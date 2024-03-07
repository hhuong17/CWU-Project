/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import DAO.CategoryDao;
import DAO.FeedbackDao;
import DAO.ProductDao;
import Libs.Authen;
import Libs.DateCustom;
import Libs.NumberCustom;
import Libs.Upload;
import Models.Category;
import Models.Feedback;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
public class AdminProductController extends HttpServlet {

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
            out.println("<title>Servlet AdminProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminProductController at " + request.getContextPath() + "</h1>");
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
        ProductDao productDao = new ProductDao();
        CategoryDao cateDao = new CategoryDao();
        Authen auth = new Authen();
        if (auth.isLogigAdmin(request) != null) {
            if (path.endsWith("/CWU/admin/product/add")) {
                List<Category> categories = cateDao.getAll();
                request.setAttribute("categories", categories);
                request.getRequestDispatcher("/Admin/view/product/add.jsp").forward(request, response);
            } else if (path.startsWith("/CWU/admin/product/edit")) {
                List<Category> categories = cateDao.getAll();
                request.setAttribute("categories", categories);
                String paths[] = path.split("/");
                int id = number.getInt(paths[paths.length - 1]);
                Product p = productDao.getById(id);
                request.setAttribute("product", p);
                request.getRequestDispatcher("/Admin/view/product/update.jsp").forward(request, response);
            } else if (path.startsWith("/CWU/admin/product/delete")) {
                String paths[] = path.split("/");
                int id = number.getInt(paths[paths.length - 1]);
                int result = productDao.delete(id);
                response.sendRedirect("/CWU/admin/product?status=" + result);
            } else if (path.startsWith("/CWU/admin/product/feedback/delete")) {
                FeedbackDao feedbackDao = new FeedbackDao();
                String paths[] = path.split("/");
                int idFeedBack = number.getInt(paths[paths.length - 1]);
                int idProduct = number.getInt(paths[paths.length - 2]);
                int result = feedbackDao.delete(idFeedBack);
                response.sendRedirect("/CWU/admin/product/feedback/"+idProduct+"?status=" + result);
            } else if (path.startsWith("/CWU/admin/product/feedback")) {
                String paths[] = path.split("/");
                int id = number.getInt(paths[paths.length - 1]);
                FeedbackDao feedbackDao = new FeedbackDao();
                List<Feedback> feedbacks = feedbackDao.getAllFeedbackOfProduct(id);
                request.setAttribute("feedbacks", feedbacks);
                Product p = productDao.getById(id);
                request.setAttribute("product", p);
                request.getRequestDispatcher("/Admin/view/product/detail.jsp").forward(request, response);
            } else {
                List<Product> product = productDao.getAll();
                request.setAttribute("products", product);
                request.getRequestDispatcher("/Admin/view/product/product.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/CWU/admin/login");
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
        ProductDao productDao = new ProductDao();
        DateCustom dateCus = new DateCustom();
        Upload upload = new Upload();
        if (request.getParameter("add-new") != null) {
            int categoryId = number.getInt(request.getParameter("category"));
            String title = request.getParameter("title");
            double price = number.getDouble(request.getParameter("price"));
            double priceSale = number.getDouble(request.getParameter("priceSale"));
            int stock = number.getInt(request.getParameter("stock"));
            String desc = request.getParameter("desc");
            Part mainImgParth = request.getPart("image");
            String pathAvatar = "./uploads/image/";
            String uploadPath = getServletContext().getRealPath(pathAvatar);
            String nameImgProduct = upload.uploadImg(mainImgParth, uploadPath);
            int status = number.getInt(request.getParameter("status"));
            Timestamp create_date = dateCus.getCurrentTime();
            Product p = new Product(1, title, price, priceSale, stock, desc, pathAvatar + nameImgProduct, categoryId, create_date);
            int result = productDao.addNew(p);
            response.sendRedirect("/CWU/admin/product?status=" + result);
        } else if (request.getParameter("update-product") != null) {
            int id = number.getInt(request.getParameter("id"));
            int categoryId = number.getInt(request.getParameter("category"));
            String title = request.getParameter("title");
            double price = number.getDouble(request.getParameter("price"));
            double priceSale = number.getDouble(request.getParameter("priceSale"));
            int stock = number.getInt(request.getParameter("stock"));
            String desc = request.getParameter("desc");
            String oldImage = request.getParameter("oldImage");
            Part mainImgParth = request.getPart("image");
            String pathAvatar = "./uploads/image/";
            String uploadPath = getServletContext().getRealPath(pathAvatar);
            String nameImgProduct = upload.uploadImg(mainImgParth, uploadPath);
            if (nameImgProduct == null) {
                nameImgProduct = oldImage;
            } else {
                nameImgProduct = pathAvatar + nameImgProduct;
            }
            int status = number.getInt(request.getParameter("status"));
            Timestamp create_date = dateCus.getCurrentTime();
            Product p = new Product(id, title, price, priceSale, stock, desc, nameImgProduct, categoryId, create_date);
            int result = productDao.update(p);
            response.sendRedirect("/CWU/admin/product?status=" + result);
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
