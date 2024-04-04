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
                        <a href="${pageContext.request.contextPath}/home">Return Home</a>
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
                    <h2 style="font-size: 30px; font-weight: bold;">Your achievements</h2>
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
                                <tr>
                                    <th style="text-align: center;">Group Information</th>
                                    <th style="text-align: center;">Exam Title</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:set var="currentGroupId" value="" />
                                <c:forEach var="result" items="${requestScope.listResult}">
                                    <c:if test="${result.exam.isPractice eq false}">
                                        <c:if test="${!result.exam.group.groupId.equals(currentGroupId)}">
                                            <tr>
                                                <td style="text-align: center;">
                                                    <b>${result.exam.group.groupName} - ${result.exam.group.topic.topicName}</b>
                                                </td>
                                                <td >
                                                    <form style="text-align: center;" action="${pageContext.request.contextPath}/achivement-detail" method="POST">
                                                        <select name="resultId">
                                                            <option value="">Choose an exam</option>
                                                            <c:set var="addedExamIds" value="" />
                                                            <c:forEach var="exam" items="${requestScope.listResult}">
                                                                <c:if test="${not exam.exam.isPractice}">
                                                                    <c:if test="${exam.exam.group.groupId eq result.exam.group.groupId}">
                                                                        <c:if test="${not fn:contains(addedExamIds, exam.exam.examId)}">
                                                                            <option value="${exam.exam.examId}">
                                                                                ${exam.exam.examTitle}
                                                                            </option>
                                                                            <c:set var="addedExamIds" value="${addedExamIds},${exam.exam.examId}" />
                                                                        </c:if>
                                                                    </c:if>
                                                                </c:if>
                                                            </c:forEach>

                                                        </select>
                                                        <input type="hidden" name="GroupId" value="${result.exam.group.groupId}">
                                                        <input type="hidden" name="check" value="false">
                                                        </td>
                                                        <td style="text-align: center;">
                                                            <button type="submit" class="btn btn-secondary">View Detailed</button>
                                                    </form>
                                                </td>
                                            </tr>

                                            <c:set var="currentGroupId" value="${result.exam.group.groupId}" />
                                        </c:if>
                                    </c:if>
                                </c:forEach>


                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                        <table class="achievement-table" style="margin-bottom: 15px">
                            <thead>
                                <tr>
                                    <th style="text-align: center;">Group Information</th>
                                    <th style="text-align: center;">Exam Title</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:set var="currentGroupId" value="" />
                                <c:forEach var="result" items="${requestScope.listResult}">
                                    <c:if test="${result.exam.isPractice eq true}">
                                        <c:if test="${!result.exam.group.groupId.equals(currentGroupId)}">
                                            <tr>
                                                <td style="text-align: center;">
                                                    <b>${result.exam.group.groupName} - ${result.exam.group.topic.topicName}</b>
                                                </td>
                                                <td >
                                                    <form style="text-align: center;" action="${pageContext.request.contextPath}/achivement-detail" method="POST">
                                                        <select name="resultId">
                                                            <option value="">Choose an exam</option>
                                                            <c:set var="addedExamIds" value="" />
                                                            <c:forEach var="exam" items="${requestScope.listResult}">
                                                                <c:if test="${exam.exam.isPractice}">
                                                                    <c:if test="${exam.exam.group.groupId eq result.exam.group.groupId}">
                                                                        <c:if test="${not fn:contains(addedExamIds, exam.exam.examId)}">
                                                                            <option value="${exam.exam.examId}">
                                                                                ${exam.exam.examTitle}
                                                                            </option>
                                                                            <c:set var="addedExamIds" value="${addedExamIds},${exam.exam.examId}" />
                                                                        </c:if>
                                                                    </c:if>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                        <input type="hidden" name="GroupId" value="${result.exam.group.groupId}">
                                                        <input type="hidden" name="check" value="true">
                                                        </td>
                                                        <td style="text-align: center;">
                                                            <button type="submit" class="btn btn-secondary">View Detailed</button>
                                                    </form>
                                                </td>
                                            </tr>

                                            <c:set var="currentGroupId" value="${result.exam.group.groupId}" />
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

