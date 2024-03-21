<%-- 
    Document   : changePassword
    Created on : 19 Mar 2024, 12:56:13 am
    Author     : hatua
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Password Recovery</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.3/components/password-resets/password-reset-3/assets/css/password-reset-3.css">
    </head>
    <body>
        <section class="p-3 p-md-4 p-xl-5" style="margin-top: 63px">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 bsb-tpl-bg-platinum">
                        <div class="d-flex flex-column justify-content-between h-100 p-3 p-md-4 p-xl-5">
                            <h3 class="m-0">Welcome Back To QuizWiz !</h3>
                            <img class="img-fluid rounded mx-auto my-4" loading="lazy" src="https://smiletutor.sg/wp-content/uploads/2020/10/password.png" width="245" height="80" alt="BootstrapBrain Logo">
                            <p class="mb-0">Not a member yet? <a href="<%= request.getContextPath() %>/register" class="link-secondary text-decoration-none">Register now</a></p>
                        </div>
                    </div>
                    <div class="col-md-8 col-lg-6 bsb-tpl-bg-lotion">
                        <div class="p-3 p-md-4 p-xl-5">
                            <div class="row">
                                <div class="col-12">
                                    <div class="mb-5">
                                        <h2 class="h3">Password Reset</h2>
                                        <h3 class="fs-6 fw-normal text-secondary m-0">Provide the email address associated with your account to recover your password.</h3>
                                    </div>
                                </div>
                            </div>
                            <form action="forgotpassword" method="POST">
                                <p style="color: red; font-size: 18px">${requestScope.mess}</p>
                                <div class="row gy-3 gy-md-4 overflow-hidden">
                                    <div class="col-12">
                                        <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                                        <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com" required>
                                    </div>
                                    <div class="col-12">
                                        <div class="d-grid">
                                            <button class="btn bsb-btn-xl btn-primary" type="submit">Reset Password</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div class="row">
                                <div class="col-12">
                                    <hr class="mt-5 mb-4 border-secondary-subtle">
                                    <div class="text-end">
                                        <a href="<%= request.getContextPath() %>/login" class="link-secondary text-decoration-none">Login</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>