

<%@page import="model.Reader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Reader reader= (Reader) request.getAttribute("reader");
%>
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
<section class="content ">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 bg-white p-0">
                <!-- general form elements -->
                <div class="card card-primary ">
                    <div class="card-header">
                        <h3 class="card-title">Chỉnh sửa thông tin  người đọc</h3>
                    </div>
                    <div class="row justify-content-center"
                         style="margin-top: 15px; margin-bottom: -15px;">
                        <div style="color: red;">${errorString}</div>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form class="p-3" method="POST"  action="${pageContext.request.contextPath}/EditReader">
                        <!-- Tên người đọc -->
                        <div class="form-group">
                            <label for="name">Tên người đọc:</label>
                            <input type="text" class="form-control" id="name" name="name" value="<%=reader.name%>" required>
                        </div>

                        <!-- Địa chỉ -->
                        <div class="form-group">
                            <label for="reader_address">Địa chỉ:</label>
                            <input type="text" class="form-control" id="reader_address" value="<%=reader.reader_address%>" name="reader_address" required>
                        </div>

                        <!-- Số CMT -->
                        <div class="form-group">
                            <label for="identity_card">Số CMT:</label>
                            <input type="text" class="form-control" id="identity_card" value="<%=reader.identity_card%>" name="identity_card" required>
                        </div>

                        <!-- Ngày sinh -->
                        <div class="form-group">
                            <label for="date_of_birth">Ngày sinh:</label>
                            <input type="date" class="form-control" id="date_of_birth" value="<%=reader.date_of_birth%>" name="date_of_birth" required>
                        </div>
                        <div class="form-group" >
                            <label for="role_id"> Loại người đọc :</label>
                            <select class="form-select form-control" name="role_id" required="" aria-label="Default select example">
                             
                                <option value="1" <%= reader.role_id==1?"selected":"" %> >Học Sinh / Sinh viên </option>
                                <option value="2" <%= reader.role_id==2?"selected":"" %> >Giáo viên </option>
                                
                            </select>

                        </div>
                        <div class="form-group">
                            <label>Số sách được mượn : </label> 
                            <input type="number" value="<%= reader.books_borrowed %>" name="book_borrowed"/> (Sách)<strong>/</strong>
                            <input type="number" value="<%= reader.borrowed_time %>" name="borrowed_time"/> (Ngày)
                                                                     
                        </div>

                        <!-- Ngày đăng ký -->
                        <div class="form-group">
                            <label for="start_day">Ngày đăng ký:</label>
                            <input type="date" value="<%= reader.start_day %>" class="form-control" id="start_day" name="start_day" required>
                        </div>

                        <!-- Hạn sử dụng -->
                        <div class="form-group">
                            <label for="end_day">Hạn sử dụng:</label>
                            <input type="date" value="<%= reader.end_day %>" class="form-control" id="end_day" name="end_day" required>
                        </div>

                        <!-- Tiền cọc -->
                        <div class="form-group">
                            <label for="deposit">Tiền cọc:</label>
                            <input type="text" value="<%= reader.deposit %>" class="form-input" id="deposit" name="deposit" required> <strong> Đồng </strong>
                        </div>

                        <!-- Nút submit để gửi form -->
                        <button type="submit" name="id" value="<%= reader.id %>" class="btn btn-primary">Lưu</button>
                    </form>

                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
</section>
<!-- /.content -->

