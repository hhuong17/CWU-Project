/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.User;

import DAO.CartDao;
import DAO.OrderDao;
import DAO.OrderDetailDao;
import DAO.ProductDao;
import DAO.UserDao;
import Libs.Authen;
import Libs.DateCustom;
import Libs.NumberCustom;
import Models.Cart;
import Models.Order;
import Models.Order_detail;
import Models.Product;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author Group 2
 */
public class CheckoutController extends HttpServlet {

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
            out.println("<title>Servlet CheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutController at " + request.getContextPath() + "</h1>");
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
            HttpSession session = request.getSession();
            NumberCustom number = new NumberCustom();
            UserDao userDao = new UserDao();
            CartDao cartDao = new CartDao();
            int idUser = number.getInt(session.getAttribute("idUser") + "");
            User user = userDao.getById(idUser);
            List<Cart> carts = cartDao.getAllCart(idUser);
            if (carts.size() == 0) {
                response.sendRedirect("/CWU/404");
            } else {
                double totalPrice = 0;
                int cartItem = 0;
                for (Cart cart : carts) {
                    cartItem += cart.getQuantity();
                    totalPrice += cart.getTotal_price();
                }
                request.setAttribute("user", user);
                request.setAttribute("carts", carts);
                request.setAttribute("totalPrice", totalPrice);
                request.setAttribute("cartItem", cartItem);
                request.getRequestDispatcher("/User/view/checkout.jsp").forward(request, response);
            }
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
            NumberCustom number = new NumberCustom();
            DateCustom date = new DateCustom();
            if (request.getParameter("btn-checkout") != null) {
                OrderDao orderDao = new OrderDao();
                OrderDetailDao orderDetailDao = new OrderDetailDao();
                ProductDao productDao = new ProductDao();
                HttpSession session = request.getSession();
                CartDao cartDao = new CartDao();
                int idUser = number.getInt(session.getAttribute("idUser") + "");
                List<Cart> carts = cartDao.getAllCart(idUser);
                double totalPrice = 0;
                int cartItem = 0;
                for (Cart cart : carts) {
                    cartItem += cart.getQuantity();
                    totalPrice += cart.getTotal_price();
                }
                String fullname = request.getParameter("fullname");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                Timestamp orderDate = date.getCurrentTime();
                int paymentMethod = number.getInt(request.getParameter("method-payment"));
                Order order = new Order(0, fullname, address, phone, orderDate, totalPrice, paymentMethod, 0, null, idUser);
                session.setAttribute("orderSession", order);
                if (paymentMethod == 1) {
                    session.setAttribute("type_method", "cash");
                    int result = orderDao.addNew(order);
                    if (result >= 1) {
                        int type = 0;
                        for (Cart cart : carts) {
                            int productId = cart.getProduct_id();
                            Product productCu = productDao.getProductActive(productId);
                            if (productCu != null) {
                                int quantity = cart.getQuantity();
                                Order_detail orderDetail = new Order_detail(0, result, quantity, productId, productCu.getTitle(), productCu.getPrice(), productCu.getSalePrice(), null);
                                type = orderDetailDao.addOrderItem(orderDetail);
                                if (type >= 1) {
                                    productDao.updateQuantity(productId, productCu.getStock() - quantity);
                                }
                            }
                        }
                        if (type >= 1) {
                            cartDao.deleteCartItemByUser(idUser);
                        }
                        response.sendRedirect("/CWU/order?status=" + type);
                    } else {
                        response.sendRedirect("/CWU/order?status=" + 0);
                    }
                } else {
                    session.setAttribute("type_method", "vnpay");
                    response.sendRedirect("/CWU/vnpay?amount=" + (long) totalPrice);
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
