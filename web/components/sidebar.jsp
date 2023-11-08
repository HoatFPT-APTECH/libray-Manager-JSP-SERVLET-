<%-- 
    Document   : sidebar.jsp
    Created on : Oct 24, 2023, 4:07:59 PM
    Author     : hoatd
--%>


<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <a href="${pageContext.request.contextPath}/UserManual" class="brand-link"> <img
                        src="<%= request.getContextPath() %>/Resources/img/logo/logo.png" alt="AdminLTE Logo"
                        class="brand-image img-circle elevation-3" style="opacity: .8">
                    <span class="brand-text font-weight-light">Quán lý thư viện</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <%
                            if (request.getSession().getAttribute("User") != null) {
                        %>
                        <%
                            User user = (User) request.getSession().getAttribute("User");
                        %>
                        <div class="image">
                            <img src="<%= request.getContextPath() %>/Resources/img/avatar/avatar.png" class="img-circle elevation-2"
                                 alt="User Image">
                        </div>
                        <div class="info">

                            <a href="#" class="d-block"><%=user.getUsername()%></a>
                        </div>
                        <%
                        } else {
                        %>

                        <div class="info" style="margin-left: 60px;">
                            <a href="${pageContext.request.contextPath}/" class="d-block">Đăng
                                nhập</a>
                        </div>
                        <%
                            }
                        %>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column"
                            data-widget="treeview" role="menu" data-accordion="false">
                            <li class="nav-item  "><a
                                    href="${pageContext.request.contextPath}/UserManual"
                                    class="nav-link ">
                                        <i class="nav-icon fas fa-book"></i>
                                        <p>Hướng dẫn</p>
                                    </a></li>
                                <li
                                    class="nav-item has-treeview "><a
                                        href="#"
                                        class="nav-link ">
                                        <i class="nav-icon fas fa-book"></i>
                                        <p>
                                            Quản lý sách<i class="right fas fa-angle-left"></i>
                                        </p>
                                    </a>
                                    <ul class="nav nav-treeview">
                                        <li class="nav-item"><a
                                                href="${pageContext.request.contextPath}/ManageBook"
                                            class="nav-link ">
                                                <i class="far fa-circle nav-icon"></i>
                                                <p>Danh sách</p>
                                            </a></li>
                                        <li class="nav-item"><a
                                                href="${pageContext.request.contextPath}/AddBook"
                                            class="nav-link ">
                                                <i class="far fa-circle nav-icon"></i>
                                                <p>Thêm sách</p>
                                            </a></li>
                                        <li class="nav-item"><a
                                                href="${pageContext.request.contextPath}/ManageCategory"
                                            class="nav-link">
                                                <i class="far fa-circle nav-icon"></i>
                                                <p>Thể loại</p>
                                            </a></li>
                                            <li class="nav-item"><a
                                                href="${pageContext.request.contextPath}/ManagerAuthor"
                                            class="nav-link">
                                                <i class="far fa-circle nav-icon"></i>
                                                <p>Tác giả</p>
                                            </a></li>
                                             <li class="nav-item"><a
                                                href="${pageContext.request.contextPath}/ManagerPublisher"
                                            class="nav-link">
                                                <i class="far fa-circle nav-icon"></i>
                                                <p>Nhà xuất bản</p>
                                            </a></li>
                                    </ul></li>
                                <li
                                    class=" nav-item has-treeview "><a
                                        href="#"
                                        class="nav-link ">
                                        <i class="nav-icon fas fa-book"></i>
                                        <p>
                                            Quản lý mượn sách<i class="right fas fa-angle-left"></i>
                                        </p>
                                    </a>
                                    <ul class="nav nav-treeview">
                                        <li class="nav-item"><a
                                                href="${pageContext.request.contextPath}/AddReader"
                                            class="nav-link">
                                                <i class="far fa-circle nav-icon"></i>
                                                <p>Thêm người mượn sách</p>
                                            </a></li>
                                        <li class="nav-item"><a
                                                href="${pageContext.request.contextPath}/ManageBorrowRequest"
                                            class="nav-link">
                                                <i class="far fa-circle nav-icon"></i>
                                                <p>Danh sách đang mượn sách</p>
                                            </a></li>

                                        <li class="nav-item"><a
                                                href="${pageContext.request.contextPath}/ManageReader?status=1"
                                            class="nav-link ">
                                                <i class="far fa-circle nav-icon"></i>
                                                <p>Lịch sử mượn sách</p>
                                            </a></li>
                                    </ul></li>
                                <%
                                    if (request.getSession().getAttribute("User") != null) {
                                %>
                            <li class="nav-item"><a
                                    href="${pageContext.request.contextPath}/Logout" class="nav-link">
                                    <i class="fas fa-circle nav-icon"></i>
                                    <p>Đăng xuất</p>
                                </a></li>
                                <%
                                    }
                                %>

                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>