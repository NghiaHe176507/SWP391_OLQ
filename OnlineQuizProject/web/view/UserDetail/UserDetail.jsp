<%-- 
    Document   : UserDetail.jsp
    Created on : Jan 23, 2024, 10:34:20 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>UserDetail</title>
        <link rel="stylesheet" href="css/loginstyle.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"> 
    </head>
    <body>
        <div class="logo" style="margin-top: 5% ">    
            <a style="font-size: 55px;  text-decoration: none; color: black" href="home">Profile</a>
        </div>
        <p><strong>Display Name:</strong> <%= request.getAttribute("displayname") %></p>
        <p><strong>Email:</strong> <%= request.getAttribute("mail") %></p>
        <p><strong>Full Name:</strong> <%= request.getAttribute("fullname") %></p>
        <p><strong>Date of Birth:</strong> <%= request.getAttribute("dob") %></p>
    </body>
</html>
