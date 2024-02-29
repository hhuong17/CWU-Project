/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Libs;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class Authen {
    public String isLogigAdmin(HttpServletRequest request) {
        try {
            String usernameCookie = "";
            Cookie cookies[] = request.getCookies();
            HttpSession session = request.getSession();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    if (c != null && c.getName().equals("usernameAdmin")) {
                        usernameCookie = c.getValue();
                        session.setAttribute("usernameAdmin", usernameCookie);
                    }
                    if(c != null && c.getName().equals("idAdmin")) {
                        String id = c.getValue();
                        session.setAttribute("idAdmin", id);
                    }
                }
            }
            if (!usernameCookie.equals("")) {
                return usernameCookie;
            }
        } catch (Exception e) {
            System.out.println("Error login admin: " + e);
        }
        return null;
    }
}
