/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Libs;

import DAO.AdminDao;
import DAO.OrderDao;
import DAO.ProductDao;
import Models.Admin;
import Models.Order;
import Models.Product;

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
}
