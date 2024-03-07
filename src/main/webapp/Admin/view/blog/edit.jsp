<%-- 
    Document   : edit
    Created on : Mar 5, 2024, 11:28:34 PM
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
                                    <h4 class="card-title">Update bài viết</h4>
                                    <form class="forms-sample" action="/CWU/admin/blog"  method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label>Tên bài viết</label>
                                            <input type="hidden" name="id" value="${blog.id}"/>
                                            <input id="title" type="text" class="form-control" placeholder="Tên bài viết" name="title" value="${blog.title}">
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Hình ảnh</label><br>
                                            <input id="image" type="file" class="form-control" name="image" >
                                            <input name="oldImage" type="hidden" value="${blog.image}" />
                                            <img src="${blog.image}" alt="Image" style="width: 200px"/>
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Mô tả</label>
                                            <textarea id="description" class="form-control" name="description">${blog.description}</textarea>
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleSelectGender">Trạng thái</label>
                                            <select class="form-control" id="exampleSelectGender" name="status">
                                                <option value="1" ${blog.status == 1 ? "selected" : ""}>Bình thường</option>
                                                <option value="0" ${blog.status == 0 ? "selected" : ""}>Ẩn</option>
                                            </select>
                                        </div>
                                        <button id="add-new" type="submit" class="btn btn-primary mr-2" name="update-blog">Update</button>
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
