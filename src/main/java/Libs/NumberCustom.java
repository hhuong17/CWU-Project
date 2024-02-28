/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Libs;

/**
 *
 * @author LENOVO
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
}
