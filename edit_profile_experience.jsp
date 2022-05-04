<%-- 
    Document   : profile
    Created on : 17 Apr, 2022, 8:05:32 AM
    Author     : user
--%>

<%@page import="driverpackage.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="CheckCookie"></jsp:include>
<jsp:scriptlet>  
                String name=(String)session.getAttribute("session_name");
               String id2 = request.getParameter("id2");
                
                 String company2="",location2="",job_title2="",year2="",job_description2="";
                               
                               Connection con=null; 
                               try
                                {
                                       con = DbConnection.getconnect();

                                       PreparedStatement ps1= con.prepareStatement("Select*from experience where id=?");
                                       ps1.setString(1, id2);
                                       
                                   ResultSet rs1  =   ps1.executeQuery();
                                       
                                   while(rs1.next())
                                   {
                                     
                                       company2= rs1.getString("company");
                                       location2 = rs1.getString("location");
                                       job_title2 = rs1.getString("job_title");
                                       year2 = rs1.getString("year");
                                       job_description2 = rs1.getString("description");
                                     }
                                }
                                catch(Exception e)
                                        {
                                            e.printStackTrace();
                                        }
                               finally
                                    {
                                        try
                                        {
                                            con.close();
                                        }
                                        catch(Exception ee)
                                        {
                                            out.println(ee);
                                        }
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
        <title>Edit Profile Experience Details Page</title>
        
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css">
        
        <script>
            
            function submitFunction(v)
            {
                if(v==="update")
                {
                   document.experienceform.action="updatexperiencedetails"; 
                   document.experienceform.submit();
                }
                if(v==="delete")
                {
                    document.experienceform.action="deleteexperiencedetails"; 
                   document.experienceform.submit();
                }
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
                        <img src="images/smartprogramminglogo.png" height="100"/>
                    </div>
                    <div class="col-md-10">
                        <h3>Add Experience Details </h3>
                        <b> <jsp:expression>name</jsp:expression></b>(<jsp:expression>session.getAttribute("session_email")</jsp:expression>)<br><br>
                        <form method="POST" name="experienceform">
                                    <input type="hidden" name="id1" value="<jsp:expression>id2</jsp:expression>"/>
                                     Company : <br><input type="text" name="company1" value="<jsp:expression>company2</jsp:expression>" class="textfield_design"/><br><br>
                                     Location : <br> <input type="text" name="location1" placeholder="Eg. Delhi" value="<jsp:expression>location2</jsp:expression>" class="textfield_design"/><br><br>
                                     Year : <br><input type="text" name="year1" placeholder="Eg. 2020-2024" value="<jsp:expression>year2</jsp:expression>" class="textfield_design"/><br><br>
                                     Title : <br> <input type="text" name="jobtitle1" placeholder="Eg. Sr.java Developer" value="<jsp:expression>job_title2</jsp:expression>" class="textfield_design" /><br><br>
                                     Description  :<br><textarea  name="description1"  placeholder="Certifications,Activities and societies" style="width: 300px;"><jsp:expression>job_description2</jsp:expression></textarea><br><br>
                                    <input  type="submit" value="Update Experience" class="btn btn-danger" onclick="submitFunction('update')"/>
                                    <input  type="submit" value="Delete Experience" class="btn btn-danger" onclick="submitFunction('delete')"/>
                            </form>
                      
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
          
        <jsp:include page="footer.jsp"/>
    </body>
</html>
