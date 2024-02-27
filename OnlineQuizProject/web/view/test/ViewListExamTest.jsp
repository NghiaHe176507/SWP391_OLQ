<%-- 
    Document   : ViewExamTest
    Created on : 27 Feb 2024, 2:08:12 am
    Author     : tuann
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <title>Student Test Scores</title>
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/viewListTest.css">
        <style>
            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
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

            .socials-list {
                margin-bottom: 10px;
            }

            .slogan {
                margin: 0;
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
            /* CSS for the title */
            .title {
                font-family: Arial, sans-serif;
                font-size: 24px;
                text-align: center;
                margin-top: 20px;
                color: #333;
                text-transform: uppercase;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="header">
                    <!-- Logo -->
                    <div class="logo col-md-2">
                        <a href="#">QUIZWIZ</a>
                    </div>

                    <!-- Search container -->
                    <div class="search-container col-md-5">
                        <input type="text" id="searchName" class="form-control mb-3"
                               placeholder="Search by student name">

                    </div>

                    <div class="login col-md-2">
                        <ul id="nav" class="nav nav-pills">
                            <li><a href="#"><i class="fa-regular fa-bell"></i> </a></li>
                            <li class="nav-item dropdown">
                                <div class="circle-background">
                                    <img class="profile-image" src="image/avatar.jpg" alt="Profile Image">
                                </div>
                                <ul class="subnav">
                                    <li><a href="<%= request.getContextPath() %>/UserDetail"><i
                                                class="fa-solid fa-user"></i> User
                                            Details</a>
                                    </li>
                                    <li><a href="#"><i class="fa-solid fa-lock"></i> Change Password</a></li>
                                    <li><a><i class="fa-solid fa-trophy"></i> Achievement</a></li>
                                    <li><a href="<%= request.getContextPath() %>/logout"><i
                                                class="fa-solid fa-right-from-bracket"></i>
                                            Log out</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="space"></div>
            </div>
            <div class="row">
                <div class="return-home" style="margin-bottom: 10px">
                    <a href="${pageContext.request.contextPath}/homeLecture" class="btn btn-primary">Return to Home Page</a>
                </div>

                <table id="studentTable" class="table table-bordered">
                    <thead class="thead-light">
                        <tr>
                            <th>No</th>
                            <th>Student Name</th>
                            <th>Examination Name</th>
                            <th>Score</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" items="${requestScope.listStudent}">
                            <tr>
                                <td>${list.resultId}</td>
                                <td>${list.studentInfo.fullName}</td>
                                <td>${list.exam.classExam.topic.topicName}</td>
                                <td>${list.score}</td>
                                <td class="${list.score >= 9 ? 'excellent' : (list.score >= 8 ? 'good' : 'average')}">
                                    ${list.score >= 9 ? 'Excellent' : (list.score >= 8 ? 'Good' : 'Average')}
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="pagination-container">
                <c:if test="${not empty totalPages}">
                    <c:if test="${currentPage > 1}">
                        <a href="?page=1">&laquo; First</a>
                        <a href="?page=${currentPage - 1}">&lsaquo; Previous</a>
                    </c:if>
                    <c:forEach var="pageNum" begin="1" end="${totalPages}">
                        <c:choose>
                            <c:when test="${pageNum == currentPage}">
                                <span class="current-page">${pageNum}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="?page=${pageNum}">${pageNum}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="?page=${currentPage + 1}">Next &rsaquo;</a>
                        <a href="?page=${totalPages}">Last &raquo;</a>
                    </c:if>
                </c:if>
            </div>
        </div>
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
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var input = document.getElementById("searchName");
            var button = document.getElementById("searchButton");

            // Function to filter rows based on search input
            function filterRows() {
                var filter = input.value.toUpperCase();
                var table = document.getElementById("studentTable");
                var rows = table.getElementsByTagName("tr");
                for (var i = 0; i < rows.length; i++) {
                    var td = rows[i].getElementsByTagName("td")[1]; // Index 1 is for student name column
                    if (td) {
                        var txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            rows[i].style.display = "";
                        } else {
                            rows[i].style.display = "none";
                        }
                    }
                }
            }

            // Search when Enter key is pressed
            input.addEventListener("keypress", function (event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    filterRows();
                }
            });

            // Search when search button is clicked
            button.addEventListener("click", function () {
                filterRows();
            });

            // Re-filter rows on page change (pagination)
            document.addEventListener("click", function (event) {
                if (event.target.tagName === "A" && event.target.closest(".pagination-container")) {
                    filterRows();
                }
            });
        });
    </script>

</html>