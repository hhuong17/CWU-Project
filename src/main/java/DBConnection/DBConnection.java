/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Group 2
 */
public class DBConnection {
 private static final String urlConnect = "jdbc:sqlserver://MSI:1433;databaseName=CWUproject;user=sa;password=240803;encrypt=true;trustServerCertificate=true;";
    public static Connection connect() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(urlConnect);
            System.out.println("Database connection successful!");
            return conn;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("COnnection fail: " + ex);
        }
        return null;
    }
}
