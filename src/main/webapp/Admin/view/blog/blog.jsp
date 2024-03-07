<%-- 
    Document   : blog
    Created on : Mar 5, 2024, 11:28:45 PM
    Author     : Le Tan Kim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">All blog</h4>
                                    <h6 style="color: red;">
                                        <c:if test="${param.status != null}">
                                            ${param.status != null  && param.status == 0 ? param.message : "Action successfully"}
                                        </c:if> 
                                    </h6>
                                    <a href="/CWU/admin/blog/add" class="btn btn-info">Add new</a>
                                    <table class="table table-bordered table-hover table-striped" id="data-table">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> Title </th>
                                                <th> Image </th>
                                                <th> Date </th>
                                                <th> Status </th>
                                                <th> View </th>
                                                <th> Action </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${blogs}" var="blog" varStatus="indexScope">
                                                <tr>
                                                    <td> ${indexScope.index + 1} </td>
                                                    <td> ${blog.title} </td>
                                                    <td> 
                                                        <img src="${blog.image}" alt="image blog" style="width: 100px"/>
                                                    </td>
                                                    <td> ${blog.date} </td>
                                                    <td> ${blog.status == 1 ? "Active" : "Hidden"} </td>
                                                    <td> ${blog.view} </td>
                                                    <td> 
                                                        <a href="/CWU/admin/blog/update/${blog.id}" class="btn btn-success">Edit</a>
                                                        <a href="/CWU/admin/blog/detail/${blog.id}" class="btn btn-info">Detail</a>
                                                        <a href="/CWU/admin/blog/delete/${blog.id}" class="btn btn-danger" onclick=" return confirm('Are your sure to delete this?')">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--footer-->
                <%@include file="../../components/footer.jsp" %>
                <script>
                    let table = new DataTable('#data-table', {
                        responsive: true,
                        pageLength: 25,
                        language: {
                            url: '//cdn.datatables.net/plug-ins/1.13.7/i18n/vi.json',
                        },
                    });
                </script>
            </div>
        </div>
    </div>
</body>
</html>
