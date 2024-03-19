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
                background: #fff;
            }
            .error {
                color: red;
                font-size: 10px;
                text-align: left;
            }
        </style>
    </head>

    <body>
        <div class="main">
            <div style="display: flex; background: #fff">
                <img style="width: 64%" src="https://static.vecteezy.com/system/resources/previews/029/888/142/original/megaphone-banner-quiz-time-illustration-vector.jpg" alt=""/>
                <form id="registrationForm" onsubmit="return validateForm()" class="form" method="POST" style="width: 447px; padding: 20px 10px;">                
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
                        <label for="fullname" class="form-label">Fullname: <span class="required">(*)</span></label>
                        <input type="text" id="fullname" name="fullname" placeholder="Enter your fullname" class="form-control">
                        <div id="fullnameError" class="error"></div>
                    </div>

                    <div class="form-group">
                        <label for="gmail" class="form-label">Gmail:<span class="required">(*)</span></label>
                        <input type="text" id="gmail" name="gmail" placeholder="Enter your Gmail address" class="form-control">
                        <div id="gmailError" class="error"></div>
                    </div>

                    <div class="form-group">
                        <label for="dob" class="form-label">Date of birth:<span class="required">(*)</span></label>
                        <input type="date" id="dob" name="dob" placeholder="Enter your Date of birth" class="form-control">
                        <div id="dobError" class="error"></div>
                    </div>
                    <div style="display: flex">
                        <div class="form-group">
                            <label for="password" class="form-label">Password:<span class="required">(*)</span></label>
                            <input type="password" id="password" name="password" placeholder="Enter your password" class="form-control">
                            <div id="passwordError" class="error"></div>
                        </div>

                        <div class="form-group" style="margin-left: 31px;">
                            <label for="confirmPassword" class="form-label">Confirm Password:<span class="required">(*)</span></label>
                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" class="form-control">
                            <div id="confirmPasswordError" class="error"></div>
                        </div>
                    </div>



                    <div class="policy">
                        <input type="checkbox" id="acceptTerms">
                        <h4>I accept all terms & condition</h4>
                    </div>
                    <button class="form-submit" type="submit">Register</button>
                    <div class="text">
                        <h3>Already have an account? <a href="<%=request.getContextPath()%>/login">Login now</a></h3>
                    </div>
                    <script>
                        function validateForm() {
                            var username = document.getElementById('username').value;
                            var fullname = document.getElementById('fullname').value;
                            var password = document.getElementById('password').value;
                            var confirmPassword = document.getElementById('confirmPassword').value;
                            var gmail = document.getElementById('gmail').value;
                            var dob = document.getElementById('dob').value;

                            var usernameError = document.getElementById('usernameError');
                            var fullnameError = document.getElementById('fullnameError');
                            var passwordError = document.getElementById('passwordError');
                            var confirmPasswordError = document.getElementById('confirmPasswordError');
                            var gmailError = document.getElementById('gmailError');
                            var dobError = document.getElementById('dobError');

                            // Reset previous errors
                            usernameError.innerHTML = "";
                            fullnameError.innerHTML = "";
                            passwordError.innerHTML = "";
                            confirmPasswordError.innerHTML = "";
                            gmailError.innerHTML = "";
                            dobError.innerHTML = "";

                            // Validate username
                            if (username.trim() === "") {
                                usernameError.innerHTML = "Username is required";
                                return false;
                            }

                            // Validate fullname
                            if (fullname.trim() === "") {
                                fullnameError.innerHTML = "Fullname is required";
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

                            // Validate Date of Birth
                            if (dob.trim() === "") {
                                dobError.innerHTML = "Date of Birth is required";
                                return false;
                            }

                            // Compare Date of Birth with today
                            var dobDate = new Date(dob);
                            var today = new Date();

                            if (dobDate >= today) {
                                dobError.innerHTML = "Date of Birth must be less than today";
                                return false;
                            }

                            return true;
                        }
                    </script>

            </div>
        </div>
    </body>
</html>