/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Order;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Group 2
 */
public class OrderDao {

    private Connection conn;

    public OrderDao() {
        try {
            this.conn = DBConnection.DBConnection.connect();
        } catch (Exception e) {
            System.err.println("Connection fail: " + e);
            this.conn = null;
        }
    }

    public List<Order> getAll() {
        String sql = "SELECT * FROM [order] order by id desc";
        List<Order> orders = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                Timestamp orderDate = rs.getTimestamp("order_date");
                double total = rs.getDouble("total");
                int payment = rs.getInt("payment");
                int status = rs.getInt("status");
                String note = rs.getString("note");
                int user_id = rs.getInt("user_id");
                Order order = new Order(id, fullname, address, phone, orderDate, total, payment, status, note,user_id);
                orders.add(order);
            }
        } catch (Exception e) {
            System.out.println("Get all orders: " + e);
        }
        return orders;
    }
    
    public List<Order> getAllByStatus(int status) {
        String sql = "SELECT * FROM [order] where status=? order by id desc";
        List<Order> orders = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                Timestamp orderDate = rs.getTimestamp("order_date");
                double total = rs.getDouble("total");
                int payment = rs.getInt("payment");
                String note = rs.getString("note");
                int user_id = rs.getInt("user_id");
                Order order = new Order(id, fullname, address, phone, orderDate, total, payment, status, note,user_id);
                orders.add(order);
            }
        } catch (Exception e) {
            System.out.println("Get all orders: " + e);
        }
        return orders;
    }
    
    public List<Order> getAllOrderByUser(int userId) {
        String sql = "SELECT * FROM [order] where user_id=? order by id desc";
        List<Order> orders = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                Timestamp orderDate = rs.getTimestamp("order_date");
                double total = rs.getDouble("total");
                int payment = rs.getInt("payment");
                int status = rs.getInt("status");
                String note = rs.getString("note");
                int user_id = rs.getInt("user_id");
                Order order = new Order(id, fullname, address, phone, orderDate, total, payment, status, note, user_id);
                orders.add(order);
            }
        } catch (Exception e) {
            System.out.println("Get all orders by user: " + e);
        }
        return orders;
    }

    public List<Order> getAllByDate(Date from, Date to) {
        String sql = "SELECT * FROM [order] where order_date >= ? AND order_date <= ? order by id desc";
        List<Order> orders = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setDate(1, from);
            st.setDate(2, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                Timestamp orderDate = rs.getTimestamp("order_date");
                double total = rs.getDouble("total");
                int payment = rs.getInt("payment");
                int status = rs.getInt("status");
                String note = rs.getString("note");
                int user_id = rs.getInt("user_id");
                Order order = new Order(id, fullname, address, phone, orderDate, total, payment, status, note,user_id);
                orders.add(order);
            }
        } catch (Exception e) {
            System.out.println("Get all orders: " + e);
        }
        return orders;
    }

    public List<Order> getAllByPayment(int status) {
        String sql = "SELECT * FROM [order] where status = ?";
        List<Order> orders = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                Timestamp orderDate = rs.getTimestamp("order_date");
                double total = rs.getDouble("total");
                int payment = rs.getInt("payment");
                String note = rs.getString("note");
                int user_id = rs.getInt("user_id");
                Order order = new Order(id, fullname, address, phone, orderDate, total, payment, status, note, user_id);
                orders.add(order);
            }
        } catch (Exception e) {
            System.out.println("Get all orders: " + e);
        }
        return orders;
    }

    public Order getById(int id) {
        String sql = "SELECT * FROM [Order] WHERE id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String fullname = rs.getString("fullname");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                Timestamp orderDate = rs.getTimestamp("order_date");
                double total = rs.getDouble("total");
                int payment = rs.getInt("payment");
                int status = rs.getInt("status");
                String note = rs.getString("note");
                int user_id = rs.getInt("user_id");
                Order order = new Order(id, fullname, address, phone, orderDate, total, payment, status, note, user_id);
                return order;
            }
        } catch (Exception e) {
            System.out.println("Get order by id: " + e);
        }
        return null;
    }

    public int updateStatus(int id, int status) {
        String sql = "Update [Order] set status = ?, payment=3 where id=?";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, id);
            result = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Update staus order:" + e);
        }
        return result;
    }

    public int updateConfirm(int id, int payment) {
        String sql = "Update [Order] set payment = ? where id=?";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, payment);
            st.setInt(2, id);
            result = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Update payment order:" + e);
        }
        return result;
    }

    public int addNew(Order order) {
        String sql = "INSERT INTO [order] (fullname, address, phone, order_date, total, payment, status, note, user_id)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        int result = 0;
        try {
            int i = 1;
            PreparedStatement st = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(i++, order.getFullname());
            st.setString(i++, order.getAddress());
            st.setString(i++, order.getPhone());
            st.setTimestamp(i++, order.getOrderDate());
            st.setDouble(i++, order.getTotal());
            st.setInt(i++, order.getPayment());
            st.setInt(i++, order.getStatus());
            st.setString(i++, order.getNote());
            st.setInt(i++, order.getUser_id());
            result = st.executeUpdate();
            if (result > 0) {
                try ( ResultSet generatedKeys = st.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int id = generatedKeys.getInt(1);
                        return id;
                    }
                } catch (SQLException e) {

                }
            }
        } catch (Exception e) {
            System.out.println("Add order fail: " + e);
        }
        return result;
    }

}
