<%-- 
    Document   : result
    Created on : Feb 25, 2024, 12:47:33 AM
    Author     : nghia
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Metadata -->
        <meta charset="UTF-8">
        <title>QuizWiz</title>
        <!-- Favicon -->
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/searchResult.css">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/searchResult.js"></script>
        <script src="js/jquery.twbsPagination.js" type="text/javascript"></script>

        <style>
            #footer {
                position: relative;
                bottom: 0;
                left: 0;
                width: 100%;
                background: linear-gradient(135deg, #4397ce, #9a3cbf);
                color: white;
                text-align: center;
                transition: transform 0.5s ease-in-out;
                padding: 5px;
            }

            .container {
                min-height: 100%;
                position: relative;
            }
            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            .container {
                flex: 1;
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
                    <div class="logo col-md-1">
                        <a href="#home">QUIZWIZ</a>
                    </div>

                    <div class="create col-md-2">
                        <a href="${pageContext.request.contextPath}/home">Return Home</a>
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
            <form action="search" method="GET">
                <h3>Topic</h3>
                <div class="topic" id="topicContainer">
                    <c:choose>
                        <c:when test="${empty requestScope.searchTopic}">
                            <div class="col-md-12">
                                <h7>Không có topic tương ứng</h7>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="topic" items="${requestScope.searchTopic}" varStatus="loop">
                                <div class="col-md-4 mb-3">
                                    <div class="topic-info" style="width: 18rem;">
                                        <div class="topic-info-body">
                                            <h6 class="topic-info-subtitle mb-2">Topic Name: ${topic.topicName}</h6>
                                            <a href="#" class="topic-info-link">More Details</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

                    <div class="show-all">
                        <a href="#" id="showAllBtn">Show all topic</a>
                        <a href="#" id="showLessBtn" style="display: none;">Show less</a>
                    </div>
                </div>


                <h3>Group</h3>
                <div class="topic" id="topicContainer">
                    <c:choose>
                        <c:when test="${empty requestScope.searchResults}">
                            <div class="col-md-12">
                                <p>Không có group tương ứng</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="group" items="${requestScope.searchResults}" varStatus="loop">
                                <div class="col-md-4 mb-3">
                                    <div class="group-info" style="width: 18rem;">
                                        <div class="group-info-body">
                                            <h5 class="group-info-title">Class Name: ${group.groupName}</h5>
                                            <h6 class="group-info-subtitle mb-2">Topic: ${group.topic.topicName}</h6>

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
                                                    <h6 class="group-info-subtitle mb-2">Invite Code: ${group.groupInviteCode}</h6>
                                                </c:otherwise>
                                            </c:choose>

                                            <c:choose>
                                                <c:when test="${group.status.statusName eq 'Active'}">
                                                    <p class="group-info-text text-success" style="margin-bottom: 0;font-weight: bold;">${group.status.statusName}</p>
                                                </c:when>
                                                <c:when test="${group.status.statusName eq 'Pending'}">
                                                    <p class="group-info-text text-secondary" style="margin-bottom: 0;font-weight: bold;">${group.status.statusName}</p>
                                                </c:when>
                                                <c:when test="${group.status.statusName eq 'Closed'}">
                                                    <p class="group-info-text text-danger" style="margin-bottom: 0;font-weight: bold;">${group.status.statusName}</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="group-info-text" style="margin-bottom: 0">${group.status.statusName}</p>
                                                </c:otherwise>
                                            </c:choose>
                                            <a href="#" class="group-info-link">More Details</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

                    <div class="show-all">
                        <a href="#" id="showAllBtnGroup">Show all group</a>
                        <a href="#" id="showLessBtnGroup" style="display: none;">Show less</a>
                    </div>
                </div>

            </form>

            <!-- End of header section -->

            <div>

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
