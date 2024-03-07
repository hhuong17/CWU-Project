/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.User;

import DAO.CartDao;
import DAO.ProductDao;
import Libs.Authen;
import Libs.NumberCustom;
import Models.Cart;
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
 * @author Group 2
 */
public class AddToCartController extends HttpServlet {

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
            out.println("<title>Servlet AddToCartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartController at " + request.getContextPath() + "</h1>");
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
        CartDao cartDao = new CartDao();
        ProductDao productDao = new ProductDao();
        Authen auth = new Authen();
        if (auth.isLogigCandidate(request) != null) {
            NumberCustom number = new NumberCustom();
            HttpSession session = request.getSession();
            int idUser = number.getInt(session.getAttribute("idUser") + "");
            if (path.startsWith("/CWU/cart/add/")) {
                String[] paths = path.split("/");
                int id = number.getInt(paths[paths.length - 1]);
                Cart cartExist = cartDao.getByIdUser(id, idUser);
                int result = 0;
                double totalPrice = 0;
                Product product = productDao.getProductActive(id);
                if (product.getPrice() - product.getSalePrice() > 0) {
                    totalPrice = product.getSalePrice() * 1;
                } else {
                    totalPrice = product.getPrice() * 1;
                }
                if (cartExist == null) {
                    Cart c = new Cart(0, idUser, totalPrice, id, 1);
                    result = cartDao.addToCart(c);
                } else {
                    totalPrice += cartExist.getTotal_price();
                    int quantity = 1 + cartExist.getQuantity();
                    Cart c = new Cart(0, idUser, totalPrice, id, quantity);
                    result = cartDao.updateToCart(c);
                }
                response.sendRedirect("/CWU/product?status=" + result);
            } else if (path.endsWith("/CWU/cart")) {
                List<Cart> carts = cartDao.getAllCart(idUser);
                request.setAttribute("carts", carts);
                request.getRequestDispatcher("/User/view/cart.jsp").forward(request, response);
            } else if (path.startsWith("/CWU/cart/delete/")) {
                String[] paths = path.split("/");
                int id = number.getInt(paths[paths.length - 1]);
                int result = cartDao.deleteCartItem(id);
                response.sendRedirect("/CWU/cart?status=" + result);
            }
        } else {
            response.sendRedirect("/CWU/login");
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
            int userId = number.getInt(session.getAttribute("idUser") + "");
            ProductDao productDao = new ProductDao();
            CartDao cartDao = new CartDao();
            if (request.getParameter("update-cart") != null) {
                int cartId = number.getInt(request.getParameter("cart_id"));
                int productId = number.getInt(request.getParameter("product_id"));
                int quantity = number.getInt(request.getParameter("quantity"));
                Product p = productDao.getProductActive(productId);
                if (p != null) {
                    double totalPrice = p.getPrice() - p.getSalePrice() > 0 ? p.getSalePrice() * quantity : p.getPrice() * quantity;
                    Cart cartUpdate = new Cart(cartId, userId, totalPrice, productId, quantity);
                    int result = cartDao.updateToCart(cartUpdate);
                    response.sendRedirect("/CWU/cart?status=" + result);
                } else {
                    response.sendRedirect("/CWU/404");
                }
            } if(request.getParameter("add-to-cart") != null) {
                int quantity = number.getInt(request.getParameter("quantity"));
                int idProduct = number.getInt(request.getParameter("id"));
                Cart cartExist = cartDao.getByIdUser(idProduct, userId);
                int result = 0;
                double totalPrice = 0;
                Product product = productDao.getProductActive(idProduct);
                if (product.getPrice() - product.getSalePrice() > 0) {
                    totalPrice = product.getSalePrice() * quantity;
                } else {
                    totalPrice = product.getPrice() * quantity;
                }
                if (cartExist == null) {
                    Cart c = new Cart(0, userId, totalPrice, idProduct, quantity);
                    result = cartDao.addToCart(c);
                } else {
                    totalPrice += cartExist.getTotal_price();
                    int quantityCart = quantity + cartExist.getQuantity();
                    Cart c = new Cart(0, userId, totalPrice, idProduct, quantityCart);
                    result = cartDao.updateToCart(c);
                }
                response.sendRedirect("/CWU/product/detail/" +idProduct+"?status=" + result);
            }
        } else {
            response.sendRedirect("/CWU/login");
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
