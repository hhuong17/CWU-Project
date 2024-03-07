<%-- 
    Document   : feedback
    Created on : Mar 5, 2024, 11:46:27 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Feed back</title>
        <%@include file="../components/baseHead.jsp" %>
    </head>
    <body class="goto-here">
        <%@include file="../components/header.jsp" %>
        <!-- END nav -->
        <section class="ftco-section contact-section bg-light">
            <div class="container">
                <div class="row block-9">
                    <div class="col-md-10 order-md-last d-flex">
                        <form action="/CWU/history/order" method="post" class="bg-white p-5 contact-form" enctype="multipart/form-data">
                            <h2>Feed back</h2>
                            <div class="form-group">
                                <label>Product</label>
                                <input type="hidden" value="${order.id}" name="order_id"/>
                                <input type="hidden" value="${product.id}" name="product_id"/>
                                <input type="hidden" value="${order.user_id}" name="user_id"/>
                                <input type="text" class="form-control" value="${product.title}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Content</label>
                                <input name="content" type="text" class="form-control" placeholder="Content">
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="file" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Start</label>
                                <select class="form-control" name="start">
                                    <option value="1">1 start</option>
                                    <option value="2">2 start</option>
                                    <option value="3">3 start</option>
                                    <option value="4">4 start</option>
                                    <option value="5">5 start</option>
                                </select>
                            </div>
                            <div class="form-group" style="margin-top: 5px">
                                <input type="submit" name="feedback-now" value="Feedback now" class="btn btn-primary py-3 px-5">
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </section>
        <%@include file="../components/footer.jsp" %>
    </body>
</html>