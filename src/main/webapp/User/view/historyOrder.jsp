<%-- 
    Document   : historyOrder
    Created on : Mar 5, 2024, 9:27:23 AM
    Author     : Le Tan Kim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="getCurrency" class="Libs.Currency" scope="page" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>History order</title>
        <%@include file="../components/baseHead.jsp" %>
    </head>
    <body class="goto-here">
        <%@include file="../components/header.jsp" %>
        <!-- END nav -->
        <section class="ftco-section ftco-cart">
            <div class="container">
                <div class="row">
                    <c:if test="${param.status != null && param.status ==1}">
                        <span style="color: green">Action successfully</span>
                    </c:if>
                    <c:if test="${param.status != null && param.status ==0}">
                        <span style="color: red">${param.message}</span>
                    </c:if>
                    <div class="col-md-12 ftco-animate">
                        <div class="cart-list">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr class="text-center">
                                        <th>Fullname</th>
                                        <th>Address</th>
                                        <th>Phone</th>
                                        <th>Date</th>
                                        <th>Payment</th>
                                        <th>Total</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${orders.size() > 0}">
                                        <c:forEach items="${orders}" var="order">
                                            <tr class="text-center">
                                                <td class="product-remove">
                                                    ${order.fullname}
                                                </td>
                                                <td class="image-prod">
                                                    ${order.address}
                                                </td>
                                                <td class="product-name">
                                                    ${order.phone}
                                                </td>
                                                <td class="product-name">
                                                    ${order.orderDate}
                                                </td>
                                                <td class="price">
                                                    <span class="badge badge-info">
                                                        <c:if test="${order.payment == 0}">
                                                            Thanh toan VNPAY
                                                        </c:if>
                                                        <c:if test="${order.payment == 1}">
                                                            Thanh toan khi nhan hang
                                                        </c:if>
                                                        <c:if test="${order.payment == 3}">
                                                            Đã xác nhận thanh toán
                                                        </c:if>
                                                    </span>
                                                </td>

                                                <td class="quantity">
                                                    ${getCurrency.currencyFormatInput(order.total)}
                                                </td>
                                                <td class="total">
                                                    <a class="btn btn-warning" href="/CWU/history/order/${order.id}">Detail</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="../components/footer.jsp" %>
    </body>
</html>