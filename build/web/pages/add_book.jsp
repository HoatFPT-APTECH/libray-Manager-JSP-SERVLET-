<%-- 
    Document   : add_book
    Created on : Oct 25, 2023, 5:08:31 PM
    Author     : hoatd
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
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
							<h3 class="card-title">Thêm sách vào thư viện</h3>
						</div>
						<div class="row justify-content-center"
							style="margin-top: 15px; margin-bottom: -15px;">
							<div style="color: red;">${errorString}</div>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form role="form" method="post"
							action="${pageContext.request.contextPath}/AddBook"
							enctype="multipart/form-data">

							<div class="card-body">
								<div class="form-group">
									<label>Nhập tên sách</label> <input type="text"
										class="form-control" id="name" name="name"
										placeholder="Nhập tên sách">
								</div>
								<div class="form-group">
									<label>Thể loại</label> 
										<!-- <option value="">Chọn 1 thể loại</option> -->
                                                                                <select name="category">
                                                                                     <%for(Category category: (ArrayList<Category>) request.getAttribute("categoryList") ){%>
                                                                                <option value="<%=Integer.toString(category.getId())%>"><%=category.getName()%></option>
                                                                                <%}%>
                                                                                </select>
                                                                               	
								</div>
                                                                <div class="form-group">
									<label>Thể loại</label> 
										<!-- <option value="">Chọn 1 thể loại</option> -->
                                                                                <select name="category">
                                                                                     <%for(Category category: (ArrayList<Category>) request.getAttribute("categoryList") ){%>
                                                                                <option value="<%=Integer.toString(category.getId())%>"><%=category.getName()%></option>
                                                                                <%}%>
                                                                                </select>
                                                                               	
								</div>            
								<div class="form-group">
									<label>Số lượng</label> <input type="number"
										class="form-control" id="count" name="count" min="1" value="1">
								</div>
								<div class="form-group">
									<label for="exampleInputFile">Thêm ảnh bìa</label>
									<div class="input-group">
										<div class="custom-file">
											<input type="file" accept="image/png, image/jpeg"
												class="custom-file-input" id="customFile" name="fileImage"
												required> <label class="custom-file-label"
												for="customFile" style="color: #a6b0ba;">Nhấn đây để chọn file</label>
										</div>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<button type="submit" class="btn btn-primary ">Lưu</button>
								<input type="button" value="Trở lại" class="btn btn-primary"
									onclick="location.href='${pageContext.request.contextPath}/ManageBook'">
							</div>
						</form>
					</div>


				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
	</section>
	<!-- /.content -->
