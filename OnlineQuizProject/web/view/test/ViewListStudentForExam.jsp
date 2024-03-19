<%-- 
    Document   : ViewListFStudentForExam
    Created on : 20 Mar 2024, 4:01:16 am
    Author     : hatua
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <title>Student</title>
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
                        <a href="home">QUIZWIZ</a>
                    </div>

                    <!-- Search container -->
                    <form action="search" method="GET" class="col-md-7">
                        <div class="search-container">
                            <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi, topic hoặc group...">
                            <button id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>
                    <div class="login col-md-2">
                        <ul id="nav" class="nav nav-pills">
                            <li></a></li>
                            <li class="nav-item dropdown">
                                <div class="circle-background">
                                    <img class="profile-image" src="image/avatar.jpg" alt="Profile Image">
                                </div>
                                <ul class="subnav">
                                    <li><a href="<%= request.getContextPath() %>/UserDetail"><i
                                                class="fa-solid fa-user"></i> User
                                            Details</a>
                                    </li>
                                    <li><a href="<%= request.getContextPath() %>/change-password-lecture"><i class="fa-solid fa-lock"></i> Change Password</a></li>
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
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Return to Home Page</a>
                </div>

                <table id="studentTable" class="table table-bordered">
                    <thead class="thead-light">
                        <tr>
                            <th>No</th>
                            <th>Student Name</th>
                            <th>Student DOB</th>
                            <th>Registered Date</th>
                            <!-- Add a header for the dropdown -->
                            <th>More</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" items="${requestScope.listOfStudentHasTest}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${list.studentInfo.fullName}</td>
                                <td>${list.studentInfo.dob}</td>
                                <td>${list.registerDate}</td>
                                <!-- Add a cell for the dropdown -->
                                <td>
                                    <button class="btn btn-link" onclick="toggleDropdown(${loop.index})">Show More</button>
                                    <div id="dropdown_${loop.index}" class="dropdown-content" style="display: none;">
                                        <!-- Dropdown content here -->
                                        <table id="studentTable" class="table table-bordered">
                                            <thead class="thead-light">
                                                <tr>
                                                <tr>
                                                    <th>Examination Name</th>
                                                    <th>Score</th>
                                                    <th>Lecture Comment</th>
                                                    <th>Edit Comment by Lecture</th>
                                                </tr>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="list" items="${requestScope.listExaminationOfStudent}">
                                                    <tr>
                                                        <td>${list.exam.group.topic.topicName}</td>
                                                        <td>${list.score}</td>
                                                        <td>${list.commentContent}</td>
                                                        <td>
                                                            <!-- Add a form to submit Lecture Comments -->
                                                            <form action="${pageContext.request.contextPath}/update-lecture-comment" method="POST" class="form-inline">
                                                                <input type="hidden" name="resultId" value="${list.resultId}">
                                                                <div class="form-group mx-sm-3 mb-2">
                                                                    <textarea class="form-control" name="lectureComment" rows="1" cols="30">${list.commentContent}</textarea>
                                                                </div>
                                                                <button type="submit" class="btn btn-primary mb-2">Save</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <!-- Add more information as needed -->
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
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
            function toggleDropdown(index) {
                var dropdown = document.getElementById("dropdown_" + index);
                if (dropdown.style.display === "none") {
                    dropdown.style.display = "block";
                } else {
                    dropdown.style.display = "none";
                }
            }
        </script>
    </body>
</html>
