/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Libs;

/**
 *
 * @author ADMIN
 */
public class ConvertStatusOrder {

    public String convertStatusOrder(int status) {
        String statusText = "";
        switch (status) {
            case 1:
                statusText = "Đã xác nhận";
                break;
            case 2:
                statusText = "Đã hủy";
                break;
            case 3:
                statusText = "Đã giao cho vận chuyển";
                break;
            case 4:
                statusText = "Đang vận chuyển";
                break;
            case 5:
                statusText = "Đã nhận hàng và thanh toán";
                break;
            case 0:
                statusText = "Đơn hàng mới";
                break;
        }
        return statusText;
    }

    public String statusPayment(int payment) {
        String paymentText = "";
        switch (payment) {
            case 1:
                paymentText = "Thanh toán khi nhận hàng";
                break;
            case 0:
                paymentText = "Thanh toán với VNPAY";
                break;
            case 3:
                paymentText = "Đã xác nhận thanh toán";
                break;
        }
        return paymentText;
    }
}
