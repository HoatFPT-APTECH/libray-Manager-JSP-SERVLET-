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

        <div class="row justify-content-center">
            <div style="margin-top: 20px; color: red;">${errorString}</div>
        </div>
        <div class="container-fluid">
            <div class="row">
              
                <div class="col">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Danh sách nhà xuất bản </h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">

                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width: 10px">STT</th>
                                        <th>Tên nhà xuất bản</th>
                                        <th>Chỉnh sửa</th>
                                        <th>Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ArrayList<Publisher> publisherList = (ArrayList<Publisher>) request.getAttribute("publisherList");
                                        for (Publisher publisher : publisherList) {
                                    %>
                                    <tr>
                                        <td><%= publisher.getId()%></td>
                                        <td><%= publisher.getName()%></td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/EditPublisher?id=<%= publisher.getId()%>" class="btn btn-sm btn-info">Chỉnh sửa</a>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-danger" data-toggle="modal" data-target="#staticBackdrop-<%= publisher.getId()%>">Xóa</button>
                                        </td>
                                    </tr>

                                <div class="modal fade" id="staticBackdrop-<%= publisher.getId()%>" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel1">Chú ý</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <span class="text-danger"> Bạn có muốn chắc xóa '<%= publisher.getName()%>'</span>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-warning  btn-secondary" data-dismiss="modal">Hủy</button>
                                                <form action="${pageContext.request.contextPath}/DeletePublisher?id=<%= publisher.getId()%>" method="POST">
                                                    <button type="submit" class="btn btn-danger">Xóa</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                                </tbody>

                            </table>
                            <div class="card-header" style="margin-left: -20px;">
                                <input type="button" value="Thêm nhà xuất bản"
                                       class="btn btn-primary"
                                       onclick="location.href = '${pageContext.request.contextPath}/AddPublisher'">
                            </div>
                        </div>

                    </div>
                    <!-- /.card -->
                </div>

