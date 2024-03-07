/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Blog;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Group 2
 */
public class BlogDao {

    private Connection conn;

    public BlogDao() {
        try {
            this.conn = DBConnection.DBConnection.connect();
        } catch (Exception e) {
            System.err.println("Connection fail: " + e);
            this.conn = null;
        }
    }

    public List<Blog> getAll() {
        String sql = "select * from blog";
        List<Blog> blogs = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String image = rs.getString("image");
                Timestamp date = rs.getTimestamp("date");
                int status = rs.getInt("status");
                int view = rs.getInt("view");
                Blog blog = new Blog(id, title, description, image, date, status, view);
                blogs.add(blog);
            }
        } catch (Exception e) {
            System.out.println("Get all blog: " + e);
        }
        return blogs;
    }
    
    public List<Blog> getAllActive() {
        String sql = "select * from blog where status=1";
        List<Blog> blogs = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String image = rs.getString("image");
                Timestamp date = rs.getTimestamp("date");
                int status = rs.getInt("status");
                int view = rs.getInt("view");
                Blog blog = new Blog(id, title, description, image, date, status, view);
                blogs.add(blog);
            }
        } catch (Exception e) {
            System.out.println("Get all blog: " + e);
        }
        return blogs;
    }
    
    public Blog getByIdActive(int id) {
        String sql = "select * from blog where id=? and status=1";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String title = rs.getString("title");
                String description = rs.getString("description");
                String image = rs.getString("image");
                Timestamp date = rs.getTimestamp("date");
                int status = rs.getInt("status");
                int view = rs.getInt("view");
                Blog blog = new Blog(id, title, description, image, date, status, view);
                return blog;
            }
        } catch (Exception e) {
            System.out.println("Get blog by id: " + e);
        }
        return null;
    }

    public Blog getById(int id) {
        String sql = "select * from blog where id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String title = rs.getString("title");
                String description = rs.getString("description");
                String image = rs.getString("image");
                Timestamp date = rs.getTimestamp("date");
                int status = rs.getInt("status");
                int view = rs.getInt("view");
                Blog blog = new Blog(id, title, description, image, date, status, view);
                return blog;
            }
        } catch (Exception e) {
            System.out.println("Get blog by id: " + e);
        }
        return null;
    }

    public int updateBlog(Blog b) {
        String sql = "update blog set title=?, description=?, image=?, date=?, status=? where id=?";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            int i = 1;
            st.setString(i++, b.getTitle());
            st.setString(i++, b.getDescription());
            st.setString(i++, b.getImage());
            st.setTimestamp(i++, b.getDate());
            st.setInt(i++, b.getStatus());
            st.setInt(i++, b.getId());
            result = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Update blog: " + e);
        }
        return result;
    }

    public int addBlog(Blog b) {
        String sql = "insert into blog (title, description, image, date, status, [view]) values (?, ?, ?, ?, ? ,?)";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            int i = 1;
            st.setString(i++, b.getTitle());
            st.setString(i++, b.getDescription());
            st.setString(i++, b.getImage());
            st.setTimestamp(i++, b.getDate());
            st.setInt(i++, b.getStatus());
            st.setInt(i++, b.getView());
            result = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Add blog: " + e);
        }
        return result;
    }
}