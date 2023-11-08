<%--
Document   : manager_borrow_tracking
Created on : Nov 7, 2023, 3:50:02 PM
Author     : Your Name
--%>

<%@page import="model.BorrowTracking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Include necessary imports here --%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>

<!-- Main content -->

<section class="content">

    <div class="container-fluid">
        <div class="row">

            <div class="col-md-12">
                <div class="card">
                    <form role="form" method="post"
                          action="${pageContext.request.contextPath}/SearchBorrowTracking">
                        <div class="card-header">
                            <h3 class="card-title">Danh sách lịch sử  mượn/trả sách</h3>

                            <div class="card-tools" style="margin-right: 1px;">
                                <div class="input-group input-group-sm" style="width: 200px;">
                                    <input type="text" name="data_search"
                                           class="form-control float-right"
                                           placeholder="Tìm kiếm theo ID hoặc ngày trả">

                                    <div class="input-group-append">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form>

                    <!-- /.card-header -->
                    <div class="card-body">
                    
                        <table class="table table-bordered table-hover" id="example2">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Người mượn</th>
                                    <th>Sách</th>

                                    <th>Trạng thái trả sách</th>
                              
                                    <th>Ngày phải trả / Ngày trả</th>
                                          <th>Số tiền phạt</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (BorrowTracking tracking : (ArrayList<BorrowTracking>) request.getAttribute("borrowTrackingList")) {%>
                                <tr>
                                    <td><%= tracking.id%></td>
                                    <td>
                                        <div>
                                            <p>Người mượn: <%= tracking.reader.name%></p>
                                            <p>CMT: <%= tracking.reader.identity_card%>  </p>
                                        </div>
                                    </td>
                                    <td>
                                        <p>Tên :<%= tracking.book.getName() %> </p>
                                        <p>Giá: <%= tracking.book.price %> Đồng  </p>
                                        <div>
                                                <img
                                            src="Resources/img/products/<%=tracking.book.getImage()%>" width="35"
                                            height="50">
                                            <figcaption>
                                           <a href="Resources/img/products/<%=tracking.book.getImage()%>"
                                                 style="font-size: 14px;" target="_blank">Xem chi tiết</a>
                                          </figcaption>
                                        </div>
                            </td>
                            <td>
                                <%if (tracking.return_status == 1) {%>
                                <p>Bình thường </p>
                                <%} else if (tracking.return_status == 2) {%>
                                <p>Xấu </p>
                                <%} else {%>
                                <p>Phải bồi thường hoàn toàn </p>
                                <%}%>



                            </td>
                            <td>
                                <p>Ngày phải trả: <%= tracking.borrow_request.due_date %></p>
                                <p> Ngày trả: <%= tracking.return_date %> </p>
                            
                            </td>
                            <td><%= tracking.fine_amound%> Đồng</td>
                            
                            <td class="d-flex border-0">
                                <button type="button" class="btn btn-primary"
                                        onclick="update(this)"
                                        value="<%= tracking.id%>"
                                        href="<%= request.getContextPath()%>/EditBorrowTracking">Sửa
                                </button>
                                <br>
                                <button type="button" class="btn btn-danger ml-3"
                                        onclick="remove(this)"
                                        value="<%= tracking.id%>"
                                        href="<%= request.getContextPath()%>/DeleteBorrowTracking">Xoá
                                </button>
                            </td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.card -->
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
</section>
<script>
    $(function () {
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });
    });
</script>
