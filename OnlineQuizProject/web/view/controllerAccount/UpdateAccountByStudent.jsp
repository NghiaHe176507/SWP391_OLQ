<%-- 
    Document   : UpdateAccountByStudent
    Created on : Feb 26, 2024, 6:31:16 AM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

        <script src="js/UpdateProfile.js"></script>


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
            body {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
            }
            .panel {
                width: 100%; /* Adjust the width as needed */
                margin: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Optional: Add a box shadow for a subtle effect */
            }

            .panel-heading {
                background-color: #f5f5f5; /* Optional: Change the background color of the panel heading */
                padding: 10px;
            }

            .panel-title {
                margin: 0;
            }

            .panel-body {
                padding: 20px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .row-1 {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                grid-template-rows: repeat(2, 1fr);
                /* align-items: center; */
            }

            .panel-1 {
                grid-column: 1/3;
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
                padding: 5px;
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
            .card {
                max-width: 600px; /* Đặt chiều rộng tối đa của form */
                margin: 0 auto; /* Căn giữa theo trục ngang */
            }
            header, footer {
                height: 60px; /* Có thể điều chỉnh theo ý muốn */
            }
            section {
                height: calc(100vh - 120px);
                overflow-y: auto;
                display: flex;
                justify-content: center; /* Căn giữa theo chiều ngang */
                align-items: center; /* Căn giữa theo chiều dọc */
            }
        </style>
    </head>
    <body>
        <header>
            <form action="home" method="POST">
                <!-- Main container div -->
                <div class="container">
                    <!-- Header section -->
                    <div class="row">
                        <div class="header">
                            <!-- Logo -->
                            <div class="logo col-md-2">
                                <a href="#">QUIZWIZ</a>
                            </div>

                            <!-- Search container -->
                            <div class="search-container col-md-6">
                                <input type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi...">
                                <button type="button" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>

                            <!-- Login section -->
                            <div class="login col-md-2">
                                <ul id="nav" class="nav nav-pills">
                                    <li><a href="#"><i class="fa-regular fa-bell"></i> </a></li>
                                    <li class="nav-item dropdown">
                                        <div class="circle-background">
                                            <img class="profile-image" src="image/avatar.jpg" alt="Profile Image">
                                        </div>
                                        <ul class="subnav">
                                            <li><a href="<%= request.getContextPath() %>/UserDetail"><i class="fa-solid fa-user"></i> User Details</a></li>
                                            <li><a href="<%= request.getContextPath() %>/change-password-student"><i class="fa-solid fa-lock"></i> Change Password</a></li>
                                            <li><a href="<%= request.getContextPath() %>/achivement-detail"><i class="fa-solid fa-trophy"></i> Achievement</a></li>
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
        <form class="container" action="updateaccount" method="POST">
            <section class="min-vh-100 bg-light">
                <div class="container">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-lg-8">
                            <div class="card border-0 shadow-sm rounded">
                                <div class="card-body p-5">
                                    <h2 class="text-center mb-5">Edit Profile</h2>
                                    <form action="./update" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="uid" value="${requestScope.user.id}">
                                        <!-- Image section -->
                                        <div class="text-center mb-4">
                                            <img src="https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQlj3rCfLHry58AtJ8ZyBEAFPtChMddDSUSjt7C7nV3Nhsni9RIx5b0-n7LxfgerrPS6b-P-u3BOM3abuY"
                                                 class="img-fluid rounded-circle" alt="User avatar" style="width: 150px; height: 150px">
                                            <div class="mt-2">
                                                <input type="file" class="form-control" name="avatar" id="avatar">
                                            </div>
                                        </div>
                                        <div class="mb-4">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                                <input type="text" name="fullname" placeholder="Fullname"
                                                       class="form-control" value="${requestScope.infoAbountAccountNeedToUpdate.fullName}" required>
                                            </div>
                                        </div>
                                        <div class="mb-4">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fa-solid fa-address-card"></i></span>
                                                <input type="text" name="displayname" placeholder="Display Name"
                                                       class="form-control" value="${requestScope.accountNeedToUpdate.displayName}" required>
                                            </div>
                                        </div>
                                        <div class="mb-4">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                                <input type="date" name="dob" placeholder="Day of Birthday"
                                                       class="form-control" value="${requestScope.infoAbountAccountNeedToUpdate.dob}" required>
                                            </div>
                                        </div>
                                        <div class="mb-4">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-lock-open"></i></span>
                                                <input type="password" id="current_password" name="current_password"
                                                       placeholder="Current Password" class="form-control"
                                                       value="${requestScope.accountNeedToUpdate.password}" required readonly>
                                            </div>
                                        </div>
                                        <div class="mb-4">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                                <input type="password" class="form-control rounded mt-1 password"
                                                       placeholder="Type your password" aria-label="password"
                                                       aria-describedby="password" name="password" required>
                                            </div>
                                            <div class="alert alert-warning mt-2 d-none" role="alert" id="password-alert">
                                                <ul class="list-unstyled mb-0">
                                                    <li class="requirements leng">Your password must have at least 8 characters
                                                    </li>
                                                    <li class="requirements big-letter">Your password must have at least 1 big
                                                        letter.</li>
                                                    <li class="requirements num">Your password must have at least 1 number.</li>
                                                    <li class="requirements special-char">Your password must have at least 1
                                                        special character.</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="d-grid">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                            <a href="<%=request.getContextPath()%>/home" class="btn btn-default">Cancel</a>

                                        </div>
                                    </form>
                                    <div id="success-alert" class="alert alert-success mt-2 d-none" role="alert">
                                        Thông tin của bạn đã được cập nhật.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>
        <footer>
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
            <!-- End of footer section -->

            <!-- End of main container div -->
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Get the logo element
                    var logo = document.querySelector('.logo a');
                    // Add click event listener to the logo
                    logo.addEventListener('click', function () {
                        // Reload the page
                        location.reload();
                    });
                });
            </script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Lấy form
                    var form = document.querySelector('form[action="updateaccount"]');

                    // Thêm sự kiện submit cho form
                    form.addEventListener('submit', function (event) {
                        // Hiển thị cửa sổ cảnh báo khi submit thành công
                        alert("Thông tin của bạn đã được cập nhật.");
                    });
                });
            </script>


        </footer>
    </body>
</html>