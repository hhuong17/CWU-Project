/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Libs;

/**
 *
 * @author Group 2
 */
public class ConvertOrderStatus {

    public String convertStatus(int status) {
        String statusText = "";
        switch (status) {
            case 1:
                statusText = "Da xac nhan";
                break;
            case 2:
                statusText = "Da huy";
                break;
            case 3:
                statusText = "Da giao cho van chuyen";
                break;
            case 4:
                statusText = "Dang van chuyen";
                break;
            case 5:
                statusText = "Da nhan hang va thanh toan";
                break;            
        }
        return statusText;
    }
    
    public String convertStatusTag(int status) {
        String statusText = "badge badge-";
        switch (status) {
            case 1:
                statusText += "primary";
                break;
            case 2:
                statusText += "danger";
                break;
            case 3:
                statusText += "info";
                break;
            case 4:
                statusText += "warning";
                break;
            case 5:
                statusText += "success";
                break;            
        }
        return statusText;
    }
    
    public String convertStatusPayment(int payment) {
        String statusText = "";
        switch (payment) {
            case 1:
                statusText = "Thanh toan khi nhan hang";
                break;
            case 0:
                statusText = "Thanh toan voi VNPAY";
                break;
            case 3:
                statusText = "Xac nhan da thanh toan";
                break;          
        }
        return statusText;
    }
}
