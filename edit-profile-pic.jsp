<%-- 
    Document   : profile
    Created on : 17 Apr, 2022, 8:05:32 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="CheckCookie"></jsp:include>
<jsp:scriptlet>  
                String name=(String)session.getAttribute("session_name");
                String pic =(String)session.getAttribute("session_pic");
            
</jsp:scriptlet>

<jsp:scriptlet>
        if(name== null || name.equals(""))
            {
                response.sendRedirect("login.jsp");
            }
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile picture Page</title>
        
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            
            <link rel="stylesheet" type="text/css" href="css/style.css">
        
    </head>
    <body>
        <jsp:include page="profileheader.jsp"></jsp:include>
        <jsp:include page="manubar.jsp"/>
        
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 3px gray; border-radius: 3px;">
                    <div class="col-md-3">
                         <img src="profilepictures/<jsp:expression>pic</jsp:expression>" height="150" style="border-radius: 60px;"/>
                    </div>
                    <div class="col-md-9">
                        <h3>Edit Profile Picture </h3>
                        
                        <form method="POST" action="editProfilepicture" enctype="multipart/form-data">
                            <b> <jsp:expression>name</jsp:expression></b>&nbsp;(<jsp:expression>session.getAttribute("session_email")</jsp:expression>)<br><br>
                            <input type="file" name="UploadProfilePic"/><br><br>
                            <input  type="submit" value="UploadProfilePicture" class="btn btn-danger"/>
                        </form>
                      
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
          
        <jsp:include page="footer.jsp"/>
    </body>
</html>
