<%-- 
    Document   : home
    Created on : Mar 1, 2024, 11:59:59 PM
    Author     : Group 2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <base href="http://localhost:8080/CWU/" />
        <title>CWU - ADMIN</title>
        <link rel="stylesheet" href="./Admin/assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="./Admin/assets/vendors/flag-icon-css/css/flag-icon.min.css">
        <link rel="stylesheet" href="./Admin/assets/vendors/css/vendor.bundle.base.css"> 
        <link rel="stylesheet" href="./Admin/assets/css/style.css">
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.1/css/dataTables.dataTables.css" />
        <script src="https://cdn.datatables.net/2.0.1/js/dataTables.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    </head>
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

                                <div class="tab-content tab-transparent-content">
                                    <div class="tab-pane fade show active" id="business-1" role="tabpanel" aria-labelledby="business-tab">
<!--                                        <div class="row" id="proBanner">
                                            <div class="col-12">
                                                <span class="d-flex align-items-center purchase-popup">
                                                    <p>Like what you see? Check out our premium version for more.</p>
                                                    <a href="https://github.com/BootstrapDash/ConnectPlusAdmin-Free-Bootstrap-Admin-Template" target="_blank" class="btn ml-auto download-button">Download Free Version</a>
                                                    <a href="http://www.bootstrapdash.com/demo/connect-plus/jquery/template/" target="_blank" class="btn purchase-button">Upgrade To Pro</a>
                                                    <i class="mdi mdi-close" id="bannerClose"></i>
                                                </span>
                                            </div>
                                        </div>-->
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
                                                                                alert('Please select the time in the valid clause.');
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
        <!-- End plugin js for this page -->
        <!-- inject:js -->
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