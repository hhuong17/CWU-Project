<%-- 
    Document   : detailProduct
    Created on : Mar 4, 2024, 10:04:18 AM
    Author     : Group 2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="getCurrency" class="Libs.Currency" scope="page" />
<jsp:useBean id="getLib" class="Libs.AdminGetLib" scope="page" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>${product.title}</title>
        <%@include file="../components/baseHead.jsp" %>
    </head>
    <body class="goto-here">
        <%@include file="../components/header.jsp" %>
        <!-- END nav -->
        <div class="hero-wrap hero-bread" style="background-image: url('./img/banner.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="index.html">Product</a></span> <span>Product Single</span></p>
                        <h1 class="mb-0 bread">${product.title}</h1>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 mb-5 ftco-animate">
                        <a href="images/product-1.jpg" class="image-popup"><img src="${product.image}" class="img-fluid" alt="${product.title}"></a>
                    </div>
                    <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                        <h3>${product.title}</h3>
                        <div class="rating d-flex">
                            <p class="text-left mr-4">
                                <a href="#" class="mr-2">${startAverge}</a>
                                <c:forEach begin="0" end="${startAverge - 1}">
                                    <a><i style="color: yellow" class='bx bxs-star' ></i></a>
                                    </c:forEach>
                                    <c:if test="${(5 - (startAverge)) > 0}">
                                        <c:forEach begin="0" end="${(5 - (startAverge) - 1)}">
                                        <a><i class='bx bx-star' ></i></a>
                                        </c:forEach>
                                    </c:if>
                            </p>
                        </div>
                        <p class="price">
                            <span>${getCurrency.currencyFormat(product.price, "vnd")}</span>
                        </p>
                        <p>
                            ${product.description}
                        </p>
                        <form action="/CWU/cart" method="post">
                            <div class="row mt-4">
                                <div class="w-100"></div>
                                <div class="input-group col-md-6 d-flex mb-3">
                                    <span class="input-group-btn mr-2">
                                        <button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
                                            -
                                        </button>
                                    </span>
                                    <input type="hidden" name="id" value="${product.id}">
                                    <input type="text" id="quantity" name="quantity" class="form-control input-number quantity-${product.id}" value="1" min="1" max="${product.stock}">
                                    <span class="input-group-btn ml-2">
                                        <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                            +
                                        </button>
                                    </span>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-12">
                                    <p style="color: #000;">${product.stock} product available</p>
                                </div>
                            </div>
                            <p><button name="add-to-cart" type="submit" class="btn btn-primary" style="color: #fff !important; background: #82ae46 !important;" onclick="return checkQuantity(${product.id}, ${product.stock})">Add to Cart</button></p>
                        </form>
                        <script>
                            const checkQuantity = (ele, maxNumber) => {
                                const valueEle = document.querySelector(".quantity-" + ele).value;
                                if (valueEle > maxNumber || valueEle <= 0) {
                                    alert("Max stock of this product is " + maxNumber);
                                    return false;
                                }
                                return true;
                            }
                        </script>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section ftco-degree-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 ftco-animate">
                        <div class="pt-5 mt-5">
                            <h3 class="mb-5">${feedbacks.size()} feedback</h3>
                            <ul class="comment-list">
                                <c:forEach items="${feedbacks}" var="feed">
                                    <c:set value="${getLib.getUser(feed.userId)}" var="user"/>
                                    <c:if test="${user != null}">
                                        <li class="comment">
                                            <div class="vcard bio">
                                                <img src="${user.avatar == null ? "./img/defaul.jpg" : user.avatar}" alt="Image placeholder">
                                            </div>
                                            <div class="comment-body">
                                                <h3>${user.fullName}</h3>
                                                <div class="meta">
                                                    ${feed.feedbackDate}
                                                    <c:forEach begin="0" end="${feed.rate - 1}">
                                                        <a>
                                                            <i style="color: yellow" class='bx bx-star' ></i></a>
                                                        </c:forEach>
                                                        <c:if test="${(5 - (feed.rate)) > 0}">
                                                            <c:forEach begin="0" end="${(5 - (feed.rate)) - 1}">
                                                            <a><i class='bx bxs-star' ></i></a>
                                                            </c:forEach>
                                                        </c:if>
                                                </div>
                                                <p>${feed.feedbackContent}</p>
                                                <p>
                                                    <c:if test="${feed.image != null}">
                                                        <img style="width: 150px" src="${feed.image}" alt="Image feedback"/>
                                                    </c:if>
                                                </p>
                                                <c:if test="${sessionScope.idUser != null && user.id == sessionScope.idUser}">
                                                     <p><a href="/CWU/history/order/feedback/delete/${feed.id}" class="reply">Delete</a></p>
                                                </c:if>
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>                    
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-3 pb-3">
                    <div class="col-md-12 heading-section text-center ftco-animate">
                        <span class="subheading">Quality defines our brand</span>
                        <h2 class="mb-4">Our Ingredients</h2>
                        <p>Embark on a journey to culinary excellence! Explore our diverse collection of ingredients,<br>where quality meets delicious flavors, and your culinary creations come to life.</p>
                    </div>
                </div>   		
            </div>
            <div class="container">
                <div class="row">
                    <c:if test="${productRelated.size() > 0}">
                        <c:forEach items="${productRelated}" var="product">
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
                                                <p class="price">
                                                    <span class="mr-2 price-dc">
                                                        ${getCurrency.currencyFormat(product.price, "vnd")}
                                                    </span>
                                                    <span class="price-sale">
                                                        ${getCurrency.currencyFormat(product.salePrice, "vnd")}
                                                    </span>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="bottom-area d-flex px-3">
                                            <div class="m-auto d-flex">
                                                <a href="/CWU/product/detail/${product.id}" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                                    <span><i class='bx bx-spreadsheet'></i></span>
                                                </a>
                                                <a href="/CWU/cart/add/${product.id}" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                                    <span><i class='bx bx-cart'></i></span>
                                                </a>
                                                <!--                                                <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                                                                                    <span><i class="ion-ios-heart"></i></span>
                                                                                                </a>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${productRelated.size() <= 0}">
                        <<img src="./img/no-product-relate.png" style="margin: 0 auto; max-width: 100%" src="./img/noproduct.jpg" alt="No product relate"/>
                    </c:if>
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
