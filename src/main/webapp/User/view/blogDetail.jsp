<%-- 
    Document   : blogDetail
    Created on : Mar 7, 2024, 1:24:43 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>${blog.title}</title>
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
                    <div class="col-lg-12 ftco-animate" style="padding: 10px;border: 1px solid #eeebeb">
                        <h2 style="font-weight: bold">${blog.title}</h2>
                        <div class="meta" style="display: flex; gap: 10px; font-size: 12px; font-style: italic">
                            <div>Post by admin at ${blog.date}</div>
                        </div>
                        <div class="main-content" style="margin-top: 10px;">
                            ${blog.description}
                        </div>
                    </div> 
                </div>
            </div>
        </section>
        <%@include file="../components/footer.jsp" %>
    </body>
</html>