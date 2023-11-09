<%-- 
    Document   : login
    Created on : Oct 25, 2023, 5:15:11 PM
    Author     : hoatd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- saved from url=(0055)https://adminlte.io/themes/v3/pages/examples/login.html -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="<%= request.getContextPath() %>/Resources/plugins/fontawesome-free/css/all.min.css">

        <!-- Ionicons -->
        <link rel="stylesheet"
              href="<%= request.getContextPath() %>/Resources/css/ionicons.min.css">
        <!-- Tempusdominus Bbootstrap 4 -->
        <link rel="stylesheet"
              href="<%= request.getContextPath() %>/Resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
        <!-- iCheck -->
        <link rel="stylesheet"
              href="<%= request.getContextPath() %>/Resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- JQVMap -->
        <link rel="stylesheet" href="<%= request.getContextPath() %>/Resources/plugins/jqvmap/jqvmap.min.css">

        <!-- overlayScrollbars -->
        <link rel="stylesheet"
              href="<%= request.getContextPath() %>/Resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
        <!-- Daterange picker -->
        <link rel="stylesheet"
              href="<%= request.getContextPath() %>/Resources/plugins/daterangepicker/daterangepicker.css">
        <!-- summernote -->
        <link rel="stylesheet"
              href="<%= request.getContextPath() %>/Resources/plugins/summernote/summernote-bs4.css">
        <!-- Google Font: Source Sans Pro -->
        <!-- daterange picker -->
        <link rel="stylesheet"
              href="<%= request.getContextPath() %>/Resources/plugins/daterangepicker/daterangepicker.css">
        <!-- Bootstrap Color Picker -->
        <link rel="stylesheet"
              href="<%= request.getContextPath() %>/Resources/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
        <!-- Select2 -->
        <link rel="stylesheet"
              href="<%= request.getContextPath() %>/Resources/plugins/select2/css/select2.min.css">
        <link rel="stylesheet"
              href="<%= request.getContextPath() %>/Resources/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
        <!-- Bootstrap4 Duallistbox -->
        <link rel="stylesheet"
              href="<%= request.getContextPath() %>/Resources/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="<%= request.getContextPath() %>/Resources/css/adminlte.min.css">
        <!-- Google Font: Source Sans Pro -->

        <link
            href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
            rel="stylesheet">
    <body class="login-page" style="min-height: 496.781px;">
        <div class="login-box">
            <div class="login-logo">
                <a href="https://adminlte.io/themes/v3/index2.html"><b>Admin</b>LTE</a>
            </div>

            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg">Sign in to start your session</p>
                    <form action="<%= request.getContextPath() %>/" method="post">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" name="userName" placeholder="User Name">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" name="password" placeholder="password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="icheck-primary">
                                    <input type="checkbox" id="remember">
                                    <label for="remember">
                                        Remember Me
                                    </label>
                                </div>
                            </div>

                            <div class="col-4">
                                <button type="submit" class="btn btn-primary btn-block btn-sm">Đăng nhập</button>
                            </div>
                           
                                   

                        </div>
                          <div id="invalidAcc" style="display: none;">
                                <div class="alert alert-danger mt-3 " id="loginError">
                                    Tên tài khoản hoặc mật khẩu không chính xác
                                  </div>
                              </div>
                    </form>
                    <div class="social-auth-links text-center mb-3">
                        <p>- OR -</p>
                        <a href="https://adminlte.io/themes/v3/pages/examples/login.html#" class="btn btn-block btn-primary">
                            <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
                        </a>
                        <a href="https://adminlte.io/themes/v3/pages/examples/login.html#" class="btn btn-block btn-danger">
                            <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
                        </a>
                    </div>

                    <p class="mb-1">
                        <a href="https://adminlte.io/themes/v3/pages/examples/forgot-password.html">I forgot my password</a>
                    </p>
                    <p class="mb-0">
                        <a href="https://adminlte.io/themes/v3/pages/examples/register.html" class="text-center">Register a new membership</a>
                    </p>
                </div>

            </div>
        </div>
        <input type="hidden" id="loginFails" value="${rs}"/>



</body></html>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded",()=>{
        loginFail()
    }) 
    function loginFail(){
        var loginI= document.querySelector("#loginFails");
    
        if(loginI.value!=null && loginI.value!=""){
            var showErrDiv= document.querySelector("#invalidAcc");
           showErrDiv.style.display="block"
        
        }
    }
            
            
</script>