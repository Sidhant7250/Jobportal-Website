<%-- 
    Document   : register
    Created on : 19 Apr, 2022, 7:41:40 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="driverpackage.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="CheckCookie"></jsp:include>
    
<jsp:scriptlet>
    String email = (String)session.getAttribute("session_email");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About us  Page</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            
            <link rel="stylesheet" type="text/css" href="css/style.css">

    </head>
    <body>
        <div class="container-fluid">
            <jsp:scriptlet>
            if(email == null ? email == null : email.trim().equals("null"))
            {
                </jsp:scriptlet>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
            }
            else
            {
            </jsp:scriptlet>
            <jsp:include page="profileheader.jsp"></jsp:include>
            <jsp:scriptlet>
            }
            </jsp:scriptlet>
            <jsp:include page="manubar.jsp"></jsp:include>
       
            
            
            <!--------search  job div start ------------------->
            <div class="row">
               
                <div class="col-md-2"></div>
                <div class="col-md-8 job_search_div">
                    <h3>About Job Portal</h3><br>
                    
                   
                </div>
                <div class="col-md-2"></div>
            </div>
            
             <!--------search  job div end------------------->
             <div class="row">
                 <div class="col-md-3">
                     <ul> 
                         <li><a href=""> company1</a></li>
                         <li><a href=""> company2</a></li>
                         <li><a href=""> company3</a></li>
                         <li><a href=""> company4</a></li>
                         <li><a href=""> company5</a></li>
                         <li><a href=""> company6</a></li>
                     </ul>
                 </div>
                 <div class="col-md-6" style="background-color: #bdb6b6;margin-top: 10px;">
                     <p> This is job portal website description</p>
                     <h3>Our mission</h3>
                     <ul>
                         <li>this is demo</li>
                         <li>this is demo</li>
                         <li>this is demo</li>
                         <li>this is demo</li>
                         <li>this is demo</li>
                         <li>this is demo</li>
                         <li>this is demo</li>
                    </ul>
                     <h3> our core value</h3>
                     <p>this is our core value description paragraph</p>
                     <h3> our Team</h3>
                     <p>This this demo description about my team</p>
                     
                 </div>
                 <div class="col-md-3">
                     <ul>
                         <li><a href=""> company7</a></li>
                         <li><a href=""> company8</a></li>
                         <li><a href=""> company9</a></li>
                         <li><a href=""> company10</a></li>
                         <li><a href=""> company11</a></li>
                         <li><a href=""> company12</a></li>
                         
                     </ul>
                 </div>
             </div>
                 
    
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
