<%-- 
    Document   : category
    Created on : Feb 27, 2024, 11:07:52 PM
    Author     : Group 2
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
                                    <h4 class="card-title">All products</h4>
                                    <h6 style="color: red;">
                                        <c:if test="${param.status != null}">
                                            ${param.status != null  && param.status == 0 ? param.message : "Action successfully"}
                                        </c:if> 
                                    </h6>
                                    <a href="/CWU/admin/product/add" class="btn btn-info">Add new</a>
                                    <table class="table table-bordered table-hover table-striped" id="data-table">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> Title </th>
                                                <th> Image </th>
                                                <th> Action </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${products}" var="product" varStatus="indexScope">
                                                <tr>
                                                    <td> ${indexScope.index + 1} </td>
                                                    <td> ${product.title} </td>
                                                    <td> 
                                                        <img src="${product.image}" src="Image product"/>
                                                    </td>

                                                    <td> 
                                                        <a href="/CWU/admin/product/edit/${product.id}" class="btn btn-success">Update</a>
                                                        <a href="/CWU/admin/product/feedback/${product.id}" class="btn btn-success">Details</a>
                                                        <a href="/CWU/admin/product/delete/${product.id}" class="btn btn-danger" onclick=" return confirm('Are your sure to delete this?')">Delete</a>
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
//                        language: {
//                            url: '//cdn.datatables.net/plug-ins/1.13.7/i18n/vi.json',
//                        },
                    });
                </script>
            </div>
        </div>
    </div>
</body>
</html>
