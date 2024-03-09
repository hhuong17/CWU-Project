<%-- 
    Document   : detail
    Created on : Mar 7, 2024, 1:33:22 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../components/header.jsp" %>
<body>
    <div class="container-scroller">
        <!-- partial:../../partials/_navbar.html -->
        <%@include file="../../components/navigation.jsp" %>
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:../../partials/_sidebar.html -->
            <%@include file="../../components/sidebar.jsp" %>
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Detail product</h4>
                                    <h6 style="color: red;">
                                        <c:if test="${param.status != null}">
                                            ${param.status != null  && param.status == 0 ? param.message : "Action successfully"}
                                        </c:if> 
                                    </h6>
                                    <form class="forms-sample" action="/CWU/admin/product"  method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="exampleSelectGender">Category</label>
                                            <c:forEach items="${categories}" var="cat">
                                                <c:if test="${cat.id == product.category_id}">
                                                    <input id="category" type="text" class="form-control" value="${cat.name}" readonly>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <div class="form-group">
                                            <label>Title</label>
                                            <input id="category" type="text" class="form-control" value="${product.title}" readonly>
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Price</label>
                                            <input id="category" type="text" class="form-control" value="${product.price}" readonly>
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Price after discount</label>
                                            <input id="category" type="text" class="form-control"value="${product.salePrice}" readonly>
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Stock</label>
                                            <input id="category" type="text" class="form-control" placeholder="Stock" name="stock" value="${product.stock}">
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Description</label>
                                            <input id="category" type="text" class="form-control" value="${product.description}" readonly>
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Image</label>
                                            <img src="${product.image}" alt="alt"/>
                                            <span class = 'message_error'></span>
                                        </div> 
                                    </form>
                                    <h4 class="card-title">All feedback</h4>
                                    <table class="table table-bordered table-hover table-striped" id="data-table">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> User </th>
                                                <th> Content </th>
                                                <th> Image </th>
                                                <th> Rate </th>
                                                <th> Date </th>
                                                <th> Action </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${feedbacks}" var="feed" varStatus="indexScope">
                                                <tr>
                                                    <td> ${indexScope.index + 1} </td>
                                                    <td> ${getAdmin.getUser(feed.userId).fullName} </td>
                                                    <td> ${feed.feedbackContent} </td>
                                                    <td> 
                                                        <img src="${feed.image}" src="Image product"/>
                                                    </td>
                                                    <td> ${feed.rate} start</td>
                                                    <td> ${feed.feedbackDate} </td>
                                                    <td> 
                                                        <a href="/CWU/admin/product/feedback/delete/${product.id}/${feed.id}" class="btn btn-danger" onclick=" return confirm('Are your sure to delete this?')">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--footer-->
                <%@include file="../../components/footer.jsp" %>     
            </div>
        </div>
    </div>
</body>
</html>