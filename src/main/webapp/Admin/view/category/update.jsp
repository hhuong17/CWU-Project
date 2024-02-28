<%-- 
    Document   : update
    Created on : Feb 28, 2024, 9:11:10 AM
    Author     : LENOVO
--%>

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
                                        <h4 class="card-title">Sửa danh mục</h4>
                                        <form class="forms-sample" action="/admin/category/" method="post">
                                            <input type="hidden" name="_method" value="PUT"> <!-- Hoặc sử dụng PATCH nếu prefer -->
                                            <div class="form-group">
                                                <label>Tên danh mục</label>
                                                <input id="category" type="text" class="form-control" placeholder="Tên danh mục" name="name"">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleSelectGender">Trạng thái</label>
                                                <select class="form-control" id="exampleSelectGender" name="status">
                                                    <option value="1">Bình thường</option>
                                                    <option value="0">Ẩn</option>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-primary mr-2" name="edit-category">Lưu chỉnh sửa</button>
                                            <a href="/admin/categories" class="btn btn-light">Quay lại</a>
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


