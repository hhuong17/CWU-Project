/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import DAO.AdminDao;
import Libs.Authen;
import Libs.MD5Hashing;
import Models.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Group 2
 */
public class AdminLoginController extends HttpServlet {

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
            out.println("<title>Servlet AdminLoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminLoginController at " + request.getContextPath() + "</h1>");
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
        if (auth.isLogigAdmin(request) != null) {
            response.sendRedirect("/CWU/admin");
        } else {
            request.getRequestDispatcher("/Admin/login.jsp").forward(request, response);
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
        if (auth.isLogigAdmin(request) != null) {
            response.sendRedirect("/CWU/admin");
        } else {

            if (request.getParameter("btn-login") != null) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                MD5Hashing md5 = new MD5Hashing();
                AdminDao adminDao = new AdminDao();
                Admin admin = adminDao.login(username);
                boolean isValid = true;
                String message = "";
                if (admin == null) {
                    message = "Account is not exist";
                    isValid = false;
                }
                if (isValid && !admin.getPassword().equals(md5.hashPassword(password))) {
                    message = "Your password is not correct";
                    isValid = false;
                }
                if (isValid && admin.getStatus() == 0) {
                    message = "Your account is looked";
                    isValid = false;
                }
                if (isValid) {
                    Cookie cUsername = new Cookie("usernameAdmin", admin.getUsername());
                    Cookie cId = new Cookie("idAdmin", admin.getId() + "");
                    cUsername.setMaxAge(60 * 60 * 24 * 3);
                    cUsername.setPath("/");
                    cId.setMaxAge(60 * 60 * 24 * 3);
                    cId.setPath("/");
                    response.addCookie(cUsername);
                    response.addCookie(cId);
                    response.sendRedirect("/CWU/admin");
                } else {
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("/Admin/login.jsp").forward(request, response);
                }
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
