<%-- 
    Document   : manager_author
    Created on : Nov 5, 2023, 8:49:34 PM
    Author     : NguyenTienDat
--%>
<%@page import="model.Author"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <div class="row justify-content-center">
            <div style="margin-top: 20px; color: red;">${errorString}</div>
        </div>
        <div class="container-fluid">
            <div class="row">
         
                <div class="col">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Danh sách tên tác giả</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">

                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width: 10px">STT</th>
                                        <th>Tên tác giả</th>
                                        <th>Chỉnh sửa</th>
                                        <th>Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ArrayList<Author> authorList = (ArrayList<Author>) request.getAttribute("authorList");
                                        for (Author author : authorList) {
                                    %>
                                    <tr>
                                        <td><%= author.getId()%></td>
                                        <td><%= author.getName()%></td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/EditAuthor?id=<%= author.getId()%>" class="btn btn-sm btn-info">Chỉnh sửa</a>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-danger" data-toggle="modal" data-target="#staticBackdrop-<%= author.getId()%>">Xóa</button>
                                        </td>
                                    </tr>

                                <div class="modal fade" id="staticBackdrop-<%= author.getId()%>" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel1">Chú ý</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <span class="text-danger"> Bạn có muốn chắc xóa tác giả này '<%= author.getName()%>'</span>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-warning  btn-secondary" data-dismiss="modal">Hủy</button>
                                                <form action="${pageContext.request.contextPath}/DeleteAuthor?id=<%= author.getId()%>" method="POST">
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
                                <input type="button" value="Thêm tác giả"
                                       class="btn btn-primary"
                                       onclick="location.href = '${pageContext.request.contextPath}/AddAuthor'">
                            </div>
                        </div>

                    </div>
                    <!-- /.card -->
                </div>


