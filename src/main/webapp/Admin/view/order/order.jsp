<%-- 
    Document   : category
    Created on : Feb 27, 2024, 11:07:52 PM
    Author     : LENOVO
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
                                    <h6 style="color: red;">${param.status != null  && param.status == 0 ? param.message : "Action successfully"}</h6>
                                    <table class="table table-bordered table-hover table-striped" id="data-table">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> FullName </th>
                                                <th> Address </th>
                                                <th> Phone </th>
                                                <th> Order date </th>
                                                <th> Payment </th>
                                                <th> Status </th>
                                                <th> X? lí </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${orders}" var="order" varStatus="indexScope">
                                                <tr>
                                                    <td> ${indexScope.index + 1} </td>
                                                    <td> ${order.fullname} </td>
                                                    <td> ${order.address} </td>
                                                    <td> ${order.phone} </td>
                                                    <td> ${order.orderDate} </td>
                                                    <td> ${order.payment == 1 ? "Thanh toan khi nhan hang" : "Thanh toan qua VNPAY"} </td>
                                                    <td> ${order.status} </td>
                                                    <td> 
                                                        <a href="/CWU/admin/order/edit/${order.id}" class="btn btn-success">Thay doi trang thai</a>
                                                        <a href="/CWU/admin/order/detail/${order.id}" class="btn btn-success">Chi tiet</a>
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
