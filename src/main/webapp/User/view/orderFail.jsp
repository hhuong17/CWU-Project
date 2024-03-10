<%-- 
    Document   : orderFail
    Created on : Mar 4, 2024, 11:51:39 PM
    Author     : Group 2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="getCurrency" class="Libs.Currency" scope="page" />
<jsp:useBean id="getPagination" class="Libs.Pagination" scope="page" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Order fail</title>
        <%@include file="../components/baseHead.jsp" %>
    </head>
    <body class="goto-here">
        <%@include file="../components/header.jsp" %>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <img style="margin: 0 auto; max-width: 100%" 
                         src="./img/orderfail.png" alt="order fail"/>
                </div>
            </div>
        </section>
        <%@include file="../components/footer.jsp" %>
    </body>
</html>
