<%-- 
    Document   : ViewTotalResultTest
    Created on : 27 Feb 2024, 11:10:52 pm
    Author     : tuann
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
        <link rel="stylesheet" href="css/totalResultTest.css">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/homeStudent.js"></script>
    </head>

    <body>
        <form action="home" method="POST">
            <!-- Main container div -->
            <div class="container">
                <!-- Header section -->
                <div class="row">
                    <div class="header">
                        <!-- Logo -->
                        <div class="logo col-md-2">
                            <a href="home">QUIZWIZ</a>
                        </div>

                        <!-- Search container -->
                        <form action="search" method="GET" class="col-md-6">
                            <div class="search-container" style="width:100%;">
                                <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi, topic hoặc group...">
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
                                        <li><a href="<%= request.getContextPath() %>/UserDetail"><i class="fa-solid fa-user"></i> User
                                                Details</a></li>
                                        <li><a href="<%= request.getContextPath() %>/change-password-student"><i class="fa-solid fa-lock"></i> Change Password</a></li>
                                        <li><a><i class="fa-solid fa-trophy"></i> Achievement</a></li>
                                        <li><a href="<%= request.getContextPath() %>/logout"><i class="fa-solid fa-right-from-bracket"></i>
                                                Log out</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Empty space -->
                <div class="row" style="margin-left: 13px;">
                    <div class="space"></div>

                    <!-- Test Result Section -->
                    <div class="row">
                        <div class="student-details col-md-8 offset-md-2">
                            <h2>Student Work Details</h2>
                            <div class="details">
                                <div class="row">
                                    <div class="col-md-6" style="padding-left: 90px;">
                                        <p><strong>Name:</strong> ${resultTotalExam.studentInfo.fullName}</p>
                                        <p><strong>Class:</strong> ${resultTotalExam.exam.group.groupName}</p>
                                        <p><strong>Subject:</strong> ${resultTotalExam.exam.examTitle} </p>
                                    </div>
                                    <div class="col-md-6" style="padding-left: 120px;">
                                        <p><strong>Assignment:</strong> ${resultTotalExam.exam.group.topic.topicName}</p>
                                        <p><strong>Submitted Date:</strong> ${resultTotalExam.exam.examEndDate}</p>
                                        <p><strong>Status:</strong> ${resultTotalExam.exam.status.statusName}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="grade">
                                    <h3>Grading Details</h3>
                                    <p><strong>Time Exam</strong> ${resultTotalExam.exam.examTime}</p>
                                    <p><strong>Score:</strong> ${resultTotalExam.score}</p>
                                    <p><strong>Comments:</strong> 
                                        <c:choose>
                                            <c:when test="${resultTotalExam.score >= 9}">
                                                Excellent performance! Keep up the great work!
                                            </c:when>
                                            <c:when test="${resultTotalExam.score >= 8}">
                                                Well done! You've achieved a commendable score.
                                            </c:when>
                                            <c:when test="${resultTotalExam.score >= 4}">
                                                You've passed the exam. Keep practicing to improve further.
                                            </c:when>
                                            <c:otherwise>
                                                Your score is below passing. Keep studying and aim for improvement.
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </div>
                            <div class="actions">
                                <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Back to Home</a>
                                <form id="examForm" action="${pageContext.request.contextPath}/view-detail-result" method="POST">
                                    <input type="hidden" id="examId" name="examId" value="${examId}">
                                    <input type="hidden" id="studentInfoId" name="studentInfoId" value="${studentInfoId}">
                                    <input type="hidden" id="resultNumber" name="resultNumber" value="${requestScope.newResult.attemptNumber}">
                                    <button type="submit" id="viewResultsBtn" class="btn btn-secondary">View Detailed Results</button>
                            </div>
                            </form>

                        </div>
                    </div>
                    <!-- End of Test Result Section -->

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
                </div>
                <!-- End of main container div -->
            </div>
            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
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
