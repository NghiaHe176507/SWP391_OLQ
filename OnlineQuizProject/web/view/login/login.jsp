<%-- 
    Document   : login
    Created on : Jan 15, 2024, 10:29:23 AM
    Author     : Đạt Phạm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="css/loginstyle.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">    </head>
    <body>
        <div class="logo" style="margin-top: 5% ">    
            <a style="font-size: 55px; font-family: 'Poppins', cursive; text-decoration: none; color: black" href="home">Home</a>
        </div>
        <div class="container">
            <form action="login" method="post">
                <div class="row">
                    <h2 style="text-align:center; font-family: Poppins ">Welcome to Quiz Online, please login to continue</h2>
                    <div class="col">
                        <c:if test="${checkAuthentication eq 'F'}">
                            <div style="color: red">Sai thông tin đăng nhập</div>
                        </c:if>
                        <input type="text" name="mail" placeholder="Email" required style="background-color: white">
                        <input type="password" name="password" placeholder="Password" required style="background-color: white" >
                        <input type="submit" value="Login">
                    </div>
                </div>
            </form>
        </div>
        <div class="bottom-container">
            <div class="row">
                <div class="col">
                    <form method="get" action="fogotPassword">
                        <input type="submit" value="Forgot password?" style="background-color: #ffffff; color: #000"  />
                        <!--<a href="fogotPassword.jsp" style="color:rgb(0, 0, 0)" class="btn">Forgot password?</a>-->
                    </form>

                </div>
            </div>
        </div>
        <div class="bottom-container">
            <div class="row">
                <div class="col">
                    <form action="signup" method="post"  >
                        <input type="submit" value="Sign Up" style="background-color: #ffffff; color: #000">
                    </form>

                </div>
            </div>
        </div>

        <!-- Button to open the modal -->




    </body>
</html>
