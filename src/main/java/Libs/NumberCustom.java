/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Libs;

/**
 *
 * @author Group 2
 */
public class NumberCustom {
    public int getInt(String input) {
        int result = 0;
        try {
            result = Integer.parseInt(input);
        }catch(NumberFormatException e) {
            System.out.println("Number format: " + e);
        }
        return result;
    }
    
    public double getDouble(String input) {
        double result = 0;
        try {
            result = Double.parseDouble(input);
        }catch(NumberFormatException e) {
            System.out.println("Number format: " + e);
        }
        return result;
    }
}
