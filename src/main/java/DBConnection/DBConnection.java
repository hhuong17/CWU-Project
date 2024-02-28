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
 * @author LENOVO
 */
public class DBConnection {
    private static final String urlConnect = "jdbc:sqlserver://LAPTOP-5O12M7IG:1433;databaseName=CWUproject;user=sa;password=sa;encrypt=true;trustServerCertificate=true;";



    public static Connection connect() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(urlConnect);
            System.out.println("Database connection successful!");
            return conn;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
}
