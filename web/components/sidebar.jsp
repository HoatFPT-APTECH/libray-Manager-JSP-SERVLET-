<%-- 
    Document   : sidebar.jsp
    Created on : Oct 24, 2023, 4:07:59 PM
    Author     : hoatd
--%>



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
                      
                        <div class="image">
                            <img src="<%= request.getContextPath() %>/Resources/img/avatar/avatar.png" class="img-circle elevation-2"
                                 alt="User Image">
                        </div>
                        <div class="info">

                            <a href="#" id="user" class="d-block"></a>
                        </div>
                      

                        
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column"
                            data-widget="treeview" role="menu" data-accordion="false">
                            <li class="nav-item  "><a
                                    href="${pageContext.request.contextPath}/UserManual"
                                    class="nav-link ">
                                        
                                        <p> <i class="fa fa-star" aria-hidden="true"></i>   Cửa sổ làm việc</p>
                                    </a></li>
                                <li
                                    class="nav-item has-treeview "><a
                                        href="#"
                                        class="nav-link ">
                                       
                                        <p>
                                           <i class="fa fa-book" aria-hidden="true"></i> Quản lý tài nguyên<i class="right fas fa-angle-left"></i>
                                        </p>
                                    </a>
                                    <ul class="nav nav-treeview">
                                        <li class="nav-item"><a
                                                href="${pageContext.request.contextPath}/ManagerBook"
                                            class="nav-link ">
                                                <i class="far fa-circle nav-icon"></i>
                                                <p>Sách</p>
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
                                      
                                        <p>
                                           <i class="fa fa-bell" aria-hidden="true"></i>  Quản lý mượn sách<i class="right fas fa-angle-left"></i>
                                        </p>
                                    </a>
                                    <ul class="nav nav-treeview">
                                        <li class="nav-item"><a
                                                href="${pageContext.request.contextPath}/ManagerReader"
                                            class="nav-link">
                                                <i class="far fa-circle nav-icon"></i>
                                                <p>Quản lý độc giả </p>
                                            </a></li>
                                        <li class="nav-item"><a
                                                href="${pageContext.request.contextPath}/ManageBorrowRequest"
                                            class="nav-link">
                                                <i class="far fa-circle nav-icon"></i>
                                                <p>Đang mượn sách</p>
                                            </a></li>

                                        <li class="nav-item"><a
                                                href="${pageContext.request.contextPath}/ManageBorrowTracking"
                                            class="nav-link ">
                                                <i class="far fa-circle nav-icon"></i>
                                                <p>Lịch sử mượn sách</p>
                                            </a></li>
                                    </ul></li>
                                    
                                     <li
                                    class=" nav-item has-treeview "><a
                                        href="#"
                                        class="nav-link ">
                                           
                                        <p>
                                      <i class="fa fa-calculator mr-2" ></i>Báo cáo thống kê <i class="right fas fa-angle-left"></i>
                                        </p>
                                    </a>
                                    <ul class="nav nav-treeview">
                                        <li class="nav-item"><a
                                                href="${pageContext.request.contextPath}/SituationServed"
                                            class="nav-link">
                                                <i class="far fa-circle nav-icon"></i>
                                                <p>Tình hình phục vụ</p>
                                            </a></li>
                                      
                                    </ul></li>
                             
                            <li class="nav-item"><a
                                    href="${pageContext.request.contextPath}/Logout" class="nav-link">
                                    <i class="fas fa-circle nav-icon"></i>
                                    <p>Đăng xuất</p>
                                </a></li>
                           

                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>