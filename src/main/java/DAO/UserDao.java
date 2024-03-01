/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author Admin
 */
import Models.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    private Connection conn;

    public UserDao() {
        try {
            this.conn = DBConnection.DBConnection.connect();
        } catch (Exception e) {
            System.err.println("Connection fail: " + e);
            this.conn = null;
        }
    }

    public List<User> getAll() {
        String sql = "SELECT * FROM [user]";
        List<User> users = new ArrayList<>();
        try ( PreparedStatement st = conn.prepareStatement(sql);  ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("fullName");
                String email = rs.getString("email");
                String password = rs.getString("password");
                int gender = rs.getInt("gender");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                int status = rs.getInt("status");
                String avatar = rs.getString("avatar");
                User user = new User(id, fullName, email, password, gender, phone, address, status, avatar);
                users.add(user);
            }
        } catch (SQLException e) {
            System.err.println("Get all users failed: " + e.getMessage());
        }
        return users;
    }

    // Method to retrieve a user by ID
    public User getUserById(int id) {
        String sql = "SELECT * FROM user WHERE id=?";

        try ( PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, id);

            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    int gender = rs.getInt("gender");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    int status = rs.getInt("status");
                    String avatar = rs.getString("avatar");

                    return new User(id, fullName, email, password, gender, phone, address, status, avatar);
                }
            }
        } catch (SQLException e) {
            System.err.println("Get user by ID failed: " + e.getMessage());
        }

        return null;
    }

    // Method to add a new user
    public void addUser(User user) {
        String sql = "INSERT INTO user (fullName, email, password, gender, phone, address, status, avatar) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try ( PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, user.getFullName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            st.setInt(4, user.getGender());
            st.setString(5, user.getPhone());
            st.setString(6, user.getAddress());
            st.setInt(7, user.getStatus());
            st.setString(8, user.getAvatar());

            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Add user failed: " + e.getMessage());
        }
    }

    // Method to update a user
    public void updateUser(User user) {
        String sql = "UPDATE user SET fullName=?, email=?, password=?, gender=?, phone=?, address=?, status=?, avatar=? WHERE id=?";

        try ( PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, user.getFullName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            st.setInt(4, user.getGender());
            st.setString(5, user.getPhone());
            st.setString(6, user.getAddress());
            st.setInt(7, user.getStatus());
            st.setString(8, user.getAvatar());
            st.setInt(9, user.getId());

            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Update user failed: " + e.getMessage());
        }
    }

    // Method to delete a user
    public void deleteUser(int id) {
        String sql = "DELETE FROM user WHERE id=?";

        try ( PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, id);

            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Delete user failed: " + e.getMessage());
        }
    }
}
