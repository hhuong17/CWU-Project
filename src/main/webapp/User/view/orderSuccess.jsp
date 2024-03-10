<%-- 
    Document   : orderSuccess
    Created on : Mar 4, 2024, 11:51:30 PM
    Author     : Group 2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="getCurrency" class="Libs.Currency" scope="page" />
<jsp:useBean id="getPagination" class="Libs.Pagination" scope="page" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Order success</title>
        <%@include file="../components/baseHead.jsp" %>
    </head>
    <body class="goto-here">
        <%@include file="../components/header.jsp" %>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <img style="margin: 0 auto; max-width: 100%" 
                         src="https://www.mgt-commerce.com/astatic/assets/images/article/2023/225/hero.svg?v=1.0.2" alt="order success"/>
                </div>
            </div>
        </section>

        
        <%@include file="../components/footer.jsp" %>
    </body>
</html>