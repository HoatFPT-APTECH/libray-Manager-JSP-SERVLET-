<%-- 
    Document   : add_author
    Created on : Nov 5, 2023, 5:59:24 PM
    Author     : NguyenTienDat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark"></h1>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->
	<section class="content">

		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<!-- general form elements -->
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">Thêm tác giả</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form role="form" method="post"
							action="${pageContext.request.contextPath}/AddAuthor">
							<div class="card-body">
								<div class="form-group">
									<label>Tên tác giả</label> <input type="text"
										class="form-control" id="name_author" name="name_author"
										placeholder="Nhập tên tác giả sách">
								</div>
							</div>
							<div class="card-footer">
								<button type="submit" class="btn btn-primary ">Lưu</button>
								<input type="button" value="Hủy" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/ManagerAuthor'">
							</div>
						</form>
					</div>
					<!-- /.card -->

				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
	</section>
