/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.User;

import DAO.UserDao;
import Libs.Authen;
import Libs.MD5Hashing;
import Libs.NumberCustom;
import Libs.Upload;
import Models.User;
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
 * @author Group 2
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50)
public class ProfileController extends HttpServlet {

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
            out.println("<title>Servlet ProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileController at " + request.getContextPath() + "</h1>");
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
        if (auth.isLogigCandidate(request) != null) {
            String path = request.getRequestURI();
            NumberCustom number = new NumberCustom();
            HttpSession session = request.getSession();
            int id = number.getInt(session.getAttribute("idUser") + "");
            UserDao userDao = new UserDao();
            User user = userDao.getById(id);
            if (path.endsWith("/CWU/profile")) {
                request.setAttribute("userProfile", user);
                request.getRequestDispatcher("/User/view/profile.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/User/view/password.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/CWU/404");
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
        if (auth.isLogigCandidate(request) != null) {
            HttpSession session = request.getSession();
            NumberCustom number = new NumberCustom();
            int idUser = number.getInt(session.getAttribute("idUser") + "");
            UserDao userDao = new UserDao();
            User user = userDao.getById(idUser);
            if (user != null && user.getStatus() == 1) {
                Upload upload = new Upload();
                if (request.getParameter("update-profile") != null) {
                    String fullname = request.getParameter("fullname");
                    String email = request.getParameter("email");
                    boolean isValidEmail = true;
                    if (!email.toLowerCase().equals(user.getEmail().toLowerCase())) {
                        User userExist = userDao.getByEmail(email);
                        if (userExist != null) {
                            isValidEmail = false;
                        }
                    }
                    if (isValidEmail) {
                        String phone = request.getParameter("phone");
                        String address = request.getParameter("address");
                        int gender = number.getInt(request.getParameter("gender"));
                        String oldImage = request.getParameter("oldAvatar");
                        Part mainImgParth = request.getPart("avatar");
                        String pathAvatar = "./uploads/avatar/";
                        String uploadPath = getServletContext().getRealPath(pathAvatar);
                        String nameImgAvatar = upload.uploadImg(mainImgParth, uploadPath);
                        if (nameImgAvatar == null) {
                            nameImgAvatar = oldImage;
                        } else {
                            nameImgAvatar = pathAvatar + nameImgAvatar;
                        }
                        User userUpdate = new User(idUser, fullname, email, null, gender, phone, address, 0, nameImgAvatar);
                        int result = userDao.updateUserProfile(userUpdate);
                        response.sendRedirect("/CWU/profile?status=" + result);
                    } else {
                        response.sendRedirect("/CWU/profile?status=" + 0 + "&message=New email is exist");
                    }
                } else {
                    String oldPassword = request.getParameter("oldPassword");
                    MD5Hashing md5 = new MD5Hashing();
                    if(user.getPassword().equals(md5.hashPassword(oldPassword))) {
                        String newPassword = request.getParameter("newPassword");
                        int result = userDao.updateUserPassword(idUser, md5.hashPassword(newPassword));
                        response.sendRedirect("/CWU/profile/password?status=" + result);
                    } else {
                        response.sendRedirect("/CWU/profile/password?status=" + 0 + "&message=Old password is in correct");
                    }
                }
            } else {
                response.sendRedirect("/CWU/profile?status=" + 0 + "&message=Your account is looking");
            }

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
