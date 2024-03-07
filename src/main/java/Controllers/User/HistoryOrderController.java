/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.User;

import DAO.FeedbackDao;
import DAO.OrderDao;
import DAO.OrderDetailDao;
import DAO.ProductDao;
import DAO.UserDao;
import Libs.Authen;
import Libs.DateCustom;
import Libs.NumberCustom;
import Libs.Upload;
import Models.Feedback;
import Models.Order;
import Models.Order_detail;
import Models.Product;
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
import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author Group 2
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50)
public class HistoryOrderController extends HttpServlet {

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
            out.println("<title>Servlet HistoryOrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HistoryOrderController at " + request.getContextPath() + "</h1>");
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
            HttpSession session = request.getSession();
            NumberCustom number = new NumberCustom();
            UserDao userDao = new UserDao();
            int idUser = number.getInt(session.getAttribute("idUser") + "");
            User user = userDao.getById(idUser);
            if (user != null && user.getStatus() == 1) {
                OrderDao orderDao = new OrderDao();
                if (path.endsWith("/CWU/history/order")) {
                    List<Order> orders = orderDao.getAllOrderByUser(idUser);
                    request.setAttribute("orders", orders);
                    request.getRequestDispatcher("/User/view/historyOrder.jsp").forward(request, response);
                } else if (path.startsWith("/CWU/history/order/feedback/")) {
                    String paths[] = path.split("/");
                    ProductDao productDao = new ProductDao();
                    int idProduct = number.getInt(paths[paths.length - 1]);
                    int idOrder = number.getInt(paths[paths.length - 2]);
                    Order order = orderDao.getById(idOrder);
                    Product product = productDao.getProductActive(idProduct);
                    if (order.getStatus() == 5 && order.getPayment() == 3) {
                        FeedbackDao feedbackDao = new FeedbackDao();
                        Feedback f = feedbackDao.getFeedback(idOrder, idProduct);
                        request.setAttribute("order", order);
                        request.setAttribute("product", product);
                        if (f != null) {
                            request.setAttribute("feedback", f);
                            request.getRequestDispatcher("/User/view/feedbackEdit.jsp").forward(request, response);     
                        } else {
                            request.getRequestDispatcher("/User/view/feedback.jsp").forward(request, response);
                        }

                    } else {
                        response.sendRedirect("/CWU/404");
                    }
                } else if (path.startsWith("/CWU/history/order/")) {
                    String paths[] = path.split("/");
                    int id = number.getInt(paths[paths.length - 1]);
                    OrderDetailDao orderDetailDao = new OrderDetailDao();
                    List<Order_detail> orderDetails = orderDetailDao.getAll(id);
                    Order order = orderDao.getById(id);
                    request.setAttribute("order", order);
                    request.setAttribute("orderDetails", orderDetails);
                    request.getRequestDispatcher("/User/view/detailOrderHistory.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("/CWU/logout");
            }
        } else {
            response.sendRedirect("/CWU/logout");
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
            Upload upload = new Upload();
            DateCustom date = new DateCustom();
            int idOrder = number.getInt(request.getParameter("order_id"));
            if (request.getParameter("feedback-now") != null) {
                int idProduct = number.getInt(request.getParameter("product_id"));
                int idUser = number.getInt(request.getParameter("user_id"));
                String content = request.getParameter("content");
                int start = number.getInt(request.getParameter("start"));
                Part mainImgParth = request.getPart("image");
                String pathAvatar = "./uploads/feedback/";
                String uploadPath = getServletContext().getRealPath(pathAvatar);
                String nameImgFeed = upload.uploadImg(mainImgParth, uploadPath);
                if (nameImgFeed == null) {
                    nameImgFeed = nameImgFeed;
                } else {
                    nameImgFeed = pathAvatar + nameImgFeed;
                }
                Timestamp feedbackDate = date.getCurrentTime();
                Feedback feedback = new Feedback(0, idProduct, idUser, start, content, nameImgFeed, feedbackDate, idOrder);
                FeedbackDao feedbackDao = new FeedbackDao();
                int result = feedbackDao.add(feedback);
                response.sendRedirect("/CWU/history/order?status=" + result);
            } else if (request.getParameter("feedback-update") != null) {
                String content = request.getParameter("content");
                int start = number.getInt(request.getParameter("start"));
                String nameImgFeedOld = request.getParameter("imageOld");
                Part mainImgParth = request.getPart("image");
                String pathAvatar = "./uploads/feedback/";
                String uploadPath = getServletContext().getRealPath(pathAvatar);
                String nameImgFeed = upload.uploadImg(mainImgParth, uploadPath);
                if (nameImgFeed == null) {
                    nameImgFeed = nameImgFeedOld;
                } else {
                    nameImgFeed = pathAvatar + nameImgFeed;
                }
                Timestamp feedbackDate = date.getCurrentTime();
                Feedback feed = new Feedback(0, 0, 0, start, content, nameImgFeed, feedbackDate, idOrder);
                FeedbackDao feedbackDao = new FeedbackDao();
                int result = feedbackDao.update(feed);
                response.sendRedirect("/CWU/history/order?status=" + result);
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
