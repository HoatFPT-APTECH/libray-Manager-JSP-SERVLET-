<%-- 
    Document   : edit_author
    Created on : Nov 5, 2023, 8:59:24 PM
    Author     : NguyenTienDat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
		<div class="row justify-content-center">
			<div style="color: red;">${errorString}</div>
		</div>
		<div class="container-fluid">

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<!-- general form elements -->
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">Chỉnh sửa tên tác giả</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form role="form" method="post"
							action="${pageContext.request.contextPath}/EditAuthor">
							<div class="card-body">
								<input type="hidden" name="id" value="${author.id}" />
								<div class="form-group">
									<label>Tên tác giả</label> <input type="text"
										class="form-control" id="name_author" name="name_author"
										value="${author.name}">
								</div>
							</div>
							<div class="card-footer">
								<button type="submit" class="btn btn-primary ">Lưu</button>
								<input type="button" value="Hủy" class="btn btn-primary"
									onclick="location.href='${pageContext.request.contextPath}/ManagerAuthor'">
							</div>
						</form>
					</div>
					<!-- /.card -->

				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
	</section>
	<!-- /.content -->

