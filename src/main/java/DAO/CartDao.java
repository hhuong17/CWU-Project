/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Tran Tri Tin
 */
public class CartDao {

    private Connection conn;

    public CartDao() {
        try {
            this.conn = DBConnection.DBConnection.connect();
        } catch (Exception e) {
            System.err.println("Connection fail: " + e);
            this.conn = null;
        }
    }

    public List<Cart> getAllCart(int userId) {
        String sql = "select * from cart where user_id=?";
        List<Cart> carts = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int user_id = rs.getInt("user_id");
                double total_price = rs.getDouble("total_price");
                int product_id = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                Cart c = new Cart(id, user_id, total_price, product_id, quantity);
                carts.add(c);
            }
        } catch (Exception e) {
            System.out.println("Get all cart: " + e);
        }
        return carts;
    }
    
    public Cart getByIdUser(int productId, int user_id) {
        String sql = "select * from cart where user_id=? and product_id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setInt(2, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                double total_price = rs.getDouble("total_price");
                int product_id = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                Cart c = new Cart(id, user_id, total_price, product_id, quantity);
                return c;
            }
        } catch (Exception e) {
            System.out.println("Get all cart: " + e);
        }
        return null;
    }
    
    public int addToCart(Cart c) {
        String sql = "insert into Cart (user_id, total_price, product_id, quantity) values (?, ?, ?, ?)";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, c.getUser_id());
            st.setDouble(2, c.getTotal_price());
            st.setInt(3, c.getProduct_id());
            st.setInt(4, c.getQuantity());
            result = st.executeUpdate();
        }catch(Exception e) {
            System.out.println("Add to cart: " + e);
        }
        return result;
    }
    
    public int updateToCart(Cart c) {
        String sql = "update Cart set quantity=?, total_price=? where user_id=? and product_id=?";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, c.getQuantity());
            st.setDouble(2, c.getTotal_price());
            st.setInt(3, c.getUser_id());
            st.setInt(4, c.getProduct_id());
            result = st.executeUpdate();
        }catch(Exception e) {
            System.out.println("Update to cart: " + e);
        }
        return result;
    }
    
    public int deleteCartItem(int id) {
        String sql = "delete from cart where id=?";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            result = st.executeUpdate();
        }catch(Exception e) {
            System.out.println("Delete cart error: " + e);
        }
        return result;
    }
    
    public int deleteCartItemByUser(int user) {
        String sql = "delete from cart where user_id=?";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, user);
            result = st.executeUpdate();
        }catch(Exception e) {
            System.out.println("Delete cart error by user: " + e);
        }
        return result;
    }
}
