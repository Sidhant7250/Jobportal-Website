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
        <title>Add Profile Experience Details Page</title>
        
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css">
        
    </head>
    <body>
        <jsp:include page="profileheader.jsp"></jsp:include>
        <jsp:include page="manubar.jsp"/>
        
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 3px gray; border-radius: 3px;">
                    <div class="col-md-2">
                        <img src="images/smartprogramminglogo.png" height="100"/>
                    </div>
                    <div class="col-md-10">
                        <h3>Add Experience Details </h3>
                        <b> <jsp:expression>name</jsp:expression></b>(<jsp:expression>session.getAttribute("session_email")</jsp:expression>)<br><br>
                        <form method="POST" action="addexperiencedetails">
                            Company : <br><input type="text" name="company1" class="textfield_design"/><br><br>
                            Location : <br> <input type="text" name="location1" placeholder="Eg. Delhi" class="textfield_design"/><br><br>
                            Year : <br><input type="text" name="year1" placeholder="Eg. 2020-2024" class="textfield_design"/><br><br>
                            Title : <br> <input type="text" name="jobtitle1" placeholder="Eg. Sr.java Developer" class="textfield_design" /><br><br>
                            Description  :<br><textarea  name="description1"  placeholder="Certifications,Activities and societies" style="width: 300px;"></textarea><br><br>
                            <input  type="submit" value="Add EXperience" class="btn btn-danger"/>
                        </form>
                      
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
          
        <jsp:include page="footer.jsp"/>
    </body>
</html>
