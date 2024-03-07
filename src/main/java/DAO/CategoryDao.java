/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Group 2
 */
public class CategoryDao {

    private Connection conn;

    public CategoryDao() {
        try {
            this.conn = DBConnection.DBConnection.connect();
        } catch (Exception e) {
            System.err.println("Connection fail: " + e);
            this.conn = null;
        }
    }

    public List<Category> getAll() {
        String sql = "Select * from category";
        List<Category> categories = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                Category c = new Category(id, name, status);
                categories.add(c);
            }
        } catch (Exception e) {
            System.err.println("Get all category fail: " + e);
        }
        return categories;
    }
    
    public List<Category> getAllActive() {
        String sql = "Select * from category where status=1";
        List<Category> categories = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                Category c = new Category(id, name, status);
                categories.add(c);
            }
        } catch (Exception e) {
            System.err.println("Get all category fail: " + e);
        }
        return categories;
    }

    public Category getById(int id) {
        String sql = "Select * from category where id=?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                int status = rs.getInt("status");
                Category c = new Category(id, name, status);
                return c;
            }
        } catch (Exception e) {
            System.err.println("Get all category by id fail: " + e);
        }
        return null;
    }
    
    public Category getByName(String name) {
        String sql = "Select * from category where name=?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                int status = rs.getInt("status");
                Category c = new Category(id, name, status);
                return c;
            }
        } catch (Exception e) {
            System.err.println("Get all category by name fail: " + e);
        }
        return null;
    }

    public int addNew(Category c) {
        String sql = "insert into Category (name, status) values (?, ?)";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setInt(2, c.getStatus());
            result = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Insert category: " + e);
        }
        return result;
    }
    
     public int Update(Category c) {
        String sql = "update Category set name = ?, status = ? where id=?";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setInt(2, c.getStatus());
            st.setInt(3, c.getId());
            result = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Update category: " + e);
        }
        return result;
    }

    public int delete(int categoryId) {
        String sql = "DELETE Category WHERE id = ?";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, categoryId);
            result = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Delete category: " + e);
        }
        return result;
    }
}
