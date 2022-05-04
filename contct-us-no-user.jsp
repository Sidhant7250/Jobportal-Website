<%-- 
    Document   : contct-us-no-user
    Created on : 28 Apr, 2022, 5:57:03 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact us no user Page</title>
    </head>
    <body>
        <div class="reg_div_design" style="background-color:#f8f4f4; margin-top: 10px;">
            <form method="POST" action="contactus">
                <h3 style="padding-top: 20px;">Contact Us </h3><br>
                <input type="text" name="name1"  placeholder="Enter Name" class="reglog_tf_design"/><br><br>
                <input type="text" placeholder="Enter Email"  name="email1" class="reglog_tf_design"/><br><br>
                <input type="text" placeholder="Enter Subject" class="reglog_tf_design" name="subject1"/>  <br><br>  
                <textarea class="reglog_tf_design" style="width: 400" placeholder="Enter Message" name="message1"></textarea><br><br>
                <input type="submit" value="Send" class="btn btn-primary"/><br><br><br>
            </form> 
        </div>
    </body>
</html>
