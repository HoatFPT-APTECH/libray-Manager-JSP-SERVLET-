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
                <div class="card">
                    <form role="form" method="post"
                          action="${pageContext.request.contextPath}/SearchBook">
                        <div class="card-header">
                            <h3 class="card-title">Danh sách yêu cầu mượn sách</h3>

                            <div class="card-tools" style="margin-right: 1px;">
                                <div class="input-group input-group-sm" style="width: 200px;">
                                    <input type="text" name="data_search"
                                           class="form-control float-right"
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
                    <div class="card-body" >
                        <div class="card-header" style="margin-left: -20px; margin-top: -40px;">
                            <input type="button" value="Thêm yêu cầu mượn sách"
                                   class="btn btn-primary"
                                   onclick="location.href = '${pageContext.request.contextPath}//AddBorrowRequest'">
                        </div>
                        <table class="table table-bordered table-hover" id="example2">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Người mượn </th>
                                    <th>Ảnh sách</th>
                                    <th>Sách</th>
                                    <th>Hạn trả</th>
                                    <th>Hành động </th>
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
                                    <td style="text-align: center;"><img
                                            src="Resources/img/products/<%=e.book.getImage()%>" width="35"
                                            height="50">
                            <figcaption>
                                <a href="Resources/img/products/<%=e.book.getImage() %>"
                                   style="font-size: 14px;" target="_blank">Xem chi tiết</a>
                            </figcaption>
                            </td>
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
                                                href="<%=request.getContextPath() %>/EditBorrowRequest"
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
