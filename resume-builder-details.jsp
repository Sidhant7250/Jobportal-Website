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

</jsp:declaration>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
</jsp:scriptlet>

<jsp:scriptlet>

    if (name == null || name.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resume Builder Details Page</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">



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
                        <h3>Resume Builder Details </h3>

                        <form method="POST" action="resumebuilderform">
                            <input type="text" value="<jsp:expression>name</jsp:expression>" name="name1" class="textfield_design" readonly=""/><a href="editprofileabout.jsp" style="font-size: 12px;"><span class="glyphicon glyphicon-pencil"></a></span><br><br>
                            <input type="text" value="<jsp:expression>email</jsp:expression>" name="email1" class="textfield_design" readonly=""/><br><br>
                                    <textarea placeholder="Address" class="textarea_design" name="address1"></textarea><br><br>       
                                <textarea placeholder="Career Objective" class="textarea_design" name="career1"></textarea><br><br> 

                                <b> Education Details:-</b><br>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>School/College</th>
                                        <th>Year</th>
                                        <th>Degree</th>
                                        <th>Marks</th>
                                        <th></th>
                                    </tr>

                                <jsp:scriptlet>
                                    String school = "", degree = "", year = "", grade = "", id = "";
                                    Connection con = null;
                                    try {

                                        con = DbConnection.getconnect();

                                        PreparedStatement ps = con.prepareStatement("Select*from education where email=?");
                                        ps.setString(1, email);

                                        ResultSet rs = ps.executeQuery();

                                        while (rs.next()) {
                                            id = rs.getString("id");
                                            school = rs.getString("school");
                                            degree = rs.getString("degree");
                                            year = rs.getString("year");
                                            grade = rs.getString("grade");
                                </jsp:scriptlet>

                                <tr>
                                    <td><jsp:expression>school</jsp:expression></td>
                                    <td><jsp:expression>year</jsp:expression></td>
                                    <td><jsp:expression>degree</jsp:expression></td>
                                    <td><jsp:expression>grade</jsp:expression></td>
                                    <td><a href="edit_profile_education.jsp?id=<jsp:expression>id</jsp:expression>" style="font-size: 12px;"><span class="glyphicon glyphicon-pencil"></span></a></td>
                                    </tr>

                                <jsp:scriptlet>

                                        }

                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                </jsp:scriptlet>
                            </table><br><br>
                            <b> Experience Details:-</b><br>
                            <table class="table table-bordered table-hover">
                                <tr>
                                    <th>Company</th>
                                    <th>Location</th>
                                    <th>Year</th>
                                    <th>Job Title</th>
                                    <th></th>
                                </tr>
                                <jsp:scriptlet>
                                    String company = "", location = "", yearr = "", job_title = "", exid = "";
                                    Connection con1 = null;
                                    try {

                                        con1 = DbConnection.getconnect();

                                        PreparedStatement ps1 = con1.prepareStatement("Select*from experience where email=?");
                                        ps1.setString(1, email);

                                        ResultSet rs1 = ps1.executeQuery();

                                        while (rs1.next()) {
                                            exid = rs1.getString("id");
                                            company = rs1.getString("company");
                                            location = rs1.getString("location");
                                            yearr = rs1.getString("year");
                                            job_title = rs1.getString("job_title");
                                </jsp:scriptlet>

                                <tr>
                                    <td><jsp:expression>company</jsp:expression></td>
                                    <td><jsp:expression>location</jsp:expression></td>
                                    <td><jsp:expression>yearr</jsp:expression></td>
                                    <td><jsp:expression>job_title</jsp:expression></td>
                                    <td><a href="edit_profile_experience.jsp?id2=<jsp:expression>exid</jsp:expression>" style="font-size: 12px;"><span class="glyphicon glyphicon-pencil"></span></a></td>
                                    </tr>

                                <jsp:scriptlet>

                                        }

                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                </jsp:scriptlet></table><br><br>
                            <textarea placeholder="Hobbies" class="textarea_design" name="hobbeis1"></textarea><br><br>
                            <b>Personal Details:-</b><br>
                            <input type="date" name="dob1" placeholder="Date of birth" class="textfield_design"/><br><br>
                            <input type="text" name="gendermaritial1" placeholder="Gender/Marital Status" class="textfield_design"/><br><br>
                            <input type="text" name="language1" placeholder="Language Profiency" class="textfield_design"/><br><br>
                            <input type="submit" value="Build my Resume" class="btn btn-success"/>        

                        </form>

                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
