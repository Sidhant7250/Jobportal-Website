<%-- 
    Document   : logdiv
    Created on : 21 Apr, 2022, 1:09:44 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login div Page</title>
        
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
        <div class="row">
                    <div class="col-md-3"> </div>
                    <div class="col-md-6">
                        <div class="reg_div_design">
                            <form method="POST" action="login">
                                <h4> Login Here </h4>
                               <input type="text" placeholder="Enter Email"  name="email1" class="reglog_tf_design"/><br><br>
                                <input type="password" placeholder="Enter Password" name="pass1" class="reglog_tf_design"/><br><br>
                                <input type="checkbox" name="rememberme1" value="rememberme"/>Remember Me <br><br>
                            <input type="submit" value="Login" class="btn btn-primary"/><br><br>
                            </form> 
                        </div>
                    </div> 
                   <div class="col-md-3"> </div>
            </div>
    </body>
</html>
