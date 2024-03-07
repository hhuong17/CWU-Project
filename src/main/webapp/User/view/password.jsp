<%-- 
    Document   : password
    Created on : Mar 5, 2024, 1:01:54 AM
    Author     : Le Tan Kim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Change password</title>
        <%@include file="../components/baseHead.jsp" %>
    </head>
    <body class="goto-here">
        <%@include file="../components/header.jsp" %>
        <!-- END nav -->
        <section class="ftco-section contact-section bg-light">
            <div class="container">
                <div class="row block-9">
                    <div class="col-md-6 order-md-last d-flex">
                        <form action="/CWU/profile" method="post" class="bg-white p-5 contact-form" enctype="multipart/form-data">
                            <h2>Change password</h2>
                            <c:if test="${param.status != null && param.status ==1}">
                                <span style="color: green">Action successfully</span>
                            </c:if>
                            <c:if test="${param.status != null && param.status ==0}">
                                <span style="color: red">${param.message != null ? param.message : "Action fail"}</span>
                            </c:if>
                            <div class="form-group">
                                <label>Old password</label>
                                <input type="password" class="form-control" placeholder="Old password"  name="oldPassword">
                            </div>
                            <div class="form-group">
                                <label>New password</label>
                                <input type="password" class="form-control" placeholder="New password"  name="newPassword">
                            </div>
                            <div class="form-group" style="margin-top: 5px">
                                <input type="submit" name="update-password" value="Update profile" class="btn btn-primary py-3 px-5">
                                <a href="/CWU/profile">Change profile</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="../components/footer.jsp" %>
    </body>
</html>