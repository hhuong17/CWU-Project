<%-- 
    Document   : add
    Created on : Feb 27, 2024, 11:10:45 PM
    Author     : LENOVO
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
                                        <h4 class="card-title">Thêm mới san pham</h4>
                                        <form class="forms-sample" action="/CWU/admin/product"  method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label for="exampleSelectGender">Danh muc</label>
                                                <select class="form-control" id="exampleSelectGender" name="category">
                                                    <c:forEach items="${categories}" var="cat">
                                                         <option value="${cat.id}">${cat.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Tieu de</label>
                                                <input id="category" type="text" class="form-control" placeholder="Tieu de" name="title">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Gia</label>
                                                <input id="category" type="text" class="form-control" placeholder=Gia" name="price">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Gia sale</label>
                                                <input id="category" type="text" class="form-control" placeholder="Gia sale" name="priceSale">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Stock</label>
                                                <input id="category" type="text" class="form-control" placeholder="Stock" name="stock">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Mo ta</label>
                                                <input id="category" type="text" class="form-control" placeholder="Mo ta" name="desc">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Hinh anh</label>
                                                <input id="category" type="file" class="form-control" placeholder="Hinh anh" name="image">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleSelectGender">Trạng thái</label>
                                                <select class="form-control" id="exampleSelectGender" name="status">
                                                    <option value="1">Bình thường</option>
                                                    <option value="0">Ẩn</option>
                                                </select>
                                            </div>
                                            <button id="add-new" type="submit" class="btn btn-primary mr-2" name="add-new">Thêm mới</button>
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
