<%-- 
    Document   : add
    Created on : Feb 27, 2024, 11:10:45 PM
    Author     : Group 2
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                        <h4 class="card-title">Add new product</h4>
                                        <form class="forms-sample" action="/CWU/admin/product"  method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label for="exampleSelectGender">Category</label>
                                                <select class="form-control" id="exampleSelectGender" name="category">
                                                    <c:forEach items="${categories}" var="cat">
                                                         <option value="${cat.id}">${cat.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Title</label>
                                                <input id="category" type="text" class="form-control"  name="title">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Price</label>
                                                <input id="category" type="text" class="form-control"  name="price">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Price after discount</label>
                                                <input id="category" type="text" class="form-control"  name="priceSale">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Stock</label>
                                                <input id="category" type="text" class="form-control"  name="stock">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Description</label>
                                                <input id="category" type="text" class="form-control"  name="desc">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Image</label>
                                                <input id="category" type="file" class="form-control"  name="image">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleSelectGender">Status</label>
                                                <select class="form-control" id="exampleSelectGender" name="status">
                                                    <option value="1">Normal</option>
                                                    <option value="0">Hide</option>
                                                </select>
                                            </div>
                                            <button id="add-new" type="submit" class="btn btn-primary mr-2" name="add-new">Add</button>
                                        </form>
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
