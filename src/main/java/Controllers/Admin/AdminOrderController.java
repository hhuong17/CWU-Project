/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import DAO.CategoryDao;
import DAO.OrderDao;
import DAO.OrderDetailDao;
import DAO.ProductDao;
import Libs.Authen;
import Libs.NumberCustom;
import Models.Category;
import Models.Order;
import Models.Order_detail;
import Models.Product;
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
public class AdminOrderController extends HttpServlet {

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
            out.println("<title>Servlet AdminOrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminOrderController at " + request.getContextPath() + "</h1>");
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
        String path = request.getRequestURI();
        NumberCustom number = new NumberCustom();
        OrderDao orderDao = new OrderDao();
        OrderDetailDao orderDetailDao = new OrderDetailDao();
        Authen auth = new Authen();
        if (auth.isLogigAdmin(request) != null) {
            if (path.startsWith("/CWU/admin/order/detail")) {
                String paths[] = path.split("/");
                int id = number.getInt(paths[paths.length - 1]);
                Order order = orderDao.getById(id);
                List<Order_detail> orderDetail = orderDetailDao.getAll(id);
                request.setAttribute("order", order);
                request.setAttribute("orderDetails", orderDetail);
                request.getRequestDispatcher("/Admin/view/order/detail.jsp").forward(request, response);
            } else if (path.startsWith("/CWU/admin/order/edit")) {
                String paths[] = path.split("/");
                int id = number.getInt(paths[paths.length - 1]);
                Order order = orderDao.getById(id);
                List<Order_detail> orderDetail = orderDetailDao.getAll(id);
                request.setAttribute("order", order);
                request.setAttribute("orderDetails", orderDetail);
                request.getRequestDispatcher("/Admin/view/order/update.jsp").forward(request, response);
            } else if (path.endsWith("/CWU/admin/order/confirm")) {
                List<Order> orders = orderDao.getAllByPayment(5);
                request.setAttribute("orders", orders);
                request.getRequestDispatcher("/Admin/view/order/confirm.jsp").forward(request, response);
            } else if (path.startsWith("/CWU/admin/order/confim")) {
                String paths[] = path.split("/");
                int id = number.getInt(paths[paths.length - 1]);
                Order order = orderDao.getById(id);
                List<Order_detail> orderDetail = orderDetailDao.getAll(id);
                request.setAttribute("order", order);
                request.setAttribute("orderDetails", orderDetail);
                request.getRequestDispatcher("/Admin/view/order/updateConfirm.jsp").forward(request, response);
            } else {
                List<Order> orders = orderDao.getAll();
                request.setAttribute("orders", orders);
                request.getRequestDispatcher("/Admin/view/order/order.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("c");
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
        NumberCustom number = new NumberCustom();
        if (request.getParameter("update-order") != null) {
            int id = number.getInt(request.getParameter("id"));
            int status = number.getInt(request.getParameter("status"));
            OrderDao orderDao = new OrderDao();
            int result = orderDao.updateStatus(id, status);
            response.sendRedirect("/CWU/admin/order?status=" + result);
        } else if (request.getParameter("update-order-payment") != null) {
            int id = number.getInt(request.getParameter("id"));
            int payment = number.getInt(request.getParameter("payment"));
            OrderDao orderDao = new OrderDao();
            int result = orderDao.updateConfirm(id, payment);
            response.sendRedirect("/CWU/admin/order/confirm?status=" + result);
        } else if (request.getParameter("filter") != null) {
            int status = number.getInt(request.getParameter("status"));
            OrderDao orderDao = new OrderDao();
            List<Order> orders = orderDao.getAllByStatus(status);
            request.setAttribute("orders", orders);
            request.setAttribute("status", status);
            request.getRequestDispatcher("/Admin/view/order/order.jsp").forward(request, response);
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
