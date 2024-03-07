/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Le Tan Kim
 */
public class FeedbackDao {
    private Connection conn;

    public FeedbackDao() {
        try {
            this.conn = DBConnection.DBConnection.connect();
        } catch (Exception e) {
            System.err.println("Connection fail: " + e);
            this.conn = null;
        }
    }
    
    public int add(Feedback f) {
        String sql = "insert into feedback (product_id, user_id, rate, feedbackContent, image, feedbackDate, order_id) values "
                + "(?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            int i = 1;
            st.setInt(i++, f.getProductId());
            st.setInt(i++, f.getUserId());
            st.setInt(i++, f.getRate());
            st.setString(i++, f.getFeedbackContent());
            st.setString(i++, f.getImage());
            st.setTimestamp(i++, f.getFeedbackDate());
            st.setInt(i++, f.getOrder_id());
            return st.executeUpdate();
        }catch(Exception e) {
            System.out.println("Add feedback fail: " + e);
        }
        return 0;
    }
    
    public int update(Feedback f) {
        String sql = "update feedback set rate =?, feedbackContent=?, image=?, feedbackDate=? where order_id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            int i = 1;
            st.setInt(i++, f.getRate());
            st.setString(i++, f.getFeedbackContent());
            st.setString(i++, f.getImage());
            st.setTimestamp(i++, f.getFeedbackDate());
            st.setInt(i++, f.getOrder_id());
            return st.executeUpdate();
        }catch(Exception e) {
            System.out.println("Add feedback fail: " + e);
        }
        return 0;
    }
    
    public int delete(int id) {
        String sql = "delete from feedback where id=?";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            result = st.executeUpdate();
        }catch(Exception e) {
            System.err.println("Delete feedback error: " + e);
        }
        return result;
    }
    
    public Feedback getFeedback(int orderId, int productId) {
        String sql = "select * from feedback where order_id=? and product_id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, orderId);
            st.setInt(2, productId);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                int id = rs.getInt("id");
                int product_id = rs.getInt("product_id");
                int user_id = rs.getInt("user_id");
                int order_id = rs.getInt("order_id");
                int rate = rs.getInt("rate");
                String feedbackContent = rs.getString("feedbackContent");
                String image = rs.getString("image");
                Timestamp feedbackDate = rs.getTimestamp("feedbackDate");
                Feedback f = new Feedback(id, productId, user_id, rate, feedbackContent, image, feedbackDate, order_id);
                return f;
            }
        }catch(Exception e) {
            System.out.println("Get feedback: " + e);
        }
        return null;
    }
    
    public List<Feedback> getAllFeedbackOfProduct(int productId) {
        String sql = "select * from feedback where product_id=?";
        List<Feedback> feedbacks = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                int id = rs.getInt("id");
                int product_id = rs.getInt("product_id");
                int user_id = rs.getInt("user_id");
                int order_id = rs.getInt("order_id");
                int rate = rs.getInt("rate");
                String feedbackContent = rs.getString("feedbackContent");
                String image = rs.getString("image");
                Timestamp feedbackDate = rs.getTimestamp("feedbackDate");
                Feedback f = new Feedback(id, productId, user_id, rate, feedbackContent, image, feedbackDate, order_id);
                feedbacks.add(f);
            }
        }catch(Exception e) {
            System.out.println("Get all feedback product: " + e);
        }
        return feedbacks;
    }
}
