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
        <script src="js/homeStudent.js"></script>

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
                                            <li><a href="#"><i class="fa-solid fa-lock"></i> Change Password</a></li>
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
        <form action="updateaccount" method="POST">
            <div class="container bootstrap snippets bootdeys">
                <div class="row">
                  <div class="row-1">
                    <form class="form-horizontal">
                        <div class="panel panel-default panel-1">
                          <div class="panel-body text-center">
                           <img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle profile-avatar" alt="User avatar">
                          </div>
                        </div>
                      <div class="panel panel-default">
                        <div class="panel-heading">
                        <h4 class="panel-title">User info</h4>
                        </div>
                        <div class="panel-body">
                          
                          <div class="form-group">
                            <label class="col-sm-2 control-label">Display name</label>
                            <div class="col-sm-10">
                              <input type="text" name="displayname" class="form-control" value="${requestScope.accountNeedToUpdate.displayName}">
                            </div>
                          </div>
                         
                          <div class="form-group">
                            <label class="col-sm-2 control-label">Fullname</label>
                            <div class="col-sm-10">
                              <input type="text" name="fullname" class="form-control" value="${requestScope.infoAbountAccountNeedToUpdate.fullName}">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-2 control-label">Dob</label>
                            <div class="col-sm-10">
                              <input type="date" name="dob" class="form-control" value="${requestScope.infoAbountAccountNeedToUpdate.dob}">
                            </div>
                          </div>
                        </div>
                      </div>
                
                      
                
                      <div class="panel panel-default">
                        <div class="panel-heading">
                        <h4 class="panel-title">Security</h4>
                        </div>
                        <div class="panel-body">
                          <div class="form-group">
                            <label class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                              <input type="password" name="password" class="form-control" value="${requestScope.accountNeedToUpdate.password}" >
                            </div>
                          </div>                  
                          <div class="form-group">
                            <div class="col-sm-10 col-sm-offset-2">
                              <button type="submit" class="btn btn-primary" value="Save">Submit</button>
                              <button type="reset" class="btn btn-default">Cancel</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
                </div>
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

        </footer>
    </body>
</html>