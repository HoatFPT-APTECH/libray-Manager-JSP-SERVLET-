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
                        <h3 class="card-title">Chỉnh sửa thông tin sách</h3>
                    </div>
                    <div class="row justify-content-center"
                         style="margin-top: 15px; margin-bottom: -15px;">
                        <div style="color: red;">${errorString}</div>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form class="p-3" method="POST" action="${pageContext.request.contextPath}/EditBook" enctype="multipart/form-data" >
                        <!-- Tên sách -->
                        <div class="form-group">
                            <label for="name">Tên sách:</label>
                            <input type="text" class="form-control" id="name" name="name" value="<%=book.getName()%>" required>
                        </div>

                        <!-- Ảnh -->
                        <div class="form-group">
                           
                            <label>  Ảnh:</label> <img src="Resources/img/products/<%= book.getImage() %>" class="thumbnail" alt="Book Image" width="30">
                         
                           <label for="image" class="btn btn-primary" > Chọn ảnh mới</label> <input type="file" class="d-none" id="image"  name="image" >
                            <input type="hidden" value="<%=book.getImage()%>" name="fileName"/>
                        </div>

                        <!-- Số lượng -->
                        <div class="form-group">
                            <label for="amount">Số lượng:</label>
                            <input type="number" class="form-control" id="amount" value="<%=book.getAmount()%>" name="amount" required>
                        </div>

                        <!-- Danh mục -->
                       <div class="form-group">
                            <label for="category_id">Thể loại :</label>
                              <select class="form-control" name="category_id">
                                  <% for( Category category: (ArrayList<Category>)request.getAttribute("listCategory")  ) {%>
                                
                                
                                <option value="<%= category.getId() %>"
                                        <%= book.getCategory_id()== category.getId()?"selected":"" %> > <%= category.getName() %> </option>
                                <%}%>
                            </select>
                           
                        </div>
                        <!-- Tác giả -->
                        <div class="form-group">
                            <label for="author">Tác giả:</label>
                              <select class="form-control" name="author_id">
                                  <% for( Author author: (ArrayList<Author>)request.getAttribute("listAuthor")  ) {%>
                                
                                
                                <option value="<%= author.getId() %>"
                                        <%= book.getAuthor_id()== author.getId()?"selected":"" %> > <%= author.getName() %> </option>
                                <%}%>
                            </select>
                           
                        </div>
                            

                        <!-- Giá -->
                        <div class="form-group">
                            <label for="price">Giá:</label>
                            <input type="text" class="form-control" id="price" value="<%=book.getPrice()%>" name="price" required>
                        </div>

                        <!-- Số trang -->
                        <div class="form-group">
                            <label for="number_of_pages">Số trang:</label>
                            <input type="number" class="form-control" id="number_of_pages" value="<%=book.getNumberOfPages()%>" name="number_of_pages" required>
                        </div>

                        <!-- Nhà xuất bản -->
                        <div class="form-group">
                            <label for="publisher_id">Nhà xuất bản:</label>
                            <select class="form-control" name="publisher_id">
                                <% for( Publisher publiser: (ArrayList<Publisher>)request.getAttribute("listPublisher")  ) {%>
                                
                                
                                <option value="<%= publiser.getId() %>"
                                        <%= book.getPublisherId()== publiser.getId()?"selected":"" %> > <%= publiser.getName() %> </option>
                                <%}%>
                            </select>
                            
                        </div>

                        <!-- Năm xuất bản -->
                        <div class="form-group">
                            <label for="publication_year">Năm xuất bản:</label>
                            <input type="date" class="form-control" id="publication_year" value="<%=book.getPublicationYear()%>" name="publication_year" required>
                        </div>

                        <!-- Ngày tạo -->
                        <div class="form-group">
                            <label for="create_day">Ngày tạo:</label>
                            <input type="date" class="form-control" id="create_day" value="<%=book.getCreateDay()%>" name="create_day" required>
                        </div>

                        <!-- Nút submit để gửi form -->
                        <button type="submit" name="id" value="<%=book.getId()%>" class="btn btn-primary">Lưu</button>
                    </form>

                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
</section>
<!-- /.content -->
