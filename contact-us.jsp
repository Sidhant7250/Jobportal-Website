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
    String email = (String) session.getAttribute("session_email");
    String name = (String) session.getAttribute("session_name");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us Page</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.max.css">

        <link rel="stylesheet" type="text/css" href="css/style.css">

    </head>
    <body>
        <div class="container-fluid">
            <jsp:scriptlet>
                if (email == null ? email == null : email.trim().equals("null")) {
            </jsp:scriptlet>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
            } else {
            </jsp:scriptlet>
            <jsp:include page="profileheader.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            </jsp:scriptlet>
            <jsp:include page="manubar.jsp"></jsp:include>



                <!--------search  job div start ------------------->
                <

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
                    <div class="col-md-6" >
                    <jsp:scriptlet>
                        if(email == null || email.trim().equals("null"))
                        {
                       </jsp:scriptlet>
                        
                    <jsp:include page="contct-us-no-user.jsp"></jsp:include>
                         <jsp:scriptlet>
                        }
                        else
                        {
                            </jsp:scriptlet>
                        
                    <jsp:include page="contact-us-user.jsp"></jsp:include>
                    <jsp:scriptlet>
                        }
                    </jsp:scriptlet>

                    </div>
                    <div class="col-md-3">
                        <ul<img src="images/7.jpg" height="100"/>   <li><a href=""> company7</a></li>
                         <img src="images/8.jpg" height="100"/>  <li><a href=""> company8</a></li>
                         <img src="images/9.png" height="100"/> <li><a href=""> company9</a></li>
                         <img src="images/10.jpg" height="100"/> <li><a href=""> company10</a></li>
                         <img src="images/11.jpg" height="100"/>   <li><a href=""> company11</a></li>
                         <img src="images/12.jpg" height="100"/> <li><a href=""> company12</a></li>

                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d214.39176837160858!2d76.71087650734023!3d30.7108571!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x616dfc7292ce7034!2sSmart%20Programming!5e0!3m2!1sen!2sin!4v1651140085451!5m2!1sen!2sin" width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                    <div class="col-md-2"></div>
                </div>


            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
