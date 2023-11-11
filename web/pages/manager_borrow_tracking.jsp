<%-- 
    Document   : manager_borrow_request
    Created on : Nov 1, 2023, 3:50:02 PM
    Author     : hoatd
--%>

<%@page import="model.BorrowTracking"%>
<%@page import="model.BorrowRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : manager_book
    Created on : Oct 26, 2023, 3:07:29 PM
    Author     : hoatd
--%>

<%@page import="model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>


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
                                    <h2>Lịch sử <b> mượn/trả sách</b></h2>
                                </div>
                                <div class="col-sm-8">						
                                   
                                    <a href="<%= request.getContextPath() %>/AddBorrowTracking" class="btn btn-success">      <i class="fa fa-plus" aria-hidden="true"></i> <span>Thêm mới</span></a>
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
                                    <form action="<%= request.getContextPath() %>/ManageBorrowTracking" method="post">
                                      <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                    <div class="filter-group">
                                        <label>Tìm kiếm</label>
                                        <input  type="text" 
                                            name="identity_card"
                                               value="<%= request.getAttribute("identity_card") %>" 
                                                class="form-control" placeholder="Tìm kiểm theo CMT">
                                    </div>
                                   
                                    <span class="filter-icon"><i class="fa fa-filter"></i></span>  
                                    </form>
                                    
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
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
                                        <p>Giá: <span class="format-money"> <%= tracking.book.price %></span> Đồng  </p>
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
