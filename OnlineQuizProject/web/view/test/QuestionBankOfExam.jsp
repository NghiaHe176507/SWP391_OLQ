<%-- 
    Document   : QuestionBankOfExam
    Created on : 5 Apr 2024, 3:12:50 am
    Author     : hatua
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/AccountManagement.css"/>

        <title>Mange Account</title>
        <style>
            /* Style for form container */
            .form-container {
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f2f2f2;
                border-radius: 5px;
            }

            /* Style for headings */
            h2, h5 {
                color: #333;
            }

            /* Style for questions */
            .question {
                margin-bottom: 10px;
            }

            /* Style for checkboxes */
            input[type="checkbox"] {
                margin-right: 5px;
            }

            /* Style for submit button */
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            /* Style for submit button on hover */
            input[type="submit"]:hover {
                background-color: #45a049;
            }

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
            /* Pagination container */
            .pagination-container {
                margin-top: 20px;
                text-align: center;
            }

            /* Pagination links */
            .pagination-container a {
                display: inline-block;
                padding: 5px 10px;
                margin: 0 2px;
                border: 1px solid #ccc;
                background-color: #f7f7f7;
                color: #333;
                text-decoration: none;
                border-radius: 3px;
            }

            /* Current page */
            .pagination-container .current-page {
                display: inline-block;
                padding: 5px 10px;
                margin: 0 2px;
                background-color: #333;
                color: #fff;
                border-radius: 3px;
            }

            .detail-link {
                text-decoration: none; /* Bỏ gạch chân */
                color: black; /* Đổi màu thành đen */
                border: 1px solid black; /* Thêm viền */
                display: inline-block; /* Hiển thị như block */
                padding: 5px 10px; /* Tăng padding để tạo khoảng trống xung quanh nút */
                transition: border-color 0.3s ease; /* Hiệu ứng khi hover */
            }

            .detail-link:hover {
                border-color: gray; /* Thay đổi màu viền khi hover */
            }

            .content-section{
                padding: 15px;
                margin: 20px;
            }


            .custom-section {
                position: fixed;
                top: 7%;
                left: 0;
                height: 81vh;
                width: 15%;
                background-color: black;
                color: white;
                overflow-y: auto;
                border-radius: 10px;
            }

            .custom-section h2{
                border-bottom: 2px solid white;
                padding-bottom: 10px;
                margin-bottom: 20px;
                background: linear-gradient(135deg, #9a3cbf, #4397ce);
                -webkit-background-clip: text;
                color: transparent;
            }

            .custom-section ul {
                list-style-type: none;
                padding-left: 0;
                align-items: center;
            }

            .custom-section ul li {
                margin: 20px;
                padding: 20px;
                background-color: black;
                border-radius: 8px;
                transition: background-color 0.3s;
                align-items: center;
            }

            .custom-section ul li a {
                text-decoration: none;
                color: white;
                flex-grow: 1;
                font-size: 16px;
            }


            .custom-section ul li:hover {
                background-color: #555;
            }


            .card-item h7 {
                border: 1px solid #fff; /* Thêm border 1px solid với màu #ccc */
                border-radius: 5px; /* Thêm border radius 5px */
                margin: 5px; /* Thêm margin 5px */
                text-align: center;
            }

            .search-container {
                width: 100%
            }

            .create-button{
                background: linear-gradient(135deg, #9a3cbf, #4397ce);
                cursor: pointer;
                color: white;
                border: none;
                padding: 7px 12px;
            }
            .create-button:hover{
                background-color: #0056b3; /* Màu nền hover */
                color: #fff; /* Màu chữ hover */
            }

            .nav-pills .nav-item {
                display: inline-block; /* Hiển thị các mục trên cùng 1 hàng */
                margin-left: 125px; /* Khoảng cách giữa các mục */
            }

            .nav-pills .nav-link {
                text-decoration: none;
                color: #fff;
                font-weight: bold;
                font-size: 16px;
                border-radius: 5px;
            }

            .nav-pills .nav-link:hover {
                background-color: rgba(255, 255, 255, 0.2); /* Màu nền khi hover */
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
                            <div class="search-container" style="width: 100%">
                                <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi, topic hoặc group...">
                                <button id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </form>
                        <div class="login col-md-3">
                            <ul id="nav" class="nav nav-pills">
                                <li class="nav-item dropdown">
                                    <div class="circle-background">
                                        <img class="profile-image" src="image/avatar.jpg" alt="Profile Image">
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
        <h1>Create Exam</h1>

        <div class="container mt-5">
            <form action="createExam.jsp" method="post">
                <h2>Question Bank</h2>
                <c:forEach items="${requestScope.questionDB}" var="question" varStatus="loop">
                    <div class="mb-3">
                        <h5>Question ${loop.index + 1}: <span>${question.questionContent}</span> </h5>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="question${loop.index + 1}" id="question${loop.index + 1}" value="${loop.index + 1}">
                            <label class="form-check-label" for="question${loop.index + 1}">Include in Exam</label>
                        </div>
                        <hr>
                    </div>
                </c:forEach>
                <button type="submit" class="btn btn-primary">Create Exam</button>
            </form>
        </div>

        <footer>
            <div id="footer">
                <!-- Social Icons -->
                <div class="socials-list">
                    <a href=""><i class="fab fa-facebook"></i></a>
                    <a href=""><i class="fab fa-instagram"></i></a>
                    <a href=""><i class="fas fa-bell"></i></a>
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
        </footer>
    </body>
</html>
