/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import DAO.AdminDao;
import Libs.Authen;
import Libs.MD5Hashing;
import Libs.NumberCustom;
import Libs.Upload;
import Models.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 *
 * @author Admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50)
public class AdminProfileController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminProfileController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Authen auth = new Authen();
        NumberCustom number = new NumberCustom();
        AdminDao adminDao = new AdminDao();

        if (auth.isLogigAdmin(request) != null) {
            HttpSession session = request.getSession();
            int id = number.getInt(session.getAttribute("idAdmin") + "");
            Admin a = adminDao.getById(id);
            if (a == null) {
                response.sendRedirect("/admin/404");
            } else {
                request.setAttribute("admin", a);
                request.getRequestDispatcher("/Admin/view/admin/profile.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/CWU/admin/login");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Authen auth = new Authen();
        AdminDao adminDao = new AdminDao();
        NumberCustom number = new NumberCustom();
        MD5Hashing md5 = new MD5Hashing();
        Upload upload = new Upload();
        if (auth.isLogigAdmin(request) != null) {
            if (request.getRequestDispatcher("update-admin") != null) {
                int id = number.getInt(request.getParameter("id"));
                String email = request.getParameter("email");
                String username = request.getParameter("username");
                Admin a = adminDao.getById(id);
                boolean isValid = true;
                String message = "";
                int type = 0;
                if (!a.getEmail().toLowerCase().equals(email.toLowerCase())) {
                    Admin aExist = adminDao.getByEmail(email);
                    if (aExist != null) {
                        isValid = false;
                        message = "This email is used";
                    }
                }
                if (isValid) {
                    String fullname = request.getParameter("fullname");
                    String password = request.getParameter("password");
                    if (password.equals("")) {
                        password = request.getParameter("odlPassword");
                    } else {
                        password = md5.hashPassword(password);
                    }
                    Part mainImgParth = request.getPart("avatar");
                    String pathAvatar = "./uploads/avatar/";
                    String uploadPath = getServletContext().getRealPath(pathAvatar);
                    String nameImgProfile = upload.uploadImg(mainImgParth, uploadPath);
                    if (nameImgProfile == null) {
                        nameImgProfile = request.getParameter("oldAvatar");
                    } else {
                        nameImgProfile = pathAvatar + nameImgProfile;
                    }
                    String phone = request.getParameter("phone");
                    int gender = number.getInt(request.getParameter("gender"));
                    int status = number.getInt(request.getParameter("status"));
                    Admin aUpdate = new Admin(id, fullname, username, gender, email, phone, nameImgProfile, password, status);
                    int result = adminDao.updateAdmin(aUpdate);
                    if (result >= 0) {
                        type = 1;
                        message = "Update profile success";
                    }
                }
                response.sendRedirect("/CWU/admin");
            }
        } else {
            response.sendRedirect("/CWU/admin/login");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
