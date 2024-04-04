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
            .search-container {
                width: 100%;
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


            .btn-1 {
                font-family: "Poppins", sans-serif;
                font-weight: 100;
                transition: all .25s;
                border: 1px solid #000;
                border-radius: 0;

                svg {
                    height: 39px;
                    left: 0;
                    position: absolute;
                    top: 0;
                    width: 100%;
                }

                rect {
                    fill: none;
                    stroke: #fff;
                    stroke-width: 2;
                    stroke-dasharray: 422, 0;
                    transition-delay: none;
                }
            }

            .btn-1:hover {
                font-weight: 900;
                letter-spacing: 2px;
                rect {
                    stroke-width: 5;
                    stroke-dasharray: 15, 310;
                    stroke-dashoffset: 48;
                    transition: all 1.35s cubic-bezier(0.19, 1, 0.22, 1);
                }
            }

            .btn-1.color-red:hover {
                color: red;
                rect {
                    stroke: red;
                }
            }

            .btn-1.color-black:hover {
                color: black;
                rect {
                    stroke: black;
                }
            }

            .btn {
                color: #000;
                cursor: pointer;
                display: block;
                font-size:16px;
                font-weight: 400;
                line-height: 24px;
                /*margin: 10px 10px;*/
                /*margin: 0 0 2em;*/
                /*max-width: 160px;*/
                position: relative;
                text-decoration: none;
                text-transform: uppercase;
                /*width: 100%;*/
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
                            </div>
                        </div>
                    </div>


                    <!-- Search container -->
                    <form action="search" method="GET" class=" col-md-5">
                        <div class="search-container">
                            <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm...">
                            <button type="submit" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>

                    <!-- Login section -->
                    <div class="login col-md-3">
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

            <div class="topic" id="topicContainer">
                <c:forEach var="group" items="${requestScope.listGroup}" varStatus="loop">
                    <div class="col-md-4 mb-3">
                        <div class="topic-info" style="width: 18rem;">
                            <div class="topic-info-body">
                                <h5 class="topic-info-title">Class Name: ${group.groupName}</h5>
                                <h6 class="topic-info-subtitle mb-2">Topic: ${group.topic.topicName}</h6>

                                <c:choose>
                                    <c:when test="${group.groupInviteCode == null}">
                                        <h6 class="topic-info-subtitle mb-2">Invite Code: NULL</h6>
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
                                <form action="viewGroupDetailForLecture" method="GET"> 
                                    <div class="row">
                                        <div class="row" style="padding-left: 40px;margin-bottom: 5px;margin-top: 5px;">
                                            <button type="submit" class="btn btn-1 color-black topic-info-link">
                                                <svg>
                                                <rect x="0" y="0" fill="none" width="100%" height="100%"/>
                                                </svg>
                                                More Details
                                            </button>
                                        </div>
                                        <input type="hidden" name="groupId" value="${group.groupId}" />
                                        <input type="hidden" name="topicId" value="${group.topic.topicId}" />
                                </form>
                                <form></form>   
                            </div>
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
