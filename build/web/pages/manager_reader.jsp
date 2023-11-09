<%--
    Document   : manager_reader
    Created on : Nov 1, 2023, 3:50:02 PM
    Author     : hoatd
--%>

<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Reader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Main content -->

<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-4">
                                    <h2>Quản lý <b>Độc giả</b></h2>
                                </div>
                                <div class="col-sm-8">						
                                    <a href="<%= request.getContextPath() %>/AddReader" class="btn btn-success">      <i class="fa fa-plus" aria-hidden="true"></i> <span>Thêm mới</span></a>
                        
                                </div>
                            </div>
                        </div>
                        <div class="table-filter">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="show-entries">
                                        <span>Show</span>
                                        <select class="form-control">
                                            <option>5</option>
                                            <option>10</option>
                                            <option>15</option>
                                            <option>20</option>
                                        </select>
                                        <span>entries</span>
                                    </div>
                                </div>
                                <div class="col-sm-9">
                                    <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                    <div class="filter-group">
                                        <label>Name</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="filter-group">
                                        <label>Location</label>
                                        <select class="form-control">
                                            <option>All</option>
                                            <option>Berlin</option>
                                            <option>London</option>
                                            <option>Madrid</option>
                                            <option>New York</option>
                                            <option>Paris</option>								
                                        </select>
                                    </div>
                                    <div class="filter-group">
                                        <label>Status</label>
                                        <select class="form-control">
                                            <option>Any</option>
                                            <option>Delivered</option>
                                            <option>Shipped</option>
                                            <option>Pending</option>
                                            <option>Cancelled</option>
                                        </select>
                                    </div>
                                    <span class="filter-icon"><i class="fa fa-filter"></i></span>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Ảnh</th>
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
                                    <td><%= reader.id%></td>
                                      <td>
                                          <%
                                           Random random = new Random();

                                // Sinh số nguyên ngẫu nhiên trong khoảng từ 0 đến Integer.MAX_VALUE
                                       int randomNumber = random.nextInt(10)+1;%>
                                       <a href="https://www.tutorialrepublic.com/examples/images/avatar/<%=randomNumber%>.jpg"><img src="https://www.tutorialrepublic.com/examples/images/avatar/<%=randomNumber%>.jpg" class="avatar" alt="Avatar"></a>
                                      </td>
                                    <td>
                                        <div>
                                            <p>Tên: <%= reader.name%></p>
                                            <p>CMT: <%= reader.identity_card%></p>
                                        </div>
                                    </td>

                                    <td><%= reader.reader_address%></td>
                                    <td><%= reader.identity_card%></td>
                                    <td><%= reader.date_of_birth%></td>
                                    <td><%= reader.start_day%></td>
                                    <td><%= reader.end_day == null ? "" : reader.end_day%></td>
                                    <td><%= reader.deposit%></td>
                                    <td><%= reader.books_borrowed%></td>
                                    <td><%= reader.borrowed_time%></td>
                                    <td class="d-flex border-0">
                                        <button type="button" class="btn btn-primary" onclick="update(this)"
                                                value="<%= reader.id%>" href="<%= request.getContextPath()%>/EditReader">Sửa</button>
                                        <br>
                                        <button type="button" class="btn btn-danger ml-3" onclick="remove(this)"
                                                value="<%= reader.id%>" href="<%= request.getContextPath()%>/DeleteReader">Xoá</button>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <div class="clearfix">
                            <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                            <ul class="pagination">
                                <li class="page-item disabled"><a href="#">Previous</a></li>
                                <li class="page-item"><a href="#" class="page-link">1</a></li>
                                <li class="page-item"><a href="#" class="page-link">2</a></li>
                                <li class="page-item"><a href="#" class="page-link">3</a></li>
                                <li class="page-item active"><a href="#" class="page-link">4</a></li>
                                <li class="page-item"><a href="#" class="page-link">5</a></li>
                                <li class="page-item"><a href="#" class="page-link">6</a></li>
                                <li class="page-item"><a href="#" class="page-link">7</a></li>
                                <li class="page-item"><a href="#" class="page-link">Next</a></li>
                            </ul>
                        </div>
                    </div>
                </div>    
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
</section>
