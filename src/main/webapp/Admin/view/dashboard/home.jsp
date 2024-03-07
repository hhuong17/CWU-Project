<%-- 
    Document   : home
    Created on : Mar 1, 2024, 11:59:59 PM
    Author     : Group 2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../components/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<body>
    <div class="container-scroller">
        <!-- partial:partials/_navbar.html -->
        <%@include file="../../components/navigation.jsp" %>
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:partials/_sidebar.html -->
            <%@include file="../../components/sidebar.jsp" %>
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
                                    <ul class="nav nav-tabs tab-transparent" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link" id="home-tab" data-toggle="tab" href="#" role="tab" aria-selected="true">Users</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link active" id="business-tab" data-toggle="tab" href="#business-1" role="tab" aria-selected="false">Business</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="performance-tab" data-toggle="tab" href="#" role="tab" aria-selected="false">Performance</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="conversion-tab" data-toggle="tab" href="#" role="tab" aria-selected="false">Conversion</a>
                                        </li>
                                    </ul>
                                    <div class="d-md-block d-none">
                                        <a href="#" class="text-light p-1"><i class="mdi mdi-view-dashboard"></i></a>
                                        <a href="#" class="text-light p-1"><i class="mdi mdi-dots-vertical"></i></a>
                                    </div>
                                </div>
                                <div class="tab-content tab-transparent-content">
                                    <div class="tab-pane fade show active" id="business-1" role="tabpanel" aria-labelledby="business-tab">
                                        <div class="row">
                                            <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                <div class="card">
                                                    <div class="card-body text-center">
                                                        <h5 class="mb-2 text-dark font-weight-normal">Orders</h5>
                                                        <h2 class="mb-4 text-dark font-weight-bold">932.00</h2>
                                                        <div class="dashboard-progress dashboard-progress-1 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-lightbulb icon-md absolute-center text-dark"></i></div>
                                                        <p class="mt-4 mb-0">Completed</p>
                                                        <h3 class="mb-0 font-weight-bold mt-2 text-dark">5443</h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                <div class="card">
                                                    <div class="card-body text-center">
                                                        <h5 class="mb-2 text-dark font-weight-normal">Unique Visitors</h5>
                                                        <h2 class="mb-4 text-dark font-weight-bold">756,00</h2>
                                                        <div class="dashboard-progress dashboard-progress-2 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-account-circle icon-md absolute-center text-dark"></i></div>
                                                        <p class="mt-4 mb-0">Increased since yesterday</p>
                                                        <h3 class="mb-0 font-weight-bold mt-2 text-dark">50%</h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3  col-lg-6 col-sm-6 grid-margin stretch-card">
                                                <div class="card">
                                                    <div class="card-body text-center">
                                                        <h5 class="mb-2 text-dark font-weight-normal">Impressions</h5>
                                                        <h2 class="mb-4 text-dark font-weight-bold">100,38</h2>
                                                        <div class="dashboard-progress dashboard-progress-3 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-eye icon-md absolute-center text-dark"></i></div>
                                                        <p class="mt-4 mb-0">Increased since yesterday</p>
                                                        <h3 class="mb-0 font-weight-bold mt-2 text-dark">35%</h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                                                <div class="card">
                                                    <div class="card-body text-center">
                                                        <h5 class="mb-2 text-dark font-weight-normal">Followers</h5>
                                                        <h2 class="mb-4 text-dark font-weight-bold">4250k</h2>
                                                        <div class="dashboard-progress dashboard-progress-4 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-cube icon-md absolute-center text-dark"></i></div>
                                                        <p class="mt-4 mb-0">Decreased since yesterday</p>
                                                        <h3 class="mb-0 font-weight-bold mt-2 text-dark">25%</h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 grid-margin">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-sm-12 grid-margin  grid-margin-lg-0">
                                                                <div class="pl-0 pl-lg-4 ">
                                                                    <div class="d-xl-flex justify-content-between align-items-center mb-2">
                                                                        <div class="box-filter-by-date">
                                                                            <div class="group-input">
                                                                                <label for="fromOrder">From: </label>
                                                                                <input type="date" id="fromPost"/>
                                                                            </div>
                                                                            <div class="group-input">
                                                                                <label for="toOrder">To </label>
                                                                                <input type="date" id="toPost"/>
                                                                            </div>
                                                                            <div class="group-input group-btn">
                                                                                <button class="btn btn-default btn-primary" onclick="validateAndFilter()">Go</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="graph-custom-legend clearfix" id="device-sales-legend"></div>
                                                                    <div id="statitis-job-post"></div>
                                                                    <div class="graph-custom-legend clearfix" id="device-sales-legend">
                                                                        <h2>Income</h2>
                                                                    </div>
                                                                    <div id="statitis-job-income"></div>
                                                                    <script>
                                                                        function validateAndFilter() {
                                                                            var fromDate = document.getElementById('fromPost').value;
                                                                            var toDate = document.getElementById('toPost').value;
                                                                            if (fromDate && toDate && fromDate <= toDate) {
                                                                                filterStatisticBill('#fromPost', '#toPost');
                                                                                filterStatisticBillInCome('#fromPost', '#toPost');
                                                                            } else {
                                                                                alert('Hãy chọn thời gian  trong khoản hợp lệ.');
                                                                            }
                                                                        }
                                                                    </script>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4 grid-margin stretch-card">
                                                <div class="card card-danger-gradient">
                                                    <div class="card-body mb-4">
                                                        <h4 class="card-title text-white">Account Retention</h4>
                                                        <canvas id="account-retension"></canvas>
                                                    </div>
                                                    <div class="card-body bg-white pt-4">
                                                        <div class="row pt-4">
                                                            <div class="col-sm-6">
                                                                <div class="text-center border-right border-md-0">
                                                                    <h4>Conversion</h4>
                                                                    <h1 class="text-dark font-weight-bold mb-md-3">$306</h1>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="text-center">
                                                                    <h4>Cancellation</h4>
                                                                    <h1 class="text-dark font-weight-bold">$1,520</h1>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-8  grid-margin stretch-card">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="d-xl-flex justify-content-between mb-2">
                                                            <h4 class="card-title">Page views analytics</h4>
                                                            <div class="graph-custom-legend primary-dot" id="pageViewAnalyticLengend"></div>
                                                        </div>
                                                        <canvas id="page-view-analytic"></canvas>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <%@include file="../../components/footer.jsp" %>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        <script src="./Admin/assets/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <script src="./Admin/assets/vendors/chart.js/Chart.min.js"></script>
        <script src="./Admin/assets/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="./Admin/assets/js/off-canvas.js"></script>
        <script src="./Admin/assets/js/hoverable-collapse.js"></script>
        <script src="./Admin/assets/js/misc.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page -->
        <script src="./Admin/assets/js/dashboard.js"></script>
        <script src="./Admin/assets/js/dashboardhome.js"></script>
        <script>
            statistic("statitis-job-post", "statitis-job-income");
        </script>
        <!-- End custom js for this page -->
    </body>
</html>