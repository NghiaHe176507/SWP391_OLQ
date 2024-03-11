<%-- 
    Document   : viewListTopic
    Created on : Feb 19, 2024, 12:31:49 AM
    Author     : PC
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/homeStudent.js"></script>
        <title>Topic</title>
        <style>
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
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                height: 100vh;
                justify-content: center;
                align-items: center; /* Center items vertically */
            }

            .container {

                display: flex;
                max-width: 800px;
                width: 100%;
                justify-content: center;
                /* Add margin for spacing on both sides */
            }

            .left-side,
            .right-side {
                padding: 20px;
                box-sizing: border-box;
                border: 1px solid #ddd;
                border-radius: 8px;
                width: 48%; /* Adjust the width to leave some space between left and right sides */
            }

            .left-side {
                overflow: auto;
                margin-right: 10px; /* Add margin between left and right sides */
            }

            .right-side {
                overflow: auto;
                margin-left: 10px; /* Add margin between left and right sides */
            }

            .left-side h2 {
                color: #007bff;
                margin-bottom: 20px;
            }

            .left-side a.btn {
                color: #fff;
            }

            .left-side a.btn:hover {
                text-decoration: none;
            }

            .left-side .btn-danger {
                background-color: #dc3545;
                border-color: #dc3545;
            }

            .left-side .btn-danger:hover {
                background-color: #bd2130;
                border-color: #bd2130;
            }
        </style>
        <script>
            function DeleteTopic(id)
            {
                var conf = confirm("Are you sure?");
                if (conf) {
                    window.location.href = '<%=request.getContextPath()%>/admin/topic-management/delete-topic?topicId=' + id;
                }
            }
        </script>
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
        <div class="container">

            <div class="right-side" id="formContainer">
                <c:if test="${requestScope.url == 'create'}">
                    <div class="container-fluid">
                        <h2 class="mb-4">Create Topic</h2>
                        <form action="create-topic" method="POST" class="needs-validation" novalidate>
                            <div class="form-group">
                                <label for="topicName">Topic Name:</label>
                                <input type="text" class="form-control" id="topicName" name="topicName" required>
                                <div class="invalid-feedback">Please enter a topic name.</div>
                            </div>
                            <div class="btn-container d-flex">
                                <button type="submit" class="btn btn-primary" value="Save">Save</button><br/>
                                <a href="<%=request.getContextPath()%>/admin/topic-management" class="btn btn-default">Cancel</a>
                            </div>
                        </form>
                    </div>
                </c:if>
            </div>
            <div class="left-side">
                <a href="<%=request.getContextPath()%>/admin/topic-management/create-topic" class="btn btn-success mb-3" id="toggleFormLink">Create</a>
                <div class="container-fluid">
                    <h2 class="mb-4">View List Topic</h2>
                    <table class="table table-striped" id="myTable">
                        <thead class="thead-dark">
                            <tr>
                                <th>Topic Id</th>
                                <th>Topic Name</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="tableBody">
                            <c:forEach items="${requestScope.listTopic}" var="topic">
                                <tr>
                                    <td>${topic.topicId}</td>
                                    <td>${topic.topicName}</td>
                                    <td>
                                        <button class="btn btn-danger" onclick="DeleteTopic(${topic.topicId})">Delete</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- Pagination -->
                    <div class="pagination">
                        <c:if test="${requestScope.totalPages > 1}">
                            <ul class="pagination justify-content-center">
                                <c:forEach begin="1" end="${requestScope.totalPages}" var="pageNumber">
                                    <li class="page-item ${pageNumber eq requestScope.currentPage ? 'active' : ''}">
                                        <a class="page-link" href="?page=${pageNumber}">${pageNumber}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
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
