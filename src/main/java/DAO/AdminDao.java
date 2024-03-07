/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Group 2
 */
public class AdminDao {

    private Connection conn;

    public AdminDao() {
        try {
            this.conn = DBConnection.DBConnection.connect();
        } catch (Exception e) {
            System.err.println("Connection fail: " + e);
            this.conn = null;
        }
    }

    public Admin login(String username) {
        String sql = "select * from Admin where username=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                int gender = rs.getInt("gender");
                String phone = rs.getString("phone");
                String avatar = rs.getString("avatar");
                String password = rs.getString("password");
                int status = rs.getInt("status");
                Admin admin = new Admin(id, fullname, username, gender, email, phone, avatar, password, status);
                return admin;
            }
        } catch (Exception e) {
            System.out.println("Error login: " + e);
        }
        return null;
    }

    public Admin getById(int id) {
        String sql = "select * from Admin where id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String username = rs.getString("username");
                String fullname = rs.getString("fullname");
                String email = rs.getString("email");
                int gender = rs.getInt("gender");
                String phone = rs.getString("phone");
                String avatar = rs.getString("avatar");
                String password = rs.getString("password");
                int status = rs.getInt("status");
                Admin admin = new Admin(id, fullname, username, gender, email, phone, avatar, password, status);
                return admin;
            }
        } catch (Exception e) {
            System.out.println("Get admin by id: " + e);
        }
        return null;
    }

    public Admin getByEmail(String email) {
        String sql = "select * from Admin where email=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String fullname = rs.getString("fullname");
                int gender = rs.getInt("gender");
                String phone = rs.getString("phone");
                String avatar = rs.getString("avatar");
                String password = rs.getString("password");
                int status = rs.getInt("status");
                Admin admin = new Admin(id, fullname, username, gender, email, phone, avatar, password, status);
                return admin;
            }
        } catch (Exception e) {
            System.out.println("Get admin by id: " + e);
        }
        return null;
    }
    
    public Admin getByForget(String email, String username) {
        String sql = "select * from Admin where email=? and username=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                int gender = rs.getInt("gender");
                String phone = rs.getString("phone");
                String avatar = rs.getString("avatar");
                String password = rs.getString("password");
                int status = rs.getInt("status");
                Admin admin = new Admin(id, fullname, username, gender, email, phone, avatar, password, status);
                return admin;
            }
        } catch (Exception e) {
            System.out.println("Get admin by forget: " + e);
        }
        return null;
    }
    
    public int updateAdminPassword(String password, int id) {
        String sql = "UPDATE [Admin] SET password=? WHERE id=?";
        int result = 0;
        try ( PreparedStatement st = conn.prepareStatement(sql)) {
            int i = 1;
            st.setString(i++, password);
            st.setInt(i++, id);
            result = st.executeUpdate();
        } catch (Exception e) {
            System.err.println("Update admin password failed: " + e.getMessage());
        }
        return result;
    }
    
    public int updateAdmin(Admin admin) {
        String sql = "UPDATE [Admin] SET fullname=?, email=?, gender=?, phone=?,password=?, avatar=? WHERE id=?";
        int result = 0;
        try ( PreparedStatement st = conn.prepareStatement(sql)) {
            int i = 1;
            st.setString(i++, admin.getFullname());
            st.setString(i++, admin.getEmail());
            st.setInt(i++, admin.getGender());
            st.setString(i++, admin.getPhone());
            st.setString(i++, admin.getPassword());
            st.setString(i++, admin.getAvatar());
            st.setInt(i++, admin.getId());
            result = st.executeUpdate();
        } catch (Exception e) {
            System.err.println("Update user failed: " + e.getMessage());
        }
        return result;
    }

}
