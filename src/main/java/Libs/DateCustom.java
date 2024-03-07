/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Libs;

import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author Group 2
 */
public class DateCustom {
    public Timestamp getCurrentTime() {
        LocalDateTime dateTime = LocalDateTime.now();
        Timestamp currentTime = Timestamp.valueOf(dateTime);
        return currentTime;
    }
}
