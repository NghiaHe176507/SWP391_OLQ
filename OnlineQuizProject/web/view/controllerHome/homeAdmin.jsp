<%-- 
    Document   : homeAdmin
    Created on : Feb 21, 2024, 12:42:00 AM
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
        <link rel="stylesheet" href="css/homeAdmin.css">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <!--<script src="home.js"></script>-->
        <script src="js/jquery.twbsPagination.js" type="text/javascript"></script>

        <script>
            function deleteAccount(id)
            {
                var conf = confirm("are you sure?");
                if (conf) {
                    window.location.href = 'deleteaccount?accountId=' + id;
                }
            }

        </script>

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

            .detail-link {
                text-decoration: none; /* Bỏ gạch chân */
                color: black; /* Đổi màu thành đen */
                border: 1px solid black; /* Thêm viền */
                display: inline-block; /* Hiển thị như block */
                padding: 5px 10px; /* Tăng padding để tạo khoảng trống xung quanh nút */
                transition: border-color 0.3s ease; /* Hiệu ứng khi hover */
            }

            .detail-link:hover {
                border-color: gray; /* Thay đổi màu viền khi hover */
            }

            .content-section{
                padding: 15px;
                margin: 20px;
            }


            .custom-section {
                position: fixed;
                top: 7%;
                left: 0;
                height: 81vh;
                width: 15%;
                background-color: black;
                color: white;
                overflow-y: auto;
                border-radius: 10px;
            }

            .custom-section h2{
                border-bottom: 2px solid white;
                padding-bottom: 10px;
                margin-bottom: 20px;
                background: linear-gradient(135deg, #9a3cbf, #4397ce);
                -webkit-background-clip: text;
                color: transparent;
            }

            .custom-section ul {
                list-style-type: none;
                padding-left: 0;
                align-items: center;
            }

            .custom-section ul li {
                margin: 20px;
                padding: 20px;
                background-color: black;
                border-radius: 8px;
                transition: background-color 0.3s;
                align-items: center;
            }

            .custom-section ul li a {
                text-decoration: none;
                color: white;
                flex-grow: 1;
                font-size: 16px;
            }


            .custom-section ul li:hover {
                background-color: #555;
            }


            .card-item h7 {
                border: 1px solid #fff; /* Thêm border 1px solid với màu #ccc */
                border-radius: 5px; /* Thêm border radius 5px */
                margin: 5px; /* Thêm margin 5px */
                text-align: center;
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

                    <!-- Search container -->
                    <form action="search" method="GET" class="col-md-6">
                        <div class="search-container">
                            <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi, topic hoặc group...">
                            <button id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>

                    <!-- Login section -->
                    <div class="login col-md-3">
                        <ul id="nav" class="nav nav-pills">
                            <li><a href="#"><i class="fa-regular fa-bell"></i> </a></li>
                            <li class="nav-item dropdown">
                                <div class="circle-background">
                                    <img class="profile-image" src="image/avatar.jpg" alt="Profile Image">
                                </div>
                                <ul class="subnav">
                                    <li><a href="<%= request.getContextPath() %>/updateaccount"><i class="fa-solid fa-user"></i> User Details</a></li>
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

        </div>

        <div class="body-admin">
            <div class="row">
                <div class="col-md-2">
                    <div class="content-section custom-section">
                        <!-- Content for the 1/4 width column -->
                        <h2>Admin Menu</h2>
                        <ul>
                            <li><a href="<%= request.getContextPath() %>/admin/account-management"><i class="fa-solid fa-list-ul"></i> View List Account</a></li>
                            <li><a href="<%= request.getContextPath() %>/admin/account-management"><i class="fa-regular fa-folder-open"></i> Update Account</a></li>
                            <li><a href="<%= request.getContextPath() %>/admin/topic-management"><i class="fa-solid fa-book"></i> View List Topic</a></li>
                            <li><a href="<%= request.getContextPath() %>/admin/group-management"><i class="fa-solid fa-people-group"></i> View List Group</a></li>
                            <li><a href="#"><i class="fa-solid fa-lock"></i> Change Password</a></li>
                            <li><a href="<%= request.getContextPath() %>/logout"><i class="fa-solid fa-right-from-bracket"></i> Log out</a></li>
                        </ul>
                    </div>
                </div>

                <!-- Second column (3/4 width) -->
                <div class="col-md-10">
                    <div class="content-section">
                        <div class="row">
                            <!-- Row with 3 cards -->
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body" style="background: linear-gradient(to bottom, #b6fbff, #83a4d4);">
                                        <h5 class="card-title">People</h5>
                                        <p>Number of people who have a Quizwiz account</p>
                                        <div class="card-item row">
                                            <h7 class="col-md-5">${requestScope.totalStudents} students <i class="fa-solid fa-person-circle-check"></i></h7>
                                            <h7 class="col-md-5">${requestScope.totalLectures} lectures <i class="fa-solid fa-circle-user"></i></h7>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body" style="background: linear-gradient(to bottom, #eef2f3, #8e9eab);">
                                        <h5 class="card-title">Group</h5>
                                        <p>Number of classes currently available</p>
                                        <div class="card-item row">
                                            <h7 class="col-md-5">${requestScope.listGroup.size()} groups <i class="fa-solid fa-users"></i></i></h7>
                                            <h7 class="col-md-5">${requestScope.totalGroupsOnline} is active <i class="fa-regular fa-circle-check"></i></h7>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body" style="background: linear-gradient(to bottom, #948E99, #0b8793);">
                                        <h5 class="card-title">Topic</h5>
                                        <p>Current subject number information is provided</p>
                                        <div class="card-item row">
                                            <h7 class="col-md-5">${requestScope.listTopic.size()} topics <i class="fa-solid fa-book-open"></i></h7>
                                            <!--<h7 class="col-md-5">95 người online <i class="fa-solid fa-circle-user"></i></h7>--> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End of Row with 3 cards -->

                            <!-- Row with table -->
                            <div class="row mt-4">
                                <div class="col-md-12">
                                    <!--                                    <table class="table table-bordered">-->
                                    <div class="custom">
                                        <h2 class="text-center">Manager List Account</h2>
                                        <div class="row">
                                            <div id="viewAccountContent" >
                                                <div>
                                                    <form action="home" method="GET">
                                                        <div class="search-container col-md-12">
                                                            <input name="query" type="text" id="searchInput" placeholder="Vui lòng nhập mail của account..." style=" border: 1px solid #000;">
                                                            <button type="submit" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                                                        </div>
                                                    </form>
                                                    <table id="paginationButtons" class="custom-table" style="margin-left: 10px;">
                                                        <tr class="account-row">
                                                            <td>Id</td>
                                                            <td>Mail</td>
                                                            <td>Password</td>
                                                            <td>Display Name</td>
                                                            <td>Full Name</td>
                                                            <td>Role</td>
                                                            <td>Status</td>
                                                            <td>Action</td>
                                                        </tr>
                                                        <c:forEach items="${requestScope.paginatedList}" var="accountInfo">
                                                            <tr>
                                                                <td>${accountInfo.account.accountId}</td>
                                                                <td>${accountInfo.account.mail}</td>
                                                                <td>${accountInfo.account.password}</td>
                                                                <td>${accountInfo.account.displayName}</td>
                                                                <td>${accountInfo.fullName}</td>
                                                                <td>${requestScope.listRoleFeatureByListAccount.get(requestScope.paginatedList.indexOf(accountInfo)).getRole().getRoleName()}</td>
                                                                <td>${accountInfo.account.accountStatus}</td>
                                                                <td>
                                                                    <c:if test="${requestScope.listRoleFeatureByListAccount.get(requestScope.paginatedList.indexOf(accountInfo)).getRole().getRoleId() != 1}">
                                                                        <a href="updateaccount?accountId=${accountInfo.account.accountId}" >Edit</a>
                                                                        <input type="button" value="Delete" onclick="deleteAccount(${accountInfo.account.accountId})"/>
                                                                    </c:if>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </table>
                                                    <div class="pagination-container">
                                                        <c:if test="${not empty totalPages}">
                                                            <c:if test="${currentPage > 1}">
                                                                <a href="?query=${param.query}&page=1">&laquo; First</a>
                                                                <a href="?query=${param.query}&page=${currentPage - 1}">&lsaquo; Previous</a>
                                                            </c:if>
                                                            <c:forEach var="pageNum" begin="1" end="${totalPages}">
                                                                <c:choose>
                                                                    <c:when test="${pageNum == currentPage}">
                                                                        <span class="current-page">${pageNum}</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <a href="?query=${param.query}&page=${pageNum}">${pageNum}</a>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                            <c:if test="${currentPage < totalPages}">
                                                                <a href="?query=${param.query}&page=${currentPage + 1}">Next &rsaquo;</a>
                                                                <a href="?query=${param.query}&page=${totalPages}">Last &raquo;</a>
                                                            </c:if>
                                                        </c:if>
                                                    </div>

                                                    <br />
                                                    <p>Note: Delete account đối với student là xóa tất cả mọi thông tin liên quan đến account bao gồm thông
                                                        tin,
                                                        lớp đã join, kết quả ktra trong database.<br />
                                                        Chỉ có thể update role/delete account giảng viên khi tài khoản chưa có hoạt động gì.<br />
                                                        Không thể delete account Admin.</p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- End of Row with table -->
                                </div>
                            </div>

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