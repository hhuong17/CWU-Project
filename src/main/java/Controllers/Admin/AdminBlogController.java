/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Admin;

import DAO.BlogDao;
import Libs.Authen;
import Libs.DateCustom;
import Libs.NumberCustom;
import Libs.Upload;
import Models.Blog;
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
public class AdminBlogController extends HttpServlet {

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
            out.println("<title>Servlet AdminBlogController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminBlogController at " + request.getContextPath() + "</h1>");
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
            NumberCustom  number = new NumberCustom();
            BlogDao blogDao = new BlogDao();
            if (path.endsWith("/CWU/admin/blog")) {
                List<Blog> blogs = blogDao.getAll();
                request.setAttribute("blogs", blogs);
                request.getRequestDispatcher("/Admin/view/blog/blog.jsp").forward(request, response);
            } else if (path.startsWith("/CWU/admin/blog/add")) {
                request.getRequestDispatcher("/Admin/view/blog/add.jsp").forward(request, response);
            } else if(path.startsWith("/CWU/admin/blog/update")) {
                String paths[] = path.split("/");
                int id = number.getInt(paths[paths.length - 1]);
                Blog blog = blogDao.getById(id);
                request.setAttribute("blog", blog);
                request.getRequestDispatcher("/Admin/view/blog/edit.jsp").forward(request, response);
            } else if(path.startsWith("/CWU/admin/blog/detail")) {
                String paths[] = path.split("/");
                int id = number.getInt(paths[paths.length - 1]);
                Blog blog = blogDao.getById(id);
                request.setAttribute("blog", blog);
                request.getRequestDispatcher("/Admin/view/blog/detail.jsp").forward(request, response);
            } else if(path.startsWith("/CWU/admin/blog/delete")) {
                 String paths[] = path.split("/");
                int id = number.getInt(paths[paths.length - 1]);
                int result = blogDao.deleteBlog(id);
                response.sendRedirect("/CWU/admin/blog?status=" + result);
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
        Authen auth = new Authen();
        if (auth.isLogigCandidate(request) != null) {
            NumberCustom number = new NumberCustom();
            DateCustom dateCustom = new DateCustom();
            Upload upload = new Upload();
            BlogDao blogDao = new BlogDao();
            if (request.getParameter("add-new") != null) {
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                int status = number.getInt(request.getParameter("status"));
                Timestamp date = dateCustom.getCurrentTime();
                Part mainImgParth = request.getPart("image");
                String pathAvatar = "./uploads/blog/";
                String uploadPath = getServletContext().getRealPath(pathAvatar);
                String nameImg = upload.uploadImg(mainImgParth, uploadPath);
                nameImg = pathAvatar + nameImg;
                Blog blog = new Blog(0, title, description, nameImg, date, status, 0);
                int result = blogDao.addBlog(blog);
                response.sendRedirect("/CWU/admin/blog?status=" + result);
            } else if(request.getParameter("update-blog") != null) {
                int id = number.getInt(request.getParameter("id"));
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                int status = number.getInt(request.getParameter("status"));
                Timestamp date = dateCustom.getCurrentTime();
                Part mainImgParth = request.getPart("image");
                String pathAvatar = "./uploads/blog/";
                String uploadPath = getServletContext().getRealPath(pathAvatar);
                String nameImg = upload.uploadImg(mainImgParth, uploadPath);
                if(nameImg == null) {
                    nameImg = request.getParameter("oldImage");
                } else {
                    nameImg = pathAvatar + nameImg;
                }
                Blog blog = new Blog(id, title, description, nameImg, date, status, 0);
                int result = blogDao.updateBlog(blog);
                response.sendRedirect("/CWU/admin/blog?status=" + result);
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
