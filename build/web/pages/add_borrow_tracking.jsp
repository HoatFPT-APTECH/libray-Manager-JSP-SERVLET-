<%-- 
    Document   : add_borrow_tracking
    Created on : Nov 3, 2023, 3:33:17 PM
    Author     : hoatd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : add_book
    Created on : Oct 25, 2023, 5:08:31 PM
    Author     : hoatd
--%>


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
                        <h3 class="card-title">Thêm mới theo dõi yêu cầu mượn sách / Trả sách</h3>
                    </div>
                    <div class="row justify-content-center"
                         style="margin-top: 15px; margin-bottom: -15px;">
                        <div style="color: red;">${errorString}</div>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form method="POST" action="${pageContext.request.contextPath}/AddBorrowTracking" class="m-2">
                        <!-- Mã yêu cầu mượn sách -->
                        <div class="form-group">
                            <label for="request_id">Mã yêu cầu mượn sách:</label> <br>
                            <input type="text" class="form-control" id="request_id" name="request_id" value="${request_id}" readonly >
                        </div>

                        <!-- Trạng thái trả sách -->
                        <div class="form-group">
                            <label for="return_status">Trạng thái trả sách:</label> <br>

                            <select class="form-select form-control" onchange="ThayDoiTrangThai(this)" required name="return_status">

                                <option value="1" selected> Bình thường </option>
                                <option value="2"> Xấu </option>
                                <option value="3"  > Phải bồi thường</option>
                            </select>
                            <div class="d-none">
                                <p>Số tiền phải bồi thường cho quuyển sách là : <span id="tienBoiThuong" ></span> Đồng | ( 100% Giá trị quyển sách)</p>
                            </div>
                        </div>

                        <!-- Ngày trả sách -->
                        <div class="form-group">
                            <label for="return_date">Ngày trả sách:</label> <br>
                            <input onchange="TienQuaHan()" type="date" class="form-control" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>" id="return_date" name="return_date" required>
                        </div>
                       <div class="d-none">
                                <p>Số tiền phải bồi thường do quá hạn là : <span id="tienQuaHan" ></span> Đồng | (GiaSách*Số ngày quá hạn * 10%)</p>
                            </div>
                        <!-- Nút submit để gửi form -->
                        <button type="submit" class="btn btn-primary">Trả sách</button>
                    </form>
                </div>

            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
</section>
<input type="hidden" id="book-price" value="${bookPrice}" />
<input type="hidden" id="due_date" value="${due_date}" />
<!-- /.content -->

