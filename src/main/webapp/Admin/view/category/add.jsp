<%-- 
    Document   : add
    Created on : Feb 27, 2024, 11:10:45 PM
    Author     : Group 2
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
                                        <h4 class="card-title">Add New Category</h4>
                                        <form class="forms-sample" action="/CWU/admin/category"  method="post">
                                            <div class="form-group">
                                                <label>Name of Category</label>
                                                <input id="category" type="text" class="form-control" placeholder="Name of Category" name="name">
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleSelectGender">Status</label>
                                                <select class="form-control" id="exampleSelectGender" name="status">
                                                    <option value="1">Normal</option>
                                                    <option value="0">Hidden</option>
                                                </select>
                                            </div>
                                            <button id="add-new" type="submit" class="btn btn-primary mr-2" name="add-new">Add New</button>
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
