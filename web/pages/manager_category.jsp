<%-- 
    Document   : manager_category
    Created on : Oct 26, 2023, 3:25:18 PM
    Author     : hoatd
--%>

<%@page import="model.Category"%>
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
                            <h3 class="card-title">Danh sách thể loại sách</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">

                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width: 10px">STT</th>
                                        <th>Tên thể loại</th>
                                        <th>Chỉnh sửa</th>
                                        <th>Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ArrayList<Category> categoryList = (ArrayList<Category>) request.getAttribute("categoryList");
                                        for (Category category : categoryList) {
                                    %>
                                    <tr>
                                        <td><%= category.getId()%></td>
                                        <td><%= category.getName()%></td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/EditCategory?id=<%= category.getId()%>" class="btn btn-sm btn-info">Chỉnh sửa</a>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-danger" data-toggle="modal" data-target="#staticBackdrop-<%= category.getId()%>">Xóa</button>
                                        </td>
                                    </tr>

                                <div class="modal fade" id="staticBackdrop-<%= category.getId()%>" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel1">Chú ý</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <span class="text-danger"> Bạn có muốn chắc xóa thể loại '<%= category.getName()%>'</span>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-warning  btn-secondary" data-dismiss="modal">Hủy</button>
                                                <form action="${pageContext.request.contextPath}/DeleteCategory?id=<%= category.getId()%>" method="POST">
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
                                <input type="button" value="Thêm thể loại"
                                       class="btn btn-primary"
                                       onclick="location.href = '${pageContext.request.contextPath}/AddCategory'">
                            </div>
                        </div>

                    </div>
                    <!-- /.card -->
                </div>
 