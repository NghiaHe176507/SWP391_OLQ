<%-- 
    Document   : register
    Created on : 13 Jan 2024, 6:23:49 pm
    Author     : tuann
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration</title>
        <link href="css/registerstyle.css" rel="stylesheet" type="text/css"/>
        <script src="js/validation.js" type="text/javascript"></script>
        <style>
            .main {
                background: linear-gradient(135deg, #71b7e6, #9b59b6);
            }
            .error {
                color: red;
                font-size: 11px;
                text-align: left;
            }
        </style>
    </head>

    <body>
        <div class="main">
            <div style="display: flex; background: #fff">
                <img src="https://th.bing.com/th/id/OIP.fUJ9ZRjz4iMrpHlltVv_XgHaJl?rs=1&pid=ImgDetMain" alt=""/>
                <form id="registrationForm" onsubmit="return validateForm()" class="form" method="POST">                
                    <div>
                        <h1 class="heading">Registration</h1>
                    </div>
                    <div class="spacer"></div>
                    <c:if test="${not empty errorMessage}">
                        <div style="color: red; padding: 10px 10px; text-align: left; font-size: 13px">${errorMessage}</div>
                    </c:if>
                    <div class="form-group">
                        <label for="username" class="form-label">Username:<span class="required">(*)</span></label>
                        <input type="text" id="username" name="username" placeholder="Enter your username" class="form-control">
                        <div id="usernameError" class="error"></div>
                    </div>

                    <div class="form-group">
                        <label for="gmail" class="form-label">Gmail:<span class="required">(*)</span></label>
                        <input type="text" id="gmail" name="gmail" placeholder="Enter your Gmail address" class="form-control">
                        <div id="gmailError" class="error"></div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="form-label">Password:<span class="required">(*)</span></label>
                        <input type="password" id="password" name="password" placeholder="Enter your password" class="form-control">
                        <div id="passwordError" class="error"></div>
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword" class="form-label">Confirm Password:<span class="required">(*)</span></label>
                        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" class="form-control">
                        <div id="confirmPasswordError" class="error"></div>
                    </div>

                    <div class="policy">
                        <input type="checkbox" id="acceptTerms">
                        <h4>I accept all terms & condition</h4>
                    </div>
                    <button class="form-submit" type="submit">Register</button>
                    <div class="text">
                        <h3>Already have an account? <a href="#">Login now</a></h3>
                    </div>
                    <script>
                        function validateForm() {
                            var username = document.getElementById('username').value;
                            var password = document.getElementById('password').value;
                            var confirmPassword = document.getElementById('confirmPassword').value; // Fix here
                            var gmail = document.getElementById('gmail').value;

                            var usernameError = document.getElementById('usernameError');
                            var passwordError = document.getElementById('passwordError');
                            var confirmPasswordError = document.getElementById('confirmPasswordError'); // Fix here
                            var gmailError = document.getElementById('gmailError');

                            // Reset previous errors
                            usernameError.innerHTML = "";
                            passwordError.innerHTML = "";
                            confirmPasswordError.innerHTML = ""; // Fix here
                            gmailError.innerHTML = "";

                            // Validate username
                            if (username.trim() === "") {
                                usernameError.innerHTML = "Username is required";
                                return false;
                            }

                            // Validate password
                            if (password.trim() === "") {
                                passwordError.innerHTML = "Password is required";
                                return false;
                            }

                            // Validate confirm password
                            if (confirmPassword.trim() === "") {
                                confirmPasswordError.innerHTML = "Please confirm your password";
                                return false;
                            }

                            if (password !== confirmPassword) {
                                confirmPasswordError.innerHTML = "Passwords do not match";
                                return false;
                            }

                            // Validate Gmail
                            var gmailRegex = /^[a-zA-Z0-9._-]+@gmail\.com$/;
                            if (!gmail.match(gmailRegex)) {
                                gmailError.innerHTML = "Please enter a valid Gmail address";
                                return false;
                            }

                            return true;
                        }
                    </script>
            </div>
        </div>
    </body>

</html>
