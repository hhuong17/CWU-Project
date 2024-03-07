<%-- 
    Document   : edit
    Created on : Mar 1, 2024, 10:40:23 PM
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
                                    <h4 class="card-title">Cinh sua thong tin nguoi dung</h4>
                                    <form class="forms-sample" action="/CWU/admin/user"  method="post">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input id="category" type="hidden" class="form-control" name="id" readonly value="${user.id}">
                                            <input id="category" type="text" class="form-control" placeholder="Email" name="email" readonly value="${user.email}">
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Fullname</label>
                                            <input id="category" type="text" class="form-control" placeholder="Fullname" name="fullname" value="${user.fullName}">
                                            <span class = 'message_error'></span>
                                        </div>
                                            <div class="form-group">
                                            <label>Phone</label>
                                            <input id="category" type="text" class="form-control" placeholder="Phone" name="phone" value="${user.phone}">
                                            <span class = 'message_error'></span>
                                        </div>
                                            <div class="form-group">
                                            <label>Address</label>
                                            <input id="category" type="text" class="form-control" placeholder="Address" name="address" value="${user.address}">
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Gender</label>
                                            <select class="form-control" id="exampleSelectGender" name="gender">
                                                <option value="0" ${user.gender == 0 ? "selected" : ""}>Nam</option>
                                                <option value="1" ${user.gender == 1 ? "selected" : ""}>Nu</option>
                                            </select>
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleSelectGender">Trạng thái</label>
                                            <select class="form-control" id="exampleSelectGender" name="status">
                                                <option value="1" ${user.status==1 ? "selected" : ""}>Active</option>
                                                <option value="0" ${user.status==0 ? "selected" : ""}>Ban</option>
                                            </select>
                                        </div>
                                        <button id="add-new" type="submit" class="btn btn-primary mr-2" name="update-user">Update</button>
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
