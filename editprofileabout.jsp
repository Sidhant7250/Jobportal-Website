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
                String gender=(String)session.getAttribute("session_gender");
                String field=(String)session.getAttribute("session_fields");
                String city=(String)session.getAttribute("session_city");
                String skills=(String)session.getAttribute("session_skills");
                String title=(String)session.getAttribute("session_title");
                
                if(title==null || title.equals(""))
                {
                    title="";
                }
                if(skills==null || skills.equals(""))
                {
                    skills="";
                }
            
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
        <title>Edit Profile Details Page</title>
        
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css">
        
        <script>
            function genderchange()
            {
               document.getElementById('gendertf').value= document.getElementById('genderset').value;
            }
            function citychange()
            {
                document.getElementById('citytf').value= document.getElementById('cityset').value;
            }
        </script>
        
    </head>
    <body>
        <jsp:include page="profileheader.jsp"></jsp:include>
        <jsp:include page="manubar.jsp"/>
        
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 3px gray; border-radius: 3px;">
                    <div class="col-md-2">
                        <img src="images/profilepic.png" height="100"/>
                    </div>
                    <div class="col-md-10">
                        <h3> Edit Personal Details </h3>
                        
                        <form method="POST" action="editProfileAbout">
                            <b> <jsp:expression>name</jsp:expression></b>&nbsp;(<jsp:expression>session.getAttribute("session_email")</jsp:expression>)<br><br>
                            <input type="text" name="name1" value="<jsp:expression>name</jsp:expression>" class="textfield_design" placeholder="Enter Name"/><br><br>
                            <input id="gendertf" type="text" name="gender1" readonly="" value="<jsp:expression>gender</jsp:expression>" class="textfield_design" placeholder="Select gender"/>
                            <select id="genderset" onchange="genderchange()">
                                <option disabled="">Select Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                            </select>
                                <br><br>
                                <input id="citytf"  type="text" name="city1" readonly="" value="<jsp:expression>city</jsp:expression>" class="textfield_design" placeholder="Select city"/>
                            <select id="cityset" onchange="citychange()">
                                <option disabled="">Select City </option>
                                <option>gaya</option>
                                <option>patna </option>
                                <option>jahanabd </option>
                                <option>Kolkatta</option>
                            </select>
                            <br><br>
                            <input type="text" name="title1" value="<jsp:expression>title</jsp:expression>"class="textfield_design" placeholder="Profile Title"/><br><br>
                            <textarea  name="skills1" placeholder="Skills" style="width: 300px;"><jsp:expression>skills</jsp:expression></textarea><br><br>
                            <input  type="submit" value="Update" class="btn btn-danger"/>
                        </form>
                      
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
          
        <jsp:include page="footer.jsp"/>
    </body>
</html>
