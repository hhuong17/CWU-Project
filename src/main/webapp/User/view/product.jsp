<%-- 
    Document   : product
    Created on : Mar 4, 2024, 1:43:21 AM
    Author     : Group 2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="getCurrency" class="Libs.Currency" scope="page" />
<jsp:useBean id="getPagination" class="Libs.Pagination" scope="page" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product</title>
        <%@include file="../components/baseHead.jsp" %>
    </head>
    <body class="goto-here">
        <%@include file="../components/header.jsp" %>
        <!-- END nav -->
        <div class="hero-wrap hero-bread" style="background-image: url('./img/banner.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span></p>
                        <h1 class="mb-0 bread">Products</h1>
                    </div>
                </div>
            </div>
        </div>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-10 mb-5 text-center">
                        <form action="/CWU/product" method="post" style="display: flex; width: 100%; gap: 10px;">
                            <div style="width: 100%">
                                <input value="${keySearch}" name="key-search" style="width: 100%; outline: none; border: 1px solid #333; padding: 10px 15px;" placeholder="Search"/>
                            </div>
                            <div>
                                <button name="btn-search" style="padding: 10px 15px; outline: none; border: 1px solid #333;">Search</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="heading-section-bold mb-4 mt-md-5">
                    <div class="ml-md-0">
                        <h2 class="mb-4">${headingMessage}</h2>
                    </div>
                </div>
                <div class="row">
                    <c:if test="${productsInPage.size() <= 0}">
                        <img style="margin: 0 auto; max-width: 100%" src="./img/noproduct.jpg" alt="no product"/>
                    </c:if>
                    <c:if test="${productsInPage.size() > 0}">
                        <c:forEach items="${productsInPage}" var="product">
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
                                                    <span><i class="ion-ios-menu"></i></span>
                                                </a>
                                                <a href="/CWU/cart/add/${product.id}" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                                    <span><i class="ion-ios-cart"></i></span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="row mt-5">
                        ${getPagination.generatePagination(pageNumber, 12, products.size(), typePage)}
                    </div>
                </c:if>
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
    </body>
</html>