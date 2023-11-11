<%-- 
    Document   : bookStatistic
    Created on : Nov 10, 2023, 4:19:26 PM
    Author     : hoatd
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.BookStatistics"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-4">
                                    <h2>Thống kê tình hình phục vụ <b> sách của thư viện (6 tháng gần đây)</b></h2>
                                </div>
                                <div class="col-sm-8">						

                                    <button type="button" onclick="requestExportExcel()" class="btn btn-secondary"><i class="material-icons">&#xE24D;</i> <span>Xuất file Excel</span></button>
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
                                    <form action="<%= request.getContextPath()%>/SituationServed" method="post">
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                        <div class="filter-group">
                                            <label>Tìm kiếm</label>
                                            <input type="text" name="search" class="form-control"
                                                   value="<%= request.getAttribute("search") %>"
                                                   
                                                   placeholder="Nhập tên sách">
                                        </div>
                                        <div class="filter-group">
                                            <label>Loại sách</label>
                                            <select class="form-control" name="book_category" >
                                                <option value="0" 
                                                        <%= (Integer)request.getAttribute("bookCategory")==0?"selected":"" %> >Mặc định</option>
                                                <option value="1"
                                                              <%= (Integer)request.getAttribute("bookCategory")==1?"selected":"" %> 
                                                        >Được phục vụ</option>
                                                <option value="2"
                                                              <%= (Integer)request.getAttribute("bookCategory")==2?"selected":"" %> 
                                                        >Chưa được phục vụ</option>
                                            						
                                            </select>
                                        </div>
                                        <div class="filter-group">
                                            <label>Tình trạng trả sách</label>
                                            <select class="form-control" name="return_status">
                                                <option value="0"
                                                              <%= (Integer)request.getAttribute("return_status")==0?"selected":"" %> 
                                                        >Mặc định</option>
                                                <option value="1" <%= (Integer)request.getAttribute("return_status")==1?"selected":"" %> >Bình thường</option>
                                                <option value="2" <%= (Integer)request.getAttribute("return_status")==2?"selected":"" %>  >Xấu</option>
                                                <option value="3" <%= (Integer)request.getAttribute("return_status")==3?"selected":"" %>  >Phải bồi thường hoàn toàn</option>
                                            </select>
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
                                    <th>Ảnh</th>
                                    <th>Tên</th>
                                    <th>Tổng SL</th>
                                    <th>SL phục vụ</th>
                                    <th>Đang mượn</th>
                                    <th>TL Tốt</th>
                                    <th>TL Xấu</th>
                                    <th>TL Bồi thường</th>
                                    <th>Tiền bồi thường</th>
                                </tr>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (BookStatistics bookStat : (ArrayList<BookStatistics>) request.getAttribute("bookStatisticList")) {%>
                                <tr>
                                    <td><%= bookStat.getId()%></td>
                                    <td><img src="Resources/img/products/<%= bookStat.getImage()%>" alt="Book Image" width="50"></td>
                                    <td style="max-width: 200px"><%= bookStat.getNameBook()%></td>
                                    <td><%= bookStat.getAmountBook()%> Quyển</td>
                                      
                                    <td><%= bookStat.getCountServed()%> Quyển</td>
                                    <td><%= bookStat.getCountServed()-bookStat.getReturnGood()- bookStat.getReturnBad()-bookStat.getReturnVeryBad() %> Quyển</td>
                                    <td><%= bookStat.getReturnGood()%> Quyển</td>
                                    <td><%= bookStat.getReturnBad()%> Quyển</td>
                                    <td><%= bookStat.getReturnVeryBad()%> Quyển</td>
                                    <td > <span class="format-money"><%= bookStat.getTotalFineAmount() == 0 ? "0" : bookStat.getTotalFineAmount()%></span> Đồng</td>
                                </tr>
                                <% }%>

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

