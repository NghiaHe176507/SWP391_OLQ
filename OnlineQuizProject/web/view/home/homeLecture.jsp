<%-- 
    Document   : homeLecture
    Created on : Jan 28, 2024, 12:37:46 AM
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
        <link rel="stylesheet" href="css/homeLecture.css">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/homeLecture.js"></script>
        <style>
            /* CSS cho button */
            .btn-primary {
                background-color: white; /* Màu nền trắng */
                color: #007bff; /* Màu chữ mặc định */
                border: 1px solid #007bff; /* Viền button */
                transition: background-color 0.3s ease, color 0.3s ease; /* Hiệu ứng chuyển đổi màu nền và màu chữ */
            }

            .btn-primary:hover {
                background-color: #007bff; /* Màu nền khi hover */
                color: white; /* Màu chữ khi hover */
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
                        <a href="#"><i class="fa-solid fa-plus"></i> Tạo đề thi</a>
                    </div>

                    <!-- Search container -->
                    <form action="search" method="GET">
                        <div class="search-container col-md-5">
                            <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi...">
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
                <c:forEach var="group" items="${requestScope.listGroup}" varStatus="loop">
                    <div class="col-md-4 mb-3">
                        <div class="topic-info" style="width: 18rem;">
                            <div class="topic-info-body">
                                <h5 class="topic-info-title">Class Name: ${group.groupName}</h5>
                                <h6 class="topic-info-subtitle mb-2">Topic: ${group.topic.topicName}</h6>

                                <c:choose>
                                    <c:when test="${group.groupInviteCode == null}">
                                        <!-- Button khi chưa có Invite Code -->
                                        <button class="btn btn-primary mb-2" onclick="this.parentNode.submit();return false; showInput(${group.groupId})">Add Invite Code</button>
                                        <!-- Ô input và nút submit, ẩn ban đầu -->
                                        <div id="inviteCode_${group.groupId}" style="display: none;">
                                            <input type="text" id="inviteInput_${group.groupId}" class="form-control mb-2" name="inviteCode" placeholder="Enter Invite Code">
                                            <button class="btn btn-success" onclick="submitInviteCode(${group.groupId})">Submit</button>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Hiển thị Invite Code nếu đã có -->
                                        <h6 class="topic-info-subtitle mb-2">Invite Code: ${group.groupInviteCode}</h6>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${group.status.statusName eq 'Active'}">
                                        <p class="topic-info-text text-success" style="margin-bottom: 0;font-weight: bold;">${group.status.statusName}</p>
                                    </c:when>
                                    <c:when test="${group.status.statusName eq 'Pending'}">
                                        <p class="topic-info-text text-secondary" style="margin-bottom: 0;font-weight: bold;">${group.status.statusName}</p>
                                    </c:when>
                                    <c:when test="${group.status.statusName eq 'Closed'}">
                                        <p class="topic-info-text text-danger" style="margin-bottom: 0;font-weight: bold;">${group.status.statusName}</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="topic-info-text" style="margin-bottom: 0">${group.status.statusName}</p>
                                    </c:otherwise>
                                </c:choose>
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

    </body>

</html>
