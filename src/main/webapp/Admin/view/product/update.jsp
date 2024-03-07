<%-- 
    Document   : update
    Created on : Feb 28, 2024, 9:11:10 AM
    Author     : Group 2
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
                                        <h4 class="card-title">Sửa danh mục</h4>
                                        <form class="forms-sample" action="/CWU/admin/product"  method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label for="exampleSelectGender">Danh muc</label>
                                                <select class="form-control" id="exampleSelectGender" name="category">
                                                    <c:forEach items="${categories}" var="cat">
                                                         <option value="${cat.id}" ${cat.id == product.category_id ? "selected" : ""}>${cat.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Tieu de</label>
                                                <input id="category" type="hidden" class="form-control" placeholder="Tieu de" name="id" value="${product.id}">
                                                <input id="category" type="text" class="form-control" placeholder="Tieu de" name="title" value="${product.title}">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Gia</label>
                                                <input id="category" type="text" class="form-control" placeholder=Gia" name="price" value="${product.price}">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Gia sale</label>
                                                <input id="category" type="text" class="form-control" placeholder="Gia sale" name="priceSale" value="${product.salePrice}">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Stock</label>
                                                <input id="category" type="text" class="form-control" placeholder="Stock" name="stock" value="${product.stock}">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Mo ta</label>
                                                <input id="category" type="text" class="form-control" placeholder="Mo ta" name="desc" value="${product.description}">
                                                
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Hinh anh</label>
                                                <input id="category" type="file" class="form-control" placeholder="Hinh anh" name="image">
                                                <input id="category" type="hidden" class="form-control" placeholder="Hinh anh" name="oldImage" value="${product.image}">
                                                <img src="${product.image}" alt="alt"/>
                                                <span class = 'message_error'></span>
                                            </div>
                                            <button id="add-new" type="submit" class="btn btn-primary mr-2" name="update-product">Update</button>
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


