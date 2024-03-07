/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.User;

import DAO.ProductDao;
import Libs.NumberCustom;
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
 * @author Uyen
 */
public class ProductController extends HttpServlet {

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
            out.println("<title>Servlet ProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductController at " + request.getContextPath() + "</h1>");
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
        int pageNumber = 1;
        if(path.endsWith("/CWU/product")) {
            pageNumber = 1;
        } else if(path.startsWith("/CWU/product/page-")) {
            NumberCustom number = new NumberCustom();
            String paths[] = path.split("/");
            String pathPage[] = (paths[paths.length -1]).split("-");
            pageNumber = number.getInt(pathPage[pathPage.length - 1]);
        }
        this.productInPage(request, response, pageNumber);
    }

    private void productInPage(HttpServletRequest request, HttpServletResponse response, int pageNumber) {
        try {
            ProductDao productDao = new ProductDao();
            List<Product> productsInPage = productDao.getAllActivePage(pageNumber, 12);
            List<Product> products = productDao.getAllActive();
            request.setAttribute("pageNumber", pageNumber);
             request.setAttribute("typePage","/CWU/product");
            request.setAttribute("productsInPage", productsInPage);
            request.setAttribute("products", products);
            request.getRequestDispatcher("/User/view/product.jsp").forward(request, response);
        } catch(Exception e) {
            System.out.println("Error product: " + e);
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
        if(request.getParameter("btn-search") != null) {
            String keySearch = request.getParameter("key-search");
            ProductDao productDao = new ProductDao();
            List<Product> productSInPage = productDao.getAllActiveSearch(keySearch);
            request.setAttribute("productsInPage", productSInPage);
            request.setAttribute("keySearch", keySearch);
            String headingMessage = "Result for '" + keySearch+"' is " + productSInPage.size() + ".";
            request.setAttribute("headingMessage", headingMessage);
            request.getRequestDispatcher("/User/view/product.jsp").forward(request, response);
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
