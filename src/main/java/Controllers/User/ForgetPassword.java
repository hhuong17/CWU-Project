/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.User;

import DAO.UserDao;
import Libs.Authen;
import Libs.Email;
import Libs.MD5Hashing;
import Libs.NewPassword;
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
public class ForgetPassword extends HttpServlet {

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
            out.println("<title>Servlet ForgetPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgetPassword at " + request.getContextPath() + "</h1>");
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
            request.getRequestDispatcher("/User/view/forgetPassword.jsp").forward(request, response);
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
            response.sendRedirect("/CWU/home");
        } else {
            if (request.getParameter("btn-reset") != null) {
                String email = request.getParameter("email");
                UserDao userDao = new UserDao();
                User user = userDao.getByEmail(email);
                MD5Hashing md5 = new MD5Hashing();
                NewPassword newPass = new NewPassword();
                if (user != null) {
                    Email emailSend = new Email();
                    String password = newPass.generatePassword(9);
                    String content = "New password of account " + email + "is <span style='color: red'>" + password + "</span>";
                    int resultReset = userDao.updateUserPassword(user.getId(), md5.hashPassword(password));
                    if (resultReset >= 1) {
                        boolean isSend = emailSend.sendEmail(user.getEmail(), "Reset password", content, null);
                        int index = 0;
                        while (!isSend && index < 5) {
                            isSend = emailSend.sendEmail(user.getEmail(), "Reset password", content, null);
                            index++;
                        }
                        int type = 0;
                        String message = "Reset password fail";
                        if (isSend) {
                            type = 1;
                            message = "Reset password successfully. Please check mail to get new password";
                        }
                        response.sendRedirect("/CWU/forget-password?status=" + type + "&message=" + message);
                    } else {
                        response.sendRedirect("/CWU/forget-password?message=Reset password fail");
                    }
                } else {
                    response.sendRedirect("/CWU/forget-password?message=Email can not find in system");
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
