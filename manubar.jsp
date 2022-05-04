<%-- 
    Document   : manubar
    Created on : 19 Apr, 2022, 9:03:45 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="CheckCookie"></jsp:include>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
    //String jobid = request.getParameter("id");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row manubardeiv">
            <div class="col-md-7" id="mynavbar">
                <ul>
                    <li><a href="index.jsp"> Home</a> </li>
                    <li> <a href="job-search-by-location-and-tech.jsp">Search Job</a> </li>
                    <li><a href="companies.jsp"> Companies</a> </li>
                    <jsp:scriptlet>
                             if (email == null ? email == null : email.trim().equals("null"))
                                 {
                    </jsp:scriptlet>
                   
                    <jsp:scriptlet>
                    } 
                    else
                     {
                    </jsp:scriptlet>
                   <li> <a href="my-applied-jobs.jsp">My Applied Job</a> </li>
                    <jsp:scriptlet>
                }
                    </jsp:scriptlet>
                   
                    
                </ul>
            </div>
            <div class="col-md-5" id="mynavbar">
                <ul>
                    <li> <a href="about-us.jsp">About Us</a> </li>
                    <li> <a href="contact-us.jsp">Contact us</a> </li>
                </ul>
            </div>
        </div>
    </body>
</html>
