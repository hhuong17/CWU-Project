/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Libs;

import java.text.DecimalFormat;

/**
 *
 * @author Uyen
 */
public class Currency {
    public String currencyFormat(double number, String suffix) {
        if (number != 0) {
            DecimalFormat decimalFormat = new DecimalFormat("###,###.##");
            return decimalFormat.format(number) + " " + suffix;
        }
        return "0 " + suffix;
    }
    
    public String currencyFormatInput(double number) {
        if (number != 0) {
            DecimalFormat decimalFormat = new DecimalFormat("###.###");
            return decimalFormat.format(number);
        }
        return "0";
    }
    
    public String calculateSale(double  newPrice, double oldPrice) {
        long sale = Math.round(Math.ceil(((oldPrice - newPrice) / oldPrice) * 100));
        return sale + " %";
    }
    
}
