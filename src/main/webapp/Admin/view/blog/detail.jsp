<%-- 
    Document   : detail
    Created on : Mar 5, 2024, 11:28:41 PM
    Author     : Le Tan Kim
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
                                    <h4 class="card-title">Update bài viết</h4>
                                    <form class="forms-sample" action="/CWU/admin/blog"  method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label>Tên bài viết</label>
                                            <input id="title" type="text" class="form-control" name="title" readonly value="${blog.title}">
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Hình ảnh</label><br>
                                            <img src="${blog.image}" alt="Image" style="width: 200px"/>
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Mô tả</label>
                                            <textarea id="description" class="form-control" name="description" readonly>${blog.description}</textarea>
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleSelectGender">Trạng thái</label>
                                            <input value="${blog.status == 1 ? "Active" : "Hidden"}" class="form-control" readonly/>
                                        </div>
                                        <a href="/CWU/admin/blog" id="add-new" class="btn btn-primary mr-2" name="update-blog">Back to list</a>
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
