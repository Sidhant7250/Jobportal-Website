<%-- 
    Document   : profile
    Created on : 17 Apr, 2022, 8:05:32 AM
    Author     : user
--%>
<jsp:include page="CheckCookie"></jsp:include>

<%@page import="backend.PathDetails"%>
<%@page import="java.io.File"%>
<%@page import="driverpackage.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email = (String) session.getAttribute("session_email");
    String gender = (String) session.getAttribute("session_gender");
    String fields = (String) session.getAttribute("session_fields");
    String pic = (String) session.getAttribute("session_pic");

    if (fields == null || fields.equals("")) {
        fields = "----Not Available----------";
    }
    String city = (String) session.getAttribute("session_city");

    String skills = (String) session.getAttribute("session_skills");

    String title = (String) session.getAttribute("session_title");
</jsp:scriptlet>

<jsp:scriptlet>
    if (name == null || name.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome : <jsp:expression>name</jsp:expression></title>
<!--------------------
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

           =------------------------------------------------------------------------------------------------------------------>
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
                    <div class="col-md-4">
                        <a href="edit-profile-pic.jsp" style="font-size: 12px; float: right;"><span class="glyphicon glyphicon-pencil"></span></a>
                        <img src="profilepictures/<jsp:expression>pic</jsp:expression>" height="200" width=150" style="border-radius: 80px;"/>
                        </div>
                        <div class="col-md-8">
                            <h3 style="color: blue"> <jsp:expression> name.toUpperCase()</jsp:expression> <a href="editprofileabout.jsp" style="font-size: 12px; float: right;"><span class="glyphicon glyphicon-pencil"></span></a> </h3>
                        <jsp:expression>title</jsp:expression><br><br>
                        <span class="profile_details_title">Skills : </span> <jsp:expression>skills</jsp:expression><br><br>
                        <span class="profile_details_title">Gender : </span><jsp:expression>gender</jsp:expression><br>
                        <span class="profile_details_title"> City : </span><jsp:expression>city</jsp:expression><br>
                        <span class="profile_details_title">Fields :</span><jsp:expression>fields</jsp:expression><br>
                        </div>
                    </div><br><br>

                    <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 3px gray; border-radius: 3px;">
                        <div class="col-md-12">
                            <h3>Education Details<a href="add_frofile_education.jsp" style="font-size: 12px; float: right;"><span class="glyphicon glyphicon-plus"></span></a></h3>
                                <jsp:scriptlet>

                                    String school = "", degree = "", grade = "", year = "", id = "";
                                    String email1 = (String) session.getAttribute("session_email");
                                    Connection con = null;
                                    try {

                                        con = DbConnection.getconnect();
                                        PreparedStatement ps = con.prepareStatement("Select*from education where email=?");
                                        ps.setString(1, email1);

                                        ResultSet rs = ps.executeQuery();

                                        while (rs.next()) {
                                            id = rs.getString("id");
                                            school = rs.getString("school");
                                            degree = rs.getString("degree");
                                            grade = rs.getString("grade");
                                            year = rs.getString("year");
                                </jsp:scriptlet>


                        <div class="row" style="background-color: #c3bdbd">
                            <div class="col-md-4"><img src="images/school.png" height="70" ></div>
                            <div class="col-md-8">
                                <a href="edit_profile_education.jsp?id=<jsp:expression>id</jsp:expression>" style="font-size: 12px; float: right;"><span class="glyphicon glyphicon-pencil"></span></a>
                                <b> <span class="glyphicon glyphicon-home"></span>&nbsp;<jsp:expression>school</jsp:expression></b><br><br>
                                <span class="glyphicon glyphicon-book"></span>&nbsp; <jsp:expression>degree</jsp:expression>&nbsp;&nbsp;<span style="color: #484646">(<jsp:expression>year</jsp:expression>)</span><br><br>
                                <span class="glyphicon glyphicon-file"></span> &nbsp; <jsp:expression>grade</jsp:expression>&nbsp;%<br><br>
                                </div>
                            </div><br>

                        <jsp:scriptlet>

                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        try {
                                            con.close();
                                        } catch (Exception ee) {
                                            out.println(ee);
                                        }
                                    }
                        </jsp:scriptlet>

                    </div>
                </div><br><br>
                <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 3px gray; border-radius: 3px;">
                    <div class="col-md-12">
                        <h3>Experience Details<a href="add_profile_experience.jsp" style="font-size: 12px; float: right;"><span class="glyphicon glyphicon-plus"></span></a></h3>
                                <jsp:scriptlet>

                                    String company2 = "", location2 = "", job_title2 = "", year2 = "", id2 = "", jon_description2 = "";
                                    Connection con1 = null;

                                    try {

                                        con1 = DbConnection.getconnect();

                                        PreparedStatement ps1 = con1.prepareStatement("Select*from experience where email=?");
                                        ps1.setString(1, email);

                                        ResultSet rs1 = ps1.executeQuery();

                                        while (rs1.next()) {
                                            id2 = rs1.getString("id");
                                            company2 = rs1.getString("company");
                                            location2 = rs1.getString("location");
                                            job_title2 = rs1.getString("job_title");
                                            year2 = rs1.getString("year");
                                </jsp:scriptlet>


                        <div class="row" style="background-color: #c3bdbd">
                            <div class="col-md-4"><img src="images/school.png" height="70" ></div>
                            <div class="col-md-8">
                                <a href="edit_profile_experience.jsp?id2=<jsp:expression>id2</jsp:expression>" style="font-size: 12px; float: right;"><span class="glyphicon glyphicon-pencil"></span></a>
                                <b> <span class="glyphicon glyphicon-home"></span>&nbsp;<jsp:expression>company2</jsp:expression></b><br><br>
                                <span class="glyphicon glyphicon-book"></span>&nbsp; <jsp:expression>location2</jsp:expression>&nbsp;&nbsp;<span style="color: #484646">(<jsp:expression>year2</jsp:expression>)</span><br><br>
                                <span class="glyphicon glyphicon-file"></span> &nbsp; <jsp:expression>job_title2</jsp:expression>&nbsp;<br><br>
                                </div>
                            </div><br>

                        <jsp:scriptlet>

                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        try {
                                            con1.close();
                                        } catch (Exception ee) {
                                            out.println(ee);
                                        }
                                    }
                        </jsp:scriptlet>

                    </div>
                </div><br><br>

                <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 3px gray; border-radius: 3px;">
                    <div class="col-md-12">
                        <h3>Resume Details</h3>
                        <div class="row" style="background-color: #dedada">
                            <div class="col-md-12">
                               <a href="upload-resume.jsp"> <span class="glyphicon glyphicon-plus"></span> Upload Resume</a>
                            <jsp:scriptlet>
                            
                                    String file_name=null;
                                try
                                {
                                    Connection con2 = DbConnection.getconnect();
                                    
                                    PreparedStatement ps = con2.prepareStatement("select*from resume where email=?");
                                    ps.setString(1, email);
                                    
                                  ResultSet rs =   ps.executeQuery();
                                  if(rs.next())
                                  {
                                      file_name = rs.getString("file_name");
                                      </jsp:scriptlet>
                               &nbsp;&nbsp;<a href="downloadresume?fn=<jsp:expression>file_name</jsp:expression>" class="btn btn-success"/> Download Resume</a>
                            <jsp:scriptlet>
                                  }
                                }
                                catch(Exception e)
                                {
                                    e.printStackTrace();
                                }
                            
                            </jsp:scriptlet>
                            </div>
                        </div><br><br>
                        <div class="row" style="background-color: #dedada">
                            <div class="col-md-12">
                                <a href="resume-builder-details.jsp"><span class="glyphicon glyphicon-pencil"></span>Resume Builder</a>
                            <jsp:scriptlet>
                            
                                File ff=new File(PathDetails.RESUME_BUILDER_PATH+email+".pdf");
                                if(ff.exists())
                                {
                            </jsp:scriptlet>
                                &nbsp;&nbsp;<a href="downloadresumebuilder?fn=<jsp:expression>email+".pdf"</jsp:expression>" class="btn btn-success"/> Download Resume</a>
                                <jsp:scriptlet>
                                }
                                </jsp:scriptlet>
                        </div>
                        </div>
                    </div>   

                </div><br><br>


                <div class="row" style="background-color: #6a6767">
                    <div class="col-md-4"></div>
                    <div class="coi-md-6" style="margin-left: 180px;"> <input type="submit" value="Follow"/></div>
                    <div class="col-md-2"></div>
                </div>

            </div>
            <div class="col-md-2"></div>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
