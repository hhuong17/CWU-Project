<%-- 
    Document   : blog
    Created on : Mar 7, 2024, 1:24:34 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Blog</title>
        <%@include file="../components/baseHead.jsp" %>
    </head>
    <body class="goto-here">
        <%@include file="../components/header.jsp" %>
        <!-- END nav -->
        <div class="hero-wrap hero-bread" style="background-image: url('./img/banner.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"><a href="/CWU">Home</a></span> <span>Blog</span></p>
                        <h1 class="mb-0 bread">Blog</h1>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section ftco-degree-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 ftco-animate">
                        <div class="row">
                            <c:if test="${blogs.size() > 0}">
                                <c:forEach items="${blogs}" var="blog">
                                    <div class="col-md-12 d-flex ftco-animate">
                                        <div class="blog-entry align-self-stretch d-md-flex">
                                            <a href="blog-single.html" class="block-20" style="background-image: url('${blog.image}');">
                                            </a>
                                            <div class="text d-block pl-md-4">
                                                <div class="meta mb-3">
                                                    <div><a href="/CWU/blog/detail/${blog.id}">${blog.date}</a></div>
                                                    <div><a >Admin</a></div>
                                                </div>
                                                <h3 class="heading">
                                                    <a href="/CWU/blog/detail/${blog.id}">${blog.title}</a>
                                                </h3>
                                                <p><a href="/CWU/blog/detail/${blog.id}" class="btn btn-primary py-2 px-3">Read more</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div> <!-- .col-md-8 -->
                </div>
            </div>
        </section> <!-- .section -->
        <%@include file="../components/footer.jsp" %>
    </body>
</html>