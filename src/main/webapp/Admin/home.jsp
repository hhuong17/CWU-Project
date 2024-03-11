<%-- 
    Document   : index
    Created on : Feb 27, 2024, 11:00:50 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./components/header.jsp" %>
  <body>
    <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
      <%@include file="./components/navigation.jsp" %>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <%@include file="./components/sidebar.jsp" %>
        <!-- partial -->
        
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <%@include file="./components/footer.jsp" %>
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
    <!-- End custom js for this page -->
  </body>
</html>