/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Libs;

import DAO.AdminDao;
import DAO.CartDao;
import DAO.CategoryDao;
import DAO.OrderDao;
import DAO.ProductDao;
import DAO.UserDao;
import Models.Admin;
import Models.Cart;
import Models.Category;
import Models.Order;
import Models.Product;
import Models.User;
import java.util.List;

/**
 *
 * @author Group 2
 */
public class AdminGetLib {
    public Product getProduct(int id) {
        ProductDao productDao = new ProductDao();
        return productDao.getById(id);
    }
    
    public Order getOrder(int id) {
        OrderDao orderDao = new OrderDao();
        return orderDao.getById(id);
    }
    
    public Admin getAdmin(int id) {
        AdminDao adminDao = new AdminDao();
        return adminDao.getById(id);
    }
    
    public List<Category> getCategory() {
        CategoryDao categoryDao = new CategoryDao();
        return categoryDao.getAllActive();
    }
    
    public Product getProductActive(int id) {
        ProductDao productDao = new ProductDao();
        return productDao.getProductActive(id);
    }
    
    public User getUser(int id) {
        UserDao userDao = new UserDao();
        return userDao.getById(id);
    }
    
    public int getNumberOfCart(int id) {
        CartDao cartDao = new CartDao();
        List<Cart> carts = cartDao.getAllCart(id);
        int numberOfCart = 0;
        for (Cart cart : carts) {
            numberOfCart += cart.getQuantity();
        }
        return numberOfCart;
    }
}
