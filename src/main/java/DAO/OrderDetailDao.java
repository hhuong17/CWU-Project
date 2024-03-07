/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Order_detail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Group 2
 */
public class OrderDetailDao {

    private Connection conn;

    public OrderDetailDao() {
        try {
            this.conn = DBConnection.DBConnection.connect();
        } catch (Exception e) {
            System.err.println("Connection fail: " + e);
            this.conn = null;
        }
    }

    public List<Order_detail> getAll(int order_id) {
        String sql = "SELECT * FROM OrderDetail where order_id = ?";
        List<Order_detail> orderDetails = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, order_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int orderId = rs.getInt("order_Id");
                int quantity = rs.getInt("quantity");
                int productId = rs.getInt("product_Id");
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                double salePrice = rs.getDouble("sale_price");
                String description = rs.getString("description");
                Order_detail orderDetail = new Order_detail(id, orderId, quantity, productId, title, price, salePrice, description);
                orderDetails.add(orderDetail);
            }
        } catch (Exception e) {
            System.out.println("Get all order details: " + e);
        }
        return orderDetails;
    }
    
    public int addOrderItem(Order_detail orderItem) {
        int result = 0;
        try {
            String sql = "INSERT INTO orderDetail (order_id, quantity, product_id, title,"
                    + " price, sale_price, description) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement st = conn.prepareStatement(sql);
                int i=1;
                st.setInt(i++, orderItem.getOrderId());
                st.setInt(i++, orderItem.getQuantity());
                st.setInt(i++, orderItem.getProductId());
                st.setString(i++, orderItem.getTitle());
                st.setDouble(i++, orderItem.getPrice());
                st.setDouble(i++, orderItem.getSalePrice());
                st.setString(i++, orderItem.getDescription());
                result = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return result;
    }
}
