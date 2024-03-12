<%-- 
    Document   : cart
    Created on : Mar 4, 2024, 12:03:21 PM
    Author     : Group 2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="getProduct" class="Libs.AdminGetLib" scope="page" />
<jsp:useBean id="getCurrency" class="Libs.Currency" scope="page" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Cart</title>
        <%@include file="../components/baseHead.jsp" %>
    </head>
    <body class="goto-here">
        <%@include file="../components/header.jsp" %>
        <!-- END nav -->
        <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span></p>
                        <h1 class="mb-0 bread">My Cart</h1>
                    </div>
                </div>
            </div>
        </div>
        <section class="ftco-section ftco-cart">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ftco-animate">
                        <div class="cart-list">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr class="text-center">
                                        <th>&nbsp;</th>
                                        <th>Product image</th>
                                        <th>Product name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${carts.size() > 0}">
                                        <c:set value="0" var="totalPrice" />
                                        <c:forEach items="${carts}" var="cart">
                                            <c:set value="${getProduct.getProductActive(cart.product_id)}" var="product" />
                                            <c:if test="${product != null}">
                                                <tr class="text-center">
                                            <form action="/CWU/cart" method="post">
                                                <td class="product-remove"><a href="/CWU/cart/delete/${cart.id}" onclick="return confirm('Are you sure to delete item?')">
                                                        <span class="ion-ios-close"></span>
                                                    </a>
                                                </td>
                                                <td class="image-prod"><div class="img" style="background-image:url(${product.image});"></div></td>
                                                <td class="product-name">
                                                    <h3>${product.title}</h3>
                                                </td>
                                                <td class="price">
                                                    <c:if test="${product.price - product.salePrice > 0}">
                                                        ${getCurrency.currencyFormatInput(product.salePrice)}
                                                    </c:if>
                                                    <c:if test="${product.price - product.salePrice == 0}">
                                                        ${getCurrency.currencyFormatInput(product.price)}
                                                    </c:if>
                                                </td>

                                                <td class="quantity">
                                                    <div class="input-group mb-3">
                                                        <input type="text" name="quantity" id="quantity-${cart.id}" class="quantity form-control input-number" value="${cart.quantity}" min="1" max="${product.stock}">
                                                    </div>
                                                </td>
                                                <td class="total">
                                                    <c:if test="${product.price - product.salePrice > 0}">
                                                        <c:set value="${totalPrice + (cart.total_price)}" var="totalPrice" />
                                                        ${getCurrency.currencyFormatInput(cart.total_price)}
                                                    </c:if>
                                                    <c:if test="${product.price - product.salePrice == 0}">
                                                        <c:set value="${totalPrice + cart.total_price}" var="totalPrice" />
                                                        ${getCurrency.currencyFormatInput(cart.total_price)}
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <input name="cart_id" type="hidden" value="${cart.id}" />
                                                    <input name="product_id" type="hidden" value="${product.id}"/>
                                                    <input name="user_id" type="hidden" value="${cart.user_id}"/>
                                                    <button class="badge badge-primary" name="update-cart" type="submit" onclick="return checkQuantity(${cart.id}, ${product.stock})">Update</button>
                                                </td>
                                            </form>
                                            </tr><!-- END TR-->
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                                <script>
                                    const checkQuantity = (ele, maxNumber) => {
                                        const valueEle = document.querySelector("#quantity-" + ele).value;
                                        if (valueEle > maxNumber || valueEle <= 0) {
                                            alert("Max stock of this product is " + maxNumber);
                                            return false;
                                        }
                                        return true;
                                    }
                                </script>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-end">
                    
<!--                    <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
                        <div class="cart-total mb-3">
                            <h3>Estimate shipping and tax</h3>
                            <p>Enter your destination to get a shipping estimate</p>
                            <form action="#" class="info">
                                <div class="form-group">
                                    <label for="">Country</label>
                                    <input type="text" class="form-control text-left px-3" placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="country">State/Province</label>
                                    <input type="text" class="form-control text-left px-3" placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="country">Zip/Postal Code</label>
                                    <input type="text" class="form-control text-left px-3" placeholder="">
                                </div>
                            </form>
                        </div>
                        <p><a href="checkout.html" class="btn btn-primary py-3 px-4">Estimate</a></p>
                    </div>-->
                    <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
                        <div class="cart-total mb-3">
                            <h3>Cart Totals</h3>
                            <p class="d-flex">
                                <span>Subtotal</span>
                                <span>${getCurrency.currencyFormat(totalPrice, "vnd")}</span>
                            </p>
                            <hr>
                            <p class="d-flex total-price">
                                <span>Total</span>
                                <span>${getCurrency.currencyFormat(totalPrice, "vnd")}</span>
                            </p>
                        </div>
                        <p><a href="/CWU/checkout" class="btn btn-primary py-3 px-4">Proceed to Checkout</a></p>
                    </div>
                </div>
            </div>
        </section>
        <section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
            <div class="container py-4">
                <div class="row d-flex justify-content-center py-5">
                    <div class="col-md-6">
                        <h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
                        <span>Get e-mail updates about our latest shops and special offers</span>
                    </div>
                    <div class="col-md-6 d-flex align-items-center">
                        <form action="#" class="subscribe-form">
                            <div class="form-group d-flex">
                                <input type="text" class="form-control" placeholder="Enter email address">
                                <input type="submit" value="Subscribe" class="submit px-3">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="../components/footer.jsp" %>
        <script>
            $(document).ready(function () {

                var quantitiy = 0;
                $('.quantity-right-plus').click(function (e) {

                    // Stop acting like a button
                    e.preventDefault();
                    // Get the field name
                    var quantity = parseInt($('#quantity').val());

                    // If is not undefined

                    $('#quantity').val(quantity + 1);


                    // Increment

                });

                $('.quantity-left-minus').click(function (e) {
                    // Stop acting like a button
                    e.preventDefault();
                    // Get the field name
                    var quantity = parseInt($('#quantity').val());

                    // If is not undefined

                    // Increment
                    if (quantity > 0) {
                        $('#quantity').val(quantity - 1);
                    }
                });

            });
        </script>
    </body>
</html>
