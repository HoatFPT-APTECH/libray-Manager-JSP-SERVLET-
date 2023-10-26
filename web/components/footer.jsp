<%-- 
    Document   : footer.jsp
    Created on : Oct 24, 2023, 4:05:59 PM
    Author     : hoatd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<footer class="main-footer"> </footer>
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="<%= request.getContextPath() %>/Resources/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="<%= request.getContextPath() %>/Resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script src="<%= request.getContextPath() %>/Resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="<%= request.getContextPath() %>/Resources/plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script src="<%= request.getContextPath() %>/Resources/plugins/sparklines/sparkline.js"></script>
	<!-- JQVMap -->
	<script src="<%= request.getContextPath() %>/Resources/plugins/jqvmap/jquery.vmap.min.js"></script>
	<script src="<%= request.getContextPath() %>/Resources/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="<%= request.getContextPath() %>/Resources/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="<%= request.getContextPath() %>/Resources/plugins/moment/moment.min.js"></script>
	<script src="<%= request.getContextPath() %>/Resources/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="<%= request.getContextPath() %>/Resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="<%= request.getContextPath() %>/Resources/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="<%= request.getContextPath() %>/Resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%= request.getContextPath() %>/Resources/js/adminlte.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="<%= request.getContextPath() %>/Resources/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<%= request.getContextPath() %>/Resources/js/demo.js"></script>