<%-- 
    Document   : home
    Created on : Mar 4, 2024, 12:52:47 AM
    Author     : Group 2
--%>
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="getCurrency" class="Libs.Currency" scope="page" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Home page</title>
        <%@include file="../components/baseHead.jsp" %>
    </head>
    <body class="goto-here">
        <%@include file="../components/header.jsp" %>
        <!-- END nav -->
        <section id="home-section" class="hero">
            <div class="home-slider owl-carousel">
                <div class="slider-item" style="background-image: url(img/banking.jpg);">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
                            <div class="col-md-12 ftco-animate text-center">
                                <h1 class="mb-2">We serve Fresh &amp; clean ingredients</h1>
                                <h2 class="subheading mb-4">We deliver nutritious &amp; healthy ingredients</h2>
                                <p><a href="#" class="btn btn-primary">View Details</a></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="slider-item" style="background-image: url(img/nguyen-lieu-lam-banh.jpg);">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                            <div class="col-sm-12 ftco-animate text-center">
                                <h1 class="mb-2">100% Hygiene &amp; Food Safety</h1>
                                <h2 class="subheading mb-4">We deliver nutritious &amp; healthy ingredients</h2>
                                <p><a href="#" class="btn btn-primary">View Details</a></p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-3 pb-3">
                    <div class="col-md-12 heading-section text-center ftco-animate">
                        <span class="subheading">Featured Products</span>
                        <h2 class="mb-4">Our Ingredients</h2>
                        <p>Embark on a journey to culinary excellence! Explore our diverse collection of ingredients,<br>where quality meets delicious flavors, and your culinary creations come to life.</p>
                    </div>
                </div>   		
            </div>
            <div class="container">
                <div class="row">
                    <c:forEach begin="0" end="7" items="${products}" var="product">
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">
                                <a href="/CWU/product/detail/${product.id}" class="img-prod"><img class="img-fluid" src="${product.image}" alt="${product.title}">
                                    <span class="status">${getCurrency.calculateSale(product.salePrice, product.price)}</span>
                                    <div class="overlay"></div>
                                </a>
                                <div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="/CWU/product/detail/${product.id}">${product.title}</a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price"><span class="mr-2 price-dc">${getCurrency.currencyFormat(product.price, "vnd")}</span>
                                                <c:if test="${product.price - product.salePrice > 0}">
                                                    <span class="price-sale">${getCurrency.currencyFormat(product.salePrice, "vnd")}</span>
                                                </c:if>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <a href="/CWU/product/detail/${product.id}" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                                <span><i class='bx bx-spreadsheet'></i></span>
                                            </a>
                                            <a href="/CWU/cart/add/${product.id}" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                                <span><i class='bx bx-cart'></i></i></span>
                                            </a>
<!--                                            <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                                <span><i class="ion-ios-heart"></i></span>
                                            </a>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${products.size() <= 0}">
                        chuaw cos
                    </c:if>
                </div>
            </div>
        </section>

        <%@include file="../components/footer.jsp" %>
    </body>
</html>