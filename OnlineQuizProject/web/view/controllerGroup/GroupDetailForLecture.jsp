<%-- 
    Document   : GroupDetailForLecture
    Created on : Mar 15, 2024, 12:10:37 AM
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
        <!--<script src="js/homeLecture.js"></script>-->
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

            /* Dropdown menu */
            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #000; /* New color for the dropdown background */
                min-width: 204px;
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: white; /* New color for the dropdown text */
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {
                background-color: #444; /* New color for the dropdown hover background */
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropbtn {
                background-color: transparent;
                color: #fff;
                padding: 16px;
                font-size: 16px;
                border: none;
                cursor: pointer;
            }

            .dropbtn:hover {
                background-color: #0056b3;
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
                        <a href="home">QUIZWIZ</a>
                    </div>

                    <div class="menu-icon col-md-1">
                        <div class="dropdown">
                            <button class="dropbtn" style="font-size: 19px;"><i class="fa-solid fa-bars" style="padding-right: 4px;"></i>Menu</button>
                            <div class="dropdown-content">
                                <a href="<%= request.getContextPath() %>/show-list-group-exam"><i class="fa-solid fa-plus"></i> Create An Exam</a>
                                <a href="<%= request.getContextPath() %>/group-management"><i class="fa-solid fa-user-group"></i></i> Group Management</a>
                                <a href="<%= request.getContextPath() %>/home"><i class="fa-solid fa-rotate-left"></i> Return Home</a>
                            </div>
                        </div>
                    </div>


                    <!-- Search container -->
                    <form action="search" method="GET" class=" col-md-6">
                        <div class="search-container" style="width: 100%;">
                            <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi...">
                            <button type="submit" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>

                    <!-- Login section -->
                    <div class="login col-md-2">
                        <ul id="nav" class="nav nav-pills">
                            <li class="nav-item dropdown">
                                <div class="circle-background">
                                    <img class="profile-image" src="image/avatar.jpg" alt="Profile Image">
                                </div>
                                <ul class="subnav">
                                    <li><a href="<%= request.getContextPath() %>/UserDetail"><i class="fa-solid fa-user"></i> User Details</a></li>
                                    <li><a href="<%= request.getContextPath() %>/change-password-lecture"><i class="fa-solid fa-lock"></i> Change Password</a></li>
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

            <!-- Table for displaying class information -->
            <table class="table class-table">
                <thead>
                    <tr style="font-size: 30px;">
                        <th scope="col">Group Management</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="group" items="${requestScope.listGroup}">
                        <c:if test="${group.groupId == groupId}">
                            <tr>
                                <td>
                                    <p><strong>Group Name: </strong> ${group.groupName}</p>
                                    <p><strong>Topic Name: </strong>${group.topic.topicName}</p>
                                    <p><strong>Lecture: </strong>${group.lectureInfo.fullName}</p>
                                    <p><strong>Status: </strong>${group.status.statusName}</p>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Table for listing exams -->
            <table class="table exam-table">
                <thead>
                    <tr>
                        <th scope="col">Exam Title</th>
                        <th scope="col">StartDate</th>
                        <th scope="col">EndDate</th>
                        <th scope="col">Time</th>
                        <th scope="col">Status</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="exam" items="${requestScope.listExamOfGroup}">
                        <c:if test="${exam.group.groupId == groupId}">
                        <form action="show-result-test-list-student" method="POST">
                            <input hidden="hidden" name="groupID" value="${groupId}">
                            <input hidden="hidden" name="examId" value="${exam.examId}">
                            <tr>
                                <td>${exam.examTitle}</td>
                                <td>${exam.examStartDate}</td>
                                <td>${exam.examEndDate}</td>
                                <td>${exam.examTime}</td>
                                <td>${exam.status.statusName}</td>
                                <td><button type="submit" class="btn btn-primary">View Detail</button></td>
                            </tr>
                        </form>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </form>

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

