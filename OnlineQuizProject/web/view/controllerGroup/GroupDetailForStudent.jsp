<%-- 
    Document   : GroupDetailForLecture
    Created on : Mar 13, 2024, 3:22:35 AM
    Author     : nghia
--%>

<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    LocalDateTime currentTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
    String formattedDateTime = currentTime.format(formatter);
    LocalDateTime currentDateTime = LocalDateTime.parse(formattedDateTime, formatter);
%>
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
                            <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm topic hoặc group...">
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

            <table class="table class-table">
                <thead>
                    <tr style="font-size: 30px;">
                        <th scope="col">Group Information</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="register" items="${requestScope.listRegister}">
                        <c:if test="${register.group.groupId == groupId}">
                            <tr>
                                <td>
                                    <p><strong>Group Name: </strong>${register.group.topic.topicName}</p>
                                    <p><strong>Topic Name: </strong>${register.group.topic.topicName}</p>
                                    <p><strong>Lecture: </strong>${register.group.lectureInfo.fullName}</p>
                                    <p><strong>Start Date: </strong>${register.registerDate}</p>
                                    <p><strong>Status: </strong>${register.group.status.statusName}</p>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>


            <!-- Bảng danh sách các Exam -->
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Exam</button>
                    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Practice</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"> <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Exam Title</th>
                                <th scope="col">Start Date</th>
                                <th scope="col">End Date</th>
                                <th scope="col">Time</th>
                                <th scope="col">Attempt</th>
                                <th scope="col">Status</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="listCheckAttemptLimit" value="${listCheckAttemptLimit}" scope="request" />

                            <c:choose>
                                <c:when test="${empty requestScope.listExamOfGroup}">
                                    <tr>
                                        <td colspan="7">There are currently no exams available.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="exam" items="${requestScope.listExamOfGroup}">
                                        <c:if test="${exam.isPractice == false}">
                                            <tr>
                                                <td>${exam.examTitle}</td>
                                                <td>${exam.examStartDate}</td>
                                                <td><fmt:formatDate value="${exam.examEndDate}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
                                                <td>${exam.examTime}</td>
                                                <td>${exam.examAttemp}</td>
                                                <td>${exam.status.statusName}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${exam.status.statusId==2}">
                                                            <button class="btn btn-secondary">Not Open Yet</button>
                                                        </c:when>
                                                        <c:when test="${exam.status.statusId==3}">
                                                            <button class="btn btn-danger">Closed</button>
                                                        </c:when>
                                                        <c:when test="${listCheckAttemptLimit.get(listExamOfGroup.indexOf(exam))!=true}">
                                                            Attempt Limit
                                                        </c:when>
                                                        <c:otherwise>
                                                            <form action="${pageContext.request.contextPath}/take-exam" method="GET">
                                                                <input type="hidden" name="examId" value="${exam.examId}">
                                                                <button type="submit" class="btn btn-primary">Do Exam</button>
                                                            </form>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>

                        </tbody>
                    </table>
                </div>
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"> <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Exam Title</th>
                                    <th scope="col">Start Date</th>
                                    <th scope="col">End Date</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Attempt</th>
                                    <th scope="col">Status</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="listCheckAttemptLimit" value="${listCheckAttemptLimit}" scope="request" />

                                <c:choose>
                                    <c:when test="${empty requestScope.listExamOfGroup}">
                                        <tr>
                                            <td colspan="7">There are currently no practices available.</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="exam" items="${requestScope.listExamOfGroup}">
                                            <c:if test="${exam.isPractice == true}">
                                                <tr>
                                                    <td>${exam.examTitle}</td>
                                                    <td>${exam.examStartDate}</td>
                                                    <td><fmt:formatDate value="${exam.examEndDate}" pattern="dd/MM/yyyy HH:mm:ss" /></td>
                                                    <td>${exam.examTime}</td>
                                                    <td>${exam.examAttemp}</td>
                                                    <td>${exam.status.statusName}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${exam.status.statusId==2}">
                                                                <button class="btn btn-secondary">Not Open Yet</button>
                                                            </c:when>
                                                            <c:when test="${exam.status.statusId==3}">
                                                                <button class="btn btn-danger">Closed</button>
                                                            </c:when>
                                                            <c:when test="${listCheckAttemptLimit.get(listExamOfGroup.indexOf(exam))!=true}">
                                                                Attempt Limit
                                                            </c:when>
                                                            <c:otherwise>
                                                                <form action="${pageContext.request.contextPath}/take-exam" method="GET">
                                                                    <input type="hidden" name="examId" value="${exam.examId}">
                                                                    <button type="submit" class="btn btn-primary">Do Exam</button>
                                                                </form>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>

                            </tbody>
                        </table>
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

