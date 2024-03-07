/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.User;

import DAO.CartDao;
import DAO.OrderDao;
import DAO.OrderDetailDao;
import DAO.ProductDao;
import Libs.Authen;
import Libs.NumberCustom;
import Models.Cart;
import Models.Order;
import Models.Order_detail;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Le Tan Kim
 */
public class OrderStatusController extends HttpServlet {

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
            out.println("<title>Servlet OrderStatusController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderStatusController at " + request.getContextPath() + "</h1>");
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
        if (auth.isLogigCandidate(request) != null) {
            HttpSession session = request.getSession();
            CartDao cartDao = new CartDao();
            int idUser = number.getInt(session.getAttribute("idUser") + "");
            String typePayment = session.getAttribute("type_method") + "";
            if(typePayment.equals("null")) {
                response.sendRedirect("/CWU/404");
            } else
            if (typePayment.equals("vnpay")) {
                String transactionStatus = request.getParameter("vnp_TransactionStatus");
                if (transactionStatus.equals("00")) {
                    Order order = (Order) session.getAttribute("orderSession");
                    OrderDao orderDao = new OrderDao();
                    ProductDao productDao = new ProductDao();
                    int result = orderDao.addNew(order);
                    OrderDetailDao orderDetailDao = new OrderDetailDao();
                    List<Cart> carts = cartDao.getAllCart(idUser);
                    if (result >= 1) {
                        int type = 0;
                        for (Cart cart : carts) {
                            int productId = cart.getProduct_id();
                            Product productCu = productDao.getProductActive(productId);
                            if (productCu != null) {
                                int quantity = cart.getQuantity();
                                Order_detail orderDetail = new Order_detail(0, result, quantity, productId, productCu.getTitle(), productCu.getPrice(), productCu.getSalePrice(), null);
                                type = orderDetailDao.addOrderItem(orderDetail);
                            }
                        }
                        if (type >= 1) {
                            cartDao.deleteCartItemByUser(idUser);
                            request.getRequestDispatcher("/User/view/orderSuccess.jsp").forward(request, response);
                        }
                    }
                } else {
                    request.getRequestDispatcher("/User/view/orderFail.jsp").forward(request, response);
                }
                session.removeAttribute("type_method");
            } else {
                String status = request.getParameter("status");
                if (status.equals("1")) {
                    request.getRequestDispatcher("/User/view/orderSuccess.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/User/view/orderFail.jsp").forward(request, response);
                }
                session.removeAttribute("type_method");
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
        processRequest(request, response);
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
