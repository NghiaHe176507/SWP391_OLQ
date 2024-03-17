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
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <style>
            .divider:after,
            .divider:before {
                content: "";
                flex: 1;
                height: 1px;
                background: #eee;
            }
        </style>
    </head>
    <body>
        <!--    <div class="logo" style="margin-top: 5% ">    
                <a style="font-size: 55px; font-family: 'Poppins', cursive; text-decoration: none; color: black" href="${pageContext.request.contextPath}">Home</a>
            </div>
            <div class="container">
                <form >
                    <div class="row">
                        <h2 style="text-align:center; font-family: Poppins ">Welcome to Quiz Online, please login to continue</h2>
                        <div class="col">

        <input type="text" name="mail" placeholder="yourname@gmail.com" required style="background-color: white" >
        <input type="password" name="password" placeholder="Password" required style="background-color: white" >
        <input type="submit" value="Login">
    </div>
    
    </div>
    </form>
    </div>
    <a href="" style="text-decoration: none">Forgot password</a>
    <div class="bottom-container">
    <div class="row">
    <div class="col">
    <a href=""  style="background-color: #ffffff; color: #000; text-decoration: none">
        Sign Up
    </a>
    </div>
    </div>
    </div>-->
        <section class="vh-100">
            <div class="container py-5 h-100">
                <div class="row align-items-center justify-content-center h-100">
                    <div class="col-md-8 col-lg-7 col-xl-6">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
                             class="img-fluid" alt="Phone image">
                    </div>
                    <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                        <form action="login" method="post">
                            <!-- Email input -->
                            <div class="form-floating mb-4">
                                <input type="email" id="form1Example13" name="mail" class="form-control form-control-lg" pattern="/^[a-zA-Z0-9._-]+@gmail\.com$/" />
                                <label class="form-label" for="form1Example13">Email address</label>
                            </div>

                            <!-- Password input -->
                            <div class="form-floating mb-4">
                                <input type="password" id="form1Example23" name="password" class="form-control form-control-lg" />
                                <label class="form-label" for="form1Example23">Password</label>
                            </div>

                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <!-- Checkbox -->
                                <div class="form-check">

                                </div>
                                <a href="${pageContext.request.contextPath}/forgotpassword" class="text-decoration-none">Forgot password?</a>
                            </div>

                            <button type="submit" class="btn btn-primary btn-lg d-block w-100">Sign in</button>

                            <c:if test="${checkAuthentication eq 'F'}">
                                <div style="color: red; text-align: center">Sai thông tin đăng nhập</div>
                            </c:if>

                            <div class="divider d-flex align-items-center my-4">
                                <p class="text-center fw-bold mx-3 mb-0 text-muted">DON'T HAVE ACCOUNT</p>
                            </div>

                            <a class="btn btn-primary btn-lg d-block w-100" style="background-color: #3b5998" href="${pageContext.request.contextPath}/register">
                                <i class="fa fa-registered me-2" aria-hidden="true"></i> Register Account Now

                            </a>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <!-- Bootstrap Bundle with Popper -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css" rel="stylesheet">
    </body>
</html>