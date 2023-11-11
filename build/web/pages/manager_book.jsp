<%--
    Document   : manager_book
    Created on : Nov 1, 2023, 3:50:02 PM
    Author     : hoatd
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Book"%>
<%@page import="model.Category"%>
<%@page import="model.Author"%>
<%@page import="model.Publisher"%>
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
                                    <h2>Quản lý <b>Sách</b></h2>
                                </div>
                                <div class="col-sm-8">						
                                    <a href="<%= request.getContextPath()%>/AddBook" class="btn btn-success">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                        <span>Thêm mới</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="table-filter">
                            <div class="row">
                                <!-- Add filters here as needed -->
                                <form action="<%=request.getContextPath()%>/ManagerBook" method="post" class="col-sm-9">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                    <div class="filter-group">
                                        <label>Tìm kiếm</label>
                                        <input type="text" name="name" value="<%= request.getAttribute("name")%>" placeholder="Nhập tên sách" class="form-control">
                                    </div>
                                    <div class="filter-group">
                                        <label>Thể loại: </label>
                                        <select class="form-control" name="category_id">
                                            <option value="0" > Tất cả</option>
                                            <% for (Category category : (ArrayList<Category>) request.getAttribute("listCategory")) {%>

                                            <option value="<%= category.getId()%>"
                                                    <%= (Integer) request.getAttribute("category_id") == category.getId() ? "selected" : ""%> > <%= category.getName()%> </option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="filter-group">
                                        <label>Tác giả</label>
                                        <select class="form-control" name="author_id">
                                            <option value="0">Tất cả</option>
                                            <% for (Author author : (ArrayList<Author>) request.getAttribute("listAuthor")) {%>


                                            <option value="<%= author.getId()%>"
                                                    <%=  (Integer) request.getAttribute("author_id") == author.getId() ? "selected" : ""%> > <%= author.getName()%> </option>
                                            <%}%>
                                        </select>
                                    </div>
                                       <div class="filter-group">
                                        <label>Ngày tạo </label>
                                        <select class="form-control" name="created_day">
                                            <option value="0" <%= (Integer)request.getAttribute("created_day")==0?"selected":"" %> >Mặc định</option>
                                            <option value="1"
                                                     <%= (Integer)request.getAttribute("created_day")==1?"selected":"" %>
                                                    >Tăng dần</option>
                                            <option value="2"
                                                     <%= (Integer)request.getAttribute("created_day")==2?"selected":"" %>
                                                    >Giảm dần</option>
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
                                    <th >Tên sách</th>
                                    <th>Số lượng</th>
                                    <th>Danh mục</th>
                                    <th>Tác giả</th>
                                    <th>Ngày tạo</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Book book : (ArrayList<Book>) request.getAttribute("bookList")) {%>
                                <tr>
                                    <td><%= book.getId()%></td>
                                    <td>
                                        <img src="Resources/img/products/<%= book.getImage()%>" class="thumbnail" alt="Book Image" width="50">
                                    </td>
                                    <td style="max-width:200px"><%= book.getName()%></td>
                                    <td><%= book.getAmount()%> Quyển</td>
                                    <td><%= book.getCategory().getName()%></td>
                                    <td><%= book.getAuthor().getName()%></td>


                                    <td><%= book.getCreateDay()%></td>
                                    <td class="d-flex border-0">
                                        <!-- Add buttons for actions (details, edit, delete) here -->
                                        <button type="button" class="btn btn-info"
                                                href="<%= request.getContextPath()%>/GetDetailBook"
                                                onclick="update(this)"
                                                value="<%= book.getId()%>">Chi tiết</button>
                                        <button type="button" class="btn btn-primary"

                                                href="<%= request.getContextPath()%>/EditBook" 
                                                onclick="update(this)"
                                                value="<%= book.getId()%>"
                                                >Sửa</button>
                                        <button type="button" class="btn btn-danger" onclick="remove(this)"
                                                value="<%= book.id%>" href="<%= request.getContextPath()%>/DeleteBook">Xoá</button>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <div class="clearfix">
                            <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                            <ul class="pagination">
                                <!-- Pagination logic goes here -->
                            </ul>
                        </div>
                    </div>
                </div>    
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
</section>
