<%-- 
    Document   : header
    Created on : Mar 4, 2024, 12:48:42 AM
    Author     : Group 2
--%>
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="getCategoryLib" class="Libs.AdminGetLib" scope="page" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="py-1 bg-primary">
    <div class="container">
        <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
            <div class="col-lg-12 d-block">
                <div class="row d-flex">
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><i class='bx bxs-phone' ></i></div>
                        <span class="text">+ 0987654321</span>
                    </div>
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><i class='bx bxs-envelope' ></i></div>
                        <span class="text">cwu.store@gmail.com</span>
                    </div>
                    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                        <span class="text">3-5 Business days delivery &amp; Free Returns</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="index.html">Cook With Us</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>
        <c:set value="${getCategoryLib.getCategory()}" var="categories" />
        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="/CWU/home" class="nav-link">Home</a></li>
                <li class="nav-item active dropdown">
                    <a class="nav-link dropdown-toggle" href="/CWU/product" id="dropdown04">Product</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <c:forEach begin="0" end="5" var="cate" items="${categories}">
                            <a class="dropdown-item" href="/CWU/category/${cate.id}">${cate.name}</a>
                        </c:forEach>
                        <c:if test="${categories.size() > 5}">
                            <a class="dropdown-item" href="/CWU/product">All</a>
                        </c:if>
                    </div>
                </li>
                <li class="nav-item"><a href="/CWU/blog" class="nav-link">Blog</a></li>
                    <c:if test="${sessionScope.idUser != null}">
                        <c:set value="${getCategoryLib.getUser(sessionScope.idUser)}" var="user"/>
                    <li class="nav-item">
                        <a href="/CWU/profile" class="nav-link">
                            ${user.fullName == null ? user.email : user.fullName}
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/CWU/logout" class="nav-link" onclick="return confirm('Are you sure to logout?')">
                            Logout
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.idUser == null}">
                    <li class="nav-item">
                        <a href="/CWU/login" class="nav-link">
                            Login
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/CWU/register" class="nav-link">
                            Register
                        </a>
                    </li>
                </c:if>
                <li class="nav-item cta cta-colored"><a href="/CWU/cart" class="nav-link">
                        <i class='bx bx-cart'></i>[${getCategoryLib.getNumberOfCart(sessionScope.idUser == null ? 0 : sessionScope.idUser)}]</a>
                </li>
            </ul>
        </div>
    </div>
</nav>