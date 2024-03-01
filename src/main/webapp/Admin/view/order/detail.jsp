<%-- 
    Document   : detail
    Created on : Feb 29, 2024, 1:15:45 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <h4 class="card-title">Chi tiet don hang</h4>
                                    <div>
                                        <form class="forms-sample" action="/CWU/admin/product"  method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label>Fullname</label>                                             
                                                <input id="category" type="text" class="form-control" placeholder="Tieu de" name="title" value="${order.fullname}" readonly>
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Address</label>
                                                <input id="category" type="text" class="form-control" placeholder=Gia" name="price" value="${order.address}" readonly>
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Phone</label>
                                                <input id="category" type="text" class="form-control" placeholder="Gia sale" name="priceSale" value="${order.phone}" readonly>
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Order date</label>
                                                <input id="category" type="text" class="form-control" placeholder="Stock" name="stock" value="${order.orderDate}" readonly>
                                                <span class = 'message_error'></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Payment</label>
                                                <input id="category" type="text" class="form-control" placeholder="Mo ta" 
                                                       name="desc" value="${order.payment == 1 ? "Thanh toan khi nhan hang" : "Thanh toan qua VNPAY"}" readonly>
                                                <span class = 'message_error'></span>
                                            </div>
                                        </form>
                                    </div>
                                    <table class="table table-bordered table-hover table-striped" id="data-table">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> Name </th>
                                                <th> Image </th>
                                                <th> Quantity </th>
                                                <th> Price </th>
                                                <th> Sale price </th>
                                                <th> Description </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${orderDetails}" var="order" varStatus="indexScope">
                                                <c:set value="${getAdmin.getProduct(order.productId)}" var="product" />
                                                <tr>
                                                    <td> ${indexScope.index + 1} </td>
                                                    <td> ${product.title} </td>
                                                    <td> <img src="${product.image}" /></td>
                                                    <td> ${order.quantity} </td>
                                                    <td> ${order.price} </td>
                                                    <td> ${order.salePrice} </td>
                                                    <td> ${order.description} </td>
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
            </div>
        </div>
    </div>
</body>
</html>


