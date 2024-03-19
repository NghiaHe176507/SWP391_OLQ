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
        <title>Change Password</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">   
        <style>
            a {
                text-decoration: none;
            }
            .login-page {
                width: 100%;
                height: 100vh;
                display: inline-block;
                display: flex;
                align-items: center;
            }
            .form-right i {
                font-size: 100px;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .input-group {
                position: relative;
            }
            .input-group > .text-danger {
                position: absolute;
                bottom: -15px; /* Adjust this value as needed */
                left: 0;
            }

            *{
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            html {
                font-family: "Poppins", sans-serif;
                scroll-behavior: smooth;
            }

            /* Common Styles */
            .header {
                background-color: #000;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1;
                display: flex;
                justify-content: space-around;
                align-items: center;
            }

            /* Logo Styles */
            .logo {
                text-align: justify;
            }

            .logo a {
                text-decoration: none;
                font-family: "Poppins", sans-serif;
                font-weight: bold;
                font-size: 36px;
                background: linear-gradient(135deg, #9a3cbf, #4397ce);
                -webkit-background-clip: text;
                color: transparent;
                transition: transform 0.2s ease-in-out;
            }

            .logo:active {
                transform: scale(0.9);
            }

            /* Search Container Styles */
            .search-container {
                display: flex;
                width: 80%;
            }

            /* Search Input Styles */
            .search-container {
                padding: 10px;
            }
            #searchInput {
                flex-grow: 1;
                padding: 10px;
                border: 2px solid #fff;
                border-radius: 5px 0 0 5px;
                outline: none;
            }

            /* Search Button Styles */
            #searchButton {
                padding: 10px;
                background: linear-gradient(135deg, #9a3cbf, #4397ce);
                color: #fff;
                border: none;
                border-radius: 0 5px 5px 0;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            #searchButton:hover {
                background: linear-gradient(135deg, #4397ce, #9a3cbf);
                transform: scale(1.05);
            }

            #searchButton:active {
                transform: scale(0.95);
            }

            /* Navigation menu styles */
            .custom-icon {
                display: flex;
                align-items: center;
                text-decoration: none;
                color: inherit;
            }

            .circle-background {
                border-radius: 50%;
                overflow: hidden;
                background-color: #ccc;
                width: 45px;
                height: 45px;
                transition: background-color 0.3s ease;
            }

            .custom-icon:hover .circle-background {
                background-color: #ddd;
            }

            .profile-image {
                width: 100%;
                height: auto;
                display: block;
            }
            /*  */

            .login {

            }

            #nav {
                display: flex;
                justify-content: space-around;
            }

            #nav>li {
                display: inline-block; /* Hiển thị các li trên cùng một dòng */
            }

            #nav .fa-bell {
                font-size: 36px; /* Đặt kích thước của biểu tượng chuông */
                position: relative; /* Đặt vị trí tương đối để thực hiện hiệu ứng */
                cursor: pointer; /* Biến con trỏ thành dạng bàn tay khi di chuột qua */
                transition: color 0.3s; /* Tạo hiệu ứng màu khi hover */
                color: #fff;
                background-color: #000;
                padding-top: 5px;
            }

            #nav .fa-bell:hover {
                color: palevioletred; /* Màu khi di chuột qua */
            }

            #nav .fa-bell::after {
                content: ''; /* Tạo một pseudo-element để làm hình nền của hiệu ứng nhấp chuột */
                position: absolute; /* Đặt vị trí tuyệt đối để che phủ biểu tượng */
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                background-color: rgba(0, 0, 0, 0.2); /* Màu nền của hiệu ứng khi nhấp chuột */
                border-radius: 50%; /* Tạo hình tròn */
                opacity: 0; /* Ẩn mặc định */
                transition: opacity 0.3s; /* Tạo hiệu ứng độ mờ */
            }

            #nav .fa-bell:active::after {
                opacity: 1; /* Hiển thị hiệu ứng khi nhấp chuột */
            }


            .subnav {
                list-style-type: none;
                padding: 15px;
            }

            #nav .subnav {
                display: none;
                min-width: 160px;
                background-color: #000;
                position: absolute;
                top: 100%;
                left: 0;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                white-space: nowrap;
            }

            #nav .subnav a {
                color: white;
                line-height: 38px;
                text-decoration: none;
            }

            #nav .nav-arraow-down {
                font-size: 14px;
            }

            #nav li:hover .subnav {
                display: block;
            }

            #nav .subnav li:hover a,
            #nav > li:hover > a {
                color: palevioletred;
            }
            /* Footer Section Styles */

            #footer {
                position: fixed;
                bottom: 0;
                left: 0;
                width: 100%;
                background: linear-gradient(135deg, #4397ce, #9a3cbf);
                color: white;
                text-align: center;
                transition: transform 0.5s ease-in-out;
                padding: 5px;
            }

            .container {
                min-height: 100%;
                position: relative;
            }

            .container {
                flex: 1;
            }

            #footer a{
                color: #000;
            }

            .slogan {
                margin: 0;
                font-size: 16px;
            }

            /* Space Styles */
            .space {
                padding: 39px;
            }

            /* Slider Section Styles */
            #carouselExampleIndicators {
                width: 100%;
                height: auto;
                max-width: 100%;
            }

            /* Custom styles for carousel images */
            #carouselExampleIndicators img {
                width: 100%;
                height: auto;
                max-width: 100%;
            }


            /*  */
            /* .topic {
              display: flex;
              justify-content: space-between;
              align-items: flex-start; 
            }
            
            .topic-info {
              flex: 1; 
              border: 1px solid #ccc; 
              padding: 10px; 
            }
            
            .show-all {
              margin-top: 10px;
            }
            
            .show-all a {
              display: block;
              text-align: right; 
              text-decoration: none;
              color: #007BFF;
            } */


            .topic {
                display: flex;
                flex-wrap: wrap; /* Cho phép các div con xuống dòng khi không đủ không gian */
                justify-content: space-between;
                align-items: flex-start;
                padding: 15px; /* Khoảng cách lề bên trong div topic */
                border: 1px solid #ccc; /* Đường viền của div topic */
                border-radius: 10px; /* Bo góc cho div topic */
            }

            .topic-info {
                flex: 0 0 calc(25% - 15px); /* Chia cột cho 4 div con, với khoảng cách giữa chúng là 15px */
                margin: 15px; /* Khoảng cách giữa các div con */
                border: 1px solid #ccc; /* Đường viền của div con */
                border-radius: 5px; /* Bo góc cho div con */
                padding: 10px; /* Khoảng cách lề bên trong div con */
            }

            .show-all {
                width: 100%;
                margin-top: 15px; /* Khoảng cách giữa div con và div show-all */
            }

            .show-all a {
                display: block;
                text-align: right;
                text-decoration: none;
                color: #007BFF;
            }

            body {
                margin-top: 20px;
            }
            .list-account {
                font-size: 1.5rem;
                /* Adjust font size as needed */
                font-weight: bold;
                /* Make the text bold */
                margin-bottom: 1rem;
                margin-left: 17rem;
            }

            .main-box {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid rgba(0, 0, 0, .125);
                border-radius: 7px;
                padding: 10px;
                /* Remove border */
                margin-bottom: 20px;
                /* Adjust spacing */
            }

            /* USER LIST TABLE */
            .user-list tbody td>img {
                position: relative;
                max-width: 50px;
                float: left;
                margin-right: 15px;
            }

            .user-list tbody td .user-link {
                display: block;
                font-size: 1.25em;
                padding-top: 3px;
            }

            .user-list tbody td .user-subhead {
                font-size: 0.875em;
                font-style: italic;
            }

            /* TABLES */
            .table {
                border-collapse: separate;
            }

            .table-hover>tbody>tr:hover>td,
            .table-hover>tbody>tr:hover>th {
                background-color: #eee;
            }

            .table thead>tr>th {
                border-bottom: 1px solid #C2C2C2;
                padding-bottom: 0;
            }

            .table tbody>tr>td {
                font-size: 0.875em;
                background: #f5f5f5;
                border-top: 10px solid #fff;
                vertical-align: middle;
                padding: 12px 8px;
            }

            .table tbody>tr>td:first-child,
            .table thead>tr>th:first-child {
                padding-left: 20px;
            }

            .table thead>tr>th span {
                border-bottom: 2px solid #C2C2C2;
                display: inline-block;
                padding: 0 5px;
                padding-bottom: 5px;
                font-weight: normal;
            }

            .table thead>tr>th>a span {
                color: #344644;
            }

            .table thead>tr>th>a span:after {
                content: "\f0dc";
                font-family: FontAwesome;
                font-style: normal;
                font-weight: normal;
                text-decoration: inherit;
                margin-left: 5px;
                font-size: 0.75em;
            }

            .table thead>tr>th>a.asc span:after {
                content: "\f0dd";
            }

            .table thead>tr>th>a.desc span:after {
                content: "\f0de";
            }

            .table thead>tr>th>a:hover span {
                text-decoration: none;
                color: #2bb6a3;
                border-color: #2bb6a3;
            }

            .table.table-hover tbody>tr>td {
                -webkit-transition: background-color 0.15s ease-in-out 0s;
                transition: background-color 0.15s ease-in-out 0s;
            }

            .table tbody tr td .call-type {
                display: block;
                font-size: 0.75em;
                text-align: center;
            }

            .table tbody tr td .first-line {
                line-height: 1.5;
                font-weight: 400;
                font-size: 1.125em;
            }

            .table tbody tr td .first-line span {
                font-size: 0.875em;
                color: #969696;
                font-weight: 300;
            }

            .table tbody tr td .second-line {
                font-size: 0.875em;
                line-height: 1.2;
            }

            .table a.table-link {
                margin: 0 5px;
                font-size: 1.125em;
            }

            .table a.table-link:hover {
                text-decoration: none;
                color: #2aa493;
            }

            .table a.table-link.danger {
                color: #fe635f;
            }

            .table a.table-link.danger:hover {
                color: #dd504c;
            }

            .table-products tbody>tr>td {
                background: none;
                border: none;
                border-bottom: 1px solid #ebebeb;
                -webkit-transition: background-color 0.15s ease-in-out 0s;
                transition: background-color 0.15s ease-in-out 0s;
                position: relative;
            }

            .table-products tbody>tr:hover>td {
                text-decoration: none;
                background-color: #f6f6f6;
            }

            .table-products .name {
                display: block;
                font-weight: 600;
                padding-bottom: 7px;
            }

            .table-products .price {
                display: block;
                text-decoration: none;
                width: 50%;
                float: left;
                font-size: 0.875em;
            }

            .table-products .price>i {
                color: #8dc859;
            }

            .table-products .warranty {
                display: block;
                text-decoration: none;
                width: 50%;
                float: left;
                font-size: 0.875em;
            }

            .table-products .warranty>i {
                color: #f1c40f;
            }

            .table tbody>tr.table-line-fb>td {
                background-color: #9daccb;
                color: #262525;
            }

            .table tbody>tr.table-line-twitter>td {
                background-color: #9fccff;
                color: #262525;
            }

            .table tbody>tr.table-line-plus>td {
                background-color: #eea59c;
                color: #262525;
            }

            .table-stats .status-social-icon {
                font-size: 1.9em;
                vertical-align: bottom;
            }

            .table-stats .table-line-fb .status-social-icon {
                color: #556484;
            }

            .table-stats .table-line-twitter .status-social-icon {
                color: #5885b8;
            }

            .table-stats .table-line-plus .status-social-icon {
                color: #a75d54;
            }

            .danger {
                color: red;
                font-size: 17px;
                position: relative;
                border: 1px solid transparent;
                border-radius: .25rem;
                text-align: center;
            }

            @media (max-width: 600px) {
                .right-side {
                    display: none;
                }
            }

        </style>
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
    </head>
    <body>
        <header>
            <form action="home" method="POST">
                <div class="container">
                    <div class="row">
                        <div class="header">
                            <div class="logo col-md-2">
                                <a href="<%= request.getContextPath() %>/home">QUIZWIZ</a>
                            </div>
                            <form action="search" method="GET" class="col-md-6">
                                <div class="search-container">
                                    <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi, topic hoặc group...">
                                    <button type="submit" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                                </div>
                            </form>
                            <div class="login col-md-2">
                                <ul id="nav" class="nav nav-pills">
                                    <li class="nav-item dropdown">
                                        <div class="circle-background">
                                            <img class="profile-image" src="image/avatar.jpg" alt="Profile Image">
                                        </div>
                                        <ul class="subnav">
                                            <li><a href="<%= request.getContextPath() %>/UserDetail"><i class="fa-solid fa-user"></i> User Details</a></li>
                                            <li><a href="<%= request.getContextPath() %>/change-password-student"><i class="fa-solid fa-lock"></i> Change Password</a></li>
                                            <li><a><i class="fa-solid fa-trophy"></i> Achievement</a></li>
                                            <li><a href="<%= request.getContextPath() %>/logout"><i class="fa-solid fa-right-from-bracket"></i> Log out</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </header>
        <div class="login-page bg-light">
            <div class="container">
                <div class="row">
                    <div class="space"></div>
                </div>
                <div class="row">
                    <div class="col-lg-10 offset-lg-1">
                        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary mb-3 mx-1">Back to Home</a>
                        <div class="bg-white shadow rounded">
                            <div class="row">
                                <div class="col-md-7 pe-0">
                                    <div class="form-left h-100 py-5 px-5">
                                        <form class="row g-4" id="changePasswordForm" action="change-password-student" method="post" onsubmit="return validateForm()">
                                            <div class="col-12">
                                                <label>Current Password<span class="text-danger"> *</span></label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><i class="bi bi-lock-fill"></i></div>
                                                    <input type="password" class="form-control" id="currentPassword" name="currentPassword" placeholder="Enter Current Password" required>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <label>New Password<span class="text-danger"> *</span></label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><i class="bi bi-lock-fill"></i></div>
                                                    <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Enter New Password" required>
                                                </div>
                                                <small id="newPasswordError" class="form-text text-danger"></small>
                                            </div>
                                            <div class="col-12">
                                                <label>Confirm New Password<span class="text-danger"> *</span></label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><i class="bi bi-lock-fill"></i></div>
                                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm New Password" required>
                                                </div>
                                                <small id="confirmPasswordError" class="form-text text-danger"></small>
                                            </div>
                                            <c:if test="${not empty error}">
                                                <div class="danger" role="alert">
                                                    ${error}
                                                </div>
                                            </c:if>
                                            <c:if test="${not empty success}">
                                                <div class="danger" role="alert">
                                                    ${success}
                                                </div>
                                            </c:if>
                                            <div class="col-12">
                                                <button type="button" class="btn btn-secondary px-4 float-end mt-4" id="cancelBtn">Cancel</button>
                                                <button type="submit" class="btn btn-primary px-4 float-end mt-4 me-2">Change Password</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-md-5 ps-0 d-none d-md-block">
                                    <div class="form-right h-100 bg-primary text-white text-center pt-5">
                                        <i class="fa-solid fa-lock-open"></i>
                                        <h2 class="fs-1" style="margin-top: 49px;">Change Password for Students</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="footer">
                <!-- Social Icons -->
                <div class="socials-list">
                    <a href=""><i class="fa-brands fa-facebook"></i></a>
                    <a href=""><i class="fa-brands fa-instagram"></i></a>
                    <a href=""><i class="fa-solid fa-bell"></i></a>
                </div>
                <!-- Slogan -->
                <p class="slogan">Khám phá sức thông minh cùng <a href="#">Quizwiz</a> </p>
            </div>
        </div>
        <script>
            function validateForm() {
                var newPassword = document.getElementById("newPassword").value;
                var confirmPassword = document.getElementById("confirmPassword").value;

                // Clear any previous error messages
                document.getElementById("newPasswordError").textContent = "";
                document.getElementById("confirmPasswordError").textContent = "";

                // Check if the new password meets any validation criteria (e.g., minimum length)
                if (newPassword.length < 8) {
                    document.getElementById("newPasswordError").textContent = "New password must be at least 8 characters long.";
                    return false;
                }

                // Check if the new password matches the confirmation password
                if (newPassword !== confirmPassword) {
                    document.getElementById("confirmPasswordError").textContent = "Passwords do not match.";
                    return false;
                }

                // Form is valid, proceed with submission
                return true;
            }

            function togglePasswordVisibility(inputId) {
                var input = document.getElementById(inputId);
                if (input.type === "password") {
                    input.type = "text";
                } else {
                    input.type = "password";
                }
            }
        </script>
    </body>
</html>
