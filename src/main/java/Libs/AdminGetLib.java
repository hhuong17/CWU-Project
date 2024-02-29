/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Libs;

import DAO.OrderDao;
import DAO.ProductDao;
import Models.Order;
import Models.Product;

/**
 *
 * @author Admin
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
}
