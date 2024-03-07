/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Category;
import Models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Group 2
 */
public class ProductDao {

    private Connection conn;

    public ProductDao() {
        try {
            this.conn = DBConnection.DBConnection.connect();
        } catch (Exception e) {
            System.err.println("Connection fail: " + e);
            this.conn = null;
        }
    }

    public List<Product> getAll() {
        String sql = "select * from Product";
        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                double salePrice = rs.getDouble("salePrice");
                int stock = rs.getInt("stock");
                String desc = rs.getString("description");
                String image = rs.getString("image");
                int category_Id = rs.getInt("category_id");
                Timestamp create_date = rs.getTimestamp("create_date");
                Product p = new Product(id, title, price, salePrice, stock, desc, image, category_Id, create_date);
                products.add(p);
            }
        } catch (Exception e) {
            System.out.println("Get all products: " + e);
        }
        return products;
    }

    public List<Product> getAllActive() {
        String sql = "select P.* from Product as P join Category as C on c.id = p.category_id where c.status=1";
        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                double salePrice = rs.getDouble("salePrice");
                int stock = rs.getInt("stock");
                String desc = rs.getString("description");
                String image = rs.getString("image");
                int category_Id = rs.getInt("category_id");
                Timestamp create_date = rs.getTimestamp("create_date");
                Product p = new Product(id, title, price, salePrice, stock, desc, image, category_Id, create_date);
                products.add(p);
            }
        } catch (Exception e) {
            System.out.println("Get all products: " + e);
        }
        return products;
    }
    
    public List<Product> getAllActiveSearch(String keySearch) {
        String sql = "select P.* from Product as P join Category as C on "
                + "c.id = p.category_id where c.status=1 and (p.title like ? or c.name like ?)";
        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, "%" + keySearch +"%");
            st.setString(2, "%" + keySearch +"%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                double salePrice = rs.getDouble("salePrice");
                int stock = rs.getInt("stock");
                String desc = rs.getString("description");
                String image = rs.getString("image");
                int category_Id = rs.getInt("category_id");
                Timestamp create_date = rs.getTimestamp("create_date");
                Product p = new Product(id, title, price, salePrice, stock, desc, image, category_Id, create_date);
                products.add(p);
            }
        } catch (Exception e) {
            System.out.println("Get all products: " + e);
        }
        return products;
    }

    public List<Product> getAllActivePageInCategory(int idCategory, int pageNumber, int pageSize) {
        String sql = "select P.* from Product as P join Category as C on c.id = p.category_id where c.status=1 and c.id=?"
                + " order by p.id desc OFFSET ? ROWS "
                + "FETCH FIRST ? ROWS ONLY";
        List<Product> products = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, idCategory);
            st.setInt(2, offset);
            st.setInt(3, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                double salePrice = rs.getDouble("salePrice");
                int stock = rs.getInt("stock");
                String desc = rs.getString("description");
                String image = rs.getString("image");
                int category_Id = rs.getInt("category_id");
                Timestamp create_date = rs.getTimestamp("create_date");
                Product p = new Product(id, title, price, salePrice, stock, desc, image, category_Id, create_date);
                products.add(p);
            }
        } catch (Exception e) {
            System.out.println("Get all products: " + e);
        }
        return products;
    }
    
    public List<Product> getAllActiveRelated(int idCategory, int idProduct) {
        String sql = "select top 4 P.* from Product as P join Category as C on c.id = p.category_id where c.status=1 and c.id=? and p.id <> ?"
                + " order by p.id desc";
        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, idCategory);
            st.setInt(2, idProduct);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                double salePrice = rs.getDouble("salePrice");
                int stock = rs.getInt("stock");
                String desc = rs.getString("description");
                String image = rs.getString("image");
                int category_Id = rs.getInt("category_id");
                Timestamp create_date = rs.getTimestamp("create_date");
                Product p = new Product(id, title, price, salePrice, stock, desc, image, category_Id, create_date);
                products.add(p);
            }
        } catch (Exception e) {
            System.out.println("Get all products related: " + e);
        }
        return products;
    }
    
    public List<Product> getAllActivePage(int pageNumber, int pageSize) {
        String sql = "select P.* from Product as P join Category as C on c.id = p.category_id where c.status=1"
                + " order by p.id desc OFFSET ? ROWS "
                + "FETCH FIRST ? ROWS ONLY";
        List<Product> products = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                double salePrice = rs.getDouble("salePrice");
                int stock = rs.getInt("stock");
                String desc = rs.getString("description");
                String image = rs.getString("image");
                int category_Id = rs.getInt("category_id");
                Timestamp create_date = rs.getTimestamp("create_date");
                Product p = new Product(id, title, price, salePrice, stock, desc, image, category_Id, create_date);
                products.add(p);
            }
        } catch (Exception e) {
            System.out.println("Get all products: " + e);
        }
        return products;
    }
    
    public Product getProductActive(int id) {
        String sql = "select P.* from Product as P join Category as C on c.id = p.category_id where c.status=1 and p.id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                double salePrice = rs.getDouble("salePrice");
                int stock = rs.getInt("stock");
                String desc = rs.getString("description");
                String image = rs.getString("image");
                int category_Id = rs.getInt("category_id");
                Timestamp create_date = rs.getTimestamp("create_date");
                Product p = new Product(id, title, price, salePrice, stock, desc, image, category_Id, create_date);
                return p;
            }
        } catch (Exception e) {
            System.out.println("Get product by id: " + e);
        }
        return null;
    }

    public Product getById(int id) {
        String sql = "select * from Product where id=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                double salePrice = rs.getDouble("salePrice");
                int stock = rs.getInt("stock");
                String desc = rs.getString("description");
                String image = rs.getString("image");
                int category_Id = rs.getInt("category_id");
                Timestamp create_date = rs.getTimestamp("create_date");
                Product p = new Product(id, title, price, salePrice, stock, desc, image, category_Id, create_date);
                return p;
            }
        } catch (Exception e) {
            System.out.println("Get product by id: " + e);
        }
        return null;
    }

    public int addNew(Product d) {
        String sql = "insert into Product (title, price , salePrice, stock, description, image, category_id, create_date) values (?, ?, ?, ?, ?, ?, ?, ?) ";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, d.getTitle());
            st.setDouble(2, d.getPrice());
            st.setDouble(3, d.getSalePrice());
            st.setInt(4, d.getStock());
            st.setString(5, d.getDescription());
            st.setString(6, d.getImage());
            st.setInt(7, d.getCategory_id());
            st.setTimestamp(8, d.getCreate_date());
            result = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Insert product: " + e);
        }
        return result;
    }

    public int update(Product d) {
        String sql = "update Product set title = ?, price = ?, salePrice=?, stock=?, description=?, image=?, category_id=?, create_date=? where id=?";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, d.getTitle());
            st.setDouble(2, d.getPrice());
            st.setDouble(3, d.getSalePrice());
            st.setInt(4, d.getStock());
            st.setString(5, d.getDescription());
            st.setString(6, d.getImage());
            st.setInt(7, d.getCategory_id());
            st.setTimestamp(8, d.getCreate_date());
            st.setInt(9, d.getId());
            result = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Update product: " + e);
        }
        return result;
    }

    public int delete(int id) {
        String sql = "delete Product where id=?";
        int result = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            result = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Delete product: " + e);
        }
        return result;
    }
}
