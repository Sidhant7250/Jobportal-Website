<%-- 
    Document   : error
    Created on : 22 Apr, 2022, 8:56:24 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:scriptlet>
    String message = (String)request.getAttribute("error_message");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
        <div class="alert alert-danger alert-dismissible fade show" style="text-align: center">
            <strong>  Error ! </strong><jsp:expression>message</jsp:expression>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </body>
</html>
