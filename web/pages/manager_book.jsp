<%-- 
    Document   : manager_book
    Created on : Oct 26, 2023, 3:07:29 PM
    Author     : hoatd
--%>

<%@page import="model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
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
                                    <h2>Quản lý <b>sách</b></h2>
                                </div>
                                <div class="col-sm-8">						
                                    <a href="<%= request.getContextPath() %>/AddBook" class="btn btn-success"> <i class="fa fa-plus" aria-hidden="true"></i> <span>Thêm sách</span></a>
                        
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
                                        <label>Lọc</label>
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
                                    <th style="width: 10px">STT</th>
                                    <th style="width: 318px;">Tên</th>
                                    <th>Thể loại</th>
                                    <th>Số lượng</th>
                                    <th>Ngày nhập</th>
                                    <th>Hình ảnh</th>
                                    <th>Hành động</th>
                                    
                            </thead>
                            <tbody>
                                <%for(Book book : (ArrayList<Book>) request.getAttribute("bookList")){%>
                                <tr>
                                    <td> <%= book.getId() %> </td>
                                    <td> <%= book.getName() %></td>
                                    <td> <%=book.getCategory().getName()%> </td>
                                    <td style="text-align: center;">${book.getAmount()}</td>
                                    <td>${book.getDay()}</td>
                                    <td style="text-align: center;"><img
                                            src="Resources/img/products/<%=book.getImage()%>" width="35"
                                            height="50">
                                <figcaption>
                                    <a href="Resources/img/products/<%=book.getImage()%>"
                                       style="font-size: 14px;" target="_blank">Xem chi tiết</a>
                                </figcaption></td>
                                <td class="d-flex border-0">
                                        <button type="button" class="btn btn-primary" onclick="update(this)"
                                                value="<%= book.getId()%>" href="<%= request.getContextPath()%>/EditBook">Sửa</button>
                                        <br>
                                        <button type="button" class="btn btn-danger ml-3" onclick="remove(this)"
                                                value="<%= book.getId()%>" href="<%= request.getContextPath()%>/DeleteBook">Xoá</button>
                                    </td>
                                </tr>

                                <div class="modal fade"
                                     id="staticBackdrop-<%=book.getId()%>"
                                     data-backdrop="static" data-keyboard="false" tabindex="-1"
                                     aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel1">Chú
                                                    ý</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <span class="text-danger"> Bạn có muốn chắc xóa
                                                    cuốn sách '<%= book.getName() %>'</span>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button"
                                                        class="btn btn-warning  btn-secondary"
                                                        data-dismiss="modal">Hủy</button>
                                                <form
                                                    action="${pageContext.request.contextPath}/DeleteBook?id=<%= book.getId() %>"
                                                    method="POST">
                                                    <button type="submit" class="btn btn-danger">Xóa</button>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <%}%>
                            </tbody>
                        </table>

                        <div class="card-header">
                            <div class="card-tools">
                                <input type="button" value="Xóa tất cả" class="btn btn-danger"
                                       data-toggle="modal" data-target="#staticBackdrop-DeleteAll">
                            </div>
                            <div class="modal fade" id="staticBackdrop-DeleteAll"
                                 data-backdrop="static" data-keyboard="false" tabindex="-1"
                                 aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel1">Chú ý</h5>
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <span class="text-danger"> Bạn có muốn chắc xóa tất
                                                cả sách</span>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-warning  btn-secondary"
                                                    data-dismiss="modal">Hủy</button>

                                            <button type="submit" class="btn btn-danger"
                                                    onclick="location.href = '${pageContext.request.contextPath}/DeleteBook'">Xóa</button>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <!-- /.card -->
            </div>
        </div>
        <!-- /.container-fluid -->
</section>
<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true,
            "autoWidth": false,
        });
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
