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
    String email = (String) session.getAttribute("session_email");
    String jobid = request.getParameter("id");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job Description Page</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
                    <div class="col-md-2">
                        <ul> 
                            <li><a href=""> company1</a></li>
                            <li><a href=""> company2</a></li>
                            <li><a href=""> company3</a></li>
                            <li><a href=""> company4</a></li>
                            <li><a href=""> company5</a></li>
                            <li><a href=""> company6</a></li>
                        </ul>
                    </div>
                    <div class="col-md-8">

                        <div class="row" style="background-color: #f8f4f4">
                            <table class="table table-bordered table-hover">
                            <jsp:scriptlet>
                                String job_profile = "", company = "", experience = "", description = "", date1 = "", time1 = "",
                                        salary = "", no_of_openings = "", job_location = "", time_vanue = "", c_email = "", c_person_name = "", c_person_profile = "", c_phone_no = "";
                                try {
                                    Connection con = DbConnection.getconnect();
                                    PreparedStatement ps = con.prepareStatement("Select*from jobs where id=?");
                                    ps.setString(1, jobid);
                                    ResultSet rs = ps.executeQuery();
                                    if (rs.next()) {

                                        job_profile = rs.getString("job_profile");
                                        company = rs.getString("company");
                                        experience = rs.getString("experience");
                                        description = rs.getString("description");
                                        date1 = rs.getString("date1");
                                        time1 = rs.getString("time1");
                                        salary = rs.getString("salary");
                                        no_of_openings = rs.getString("no_of_openings");
                                        job_location = rs.getString("job_location");
                                        time_vanue = rs.getString("time_venue");
                                        c_email = rs.getString("c_email");
                                        c_person_name = rs.getString("c_person_name");
                                        c_person_profile = rs.getString("c_person_profile");
                                        c_phone_no = rs.getString("c_phone_no");
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            </jsp:scriptlet>
                            <tr>
                                <td><b><jsp:expression>job_profile</jsp:expression></b></td>
                                    <td> </td>
                                    <td><span style="color: #4b4b4b;font-size: 10px;float:right;">(<jsp:expression>date1</jsp:expression>&nbsp;&nbsp;<jsp:expression>time1</jsp:expression>)</span></td>
                                </tr>
                                <tr>
                                    <td> <span class="glyphicon glyphicon-home"></span></td>
                                    <td><span style="color: #727171;">Company :-</span></td>
                                        <td><jsp:expression>company</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-briefcase"></span></td>
                                    <td><span style="color: #727171;">Experience :-</span></td>
                                    <td><jsp:expression>experience</jsp:expression> </td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-list-alt"></span></td>
                                    <td><span style="color: #727171;">Job Description :-</span></td>
                                    <td><jsp:expression>description</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-usd"></span></td>
                                    <td><span style="color: #727171;">Salary :-</span></td>
                                    <td><jsp:expression>salary</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-th"></span></td>
                                    <td><span style="color: #727171;">No of Job:-</span></td>
                                    <td><jsp:expression>no_of_openings</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-map-marker"></span></td>
                                    <td><span style="color: #727171;"> Job Location :-</span></td>
                                    <td><jsp:expression>job_location</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-send"></span></td>
                                    <td><span style="color: #727171;">Time /Vanue:-</span></td>
                                    <td><jsp:expression>time_vanue</jsp:expression></td>
                                </tr>

                                <tr>
                                    <td>Company Details</td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-file"></span></td>
                                    <td><span style="color: #727171;">Company Name </span></td>
                                    <td><jsp:expression>company</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-user"></span></td>
                                    <td><span style="color: #727171;">Person name </span></td>
                                    <td><jsp:expression>c_person_name</jsp:expression>(<jsp:expression>c_person_profile</jsp:expression>)</td>
                                </tr>

                                <tr>
                                    <td><span class="glyphicon glyphicon-phone-alt"></span></td>
                                    <td><span style="color: #727171;"> Phone Number </span></td>
                                        <td><jsp:expression>c_phone_no</jsp:expression></td>
                                </tr>
                            <jsp:scriptlet>
                                     if (email == null ? email == null : email.trim().equals("null")) {
                            </jsp:scriptlet>

                            <tr>
                                <td></td>
                                <td></td>
                                <td> <a href="login.jsp" class="btn btn-primary">Login To Apply</a></td>
                            </tr>
                            <jsp:scriptlet>
                                    }
                                     else 
                                                {
                                        Connection con1 = null;
                                        try {
                                            con1 = DbConnection.getconnect();
                                            PreparedStatement ps1 = con1.prepareStatement("select*from applied_jobs where email=? and jobid=?");
                                            ps1.setString(1, email);
                                            ps1.setString(2, jobid);
                                            ResultSet rs1 = ps1.executeQuery();
                                            if (rs1.next()) {
                            </jsp:scriptlet>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <span style="color: red;font-size: 12px;padding: 3px;">Already applied for this job</span><br><br>
                                    <form method="POST" action="DeleteMyJobAppilication">
                                        <input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jobid"/>
                                        <input type="submit" value="Delete this application" class="btn btn-danger"/>
                                    </form>
                                </td>
                            </tr>
                            <jsp:scriptlet>
                                    } else {
                            </jsp:scriptlet>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <form action="applyforjob" method="POST">
                                        <input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jobid"/>
                                            <input type="submit" value="Applay" class="btn btn-primary"/>
                                        </form>
                                    </td>
                                </tr>
                            <jsp:scriptlet>
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            </jsp:scriptlet>

                            <jsp:scriptlet>
                                        }
                            </jsp:scriptlet>


                    </div>


                    </table>

                </div>  
            </div>

            <div class="col-md-2">
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
