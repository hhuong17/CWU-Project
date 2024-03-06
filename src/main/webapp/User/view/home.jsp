<%-- 
    Document   : home
    Created on : Mar 4, 2024, 12:52:47 AM
    Author     : Tran Tri Tin
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
                                <h1 class="mb-2">We serve Fresh Vegestables &amp; Fruits</h1>
                                <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
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
                                <h1 class="mb-2">100% Fresh &amp; Organic Foods</h1>
                                <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
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
                        <h2 class="mb-4">Our Products</h2>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
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
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
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
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
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
                                        <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Garreth Smith</p>
                                        <span class="position">Marketing Manager</span>
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
                                        <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Garreth Smith</p>
                                        <span class="position">Interface Designer</span>
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
                                        <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Garreth Smith</p>
                                        <span class="position">UI Designer</span>
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
                                        <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Garreth Smith</p>
                                        <span class="position">Web Developer</span>
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
                                        <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Garreth Smith</p>
                                        <span class="position">System Analyst</span>
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