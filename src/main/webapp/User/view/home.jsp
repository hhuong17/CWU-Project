<%-- 
    Document   : home
    Created on : Mar 4, 2024, 12:52:47 AM
    Author     : Group 2
--%>

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
                <div class="slider-item" style="background-image: url(images/bg_1.jpg);">
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

                <div class="slider-item" style="background-image: url(images/bg_2.jpg);">
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
                                                <span><i class="ion-ios-menu"></i></span>
                                            </a>
                                            <a href="/CWU/cart/add/${product.id}" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                                <span><i class="ion-ios-cart"></i></span>
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

        <section class="ftco-section img" style="background-image: url(images/bg_3.jpg);">
            <div class="container">
                <div class="row justify-content-end">
                    <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
                        <span class="subheading">Best Price For You</span>
                        <h2 class="mb-4">Deal of the day</h2>
                        <p>Today's program: Limited stock! Get [product] at a discounted price today!</p>
                        <h3><a href="#">Spinach</a></h3>
                        <span class="price">$10 <a href="#">now $5 only</a></span>
                        <div id="timer" class="d-flex mt-5">
                            <div class="time" id="days"></div>
                            <div class="time pl-3" id="hours"></div>
                            <div class="time pl-3" id="minutes"></div>
                            <div class="time pl-3" id="seconds"></div>
                        </div>
                    </div>
                </div>   		
            </div>
        </section>

        <section class="ftco-section testimony-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section ftco-animate text-center">
                        <span class="subheading">Testimony</span>
                        <h2 class="mb-4">Our satisfied customer says</h2>
                        <p>With quality ingredients from CWU, creating delicious and unique dishes is no longer a challenge. Thank you for bringing creativity and quality to my family's meals!</p>
                    </div>
                </div>
                <div class="row ftco-animate">
                    <div class="col-md-12">
                        <div class="carousel-testimony owl-carousel">
                            <div class="item">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text text-center">
                                        <p class="mb-5 pl-4 line">Explore a diverse array of premium ingredients that spark your culinary imagination, resulting in delectable dishes with each creation.</p>
                                        <p class="name">Quality Ingredients, Creative Dishes</p>
                                        <span class="position">Naturally derived ingredients </span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-5" style="background-image: url(images/person_2.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text text-center">
                                        <p class="mb-5 pl-4 line">We meticulously source and curate premium ingredients, enabling you to craft culinary masterpieces that impress every palate.</p>
                                        <p class="name">Crafting Culinary Excellence</p>
                                        <span class="position">High-quality ingredients</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-5" style="background-image: url(images/person_3.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text text-center">
                                        <p class="mb-5 pl-4 line">Elevate your cooking to new heights with our carefully selected range of superior ingredients, guaranteeing a delightful culinary journey with every dish.</p>
                                        <p class="name">Elevating Your Cooking Experience</p>
                                        <span class="position">Fresh ingredients</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text text-center">
                                        <p class="mb-5 pl-4 line">Explore our innovative range of ingredients and unleash your imagination to create inspired culinary creations that leave a lasting impression.</p>
                                        <p class="name">Innovative Ingredients, Inspired Creations</p>
                                        <span class="position">Flavorful ingredients</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text text-center">
                                        <p class="mb-5 pl-4 line">Let our high-quality ingredients be your canvas as you unleash your inner chef, experimenting with flavors and techniques to create unforgettable meals.</p>
                                        <p class="name">Unleash Your Inner Chef</p>
                                        <span class="position">Chef-selected ingredients</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <hr>

        <section class="ftco-section ftco-partner">
            <div class="container">
                <div class="row">
                    <div class="col-sm ftco-animate">
                        <a href="#" class="partner"><img src="images/partner-1.png" class="img-fluid" alt="Colorlib Template"></a>
                    </div>
                    <div class="col-sm ftco-animate">
                        <a href="#" class="partner"><img src="images/partner-2.png" class="img-fluid" alt="Colorlib Template"></a>
                    </div>
                    <div class="col-sm ftco-animate">
                        <a href="#" class="partner"><img src="images/partner-3.png" class="img-fluid" alt="Colorlib Template"></a>
                    </div>
                    <div class="col-sm ftco-animate">
                        <a href="#" class="partner"><img src="images/partner-4.png" class="img-fluid" alt="Colorlib Template"></a>
                    </div>
                    <div class="col-sm ftco-animate">
                        <a href="#" class="partner"><img src="images/partner-5.png" class="img-fluid" alt="Colorlib Template"></a>
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
    </body>
</html>