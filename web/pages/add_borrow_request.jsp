<%-- 
    Document   : add_book
    Created on : Oct 25, 2023, 5:08:31 PM
    Author     : hoatd
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
<section class="content ">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 bg-white p-0 ">
                <!-- general form elements -->
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Thêm mới yêu cầu mượn sách</h3>
                    </div>
                    <div class="row justify-content-center"
                         style="margin-top: 15px; margin-bottom: -15px;">
                        <div style="color: red;">${errorString}</div>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->

                </div>
                    <form method="POST" action="${pageContext.request.contextPath}/AddBorrowRequest" >
                    <!-- Tên sách -->
                    <div class="form-group">
                        <label for="book_id">Mã sách:</label>
                        <input type="text" class="form-control" id="book_id" name="book_id" required>
                    </div>

                    <!-- Mã độc giả -->
                    <div class="form-group">
                        <label for="reader_id">Mã thẻ thư viện của độc giả:</label>
                        <input type="text" class="form-control" id="reader_id" name="identity_card" required>
                    </div>

                    <!-- Ngày hết hạn -->
                    <div class="form-group">
                        <label for="due_date">Ngày trả sách:</label>
                        <input type="date" class="form-control" id="due_date" name="due_date" required>
                    </div>

                    <!-- Nút submit để gửi form -->
                    <button type="submit" class="btn btn-primary">Thêm mới</button>
                </form>

            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
</section>
<!-- /.content -->
