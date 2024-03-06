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
    public User getById(int id) {
        String sql = "SELECT * FROM [user] WHERE id=?";

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

    public User getByEmail(String email) {
        String sql = "SELECT * FROM [user] WHERE email=?";

        try ( PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, email);

            try ( ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String fullName = rs.getString("fullName");
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
    public int  addUser(User user) {
        String sql = "INSERT INTO [user] (fullname, email, password, phone, address, status) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            int i = 1;
            st.setString(i++, user.getFullName());
            st.setString(i++, user.getEmail());
            st.setString(i++, user.getPassword());
            st.setString(i++, user.getPhone());
            st.setString(i++, user.getAddress());
            st.setInt(i++, user.getStatus());
            return st.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Add user failed: " + e.getMessage());
        }
        return 0;
    }

    // Method to update a user
    public int updateUser(User user) {
        String sql = "UPDATE [user] SET fullName=?, email=?, gender=?, phone=?, address=?, status=?, avatar=? WHERE id=?";
        int result = 0;
        try ( PreparedStatement st = conn.prepareStatement(sql)) {
            int i = 1;
            st.setString(i++, user.getFullName());
            st.setString(i++, user.getEmail());
            st.setInt(i++, user.getGender());
            st.setString(i++, user.getPhone());
            st.setString(i++, user.getAddress());
            st.setInt(i++, user.getStatus());
            st.setString(i++, user.getAvatar());
            st.setInt(i++, user.getId());
            result = st.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Update user failed: " + e.getMessage());
        }
        return result;
    }

    public int updateUserPassword(int id, String password) {
        String sql = "UPDATE [user] SET password=? WHERE id=?";
        int result = 0;
        try ( PreparedStatement st = conn.prepareStatement(sql)) {
            int i = 1;
            st.setString(i++, password);
            st.setInt(i++, id);
            result = st.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Update user password failed: " + e.getMessage());
        }
        return result;
    }

    public int updateUserProfile(User user) {
        String sql = "UPDATE [user] SET fullName=?, email=?, gender=?, phone=?, address=?, avatar=? WHERE id=?";
        int result = 0;
        try ( PreparedStatement st = conn.prepareStatement(sql)) {
            int i = 1;
            st.setString(i++, user.getFullName());
            st.setString(i++, user.getEmail());
            st.setInt(i++, user.getGender());
            st.setString(i++, user.getPhone());
            st.setString(i++, user.getAddress());
            st.setString(i++, user.getAvatar());
            st.setInt(i++, user.getId());
            result = st.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Update user profile failed: " + e.getMessage());
        }
        return result;
    }

    // Method to delete a user
    public int delete(int id) {
        String sql = "DELETE FROM [user] WHERE id=?";
        int result = 0;
        try ( PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, id);
            result = st.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Delete user failed: " + e.getMessage());
        }
        return result;
    }
}
