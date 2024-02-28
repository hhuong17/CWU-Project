<%-- 
    Document   : category
    Created on : Feb 27, 2024, 11:07:52 PM
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
                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Tất cả công ty</h4>
                                    <a href="" class="btn btn-success">Add new</a>
                                    <table class="table table-bordered table-hover table-striped table-responsive" id="data-table">
                                        <thead>
                                            <tr>
                                                <th> # </th>
                                                <th> Chủ sở hữu </th>
                                                <th> Công ty </th>
                                                <th> Email </th>
                                                <th> Địa chỉ </th>
                                                <th> SĐT </th>
                                                <th> Tax </th>
                                                <th> Ngày tạo </th>
                                                <th> Cập nhật </th>
                                                <th>Kiểm duyệt</th>
                                                <th> Trạng thái </th>
                                                <th> Xử lí </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${companies}" var="company" varStatus="indexScope">
                                                <tr>
                                                    <td> ${indexScope.index + 1} </td>
                                                    <td> ${company.owner} </td>
                                                    <td> ${company.name} </td>
                                                    <td> ${company.email} </td>
                                                    <td> ${company.address} </td>
                                                    <td> ${company.phone} </td>
                                                    <td> ${company.tax} </td>
                                                    <td>
                                                        ${getConvertText.getTextDate(company.create_at)}
                                                    </td>
                                                    <td> 
                                                        ${getConvertText.getTextDate(company.modified_at)} 
                                                    </td>
                                                    <td>
                                                        <label class="${convertStatusText.convertStatusTagClass(company.is_approval)}">
                                                            ${convertStatusText.convertStatusAdminApproval(company.is_approval)}
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <label class="${convertStatusText.convertStatusTagClass(company.status)}">
                                                            ${convertStatusText.convertStatusTextUser(company.status)}
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-primary" href="/admin/cong-ty/cap-nhat/${company.id}">
                                                            Cập nhật
                                                        </a>
                                                        <a class="btn btn-warning" href="/admin/cong-ty/chi-tiet/${company.id}">
                                                            Chi tiết
                                                        </a>
                                                        <a class="btn btn-danger" 
                                                           href="/admin/cong-ty/xoa/${company.id}"
                                                           onclick="return confirm('Bạn có chắc muốn xóa công ty này?')"
                                                           >
                                                            Xóa
                                                        </a>
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
