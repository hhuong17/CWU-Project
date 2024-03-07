/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.User;

import DAO.UserDao;
import Libs.Authen;
import Libs.MD5Hashing;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Le Tan Kim
 */
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
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
            response.sendRedirect("/CWU/home");
        } else {
            request.getRequestDispatcher("/User/view/register.jsp").forward(request, response);
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
        if (auth.isLogigCandidate(request) == null) {
            if (request.getParameter("btn-signup") != null) {
                UserDao userDao = new UserDao();
                String fullname = request.getParameter("fullname");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                User user = userDao.getByEmail(email);
                if (user != null) {
                    response.sendRedirect("/CWU/register?status=0&message=Email is exist");
                } else {
                    MD5Hashing md5 = new MD5Hashing();
                    String password = request.getParameter("password");
                    String addres = request.getParameter("address");
                    int status = 1;
                    User userSign = new User(0, fullname, email, md5.hashPassword(password), status, phone, addres, status, null);
                    int result = userDao.addUser(userSign);
                    String message = "Register successfully";
                    if (result <= 0) {
                        message = "Register fail";
                    }
                    response.sendRedirect("/CWU/register?status=" + result + "&message=" + message);
                }
            }
        } else {
            response.sendRedirect("/CWU/home");
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
