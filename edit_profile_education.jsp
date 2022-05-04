<%-- 
    Document   : profile
    Created on : 17 Apr, 2022, 8:05:32 AM
    Author     : user
--%>

<%@page import="driverpackage.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="CheckCookie"></jsp:include>
<jsp:declaration>
        String school="",degree="",year="",grade="",description="";
</jsp:declaration>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String gender = (String) session.getAttribute("session_gender");
    String field = (String) session.getAttribute("session_fields");
    String city = (String) session.getAttribute("session_city");
    String skills = (String) session.getAttribute("session_skills");
    String title = (String) session.getAttribute("session_title");

    if (title == null || title.equals("")) {
        title = "";
    }
    if (skills == null || skills.equals("")) {
        skills = "";
    }
    String id = request.getParameter("id");
    Connection con=null;
    try {
        
         con = DbConnection.getconnect();

        PreparedStatement ps = con.prepareStatement("Select*from education where id=?");
        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();

        while (rs.next())
         {
            school = rs.getString("school");
            degree = rs.getString("degree");
            year = rs.getString("year");
            grade = rs.getString("grade");
            description = rs.getString("description");
        }

    } 
    catch (Exception e)
     {
        out.println(e);
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

<jsp:scriptlet>    if (name == null || name.equals("")) {
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
           function submitFunction(val)
           {
               if(val==="update")
               {
                   document.editeducationform.action="editeducationdetails";
                   document.editeducationform.submit();
               }
               if(val==="delete")
               {
                    document.editeducationform.action="deleteducationdetails";
                   document.editeducationform.submit();
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
                        <h3>Edit Educational Details </h3>
                        <b> <jsp:expression>name</jsp:expression></b>&nbsp;(<jsp:expression>session.getAttribute("session_email")</jsp:expression>)<br><br>
                        <form method="POST" name="editeducationform">
                                    <input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1"/>
                                    School/College : <br><input type="text" name="school1" value="<jsp:expression>school</jsp:expression>" class="textfield_design"/><br><br>
                                    Degree : <br> <input type="text" name="degree1" value="<jsp:expression>degree</jsp:expression>" placeholder="Eg. 10th or B.tech" class="textfield_design"/><br><br>
                                    Year : <br><input type="text" name="year1" value="<jsp:expression>year</jsp:expression>" placeholder="Eg. 2020-2024" class="textfield_design"/><br><br>
                                    Grade : <br> <input type="text" name="grade1" value="<jsp:expression>grade</jsp:expression>" placeholder="Eg. 90" class="textfield_design" /> <br><br>
                                    Description  :<br><textarea  name="description1"  placeholder="Certifications,Activities and societies" style="width: 300px;"><jsp:expression>description</jsp:expression></textarea><br><br>
                                    <input  type="submit" value="Update Education" class="btn btn-danger" onclick="submitFunction('update')"/>
                                    <input  type="submit" value="Delete Education" class="btn btn-danger" onclick="submitFunction('delete')"/>
                            </form>

                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
