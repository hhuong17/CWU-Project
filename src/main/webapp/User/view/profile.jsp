<%-- 
    Document   : profile
    Created on : Mar 5, 2024, 12:51:47 AM
    Author     : Group 2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Profile</title>
        <%@include file="../components/baseHead.jsp" %>
    </head>
    <body class="goto-here">
        <%@include file="../components/header.jsp" %>
        <!-- END nav -->
        <section class="ftco-section contact-section bg-light">
            <div class="container">
                <div class="row block-9">
                    <div class="col-md-10 order-md-last d-flex">
                        <form action="/CWU/profile" method="post" class="bg-white p-5 contact-form" enctype="multipart/form-data">
                            <h2>Profile</h2>
                            <c:if test="${param.status != null && param.status ==1}">
                                <span style="color: green">Action successfully<span>
                            </c:if>
                            <c:if test="${param.status != null && param.status ==0}">
                                <span style="color: red">${param.message}<span>
                            </c:if>
                            <div class="form-group">
                                <label>Full name</label>
                                <input name="fullname" type="text" class="form-control" placeholder="Full name" value="${userProfile.fullName}">
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input name="email" type="text" class="form-control" placeholder="Email" value="${userProfile.email}">
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input name="phone" type="text" class="form-control" placeholder="Phone" value="${userProfile.phone}">
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input name="address" type="text" class="form-control" placeholder="Address" value="${userProfile.address}">
                            </div>
                            <div class="form-group">
                                <label>Avatar</label>
                                <input type="file" class="form-control" placeholder="Avatar" name="avatar">
                                <input type="hidden" class="form-control" name="oldAvatar" value="${userProfile.avatar}"> 
                                <img src="${userProfile.avatar}" alt="avatar"/>
                            </div>
                            <div class="form-group">
                                <label>Gender</label>
                                <select class="form-control" name="gender">
                                    <option value="1" ${userProfile.gender==1 ? "selected" : ""}>Nam</option>
                                    <option value="0" ${userProfile.gender==0 ? "selected" : ""}>Nữ</option>
                                </select>
                            </div>
                            <div class="form-group" style="margin-top: 5px">
                                <input type="submit" name="update-profile" value="Update profile" class="btn btn-primary py-3 px-5">
                                <a style="padding: 5px 10px; border-radius: 5px" class="bagde badge-warning" href="/CWU/profile/password">Change password</a>  |
                                <a style="padding: 5px 10px; border-radius: 5px" class="bagde badge-danger" href="/CWU/history/order">History order</a>
                            </div>
                        </form>
                    </div>
                                
                </div>
            </div>
        </section>
        <%@include file="../components/footer.jsp" %>
    </body>
</html>