/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
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
        String sql = "SELECT * FROM [order]";
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
                Order order = new Order(id, fullname, address, phone, orderDate, total, payment, status, note);
                orders.add(order);
            }
        } catch (Exception e) {
            System.out.println("Get all orders: " + e);
        }
        return orders;
    }

    public Order getById(int id) {
        String sql = "SELECT * FROM Order WHERE id=?";
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
                Order order = new Order(id, fullname, address, phone, orderDate, total, payment, status, note);
                return order;
            }
        } catch (Exception e) {
            System.out.println("Get order by id: " + e);
        }
        return null;
    }

}
