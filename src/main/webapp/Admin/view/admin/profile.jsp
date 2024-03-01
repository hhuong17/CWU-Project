<%-- 
    Document   : profile
    Created on : Mar 1, 2024, 11:12:36 PM
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
                                    <h4 class="card-title">Chinh sua thong tin admin</h4>
                                    <form class="forms-sample" action="/CWU/admin/profile"  method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input id="category" type="text" class="form-control" placeholder="Userame" name="username" readonly value="${admin.username}">
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input id="category" type="hidden" class="form-control" name="id" readonly value="${admin.id}">
                                            <input id="category" type="text" class="form-control" placeholder="Email" name="email" value="${admin.email}">
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Fullname</label>
                                            <input id="category" type="text" class="form-control" placeholder="Fullname" name="fullname" value="${admin.fullname}">
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Phone</label>
                                            <input id="category" type="text" class="form-control" placeholder="Phone" name="phone" value="${admin.phone}">
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input id="category" type="text" class="form-control" placeholder="Password" name="password">
                                            <input id="category" type="hidden"  name="odlPassword" value="${admin.password}">
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Gender</label>
                                            <select class="form-control" id="exampleSelectGender" name="gender">
                                                <option value="0" ${admin.gender == 0 ? "selected" : ""}>Nam</option>
                                                <option value="1" ${admin.gender == 1 ? "selected" : ""}>Nu</option>
                                            </select>
                                            <span class = 'message_error'></span>
                                        </div>
                                        <div class="form-group">
                                            <label>Avatar</label>
                                            <input id="category" type="file" class="form-control" placeholder="Phone" name="avatar">
                                            <input type="hidden" value="${admin.avatar}" name="oldAvatar"/>
                                            <img src="${admin.avatar}"/>
                                            <span class = 'message_error'></span>
                                        </div>
                                        <button id="add-new" type="submit" class="btn btn-primary mr-2" name="update-admin">Update</button>
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
