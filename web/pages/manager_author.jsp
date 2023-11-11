<%-- 
    Document   : manager_author
    Created on : Nov 5, 2023, 8:49:34 PM
    Author     : NguyenTienDat
--%>
<%@page import="model.Author"%>
<%@page import="java.util.ArrayList"%>
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
                                    <h2>Quản lý <b>tác giả</b></h2>
                                </div>
                                <div class="col-sm-8">						
                                    <a href="<%= request.getContextPath() %>/AddAuthor" class="btn btn-success"> <i class="fa fa-plus" aria-hidden="true"></i> <span>Thêm tác giả</span></a>
                        
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
                                
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 10px">STT</th>
                                    <th style="width: 318px;">Tên tác giả</th>
                                   
                                    <th>Hành động</th>
                                    
                            </thead>
                            <tbody>
                                <%
                                        ArrayList<Author> authorList = (ArrayList<Author>) request.getAttribute("authorList");
                                        for (Author author : authorList) {
                                    %>
                                <tr>
                                    <td> <%= author.getId() %> </td>
                                    <td> <%= author.getName() %></td>
                                    
                                <td class="d-flex border-0">
                                        <button type="button" class="btn btn-primary" onclick="update(this)"
                                                value="<%= author.getId()%>" href="<%= request.getContextPath()%>/EditAuthor">Sửa</button>
                                        <br>
                                        <button type="button" class="btn btn-danger ml-3" onclick="remove(this)"
                                                value="<%= author.getId()%>" href="<%= request.getContextPath()%>/DeleteAuthor">Xoá</button>
                                    </td>
                                </tr>

                                <div class="modal fade"
                                     id="staticBackdrop-<%=author.getId()%>"
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
                                                    tác giả '<%= author.getName() %>'</span>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button"
                                                        class="btn btn-warning  btn-secondary"
                                                        data-dismiss="modal">Hủy</button>
                                                <form
                                                    action="${pageContext.request.contextPath}/DeleteBook?id=<%= author.getId() %>"
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

