<%-- 
    Document   : manager_borrow_request
    Created on : Nov 1, 2023, 3:50:02 PM
    Author     : hoatd
--%>

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
                                    <h2>Danh sách đang<b> mượn sách</b></h2>
                                </div>
                                <div class="col-sm-8">						
                                   
                                    <a href="<%= request.getContextPath() %>/AddBorrowRequest" class="btn btn-success">      <i class="fa fa-plus" aria-hidden="true"></i> <span>Thêm mới</span></a>
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
                                    <form action="<%= request.getContextPath() %>/ManageBorrowRequest" method="post">
                                      <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                    <div class="filter-group">
                                        <label>Tìm kiếm</label>
                                        <input name="identity_card" value="<%= request.getAttribute("identity_card") %>" type="text" name="identity_card" class="form-control" placeholder="Tìm kiểm theo CMT">
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
                                    <th>Người mượn </th>
                                    <th>Ảnh sách</th>
                                    <th>Sách</th>
                                    <th>Hạn trả</th>
                                    <th>Hành động </th>
                                </tr>
                                </tr>
                            </thead>
                            <tbody>
                                
                              <%for (BorrowRequest e : (ArrayList<BorrowRequest>) request.getAttribute("borrowRequestList")) {%>
                                <tr>
                                    <td> <%= e.id%> </td>
                                    <td> 
                                        <div>
                                            <p>Tên: <%=e.reader.name%> </p>
                                            <p> CMT: <%=e.reader.identity_card %> </p>
                                        </div>
                                    </td>
                                       <td><img src="Resources/img/products/<%= e.book.getImage()%>" alt="Book Image" width="50"></td>
                                    <td> 
                                        <div>
                                            <p><%= e.book.getName() %> </p>
                                        </div>
                                    </td>
                                   
                                    <td> <%= e.due_date %> </td>
                                    
                           
                                    <td class="d-flex border-0">
                                        <button type="button " class="btn btn-primary"
                                                onclick="update(this)"
                                                value="<%= e.id %>"
                                                href="<%=request.getContextPath() %>/EditBorrowRequest" >Sửa</button> <br>
                                                <button type="button" class="btn btn-warning ml-3"
                                                        onclick="update(this)"
                                                          value="<%= e.id %>"
                                                href="<%=request.getContextPath() %>/AddBorrowTracking"
                                                >Trả sách</button> <br>
                                        <button type="button " class="btn btn-danger ml-3"
                                                            onclick="remove(this)"
                                                          value="<%= e.id %>"
                                                href="<%=request.getContextPath() %>/DeleteBorrowRequest"
                                                > Xoá</button>
                                
                                
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
