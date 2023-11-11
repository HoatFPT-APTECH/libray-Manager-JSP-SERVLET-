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
                                <form action="<%=request.getContextPath() %>/ManagerReader" method="post" class="col-sm-9">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                    <div class="filter-group">
                                        <label>Tìm kiếm</label>
                                        <input type="text" name="identity_card" value="<%= request.getAttribute("identity_card") %>" placeholder="Nhập CMT" class="form-control">
                                    </div>
                                    <div class="filter-group">
                                        <label>Loại</label>
                                        <select class="form-control" name="role_id">
                                            <option value="0" <%= (Integer)request.getAttribute("role_id")==0?"selected":"" %> >Tất cả</option>
                                            <option value="1" <%= (Integer)request.getAttribute("role_id")==1?"selected":"" %>  >Học sinh / Sinh viên</option>
                                      <option value="2"  <%= (Integer)request.getAttribute("role_id")==2?"selected":"" %>  >Giáo viên</option>
                                        </select>
                                    </div>
                                    <div class="filter-group">
                                        <label>Ngày đăng ký</label>
                                        <select class="form-control" name="start_day">
                                            <option value="0" <%= (Integer)request.getAttribute("start_day")==0?"selected":"" %>  >Mặc định</option>
                                            <option value="1" <%= (Integer)request.getAttribute("start_day")==1?"selected":"" %> >Tăng dần</option>
                                            <option value="2" <%= (Integer)request.getAttribute("start_day")==2?"selected":"" %> >Giảm dần</option>
                                      
                                        </select>
                                    </div>
                                    <span class="filter-icon"><i class="fa fa-filter"></i></span>
                                </form>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Ảnh</th>
                                    <th>Tên người đọc</th>

                        
                                    <th>CMT</th>
                            
                                    <th>Loại</th>
                                    <th>Ngày đăng ký</th>
                               
                               
                                  
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

                                  
                                    <td><%= reader.identity_card%></td>
                                    <td><%= reader.role_id==1?"Học sinh/Sinh viên":"Giáo viên"%> </td>
                                    <td><%= reader.start_day%></td>
                                
                            
                                   
                                    <td class="d-flex border-0">
                                         <button type="button" class="btn btn-info " onclick="update(this)"
                                                value="<%= reader.id%>" href="<%= request.getContextPath()%>/GetDetailReader">Chi tiết</button>
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
