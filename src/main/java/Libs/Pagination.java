/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Libs;

/**
 *
 * @author Uyen
 */
public class Pagination {

    public String generatePagination(int pageNumber, int pageSize, int totalItems, String typePage) {
        int totalPages = calculateTotalPages(pageSize, totalItems);

        StringBuilder html = new StringBuilder();
        html.append("<div class=\"col text-center\">");
        html.append("<div class=\"block-27\">");
        html.append("<ul>");

        for (int i = 1; i <= totalPages; i++) {
            html.append("<li");
            if (i == pageNumber) {
                html.append(" class=\"active\"");
            }
            html.append("><a href=\""+typePage+"/page-"+i+"\">" + i + "</a></li>");
        }
        html.append("</ul>");
        html.append("</div>");
        html.append("</div>");

        return html.toString();
    }

    private int calculateTotalPages(int pageSize, int totalItems) {
        return (int) Math.ceil((double) totalItems / pageSize);
    }
}
