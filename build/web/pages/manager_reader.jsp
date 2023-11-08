<%--
    Document   : manager_reader
    Created on : Nov 1, 2023, 3:50:02 PM
    Author     : hoatd
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Reader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Main content -->

<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <form role="form" method="post" action="${pageContext.request.contextPath}/ManagerReader">
                        <div class="card-header">
                            <h3 class="card-title">Danh sách người đọc</h3>
                            <div class="card-tools" style="margin-right: 1px;">
                                <div class="input-group input-group-sm" style="width: 200px;">
                                    <input type="text" name="identity_card" class="form-control float-right"
                                        placeholder="Tìm kiếm theo CMT">
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
                        <div class="card-header" style="margin-left: -20px; margin-top: -40px;">
                            <input type="button" value="Thêm người đọc" class="btn btn-primary"
                                onclick="location.href = '${pageContext.request.contextPath}//AddReader'">
                        </div>
                        <table class="table table-bordered table-hover" id="example2">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên người đọc</th>
                               
                                    <th>Địa chỉ</th>
                                    <th>CMT</th>
                                    <th>Ngày sinh</th>
                                    <th>Ngày đăng ký</th>
                                    <th>Hạn sử dụng</th>
                                    <th>Tiền cọc</th>
                                    <th>Số sách đã mượn</th>
                                    <th>Thời gian mượn</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Reader reader : (ArrayList<Reader>) request.getAttribute("readerList")) {%>
                                <tr>
                                    <td><%= reader.id %></td>
                                    <td>
                                        <div>
                                            <p>Tên: <%= reader.name %></p>
                                            <p>CMT: <%= reader.identity_card %></p>
                                        </div>
                                    </td>
                               
                                    <td><%= reader.reader_address %></td>
                                    <td><%= reader.identity_card %></td>
                                    <td><%= reader.date_of_birth %></td>
                                    <td><%= reader.start_day %></td>
                                    <td><%= reader.end_day==null? "": reader.end_day %></td>
                                    <td><%= reader.deposit %></td>
                                    <td><%= reader.books_borrowed %></td>
                                    <td><%= reader.borrowed_time %></td>
                                    <td class="d-flex border-0">
                                        <button type="button" class="btn btn-primary" onclick="update(this)"
                                            value="<%= reader.id %>" href="<%= request.getContextPath() %>/EditReader">Sửa</button>
                                        <br>
                                        <button type="button" class="btn btn-danger ml-3" onclick="remove(this)"
                                            value="<%= reader.id %>" href="<%= request.getContextPath() %>/DeleteReader">Xoá</button>
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
