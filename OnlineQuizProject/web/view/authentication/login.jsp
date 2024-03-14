<%-- 
    Document   : login
    Created on : Jan 15, 2024, 10:29:23 AM
    Author     : Đạt Phạm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Login Page</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel="stylesheet" href="css/loginstyle.css">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    </head>


        <div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
            <div class="card card0 border-0">
                <div class="row d-flex">
                    <div class="col-lg-6">
                        <div class="card1 pb-5">
                            <div class="row">
                                <img src="https://gshelper.com/wp-content/uploads/2017/09/Quiz-Logo.png" class="logo">
                            </div>
                            <div class="row px-3 justify-content-center mt-4 mb-5 border-line">
                                <img src="https://th.bing.com/th/id/R.e2aee148d486feaaa3bfc73bca306113?rik=7UieUAaJReADxA&pid=ImgRaw&r=0"
                                     class="image">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card2 card border-0 px-4 py-5">
                            <div class="row mb-4 px-3">
                                <h6 class="mb-0 mr-4 mt-2">Welcome to Quiz Online, please login to continue</h6>
                            </div>
                            <form action="login" method="post">
                                <div class="row px-3">
                                    <label class="mb-1">
                                        <h6 class="mb-0 text-sm">Email Address</h6>
                                    </label>
                                    <input class="mb-4" type="text" name="mail" placeholder="Enter a valid email address"
                                           pattern="/^[a-zA-Z0-9._-]+@gmail\.com$/">
                                </div>
                                <div class="row px-3">
                                    <label class="mb-1">
                                        <h6 class="mb-0 text-sm">Password</h6>
                                    </label>
                                    <input type="password" name="password" placeholder="Enter password">
                                </div>
                                <div class="row px-3 mb-4">
                                    <div class="custom-control custom-checkbox custom-control-inline">
                                        <input id="chk1" type="checkbox" name="chk" class="custom-control-input">
                                        <label for="chk1" class="custom-control-label text-sm">Remember me</label>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/forgotpassword"
                                       class="ml-auto mb-0 text-sm" style="color: #007BFF">Forgot Password?</a>
                                </div>
                                <div>
                                    <c:if test="${checkAuthentication eq 'F'}">
                                        <div style="color: red">Sai thông tin đăng nhập</div>
                                    </c:if>
                                </div>

                                <div class="row mb-3 px-3" >
                                    <button type="submit" class="btn btn-primary ">Login</button>
                                </div>
                            </form>
                            <div class="row mb-4 px-3">
                                <small class="font-weight-bold">Don't have an account? <a
                                        href="${pageContext.request.contextPath}/register"
                                        class="text-danger ">Register</a></small>
                            </div>
                        </div>
                    </div>
                </div>
                                        <div class="bg-blue py-4" style="background-color: #007BFF" >
                    <div class="row px-3">
                        <small class="ml-4 ml-sm-5 mb-2">Create by Group 1 SE1760</small>
                    </div>
                </div>
            </div>
        </div>

</html>
