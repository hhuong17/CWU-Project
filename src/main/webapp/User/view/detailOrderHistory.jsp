<%-- 
    Document   : detailOrderHistory
    Created on : Mar 5, 2024, 10:57:39 AM
    Author     : Tran Tri Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="getProduct" class="Libs.AdminGetLib" scope="page" />
<jsp:useBean id="getStatusOrder" class="Libs.ConvertStatusOrder" scope="page" />
<jsp:useBean id="getCurrency" class="Libs.Currency" scope="page" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Detail order</title>
        <%@include file="../components/baseHead.jsp" %>
    </head>
    <body class="goto-here">
        <%@include file="../components/header.jsp" %>
        <!-- END nav -->
        <section class="ftco-section contact-section bg-light">
            <div class="container">
                <div class="row block-9">
                    <div class="col-md-6 order-md-last d-flex">
                        <form action="/CWU/profile" method="post" class="bg-white p-5 contact-form" enctype="multipart/form-data">
                            <h2>Order detail</h2>
                            <div class="form-group">
                                <label>Full name</label>
                                <input readonly type="text" class="form-control" value="${order.fullname}">
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input readonly type="text" class="form-control" value="${order.phone}">
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input readonly type="text" class="form-control" value="${order.address}">
                            </div>
                            <div class="form-group">
                                <label>Order date </label>
                                <input readonly type="text" class="form-control" value="${order.orderDate}">
                            </div>
                            <div class="form-group">
                                <label>Payment </label>
                                <input readonly type="text" class="form-control" value="${getStatusOrder.statusPayment(payment)}">
                            </div>
                            <div class="form-group">
                                <label>Status </label>
                                <input readonly type="text" class="form-control" value="${getStatusOrder.convertStatusOrder(order.status)}">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <section class="ftco-section ftco-cart">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ftco-animate">
                        <div class="cart-list">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr class="text-center">
                                        <th>Name</th>
                                        <th>Image</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Sale price</th>
                                        <th>Description</th>
                                        <th>Total item</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${orderDetails.size() > 0}">
                                        <c:forEach items="${orderDetails}" var="orderDetail">
                                            <c:set value="${getProduct.getProduct(orderDetail.productId)}" var="product"/>
                                            <c:if test="${product != null}">
                                                <tr class="text-center">
                                                    <td class="product-remove">
                                                        ${product.title}
                                                    </td>
                                                    <td class="image-prod">
                                                        <img src="${product.image}" alt="${product.title}"/>
                                                    </td>
                                                    <td class="product-name">
                                                        ${orderDetail.quantity}
                                                    </td>
                                                    <td class="product-name">
                                                        ${orderDetail.price}
                                                    </td>
                                                    <td class="product-name">
                                                        ${orderDetail.salePrice}
                                                    </td>
                                                    <td class="price">
                                                        ${orderDetail.description}
                                                    </td>
                                                    <td class="quantity">
                                                        <c:if test="${orderDetail.price - orderDetail.salePrice > 0}" >
                                                            ${getCurrency.currencyFormatInput(orderDetail.salePrice * orderDetail.quantity)}
                                                        </c:if>
                                                        <c:if test="${orderDetail.price - orderDetail.salePrice <= 0}" >
                                                            ${getCurrency.currencyFormatInput(orderDetail.price * orderDetail.quantity)}
                                                        </c:if>
                                                    </td>
                                                    <td class="total">
                                                        <c:if test="${order.status == 5 && order.payment == 3}">
                                                            <a class="btn btn-info" href="/CWU/history/order/feedback/${order.id}/${orderDetail.productId}">Feedback</a>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:if>
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
