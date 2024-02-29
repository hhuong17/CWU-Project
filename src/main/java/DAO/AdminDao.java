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
 * @author Admin
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
                String password = rs.getString("password");
                int status = rs.getInt("status");
                Admin admin = new Admin(id, fullname, username, gender, email, phone, password, status);
                return admin;
            }
        } catch (Exception e) {
            System.out.println("Error login: " + e);
        }
        return null;
    }
}
