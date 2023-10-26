<%-- 
    Document   : manager_reader
    Created on : Oct 26, 2023, 3:36:14 PM
    Author     : hoatd
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Reader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Main content -->
<section class="content">

    <div class="row justify-content-center">
        <div style="margin-top: 20px; color: red;">${errorString}</div>
    </div>
    <div class="container-fluid">
        <div class="row">

            <div class="col-md-12">
                <div class="card">
                    <c:if
                        test="${sessionScope.Check.toString().equals('ManageReader_0')}">
                        <form role="form" method="post"
                              action="${pageContext.request.contextPath}/SearchReader">
                    </c:if>
                    <c:if
                        test="${sessionScope.Check.toString().equals('ManageReader_1')}">
                        <form role="form" method="post"
                              action="${pageContext.request.contextPath}/SearchReader?status=1">
                    </c:if>
                    <div class="card-header">
                        <c:if
                            test="${sessionScope.Check.toString().equals('ManageReader_0')}">
                            <h3 class="card-title">Danh sách sách những người đang mượn
                                sách</h3>
                        </c:if>
                        <c:if
                            test="${sessionScope.Check.toString().equals('ManageReader_1')}">
                            <h3 class="card-title">Danh sách lịch sử mượn sách sách</h3>
                        </c:if>


                        <div class="card-tools" style="margin-right: 1px;">
                            <div class="input-group input-group-sm" style="width: 200px;">
                                <input type="text" name="data_search"
                                       class="form-control float-right"
                                       placeholder="Tìm kiếm theo tên">

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
                    <div class="card-body">
                        <table class="table table-bordered table-hover" id="example2">
                            <thead>
                                <tr>
                                    <th style="width: 10px">STT</th>
                                    <th>Tên</th>
                                    <th>Số CMNN</th>
                                    
                                    <th>Ngày mượn</th>
                            <c:if
                                test="${sessionScope.Check.toString().equals('ManageReader_0')}">
                                <th>Ngày phải trả</th>
                                <th>Xác nhận</th>
                            </c:if>
                            <c:if
                                test="${sessionScope.Check.toString().equals('ManageReader_1')}">
                                <th>Ngày trả</th>
                            </c:if>

                            </tr>
                            </thead>
                            <tbody>
                                <%
                                    ArrayList<Reader> readerList = (ArrayList<Reader>) request.getAttribute("readerList");
                                    String check = (String) session.getAttribute("Check");
                                    for (int i = 0; i < readerList.size(); i++) {
                                        Reader reader = readerList.get(i);
                                %>
                                <tr>
                                    <td><%= i + 1%></td>
                                    <td><%= reader.getName()%></td>
                                    <td><%= reader.getIdentify()%></td>
                                    
                                    <td><%= reader.getStart_day()%></td>
                                    <td><%= reader.getEnd_day()%></td>
                            <c:if test='<%= check != null && check.equals("ManageReader_0")%>'>
                                <td>
                                    <button type="submit" class="btn btn-warning btn-secondary"
                                            onclick="location.href = '<%= pageContext.request.contextPath%>/ConfirmReader?id=<%= reader.getId()%>'">Đã trả
                                    </button>
                                </td>
                            </c:if>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>

                </div>
                <!-- /.card -->
            </div>
        </div>
        <!-- /.container-fluid -->
</section>