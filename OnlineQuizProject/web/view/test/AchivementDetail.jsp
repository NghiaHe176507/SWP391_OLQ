<%-- 
    Document   : achievement
    Created on : Apr 4, 2024, 3:46:45 AM
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
                        <a href="${pageContext.request.contextPath}/achivement">Back</a>
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
                        <c:choose>
                            <c:when test="${check}">
                                <input class="nav-link active" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="true" value="Practice">
                            </c:when>
                            <c:otherwise>
                                <input class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true" value="Exam">
                            </c:otherwise>
                        </c:choose>
                    </div>
                </nav>



                <div class="tab-content" id="nav-tabContent">

                    <table class="achievement-table" style="margin-bottom: 15px">
                        <thead>
                            <tr>
                                <th style="text-align: center;">Exam Title</th>
                                <th style="text-align: center;">Group Name</th>
                                <th style="text-align: center;">Score</th>
                                <th style="text-align: center;">Attempt Number</th>
                                <th style="text-align: center;">Status</th>
                                <th></th>
                            </tr>
                        </thead>
                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                            <tbody>
                                <c:set var="totalScore" value="0" />
                                <c:set var="countResults" value="0" />
                                <c:set var="currentExamId" value="" />
                                <c:set var="averageScore" value="0" />
                                <c:set var="roundedAverage" value="0" />

                                <c:forEach var="result" items="${requestScope.listResult}">
                                    <c:if test="${result.exam.isPractice eq false}">
                                        <c:if test="${result.exam.group.groupId eq GroupId && result.exam.examId eq selectedResultId}">
                                            <c:choose>
                                                <c:when test="${result.exam.examId ne currentExamId}">
                                                    <c:if test="${countResults > 0}">
                                                        <c:set var="averageScore" value="${totalScore / countResults * 10}" />
                                                        <c:set var="roundedAverage" value="${Math.round(averageScore)}" />

                                                        <tr>
                                                            <td colspan="6" style="border-top: none">
                                                                <c:choose>
                                                                    <c:when test="${roundedAverage < 0.5 && roundedAverage >= 0.0}">
                                                                        <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                                            <div class="progress-bar" style="width: ${100}%; background-color: #ccc; color: #000">0%</div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${roundedAverage > 0.5 && roundedAverage <= 5}">
                                                                        <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                                            <div class="progress-bar bg-danger" style="width: ${5}%">${roundedAverage}%</div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${roundedAverage >= 5 && roundedAverage <= 25}">
                                                                        <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                                            <div class="progress-bar bg-danger" style="width: ${25}%">${roundedAverage}%</div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${roundedAverage > 25 && roundedAverage <= 50}">
                                                                        <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                                            <div class="progress-bar bg-warning" style="width: ${50}%">${roundedAverage}%</div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${roundedAverage > 50 && roundedAverage <= 75}">
                                                                        <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                                            <div class="progress-bar bg-info" style="width: ${75}%">${roundedAverage}%</div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                                            <div class="progress-bar bg-success" style="width: ${100}%">${roundedAverage}%</div>
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </c:if>

                                                    <tr>
                                                        <td colspan="6"><b>${result.exam.group.groupName} - ${result.exam.group.topic.topicName}</b></td>
                                                    </tr>

                                                    <c:set var="currentExamId" value="${result.exam.examId}" />
                                                    <c:set var="totalScore" value="${result.score}" />
                                                    <c:set var="countResults" value="1" />
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="totalScore" value="${totalScore + result.score}" />
                                                    <c:set var="countResults" value="${countResults + 1}" />
                                                </c:otherwise>
                                            </c:choose>

                                            <tr>
                                                <td style="text-align: center;">${result.exam.examTitle}</td>
                                                <td style="text-align: center;">${result.exam.group.groupName}</td>
                                                <td style="text-align: center;">${result.score}</td>
                                                <td style="text-align: center;">${result.attemptNumber}</td>
                                                <td style="text-align: center;">
                                                    <c:choose>
                                                        <c:when test="${result.exam.status.statusId eq 1}">
                                                            <span style="background-color: #28a745; padding: 5px; color: white; border: 1px solid #28a745; border-radius: 3px;">${result.exam.status.statusName}</span>
                                                        </c:when>
                                                        <c:when test="${result.exam.status.statusId eq 2}">
                                                            <span style="background-color: #6c757d; padding: 5px; color: white; border: 1px solid #6c757d; border-radius: 3px;">${result.exam.status.statusName}</span>
                                                        </c:when>
                                                        <c:when test="${result.exam.status.statusId eq 3}">
                                                            <span style="background-color: #dc3545; padding: 5px; color: white; border: 1px solid #dc3545; border-radius: 3px;">${result.exam.status.statusName}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span>${result.exam.status.statusName}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td style="text-align: center;">
                                                    <c:choose>
                                                        <c:when test="${result.exam.isPractice eq true || result.exam.status.statusId eq 3}">
                                                            <form id="examForm" action="${pageContext.request.contextPath}/view-detail-result" method="POST">
                                                                <input type="hidden" id="examId" name="examId" value="${result.exam.examId}">
                                                                <input type="hidden" id="studentInfoId" name="studentInfoId" value="${studentInfoId}">
                                                                <input type="hidden" id="resultNumber" name="resultNumber" value="${result.attemptNumber}">
                                                                <button type="submit" id="viewResultsBtn" class="btn btn-secondary">View Detailed Results</button>
                                                            </form>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <!-- Handle the 'otherwise' case here -->
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:if>
                                </c:forEach>

                                <c:if test="${countResults > 0}">
                                    <c:set var="averageScore" value="${totalScore / countResults * 10}" />
                                    <c:set var="roundedAverage" value="${Math.round(averageScore)}" />

                                    <tr>
                                        <td colspan="6" style="border-top: none">
                                            <c:choose>
                                                <c:when test="${roundedAverage < 0.5 && roundedAverage >= 0.0}">
                                                    <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                        <div class="progress-bar" style="width: ${100}%; background-color: #ccc; color: #000">0%</div>
                                                    </div>
                                                </c:when>
                                                <c:when test="${roundedAverage > 0.5 && roundedAverage <= 5}">
                                                    <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                        <div class="progress-bar bg-danger" style="width: ${5}%">${roundedAverage}%</div>
                                                    </div>
                                                </c:when>
                                                <c:when test="${roundedAverage >= 5 && roundedAverage <= 25}">
                                                    <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                        <div class="progress-bar bg-danger" style="width: ${25}%">${roundedAverage}%</div>
                                                    </div>
                                                </c:when>
                                                <c:when test="${roundedAverage > 25 && roundedAverage <= 50}">
                                                    <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                        <div class="progress-bar bg-warning" style="width: ${50}%">${roundedAverage}%</div>
                                                    </div>
                                                </c:when>
                                                <c:when test="${roundedAverage > 50 && roundedAverage <= 75}">
                                                    <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                        <div class="progress-bar bg-info" style="width: ${75}%">${roundedAverage}%</div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                        <div class="progress-bar bg-success" style="width: ${100}%">${roundedAverage}%</div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </div>





                        <div class="tab-pane fade show active" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                            <tbody>
                                <c:set var="totalScore" value="0" />
                                <c:set var="countResults" value="0" />
                                <c:set var="currentExamId" value="" />
                                <c:set var="averageScore" value="0" />
                                <c:set var="roundedAverage" value="0" />

                                <c:forEach var="result" items="${requestScope.listResult}">
                                    <c:if test="${result.exam.isPractice eq true}">
                                        <c:if test="${result.exam.group.groupId eq GroupId && result.exam.examId eq selectedResultId}">
                                            <c:choose>
                                                <c:when test="${result.exam.examId ne currentExamId}">
                                                    <c:if test="${countResults > 0}">
                                                        <c:set var="averageScore" value="${totalScore / countResults * 10}" />
                                                        <c:set var="roundedAverage" value="${Math.round(averageScore)}" />

                                                        <tr>
                                                            <td colspan="6" style="border-top: none">
                                                                <c:choose>
                                                                    <c:when test="${roundedAverage < 0.5 && roundedAverage >= 0.0}">
                                                                        <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                                            <div class="progress-bar" style="width: ${100}%; background-color: #ccc; color: #000">0%</div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${roundedAverage > 0.5 && roundedAverage <= 5}">
                                                                        <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                                            <div class="progress-bar bg-danger" style="width: ${5}%">${roundedAverage}%</div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${roundedAverage >= 5 && roundedAverage <= 25}">
                                                                        <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                                            <div class="progress-bar bg-danger" style="width: ${25}%">${roundedAverage}%</div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${roundedAverage > 25 && roundedAverage <= 50}">
                                                                        <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                                            <div class="progress-bar bg-warning" style="width: ${50}%">${roundedAverage}%</div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${roundedAverage > 50 && roundedAverage <= 75}">
                                                                        <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                                            <div class="progress-bar bg-info" style="width: ${75}%">${roundedAverage}%</div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                                            <div class="progress-bar bg-success" style="width: ${100}%">${roundedAverage}%</div>
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </c:if>

                                                    <tr>
                                                        <td colspan="6"><b>${result.exam.group.groupName} - ${result.exam.group.topic.topicName}</b></td>
                                                    </tr>

                                                    <c:set var="currentExamId" value="${result.exam.examId}" />
                                                    <c:set var="totalScore" value="${result.score}" />
                                                    <c:set var="countResults" value="1" />
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="totalScore" value="${totalScore + result.score}" />
                                                    <c:set var="countResults" value="${countResults + 1}" />
                                                </c:otherwise>
                                            </c:choose>

                                            <tr>
                                                <td style="text-align: center;">${result.exam.examTitle}</td>
                                                <td style="text-align: center;">${result.exam.group.groupName}</td>
                                                <td style="text-align: center;">${result.score}</td>
                                                <td style="text-align: center;">${result.attemptNumber}</td>
                                                <td style="text-align: center;">
                                                    <c:choose>
                                                        <c:when test="${result.exam.status.statusId eq 1}">
                                                            <span style="background-color: #28a745; padding: 5px; color: white; border: 1px solid #28a745; border-radius: 3px;">${result.exam.status.statusName}</span>
                                                        </c:when>
                                                        <c:when test="${result.exam.status.statusId eq 2}">
                                                            <span style="background-color: #6c757d; padding: 5px; color: white; border: 1px solid #6c757d; border-radius: 3px;">${result.exam.status.statusName}</span>
                                                        </c:when>
                                                        <c:when test="${result.exam.status.statusId eq 3}">
                                                            <span style="background-color: #dc3545; padding: 5px; color: white; border: 1px solid #dc3545; border-radius: 3px;">${result.exam.status.statusName}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span>${result.exam.status.statusName}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td style="text-align: center;">
                                                    <c:choose>
                                                        <c:when test="${result.exam.isPractice eq true || result.exam.status.statusId eq 3}">
                                                            <form id="examForm" action="${pageContext.request.contextPath}/view-detail-result" method="POST">
                                                                <input type="hidden" id="examId" name="examId" value="${result.exam.examId}">
                                                                <input type="hidden" id="studentInfoId" name="studentInfoId" value="${studentInfoId}">
                                                                <input type="hidden" id="resultNumber" name="resultNumber" value="${result.attemptNumber}">
                                                                <button type="submit" id="viewResultsBtn" class="btn btn-secondary">View Detailed Results</button>
                                                            </form>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <!-- Handle the 'otherwise' case here -->
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:if>
                                </c:forEach>

                                <c:if test="${countResults > 0}">
                                    <c:set var="averageScore" value="${totalScore / countResults * 10}" />
                                    <c:set var="roundedAverage" value="${Math.round(averageScore)}" />

                                    <tr>
                                        <td colspan="6" style="border-top: none">
                                            <c:choose>
                                                <c:when test="${roundedAverage < 0.5 && roundedAverage >= 0.0}">
                                                    <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                        <div class="progress-bar" style="width: ${100}%; background-color: #ccc; color: #000">0%</div>
                                                    </div>
                                                </c:when>
                                                <c:when test="${roundedAverage > 0.5 && roundedAverage <= 5}">
                                                    <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                        <div class="progress-bar bg-danger" style="width: ${5}%">${roundedAverage}%</div>
                                                    </div>
                                                </c:when>
                                                <c:when test="${roundedAverage >= 5 && roundedAverage <= 25}">
                                                    <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                        <div class="progress-bar bg-danger" style="width: ${25}%">${roundedAverage}%</div>
                                                    </div>
                                                </c:when>
                                                <c:when test="${roundedAverage > 25 && roundedAverage <= 50}">
                                                    <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                        <div class="progress-bar bg-warning" style="width: ${50}%">${roundedAverage}%</div>
                                                    </div>
                                                </c:when>
                                                <c:when test="${roundedAverage > 50 && roundedAverage <= 75}">
                                                    <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                        <div class="progress-bar bg-info" style="width: ${75}%">${roundedAverage}%</div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="progress" style="height: 2rem;" role="progressbar" aria-label="Progress" aria-valuenow="${roundedAverage}" aria-valuemin="0" aria-valuemax="100">
                                                        <div class="progress-bar bg-success" style="width: ${100}%">${roundedAverage}%</div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </div>
                    </table>
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

