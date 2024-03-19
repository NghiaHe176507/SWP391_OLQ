<%-- 
    Document   : AddQuestion
    Created on : 11 Mar 2024, 07:50:21
    Author     : MINH TUAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Group</title>

        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/ce03f1d68b.js" crossorigin="anonymous"></script>
        <style>
            @import url("https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap");
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            html {
                font-family: "Poppins", sans-serif;
                scroll-behavior: smooth;
            }
            .container {
                min-height: 100%;
                position: relative;
            }
            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            .container {
                flex: 1;
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

            #nav > li {
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
                content: ""; /* Tạo một pseudo-element để làm hình nền của hiệu ứng nhấp chuột */
                position: absolute; /* Đặt vị trí tuyệt đối để che phủ biểu tượng */
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                background-color: rgba(0,0, 0,0.2); /* Màu nền của hiệu ứng khi nhấp chuột */
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

            /* Create Styles */
            .create {
                text-align: center;
            }

            .create a {
                text-decoration: none;
                font-family: "Poppins", sans-serif;
                font-weight: bold;
                font-size: 16px;
                color: #fff;
                padding: 10px 20px;
                background: linear-gradient(135deg, #9a3cbf, #4397ce);
                border-radius: 5px;
                transition: background 0.3s ease, transform 0.2s ease-in-out;
            }

            .create a:hover {
                background: linear-gradient(135deg, #4397ce, #9a3cbf);
                transform: scale(1.05);
            }

            .create a:active {
                transform: scale(0.95);
            }

            /* Footer Section Styles */

            #footer {
                position: relative;
                bottom: 0;
                left: 0;
                width: 100%;
                background: linear-gradient(135deg, #4397ce, #9a3cbf);
                color: white;
                text-align: center;
                transition: transform 0.5s ease-in-out;
                padding: 5px;
            }

            #footer a {
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

            body{
                margin-top:20px;
            }
            .shadow {
                box-shadow: 0 0 3px rgb(53 64 78 / 20%) !important;
            }
            .rounded {
                border-radius: 5px !important;
            }
            .bg-light {
                background-color: #f7f8fa !important;
            }
            .bg-primary, .btn-primary, .btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active, .btn-outline-primary.active, .btn-outline-primary.focus, .btn-outline-primary:not(:disabled):not(.disabled):active, .badge-primary, .nav-pills .nav-link.active, .pagination .active a, .custom-control-input:checked ~ .custom-control-label:before, #preloader #status .spinner > div, .social-icon li a:hover, .back-to-top:hover, .back-to-home a, ::selection, #topnav .navbar-toggle.open span:hover, .owl-theme .owl-dots .owl-dot.active span, .owl-theme .owl-dots.clickable .owl-dot:hover span, .watch-video a .play-icon-circle, .sidebar .widget .tagcloud > a:hover, .flatpickr-day.selected, .flatpickr-day.selected:hover, .tns-nav button.tns-nav-active, .form-check-input.form-check-input:checked {
                background-color: #6dc77a !important;
            }

            .badge {
                padding: 5px 8px;
                border-radius: 3px;
                letter-spacing: 0.5px;
                font-size: 12px;
            }

            .btn-primary, .btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active, .btn-outline-primary.active, .btn-outline-primary.focus, .btn-outline-primary:not(:disabled):not(.disabled):active {
                box-shadow: 0 3px 7px rgb(109 199 122 / 50%) !important;
            }
            .btn-primary, .btn-outline-primary, .btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active, .btn-outline-primary.active, .btn-outline-primary.focus, .btn-outline-primary:not(:disabled):not(.disabled):active, .bg-soft-primary .border, .alert-primary, .alert-outline-primary, .badge-outline-primary, .nav-pills .nav-link.active, .pagination .active a, .form-group .form-control:focus, .form-group .form-control.active, .custom-control-input:checked ~ .custom-control-label:before, .custom-control-input:focus ~ .custom-control-label::before, .form-control:focus, .social-icon li a:hover, #topnav .has-submenu.active.active .menu-arrow, #topnav.scroll .navigation-menu > li:hover > .menu-arrow, #topnav.scroll .navigation-menu > li.active > .menu-arrow, #topnav .navigation-menu > li:hover > .menu-arrow, .flatpickr-day.selected, .flatpickr-day.selected:hover, .form-check-input:focus, .form-check-input.form-check-input:checked, .container-filter li.active, .container-filter li:hover {
                border-color: #6dc77a !important;
            }
            .bg-primary, .btn-primary, .btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active, .btn-outline-primary.active, .btn-outline-primary.focus, .btn-outline-primary:not(:disabled):not(.disabled):active, .badge-primary, .nav-pills .nav-link.active, .pagination .active a, .custom-control-input:checked ~ .custom-control-label:before, #preloader #status .spinner > div, .social-icon li a:hover, .back-to-top:hover, .back-to-home a, ::selection, #topnav .navbar-toggle.open span:hover, .owl-theme .owl-dots .owl-dot.active span, .owl-theme .owl-dots.clickable .owl-dot:hover span, .watch-video a .play-icon-circle, .sidebar .widget .tagcloud > a:hover, .flatpickr-day.selected, .flatpickr-day.selected:hover, .tns-nav button.tns-nav-active, .form-check-input.form-check-input:checked {
                background-color: #6dc77a !important;
            }
            .btn {
                padding: 8px 20px;
                outline: none;
                text-decoration: none;
                font-size: 16px;
                letter-spacing: 0.5px;
                transition: all 0.3s;
                font-weight: 600;
                border-radius: 5px;
            }
            .btn-primary {
                background-color: #6dc77a !important;
                border: 1px solid #6dc77a !important;
                color: #fff !important;
                box-shadow: 0 3px 7px rgb(109 199 122 / 50%);
            }

            a {
                text-decoration:none;
            }
        </style>
    </head>

    <body>

        <header>
            <div class="container">
                <div class="row">
                    <div class="header">
                        <!-- Logo -->
                        <div class="logo col-md-2">
                            <a href="home">QUIZWIZ</a>
                        </div>

                        <form action="search" method="GET" class="col-md-6">
                            <div class="search-container" style="width:100%;">
                                <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi, topic hoặc group...">
                                <button type="submit" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </form>

                        <div class="login col-md-2">
                            <ul id="nav" class="nav nav-pills">
                                <li class="nav-item dropdown">
                                    <div class="circle-background">
                                        <img class="profile-image" src="<%= request.getContextPath() %>/image/avatar.jpg" alt="Profile Image">
                                    </div>
                                    <ul class="subnav">
                                        <li><a href="<%= request.getContextPath() %>/UserDetail"><i class="fa-solid fa-user"></i> User Details</a></li>
                                        <li><a href="<%= request.getContextPath() %>/change-password-student"><i class="fa-solid fa-lock"></i> Change Password</a></li>
                                        <li><a href="<%= request.getContextPath() %>/logout"><i class="fa-solid fa-right-from-bracket"></i> Log out</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="row">
            <div class="space"></div>
        </div>

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <div class="container mt-5 pt-4">
            <div class="row align-items-end mb-4 pb-2">
                <div class="col-md-8">
                    <div class="section-title text-center text-md-start">
                        <h4 class="title mb-4">Group list for create exam</h4>
                        <p class="text-muted mb-0 para-desc">Prepare to demonstrate your knowledge and critical thinking skills as you tackle each question with clarity and focus. Success lies not only in correct answers but also in the effort and thoughtfulness you invest.</p>
                    </div>
                </div>

            </div>

            <div class="row">
                <span class="text-muted d-block"><i class="fa fa-bar-chart" style="margin-right: 6px;" aria-hidden="true"></i>Number of exam: ${listGroupExam.size()}</span>
                <c:forEach items="${requestScope.listGroupExam}" var="groupE">
                    <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">

                        <div class="group-info card border-0 bg-light rounded shadow">

                            <div class="card-body p-4">
                                <span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0">${accountInfo.fullName}</span>
                                <h5>${groupE.groupName}</h5>
                                <div class="mt-3">
                                    <span class="text-muted d-block"><i class="fa fa-graduation-cap" aria-hidden="true"></i> ${groupE.topic.topicName}</span>
                                </div>

                                <div class="mt-3">

                                    <a href="<%= request.getContextPath() %>/create-exam?groupId=${groupE.groupId}" class="btn btn-primary">Create Exam</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div class="row justify-content-end mb-4 pb-2">
                    <div class="col-md-4 mt-sm-0 d-none d-md-block" id="groupContainer">
                        <div class="text-center text-md-end">
                            <a href="#" id="showAllBtn">Show all groups <i class="fa-solid fa-arrow-down"></i></a>
                            <a href="#" id="showLessBtn" style="display: none;">Show less <i class="fa-solid fa-arrow-up"></i></a>

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
            <p class="slogan">Khám phá sức thông minh cùng <a href="home">Quizwiz</a> </p>
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var showAllBtn = document.getElementById("showAllBtn");
                var showLessBtn = document.getElementById("showLessBtn");
                var groupInfos = document.querySelectorAll(".group-info");

                // Ẩn các topic-info với index từ 3 trở đi
                for (var i = 3; i < groupInfos.length; i++) {
                    groupInfos[i].style.display = "none";
                }

                showAllBtn.addEventListener("click", function () {
                    // Hiện tất cả các topic-info
                    groupInfos.forEach(function (groupInfos) {
                        groupInfos.style.display = "flex";
                    });

                    // Ẩn nút Show all và hiện nút Show less
                    showAllBtn.style.display = "none";
                    showLessBtn.style.display = "block";
                });

                showLessBtn.addEventListener("click", function () {
                    // Ẩn các topic-info với index từ 3 trở đi
                    for (var i = 3; i < groupInfos.length; i++) {
                        groupInfos[i].style.display = "none";
                    }

                    // Ẩn nút Show less và hiện nút Show all
                    showAllBtn.style.display = "block";
                    showLessBtn.style.display = "none";
                });
            });
        </script>
        
         <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Get the logo element
            var logo = document.querySelector('.logo a');

            // Add click event listener to the logo
            logo.addEventListener('click', function (event) {
                // Prevent the default action of the link
                event.preventDefault();

                // Get the base URL
                var baseUrl = "<%= request.getContextPath() %>";

                // Navigate to the home page
                window.location.href = baseUrl + "/home";
            });
        });
    </script>

    </body>
</html>
