<%-- 
    Document   : index
    Created on : Oct 24, 2023, 4:40:13 PM
    Author     : hoatd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <jsp:include page="./components/head.jsp"/>
    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">
             <jsp:include page="./components/header.jsp"/>
            <!-- /.navbar -->
              <jsp:include page="./components/sidebar.jsp"/>
              <div class="content-wrapper">
                  <section class="content" >
                      
                   
                          <p> Include page ở đây  </p>
                          <jsp:include page="./pages/${page}"/>
                  
                  </section>


              </div>
            
        </div>
                    
                      <jsp:include page="./components/footer.jsp"/> 
                     
                          <input type="hidden" id="errorString" value="${errorString}"/>;
                          <script>
                              var errStr= document.getElementById("errorString")
                              var str=errStr.value;
                              if(typeof str==="string" && str.length!==0)
                              alert(str)
                              </script>
                         
    </body>
</html>
