<%-- 
    Document   : register
    Created on : 21 Apr, 2022, 9:43:10 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="CheckCookie"></jsp:include>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        
        <script>
            function val(v)
            {
                document.getElementById(v).innerHTML="";
            }
            function validation()
            {
                var flag=true;
                
                var name2=document.regform.name1.value;
                var email2=document.regform.email1.value;
                var pass2=document.regform.pass1.value;
                var gender2= document.regform.gender1.value;
               // var fields2=document.regform.field1.value;
                var city2 = document.regform.city1.value;
                
                var name_pattern=/^[a-zA-Z ]{3,30}$/;
                var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                var pass_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
                
                
//                alert(name2);
//                alert(email2);
//                alert(pass2);
//                alert(gender2);
// 
//                alert(fields2);
//                alert(city2);
               
        /*
         *  if you dont want to rember the regex pattern them simply use below code 
                if(pass2.leggth<6 && pass2.leggth>16)
                {
                    
                }
                if(pass2.search(/^[a-zA-Z]/)<0)
                {
                    
                }
                if(pass2.search(/[0-9]/)<0)
                {
                    
                }
                if(pass2.search(/[@_]/)<0)
                {
                    
                }
               */
               
                    if(!name2.match(name_pattern))
                    {
                        document.getElementById("name_error").innerHTML="Name is not properly formated";
                        flag = false;
                    }
               
                   if(name2==="")
                   {
                       document.getElementById("name_error").innerHTML="Name cannot empty";
                       flag=false;
                   }
                   if(!email2.match(email_pattern))
                    {
                        document.getElementById("email_error").innerHTML="Email is not properly formated";
                        flag = false;
                    }
                  if(email2==="")
                   {
                       //alert("email cannot empty");
                       document.getElementById("email_error").innerHTML="email cannot empty";
                        flag=false;
                   }
                   if(!pass2.match(pass_pattern))
                    {
                        document.getElementById("pass_error").innerHTML="Password should coint integer(0-9) and special character(a-z)";
                        flag = false;
                    }
                  if(pass2==="")
                   {
                       //alert("Password cannot empty");\
                       document.getElementById("pass_error").innerHTML="Password cannot empty";
                        flag=false;
                   }
                   if(gender2==="")
                   {
                       //alert("Please select gender ");
                       document.getElementById("gender_error").innerHTML="Please select gender ";
                        flag=false;
                   }
//                  else  if(fields2==="")
//                   {
//                       alert("please select atlest one field");
//                        return false;
//                   }
                   if(city2==="Select city")
                   {
                       //alert("please select city");
                       document.getElementById("city_error").innerHTML="please select city";
                        flag=false;
                   }
                   return flag;
                   
         /*
                   if(name2==="")
                   {
                       alert("Name cannot empty");
                       return false;
                   }
                  else if(email2==="")``
                   {
                       alert("email cannot empty");
                       return false;
                   }
                   else if(pass2==="")
                   {
                       alert("Password cannot empty");
                        return false;
                   }
                   else if(gender2==="")
                   {
                       alert("Please select gender ");
                        return false;
                   }
                  else  if(fields2==="")
                  {
                       alert("please select atlest one field");
                        return false;
                   }
                  else if(city2==="Select city")
                   {
                       alert("please select city");
                        return false;
                   }
                   else
                   {
                       document.regform.action="reg";
                       document.regform.submit();
                   }
               */
            
             }
        </script>

    </head>
    <body>
        <div class="container-fluid">
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="manubar.jsp"></jsp:include>

                <div class="row">
                    <div class="col-md-3">

                    </div>
                    <div class="col-md-6">
                        <div class="reg_div_design">
                            <form method="POST" name="regform"  onsubmit="return validation()" action="reg" >
                                <h4> Register Here </h4>
                                <input type="text" placeholder="Enter name" name="name1" class="reglog_tf_design" onkeyup="val('name_error')"/><br><span id="name_error" style="color: red;"></span><br><br>
                                <input type="text" placeholder="Enter Email"  name="email1" class="reglog_tf_design" onkeyup="val('email_error')"/><br><span id="email_error" style="color: red;"></span><br><br>
                                <input type="password" placeholder="Enter Password" name="pass1" class="reglog_tf_design" onkeyup="val('pass_error')"/><br><span id="pass_error" style="color: red;"></span><br><br>
                                <b>Select Gender : </b><input type="radio" name="gender1" value="male"/>Male<input type="radio" name="gender1" value="Female"/>Female<br><span id="gender_error" style="color: red;"></span><br><br>
                            <b> Select Fields : </b><input type="checkbox" name="field1" value="Information Technology"/>Information Technology
                            <input type="checkbox" name="field1" value="Marketing"/>Marketing
                            <input type="checkbox" name="field1" value="Finance"/>Finance<br><br>
                            <select class="reglog_tf_design" name="city1">
                                <option value="Select city">Select City </option>
                                <option value="Gaya">gaya</option>
                                <option value="Patna">patna </option>
                                <option value="Jahanabad">jahanabd </option>
                                <option value="Kolkatta">Kolkatta</option>
                            </select><br><span id="city_error" style="color: red;"></span><br><br>
                            <input type="submit" value="Register"class="btn btn-primary"/><br><br>
                            </form> 
                        </div>

                    </div>
                    <div class="col-md-3"></div>
                </div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
