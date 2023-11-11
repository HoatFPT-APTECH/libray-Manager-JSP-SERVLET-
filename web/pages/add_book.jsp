<%@page import="model.Category"%>
<%@page import="model.Author"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Publisher"%>
<%@page import="model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Book book = (Book) request.getAttribute("book");
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
<section class="content">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 bg-white p-0">
                <!-- general form elements -->
                <div class="card card-primary ">
                    <div class="card-header">
                        <h3 class="card-title">Thêm sách</h3>
                    </div>
                    <div class="row justify-content-center"
                         style="margin-top: 15px; margin-bottom: -15px;">
                        <div style="color: red;">${errorString}</div>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form class="p-3" method="POST" action="${pageContext.request.contextPath}/AddBook" enctype="multipart/form-data" >
                        <!-- Tên sách -->
                        <div class="form-group">
                            <label for="name">Tên sách:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>

                        <!-- Ảnh -->
                        <div class="form-group">
                           
                         
                            <label for="image" > Chọn ảnh: </label> <input required type="file"  id="image"  name="image" >
            
                        </div>

                        <!-- Số lượng -->
                        <div class="form-group">
                            <label for="amount">Số lượng:</label>
                            <input type="number" class="form-control" id="amount" name="amount" required>
                        </div>

                        <!-- Danh mục -->
                       <div class="form-group">
                            <label for="category_id">Thể loại :</label>
                              <select class="form-control" name="category_id">
                                  <% for( Category category: (ArrayList<Category>)request.getAttribute("listCategory")  ) {%>
                                
                                
                                <option value="<%= category.getId() %>" > <%= category.getName() %> </option>
                                <%}%>
                            </select>
                           
                        </div>
                        <!-- Tác giả -->
                        <div class="form-group">
                            <label for="author">Tác giả:</label>
                              <select class="form-control" name="author_id">
                                  <% for( Author author: (ArrayList<Author>)request.getAttribute("listAuthor")  ) {%>
                                
                                
                                <option value="<%= author.getId() %>" > <%= author.getName() %> </option>
                                <%}%>
                            </select>
                           
                        </div>
                            

                        <!-- Giá -->
                        <div class="form-group">
                            <label for="price">Giá:</label>
                            <input type="text" class="form-control" id="price" name="price" required>
                        </div>

                        <!-- Số trang -->
                        <div class="form-group">
                            <label for="number_of_pages">Số trang:</label>
                            <input type="number" class="form-control" id="number_of_pages"  name="number_of_pages" required>
                        </div>

                        <!-- Nhà xuất bản -->
                        <div class="form-group">
                            <label for="publisher_id">Nhà xuất bản:</label>
                            <select class="form-control" name="publisher_id">
                                <% for( Publisher publiser: (ArrayList<Publisher>)request.getAttribute("listPublisher")  ) {%>
                                
                                
                                <option value="<%= publiser.getId() %>"
                                         > <%= publiser.getName() %> </option>
                                <%}%>
                            </select>
                            
                        </div>

                        <!-- Năm xuất bản -->
                        <div class="form-group">
                            <label for="publication_year">Năm xuất bản:</label>
                            <input type="date" class="form-control" id="publication_year"  name="publication_year" required>
                        </div>

                        <!-- Ngày tạo -->
                        <div class="form-group">
                            <label for="create_day">Ngày tạo:</label>
                            <input type="date" class="form-control" id="create_day"  name="create_day" required>
                        </div>

                        <!-- Nút submit để gửi form -->
                        <button type="submit"  class="btn btn-primary">Lưu</button>
                    </form>

                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
</section>
<!-- /.content -->
