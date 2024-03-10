<%-- 
    Document   : homeStudent
    Created on : Jan 27, 2024, 1:27:21 AM
    Author     : nghia
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Metadata -->
        <meta charset="UTF-8">
        <title>QuizWiz</title>
        <!-- Favicon -->
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/homeStudent.css">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

        <script src="js/homeStudent.js"></script>
        <style>
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
        </style>
    </head>

    <body>
        <!-- Main container div -->
        <div class="container">
            <!-- Header section -->
            <div class="row">
                <div class="header">
                    <!-- Logo -->
                    <div class="logo col-md-2">
                        <a href="#">QUIZWIZ</a>
                    </div>



                    <div class="create col-md-1">
                        <a href="#" id="joinGroupBtn"><i class="fa-solid fa-plus"></i> Join group</a>
                    </div>

                    <!-- Search container -->
                    <form action="search" method="GET" class="col-md-5">
                        <div class="search-container">
                            <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi, topic hoặc group...">
                            <button type="submit" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>



                    <!-- Login section -->
                    <div class="login col-md-3">
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

            <!-- Empty space -->
            <div class="row">
                <div class="space"></div>
            </div>

            <div class="topic" id="topicContainer">
                <c:forEach var="register" items="${requestScope.listRegister}" varStatus="loop">
                    <div class="col-md-4 mb-3">
                        <div class="topic-info" style="width: 18rem;">
                            <div class="topic-info-body">
                                <h4 class="topic-info-title">Class Name: ${register.group.groupName}</h4>
                                <h6 class="topic-info-subtitle mb-2">Topic Name: ${register.group.topic.topicName}</h6>
                                <h6 class="topic-info-subtitle mb-2">Lecturer: ${register.group.lectureInfo.fullName}</h6>
                                <h6 class="topic-info-subtitle mb-2">Start Date: ${register.registerDate}</h6>
                                <a href="#" class="topic-info-link">More Details</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div class="show-all">
                    <a href="#" id="showAllBtn">Show all topic</a>
                    <a href="#" id="showLessBtn" style="display: none;">Show less</a>
                </div>
            </div>



        </div>
        <!-- End of header section -->

        <div>

        </div>

        <!-- Footer section -->
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

        <script>
            document.addEventListener("DOMContentLoaded", function () {
// Lấy nút "Join group" và ô input
            var joinGroupBtn = document.getElementById("joinGroupBtn");
                    var joinGroupInput = document.getElementById("joinGroupInput");
// Thêm sự kiện click vào nút "Join group"
                    joinGroupBtn.addEventListener("click", function (event) {
                    event.preventDefault(); // Ngăn chặn hành động mặc định của nút "Join group"

                            // Hiển thị ô input khi click vào nút "Join group"
                            joinGroupInput.style.display = "inline-block";
                    });
                    // Sau khi xử lý xong, có thể ẩn ô input đi
            });
            }
            );

        </script>
    </body>

</html>
