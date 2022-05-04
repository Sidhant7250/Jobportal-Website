<%-- 
    Document   : profileheader
    Created on : 21 Apr, 2022, 8:52:07 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="CheckCookie"></jsp:include>
<jsp:scriptlet> 
                String name=(String)session.getAttribute("session_name");
                String pic = (String)session.getAttribute("session_pic");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile header Page</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome : <jsp:expression> name </jsp:expression></title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        
    </head>
    <body>
       <div class="row header_bg">
                <div class="col-md-4">
                    <a href="index.jsp">
                        <img src="images/smartprogramminglogo.png" height="50"/>
                    <span class="logo_text_design">Job Portal</span>
                    </a>
                    </div>
                    <div class="col-md-6">
                         <img src="profilepictures/<jsp:expression>pic</jsp:expression>" height="40" style="border-radius: 30px;"/>
                        <span style="text-align: center; color: white"><a href="profile.jsp" style="color: white; font-size: 20px; text-decoration: none"> <jsp:expression> name </jsp:expression> </a></span>
                    </div>
                    <div class="col-md-2">
                         <span style="color: white">  <a href="logout" class="hyperlink_design">Logout</a></span>
                    </div>
            </div>
    </body>
</html>
