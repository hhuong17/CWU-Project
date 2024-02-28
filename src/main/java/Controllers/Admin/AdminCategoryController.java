/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import DAO.CategoryDao;
import Libs.NumberCustom;
import Models.Category;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
public class AdminCategoryController extends HttpServlet {

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
            out.println("<title>Servlet AdminCategoryController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminCategoryController at " + request.getContextPath() + "</h1>");
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
        CategoryDao cateDao = new CategoryDao();
        if (path.endsWith("/CWU/admin/category/add")) {
            request.getRequestDispatcher("/Admin/view/category/add.jsp").forward(request, response);
        } else if(path.startsWith("/CWU/admin/category/edit")){
            String paths[] = path.split("/");
            int id = number.getInt(paths[paths.length - 1]);
            Category c = cateDao.getById(id);
            request.setAttribute("category", c);
            request.getRequestDispatcher("/Admin/view/category/update.jsp").forward(request, response);
        } else {
            List<Category> categories = cateDao.getAll();
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/Admin/view/category/category.jsp").forward(request, response);
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
        if(request.getParameter("add-new") != null) {
            String name = request.getParameter("name");
            int status = number.getInt(request.getParameter("status"));
            CategoryDao categoryDao = new CategoryDao();
            Category c = new Category(0, name, status);
            int result = categoryDao.addNew(c);
            response.sendRedirect("/CWU/admin/category?status=" + result);
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
