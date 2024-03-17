<%-- 
    Document   : checkout
    Created on : Mar 4, 2024, 2:30:21 PM
    Author     : Group 2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="getCurrency" class="Libs.Currency" scope="page" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Check out</title>
        <link rel="stylesheet" href="./assets/css/form.css"/>
        <%@include file="../components/baseHead.jsp" %>
    </head>
    <body class="goto-here">
        <%@include file="../components/header.jsp" %>
        <!-- END nav -->

        <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span></p>
                        <h1 class="mb-0 bread">Checkout</h1>
                    </div>
                </div>
            </div>
        </div>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-7 ftco-animate">
                        <form action="/CWU/checkout" method="post" class="billing-form">
                            <h3 class="mb-4 billing-heading">Billing Details</h3>
                            <div class="row align-items-end">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="firstname">Fullname</label>
                                        <input name="fullname" id="fullname" type="text" class="form-control" placeholder="Fullname" required>
                                        <span class="message_error"></span>
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="w-100"></div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="streetaddress">Address</label>
                                        <input name="address" type="text" id="address" class="form-control" placeholder="Address" required>
                                        <span class="message_error"></span>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="streetaddress">Phone</label>
                                        <input name="phone" type="text" id="phone" class="form-control" placeholder="Phone number" required>
                                        <span class="message_error"></span>
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-12">
                                    <div class="cart-detail p-3 p-md-4">
                                        <h3 class="billing-heading mb-4">Payment Method</h3>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="radio">
                                                    <label><input type="radio" checked value="1" name="method-payment" class="mr-2"> Payment by cash</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="radio">
                                                    <label><input type="radio" value="0" name="method-payment" class="mr-2">Payment with vnpay</label>
                                                </div>
                                            </div>
                                        </div>
                                        <p><button id="btn-order" type="submit" name="btn-checkout" class="btn btn-primary py-3 px-4">Check out</button></p>
                                    </div>
                                </div>
                            </div>
                        </form><!-- END -->
                    </div>
                    <div class="col-xl-5">
                        <div class="row mt-5 pt-3">
                            <div class="col-md-12 d-flex mb-5">
                                <div class="cart-detail cart-total p-3 p-md-4">
                                    <h3 class="billing-heading mb-4">Cart Total</h3>
                                    <p class="d-flex">
                                        <span>Cart item</span>
                                        <span>${cartItem}</span>
                                    </p>
                                    <p class="d-flex">
                                        <span>Total pay</span>
                                        <span>${getCurrency.currencyFormat(totalPrice, "vnd")}</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div> <!-- .col-md-8 -->
                </div>
            </div>
        </section> <!-- .section -->

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
        <script src="./assets/js/check.js"></script>
        <script>
                                        let fullname = document.querySelector('#fullname'),
                                                phone = document.querySelector('#phone'),
                                                address = document.querySelector('#address'),
                                                btnSubmit = document.querySelector('#btn-order');
                                        const messageEmpty = "Hãy nhập thông tin cho trường này",
 
                                                messagePhone = "Hãy nhập đúng định dạng số điện thoại";
                                        const inputsToValidateCheckInfo = [
                                            {element: address, message: messageEmpty, regex: /^.{1,}$/, type: "text", isEmpty: false},
                                            {element: phone, message: messagePhone, regex: /(84|0[3|5|7|8|9])+([0-9]{8})\b/g, type: "text", isEmpty: false},
                                            {element: fullname, message: messageEmpty, regex: /^.{1,}$/, type: "text", isEmpty: false},
                                        ];
                                        validation(inputsToValidateCheckInfo, btnSubmit);
    </script>
    </body>
</html>