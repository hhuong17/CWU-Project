<%-- 
    Document   : add
    Created on : Mar 5, 2024, 11:28:29 PM
    Author     : Admin
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
                                    <h4 class="card-title">Thêm mới bài viết</h4>
                                    <form class="forms-sample" action="/CWU/admin/blog"  method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label>Tên bài viết</label>
                                            <input id="title" type="text" class="form-control" placeholder="Tên bài viết" name="title">
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Hình ảnh</label>
                                            <input id="image" type="file" class="form-control" name="image">
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Mô tả</label>
                                            <textarea id="description" class="form-control" name="description"></textarea>
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
                <script src="./ckeditor/ckeditor.js"></script>
                <script>
                    CKEDITOR.replace("description");
                </script>
            </div>
        </div>
    </div>
</body>
</html>
