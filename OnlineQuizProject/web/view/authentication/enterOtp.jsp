<%-- 
    Document   : changePassword
    Created on : 19 Mar 2024, 12:56:13 am
    Author     : hatua
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>OTP Verification</title>
        <!-- Bootstrap 5 CDN Link -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            /* Google Poppins Font CDN Link */
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

            *{
                margin:0;
                padding:0;
                box-sizing: border-box;
            }

            /* Variables */
            :root{
                --primary-font-family: 'Poppins', sans-serif;
                --light-white:#f5f8fa;
                --gray:#5e6278;
                --gray-1:#e3e3e3;
            }
            body{
                font-family:var(--primary-font-family);
                font-size: 14px;
            }

            /* Main CSS OTP Verification New Changing */
            .wrapper{
                padding:0 0 100px;
                background-image:url("images/bg.png");
                background-position:bottom center;
                background-repeat: no-repeat;
                background-size: contain;
                background-attachment: fixed;
                min-height: 100%;
                /* height:100vh;
                display:flex;
                align-items:center;
                justify-content:center; */
            }
            .wrapper .logo img{
                max-width:40%;
            }
            .wrapper input{
                background-color:var(--light-white);
                border-color:var(--light-white);
                color:var(--gray);
            }
            .wrapper input:focus{
                box-shadow: none;
            }
            .wrapper .password-info{
                font-size:10px;
            }
            .wrapper .submit_btn{
                padding:10px 15px;
                font-weight:500;
            }
            .wrapper .login_with{
                padding:8px 15px;
                font-size:13px;
                font-weight: 500;
                transition:0.3s ease-in-out;
            }
            .wrapper .submit_btn:focus,
            .wrapper .login_with:focus{
                box-shadow: none;
            }
            .wrapper .login_with:hover{
                background-color:var(--gray-1);
                border-color:var(--gray-1);
            }
            .wrapper .login_with img{
                max-width:7%;
            }

            /* OTP Verification CSS */
            .wrapper .otp_input input{
                width:14%;
                height:70px;
                text-align: center;
                font-size: 20px;
                font-weight: 600;
            }

            @media (max-width:1200px){
                .wrapper .otp_input input{
                    height:50px;
                }
            }
            @media (max-width:767px){
                .wrapper .otp_input input{
                    height:40px;
                }
            }
        </style>
    </head>
    <body> 
        <section class="wrapper">
            <div class="container">
                <div class="col-sm-8 offset-sm-2 col-lg-6 offset-lg-3 col-xl-6 offset-xl-3 text-center">
                    <div class="logo">
                        <img decoding="async" src="image/Its-Quiz-Time-Logo.webp" class="img-fluid" alt="logo">
                    </div>
                    <form id="register-form" action="validateOtp" role="form" autocomplete="off" class="rounded bg-white shadow p-5" method="post">
                        <h3 class="text-dark fw-bolder fs-4 mb-2">Two Step Verification</h3>

                        <div class="fw-normal text-muted mb-4">
                            Enter the verification code we sent to
                        </div>  

                        <div class="d-flex align-items-center justify-content-center fw-bold mb-4">                            
                            <span>${sessionScope.email}</span>
                        </div>

                        <div class="otp_input text-start mb-2">
                            <label for="digit">Type your 6 digit security code</label>
                            <div id="otp" name="otp" class="d-flex align-items-center justify-content-between mt-2">
                                <input type="text" name="digit1" class="form-control" maxlength="1" placeholder="">
                                <input type="text" name="digit2" class="form-control" maxlength="1" placeholder="">
                                <input type="text" name="digit3" class="form-control" maxlength="1" placeholder="">
                                <input type="text" name="digit4" class="form-control" maxlength="1" placeholder="">
                                <input type="text" name="digit5" class="form-control" maxlength="1" placeholder="">
                                <input type="text" name="digit6" class="form-control" maxlength="1" placeholder="">
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary submit_btn my-4" name="recover-submit">Submit</button> 
                    </form>
                </div>
            </div>
        </section>
        <script>
            var inputs = document.querySelectorAll('#otp input');

            for (var i = 0; i < inputs.length; i++) {
                inputs[i].addEventListener('input', function () {
                    if (this.value.length === this.maxLength) {
                        var index = Array.prototype.indexOf.call(inputs, this);
                        if (index < inputs.length - 1) {
                            inputs[index + 1].focus();
                        }
                    }
                });
            }
        </script>
    </body>
</html>
