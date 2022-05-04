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
        <title>Index Page</title>

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
       
            <div class="row" style="border: 2px solid black">
               <img src="images/jobbanner.jpg"/>
            </div>
            
            <!--------search  job div start ------------------->
            <div class="row">
               
                <div class="col-md-2"></div>
                <div class="col-md-8 job_search_div">
                    <h3>Find A Job at India,s No.1 Job Site</h3><br>
                    <form action="search-job-result.jsp"method="POST">
                        <input type="text" name="technology1" placeholder="Technology..." class="textfield_design"/>
                        <input type="text" name="location1" placeholder="Location..." class="textfield_design"/>
                        <input type="submit" value="Search" class="btn btn-primary"/>
                    </form>
                   
                </div>
                <div class="col-md-2"></div>
            </div>
            
             <!--------search  job div end------------------->
             <div class="row">
                 <div class="col-md-3" style="background-color: #575757">
                     <ul> 
                         <img src="images/1.webp" height="100"/>  <li><a href=""> company1</a></li>
                         <img src="images/2.jfif" height="100"/> <li><a href=""> company2</a></li>
                         <img src="images/3.jfif" height="100"/>    <li><a href=""> company3</a></li>
                         <img src="images/4.jfif" height="100"/> <li><a href=""> company4</a></li>
                         <img src="images/5.jpeg" height="100"/> <li><a href=""> company5</a></li>
                         <img src="images/6.jpg" height="100"/> <li><a href=""> company6</a></li>
                     </ul>
                 </div>
                 <div class="col-md-6">
                     
                     <div class="row" style="background-color: #f8f4f4">
                     <jsp:scriptlet>
                     String id="",job_profile="",company="",experience="",description="",date1="",time1="";
                        try
                        {
                            Connection con = DbConnection.getconnect();
                            PreparedStatement ps = con.prepareStatement("Select*from jobs");
                            ResultSet rs = ps.executeQuery();
                            while(rs.next())
                            {
                                id = rs.getString("id");
                                job_profile = rs.getString("job_profile");
                                company = rs.getString("company");
                                experience = rs.getString("experience");
                                description = rs.getString("description");
                                date1 = rs.getString("date1");
                                time1=rs.getString("time1");
                                </jsp:scriptlet>
                         <div class="col-md-12 display_job_div">
                             <b> <jsp:expression>job_profile</jsp:expression></b><span style="color: #4b4b4b;font-size: 10px;float:right;">(<jsp:expression>date1</jsp:expression>&nbsp;&nbsp;<jsp:expression>time1</jsp:expression>)</span><br>
                         <span> <span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;<span style="color: #727171;">Company :-</span><jsp:expression>company</jsp:expression></span><br>
                     <span><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;<span style="color: #727171;">Experience :-</span><jsp:expression>experience</jsp:expression> </span><br>
                     <span> <span class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;<span style="color: #727171;">Job Description :-</span><jsp:expression>description</jsp:expression></span><br>
                     <a href="jobdescription.jsp?id=<jsp:expression>id</jsp:expression>"> See more details</a><br>
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
                         <div class="col-md-3" style="background-color: #575757">
                     <ul>
                         <img src="images/7.jpg" height="100"/>   <li><a href=""> company7</a></li>
                         <img src="images/8.jpg" height="100"/>  <li><a href=""> company8</a></li>
                         <img src="images/9.png" height="100"/> <li><a href=""> company9</a></li>
                         <img src="images/10.jpg" height="100"/> <li><a href=""> company10</a></li>
                         <img src="images/11.jpg" height="100"/>   <li><a href=""> company11</a></li>
                         <img src="images/12.jpg" height="100"/> <li><a href=""> company12</a></li>
                         
                     </ul>
                 </div>
             </div>
                 
            
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
