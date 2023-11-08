<%-- 
    Document   : add_borrow_tracking
    Created on : Nov 3, 2023, 3:33:17 PM
    Author     : hoatd
--%>

<%@page import="model.BorrowTracking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : add_book
    Created on : Oct 25, 2023, 5:08:31 PM
    Author     : hoatd
--%>
<%
   BorrowTracking borrowTracking= (BorrowTracking) request.getAttribute("borrow_tracking");
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
            <div class="col-md-6 bg-white p-0 ">
                <!-- general form elements -->
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Chỉnh sửa lịch sử mượn/ trả sách</h3>
                    </div>
                    <div class="row justify-content-center"
                         style="margin-top: 15px; margin-bottom: -15px;">
                        <div style="color: red;">${errorString}</div>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form method="POST" action="${pageContext.request.contextPath}/EditBorrowTracking" class="m-2">
                        <!-- Mã yêu cầu mượn sách -->
                        <div class="form-group">
                            <label for="request_id">Mã yêu cầu mượn sách:</label> <br>
                            <input type="text" class="form-control" id="request_id" name="request_id" value="${request_id}"  >
                        </div>

                        <!-- Trạng thái trả sách -->
                        <div class="form-group">
                            <label for="return_status">Trạng thái trả sách:</label> <br>

                            <select class="form-select form-control" onchange="ThayDoiTrangThai(this)" required name="return_status">

                                <option value="1" <%= borrowTracking.return_status==1? "selected": "" %> > Bình thường </option>
                                <option value="2"<%= borrowTracking.return_status==2? "selected": "" %> > Xấu </option>
                                <option value="3" <%= borrowTracking.return_status==3? "selected": "" %> > Phải bồi thường</option>
                            </select>
                            <div class="d-none">
                                <p>Số tiền phải bồi thường cho quuyển sách là : <span id="tienBoiThuong" ></span> Đồng | ( 100% Giá trị quyển sách)</p>
                            </div>
                        </div>

                        <!-- Ngày trả sách -->
                        <div class="form-group">
                            <label for="return_date">Ngày trả sách:</label> <br>
                            <input  onchange="TienQuaHan()"  type="date" class="form-control" value="<%=borrowTracking.return_date%>" id="return_date" name="return_date" required>
                        </div>
                       <div class="d-none">
                                <p>Số tiền phải bồi thường do quá hạn là : <span id="tienQuaHan" ></span> Đồng | (GiaSách*Số ngày quá hạn * 10%)</p>
                            </div>
                        <!-- Nút submit để gửi form -->
                        <button type="submit" name="id" value="<%= borrowTracking.id %>" class="btn btn-primary">Lưu</button>
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

