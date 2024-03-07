<%-- 
    Document   : delete
    Created on : Feb 28, 2024, 1:54:26 PM
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
                                        <h4 class="card-title">Xóa category</h4>
                                        <form class="forms-sample" action="/CWU/admin/delete-category" method="post">
                                            <div class="form-group">
                                                <label for="categoryId">Chọn ngành nghề cần xóa</label>
                                                <select class="form-control" id="categoryId" name="categoryId">
                                                    <!-- Lặp qua danh sách các category để hiển thị -->
                                                    <%
                                                        // Lấy danh sách category từ database hoặc bất kỳ nguồn dữ liệu nào khác
                                                        List<Category> categories = categoryDAO.getAllCategories();

                                                        for(Category category : categories) {
                                                    %>
                                                    <option value="<%=category.getId()%>"><%=category.getName()%></option>
                                                    <% } %>
                                                </select>
                                            </div>
                                            <button id="delete-category" type="submit" class="btn btn-danger mr-2" name="delete-category">Xóa</button>
                                            <button class="btn btn-light" type="reset">Hủy bỏ</button>
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

