/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.Admin;

import DAO.UserDao;
import Libs.Authen;
import Libs.NumberCustom;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Group 2
 */
public class AdminUserController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminUserController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminUserController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String path = request.getRequestURI();
        NumberCustom number = new NumberCustom();
        UserDao userDao = new UserDao();
        Authen auth = new Authen();
        if (auth.isLogigAdmin(request) != null) {
            if (path.endsWith("/CWU/admin/category/add")) {
                request.getRequestDispatcher("/Admin/view/category/add.jsp").forward(request, response);
            } else if (path.startsWith("/CWU/admin/user/edit")) {
                String paths[] = path.split("/");
                int id = number.getInt(paths[paths.length - 1]);
                User u = userDao.getById(id);
                request.setAttribute("user", u);
                request.getRequestDispatcher("/Admin/view/user/edit.jsp").forward(request, response);
            } else if (path.startsWith("/CWU/admin/user/delete")) {
                String paths[] = path.split("/");
                int id = number.getInt(paths[paths.length - 1]);
                int result = userDao.delete(id);
                response.sendRedirect("/CWU/admin/user?status=" + result);
            } else {
                List<User> users = userDao.getAll();
                request.setAttribute("users", users);
                request.getRequestDispatcher("/Admin/view/user/user.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/CWU/admin/login");
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Authen auth = new Authen();
        UserDao userDao = new UserDao();
        NumberCustom number = new NumberCustom();
        if(auth.isLogigAdmin(request) != null) {
            int id = number.getInt(request.getParameter("id"));
            String email = request.getParameter("email");
            String fullname = request.getParameter("fullname");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            int gender = number.getInt(request.getParameter("gender"));
            int status = number.getInt(request.getParameter("status"));
            User u = new User(id, fullname, email, null, gender, phone, address, status, email);
            int result = userDao.updateUser(u);
            response.sendRedirect("/CWU/admin/user?status=" + result);
        } else {
            response.sendRedirect("/CWU/admin/login");
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
