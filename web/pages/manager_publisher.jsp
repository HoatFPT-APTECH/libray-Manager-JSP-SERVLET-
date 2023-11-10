<%-- 
    Document   : manager_publisher
    Created on : Nov 7, 2023, 6:58:36 PM
    Author     : NguyenTienDat
--%>
<%@page import="model.Publisher"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Main content -->
<!-- Content Wrapper. Contains page content -->

        <section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-4">
                                    <h2>Quản lý <b>nhà xuất bản</b></h2>
                                </div>
                                <div class="col-sm-8">						
                                    <a href="<%= request.getContextPath() %>/AddPublisher" class="btn btn-success"> <i class="fa fa-plus" aria-hidden="true"></i> <span>Thêm nhà xuất bản</span></a>
                        
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
                                    <th style="width: 318px;">Tên nhà xuất bản</th>
                                    
                                    <th>Hành động</th>
                                    
                            </thead>
                            <tbody>
                                <%
                                        ArrayList<Publisher> publisherList = (ArrayList<Publisher>) request.getAttribute("publisherList");
                                        for (Publisher publisher : publisherList) {
                                    %>
                                <tr>
                                    <td><%= publisher.getId()%></td>
                                    <td><%= publisher.getName()%></td>
                                <td class="d-flex border-0">
                                        <button type="button" class="btn btn-primary" onclick="update(this)"
                                                value="<%= publisher.getId()%>" href="<%= request.getContextPath()%>/EditPublisher">Sửa</button>
                                        <br>
                                        <button type="button" class="btn btn-danger ml-3" onclick="remove(this)"
                                                value="<%= publisher.getId()%>" href="<%= request.getContextPath()%>/DeletePublisher">Xoá</button>
                                    </td>
                                </tr>

                                <div class="modal fade"
                                     id="staticBackdrop-<%=publisher.getId()%>"
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
                                                    nhà xuất bản '<%= publisher.getName() %>'</span>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button"
                                                        class="btn btn-warning  btn-secondary"
                                                        data-dismiss="modal">Hủy</button>
                                                <form
                                                    action="${pageContext.request.contextPath}/DeletePublisher?id=<%= publisher.getId() %>"
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
                                                cả nhà xuất bản</span>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-warning  btn-secondary"
                                                    data-dismiss="modal">Hủy</button>

                                            <button type="submit" class="btn btn-danger"
                                                    onclick="location.href = '${pageContext.request.contextPath}/DeletePublisher'">Xóa</button>


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
