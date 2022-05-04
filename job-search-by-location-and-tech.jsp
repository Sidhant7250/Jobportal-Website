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

<jsp:scriptlet>
    String email = (String)session.getAttribute("session_email");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>job search  BY Location And Technology Page</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            
            <link rel="stylesheet" type="text/css" href="css/style.css">
            <script>
               function searchJobByTech(tech)
            {
                //alert(tech);
                
                var obj;
                // 1. creates an XMLHttpRequest Object
                if(window.XMLHttpRequest)
                {
                    obj=new XMLHttpRequest();   //for latest browsers
                }
                else
                {
                    obj=new ActiveXObject("Microsoft.XMLHTTP");     //for old IE version
                }
                
                // 2. specify the request
                obj.open("POST", "JobSearchByTechnology?technology="+tech, true);
                
                // 3. sends the request to the server
                obj.send();
                
                // 4. calls the function when readyState property changes
                obj.onreadystatechange = function()
                {
                    if(obj.readyState === 4 && obj.status === 200)
                    {
                        document.getElementById("respgenrated").innerHTML = obj.responseText;
                    }
                };
            }
            function searchJobByLocation(location)
            {
                var loc;
                if(window.XMLHttpRequest)
                {
                    loc=new XMLHttpRequest();
                }
                else
                {
                    loc =new ActiveXObject("Michrosoft.XMLHTTP");
                }
                loc.open("POST","JobSearchByLocation?location="+location,true);
                
                loc.send();
                
                loc.onreadystatechange = function()
                {
                    if(loc.readyState === 4 && loc.status === 200)
                    {
                        document.getElementById("respgenrated").innerHTML = loc.responseText;
                    }
                }
            }
        </script>

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
                    <h3>Find A Job at India,s No.1 Job Site</h3><br>
                    <input type="text" placeholder="Search by Technology..." class="textfield_design" onkeyup="searchJobByTech(this.value)" /><br><br>
                    OR<br><br>
                    <input type="text" placeholder="Search By Location..." class="textfield_design"onkeyup="searchJobByLocation(this.value)"/><br><br>
                   
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
                 <div class="col-md-6">
                     
                     <div class="row" style="background-color: #f8f4f4">
                     
                         <div class="col-md-12">
                             <span id="respgenrated">No Result Fund</span>
                         </div>
                         
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
