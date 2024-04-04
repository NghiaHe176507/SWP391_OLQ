<%-- 
    Document   : Achivement
    Created on : Apr 4, 2024, 3:02:56 PM
    Author     : nghia
--%>

<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

            .container {
                flex: 1;
            }

            #footer {
                background-color: #333;
                color: #fff;
                padding: 10px 0;
                text-align: center;
                width: 100%;
            }
            .achievement-container {
                width: 80%;
                margin: 0 auto;
            }
            .achievement-title {
                margin-bottom: 20px;
            }
            .achievement-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }
            .achievement-table th, .achievement-table td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }
            .achievement-table th {
                background-color: #f2f2f2;
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
                        <a href="#">QUIZWIZ</a>
                    </div>
                    <div class="menu-icon col-md-1">
                        <div class="dropdown">
                            <button class="dropbtn" style="font-size: 19px;"><i class="fa-solid fa-bars" style="padding-right: 4px;"></i>Menu</button>
                            <div class="dropdown-content">
                                <a href="<%= request.getContextPath() %>/history-group">History Group</a>
                                <a href="<%= request.getContextPath() %>/home"><i class="fa-solid fa-rotate-left"></i> Return Home</a>
                            </div>
                        </div>
                    </div>

                    <!-- Search container -->
                    <form action="search" method="GET" class=" col-md-6">
                        <div class="search-container" style="width: 100%;">
                            <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm...">
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
                                    <li><a href="<%= request.getContextPath() %>/change-password-student"><i class="fa-solid fa-lock"></i> Change Password</a></li>
                                    <li><a href="<%= request.getContextPath() %>/achivement"><i class="fa-solid fa-trophy"></i> Achievement</a></li>
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

            <div class="achievement-container">
                <div class="achievement-title">
                    <h2 style="font-size: 30px; font-weight: bold;">Your achievements <i class="fa-solid fa-trophy"></i></h2>
                    <h7 style="color: #6c757d">"Dare to Quiz, Excel to Win! - Your Journey to Quiz Mastery with QuizWiz"</h7>
                </div>

                <%--<c:set var="totalScore" value="0" />
                <c:set var="countResults" value="0" />--%>
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Exam</button>
                        <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Practice</button>

                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <table class="achievement-table" style="margin-bottom: 15px">
                            <thead>
                                <c:set var="headerDisplayed" value="false" />

                                <c:if test="${not headerDisplayed}">
                                    <tr>
                                        <th style="text-align: center; width: 16.66%;">Exam Title</th>
                                        <th style="text-align: center; width: 16.66%;">Start Date</th>
                                        <th style="text-align: center; width: 16.66%;">End Date</th>
                                        <th style="text-align: center; width: 16.66%;">Time</th>
                                        <th style="text-align: center; width: 16.66%;">Attempt Number</th>
                                        <th style="text-align: center; width: 16.66%;"></th>
                                    </tr>
                                    <c:set var="headerDisplayed" value="true" />
                                </c:if>
                            </thead>
                            <tbody>
                                <c:set var="currentGroupId" value="" />
                                <c:set var="displayedExamIds" value="" />

                                <c:forEach var="result" items="${requestScope.listResult}">
                                    <c:if test="${result.exam.isPractice eq false}">
                                        <c:if test="${!result.exam.group.groupId.equals(currentGroupId)}">
                                            <tr onclick="toggleRows('${result.exam.group.groupId}')">
                                                <td style="text-align: center;font-size: 18px;" colspan="6">
                                                    <b>${result.exam.group.groupName} - ${result.exam.group.topic.topicName} <i class="fa-solid fa-caret-down"></i></b>
                                                </td>
                                            </tr>
                                            <c:set var="currentGroupId" value="${result.exam.group.groupId}" />

                                            <c:forEach var="exam" items="${requestScope.listResult}">

                                                <c:if test="${not exam.exam.isPractice}">
                                                    <c:if test="${exam.exam.group.groupId eq result.exam.group.groupId}">
                                                        <c:if test="${not fn:contains(displayedExamIds, exam.exam.examId)}">

                                                            <tr style="display: none;" data-group-id="${result.exam.group.groupId}">
                                                                <td style="text-align: center;">${exam.exam.examTitle}</td>
                                                                <td style="text-align: center;">${exam.exam.examStartDate}</td>
                                                                <td style="text-align: center;">${exam.exam.examEndDate}</td>
                                                                <td style="text-align: center;">${exam.exam.examTime}</td>
                                                                <td style="text-align: center;">${exam.exam.examAttemp}</td>
                                                                <td style="text-align: center;">
                                                                    <form action="${pageContext.request.contextPath}/achivement-detail" method="POST">
                                                                        <input type="hidden" name="GroupId" value="${exam.exam.group.groupId}">
                                                                        <input type="hidden" name="resultId" value="${exam.exam.examId}">
                                                                        <input type="hidden" name="check" value="false">
                                                                        <input type="hidden" name="examId" value="${exam.exam.examId}">
                                                                        <button type="submit" class="btn btn-secondary view-details-btn">View Detailed</button>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                            <c:set var="displayedExamIds" value="${displayedExamIds},${exam.exam.examId}" />
                                                        </c:if>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:if>
                                </c:forEach>

                            <script>
                                function toggleRows(groupId) {
                                    var rows = document.querySelectorAll('tr[data-group-id="' + groupId + '"]');
                                    rows.forEach(function (row) {
                                        if (row.style.display === 'none') {
                                            row.style.display = '';
                                        } else {
                                            row.style.display = 'none';
                                        }
                                    });
                                }
                            </script>

                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                        <table class="achievement-table" style="margin-bottom: 15px">
                            <thead>
                                <c:set var="headerDisplayed" value="false" />

                                <c:if test="${not headerDisplayed}">
                                    <tr>
                                        <th style="text-align: center; width: 200px;">Practice Title</th>
                                        <th style="width: 200px;"></th>

                                    </tr>
                                    <c:set var="headerDisplayed" value="true" />
                                </c:if>
                            </thead>
                            <tbody>
                                <c:set var="currentGroupId" value="" />
                                <c:set var="displayedExamIds" value="" />

                                <c:forEach var="result" items="${requestScope.listResult}">
                                    <c:if test="${result.exam.isPractice eq true}">
                                        <c:if test="${!result.exam.group.groupId.equals(currentGroupId)}">
                                            <tr onclick="toggleRows('${result.exam.group.groupId}')">
                                                <td style="text-align: center;font-size: 18px;" colspan="6">
                                                    <b>${result.exam.group.groupName} - ${result.exam.group.topic.topicName} <i class="fa-solid fa-caret-down"></i></b>
                                                </td>
                                            </tr>
                                            <c:set var="currentGroupId" value="${result.exam.group.groupId}" />

                                            <c:forEach var="exam" items="${requestScope.listResult}">

                                                <c:if test="${exam.exam.isPractice}">
                                                    <c:if test="${exam.exam.group.groupId eq result.exam.group.groupId}">
                                                        <c:if test="${not fn:contains(displayedExamIds, exam.exam.examId)}">

                                                            <tr style="display: none;" data-group-id="${result.exam.group.groupId}">
                                                                <td style="text-align: center;">${exam.exam.examTitle}</td>
                                                                <td style="text-align: center;">
                                                                    <form action="${pageContext.request.contextPath}/achivement-detail" method="POST">
                                                                        <input type="hidden" name="GroupId" value="${exam.exam.group.groupId}">
                                                                        <input type="hidden" name="check" value="false">
                                                                        <input type="hidden" name="resultId" value="${exam.exam.examId}">
                                                                        <input type="hidden" name="examId" value="${exam.exam.examId}">
                                                                        <button type="submit" class="btn btn-secondary view-details-btn">View Detailed</button>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                            <c:set var="displayedExamIds" value="${displayedExamIds},${exam.exam.examId}" />
                                                        </c:if>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div> 

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

