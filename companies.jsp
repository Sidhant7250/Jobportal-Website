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
        <title>Companies Page</title>

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
                 <div class="col-md-6">
                     <h3>Our company</h3>
                     <div class="row" style="background-color: #f8f4f4">
                         
                     <jsp:scriptlet>
                     String c_id="",c_name="",c_email="",c_logo="",c_phoneno="";
                        try
                        {
                            Connection con = DbConnection.getconnect();
                            PreparedStatement ps = con.prepareStatement("Select*from company_reg");
                            ResultSet rs = ps.executeQuery();
                            while(rs.next())
                            {
                                c_id = rs.getString("id");
                                c_name = rs.getString("c_name");
                                c_email = rs.getString("c_email");
                                c_logo = rs.getString("c_logo");
                                c_phoneno = rs.getString("c_phoneno");
                                
                                </jsp:scriptlet>
                         <div class="col-md-12 display_job_div">
                             <img src="company_logo/<jsp:expression>c_logo</jsp:expression>" height="50"/>
                             <b> <jsp:expression>c_name</jsp:expression></b><span style="color: #4b4b4b;font-size: 10px;">(<jsp:expression>c_email</jsp:expression>&nbsp;&nbsp;)</span><br>
                         <span> <span class="glyphicon glyphicon-phone-alt"></span>&nbsp;&nbsp;<span style="color: #727171;">Phone Number :-&nbsp;</span><jsp:expression>c_phoneno</jsp:expression></span><br>
                     
                             <a href="companiesjobs.jsp?c_email=<jsp:expression>c_email</jsp:expression>"> See All Jobs for this company</a><br>
                         </div>
                     <jsp:scriptlet>
                                
                            }
                            
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                     </jsp:scriptlet>
                         
                         
                         
                         
                     </div>
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
