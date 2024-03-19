<%-- 
    Document   : viewListTopic
    Created on : Feb 19, 2024, 12:31:49 AM
    Author     : PC
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <title>Topic</title>
        <style>
            @import url("https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap");
            *{
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            html {
                font-family: "Poppins", sans-serif;
                scroll-behavior: smooth;
            }

            /* Common Styles */
            .header {
                background-color: #000;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1;
                display: flex;
                justify-content: space-around;
                align-items: center;
            }

            /* Logo Styles */
            .logo {
                text-align: justify;
            }

            .logo a {
                text-decoration: none;
                font-family: "Poppins", sans-serif;
                font-weight: bold;
                font-size: 36px;
                background: linear-gradient(135deg, #9a3cbf, #4397ce);
                -webkit-background-clip: text;
                color: transparent;
                transition: transform 0.2s ease-in-out;
            }

            .logo:active {
                transform: scale(0.9);
            }

            /* Search Container Styles */
            .search-container {
                display: flex;
                width: 80%;
            }

            /* Search Input Styles */
            .search-container {
                padding: 10px;
            }
            #searchInput {
                flex-grow: 1;
                padding: 10px;
                border: 2px solid #fff;
                border-radius: 5px 0 0 5px;
                outline: none;
            }

            /* Search Button Styles */
            #searchButton {
                padding: 10px;
                background: linear-gradient(135deg, #9a3cbf, #4397ce);
                color: #fff;
                border: none;
                border-radius: 0 5px 5px 0;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            #searchButton:hover {
                background: linear-gradient(135deg, #4397ce, #9a3cbf);
                transform: scale(1.05);
            }

            #searchButton:active {
                transform: scale(0.95);
            }

            /* Navigation menu styles */
            .custom-icon {
                display: flex;
                align-items: center;
                text-decoration: none;
                color: inherit;
            }

            .circle-background {
                border-radius: 50%;
                overflow: hidden;
                background-color: #ccc;
                width: 45px;
                height: 45px;
                transition: background-color 0.3s ease;
            }

            .custom-icon:hover .circle-background {
                background-color: #ddd;
            }

            .profile-image {
                width: 100%;
                height: auto;
                display: block;
            }
            /*  */

            .login {

            }

            #nav {
                display: flex;
                justify-content: space-around;
            }

            #nav>li {
                display: inline-block; /* Hiển thị các li trên cùng một dòng */
            }

            #nav .fa-bell {
                font-size: 36px; /* Đặt kích thước của biểu tượng chuông */
                position: relative; /* Đặt vị trí tương đối để thực hiện hiệu ứng */
                cursor: pointer; /* Biến con trỏ thành dạng bàn tay khi di chuột qua */
                transition: color 0.3s; /* Tạo hiệu ứng màu khi hover */
                color: #fff;
                background-color: #000;
                padding-top: 5px;
            }

            #nav .fa-bell:hover {
                color: palevioletred; /* Màu khi di chuột qua */
            }

            #nav .fa-bell::after {
                content: ''; /* Tạo một pseudo-element để làm hình nền của hiệu ứng nhấp chuột */
                position: absolute; /* Đặt vị trí tuyệt đối để che phủ biểu tượng */
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                background-color: rgba(0, 0, 0, 0.2); /* Màu nền của hiệu ứng khi nhấp chuột */
                border-radius: 50%; /* Tạo hình tròn */
                opacity: 0; /* Ẩn mặc định */
                transition: opacity 0.3s; /* Tạo hiệu ứng độ mờ */
            }

            #nav .fa-bell:active::after {
                opacity: 1; /* Hiển thị hiệu ứng khi nhấp chuột */
            }


            .subnav {
                list-style-type: none;
                padding: 15px;
            }

            #nav .subnav {
                display: none;
                min-width: 160px;
                background-color: #000;
                position: absolute;
                top: 100%;
                left: 0;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                white-space: nowrap;
            }

            #nav .subnav a {
                color: white;
                line-height: 38px;
                text-decoration: none;
            }

            #nav .nav-arraow-down {
                font-size: 14px;
            }

            #nav li:hover .subnav {
                display: block;
            }

            #nav .subnav li:hover a,
            #nav > li:hover > a {
                color: palevioletred;
            }
            /* Footer Section Styles */

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
            #footer a{
                color: #000;
            }

            .slogan {
                margin: 0;
                font-size: 16px;
            }

            /* Space Styles */
            .space {
                padding: 30px;
            }

            /* Slider Section Styles */
            #carouselExampleIndicators {
                width: 100%;
                height: auto;
                max-width: 100%;
            }

            /* Custom styles for carousel images */
            #carouselExampleIndicators img {
                width: 100%;
                height: auto;
                max-width: 100%;
            }

            .topic {
                display: flex;
                flex-wrap: wrap; /* Cho phép các div con xuống dòng khi không đủ không gian */
                justify-content: space-between;
                align-items: flex-start;
                padding: 15px; /* Khoảng cách lề bên trong div topic */
                border: 1px solid #ccc; /* Đường viền của div topic */
                border-radius: 10px; /* Bo góc cho div topic */
            }

            .topic-info {
                flex: 0 0 calc(25% - 15px); /* Chia cột cho 4 div con, với khoảng cách giữa chúng là 15px */
                margin: 15px; /* Khoảng cách giữa các div con */
                border: 1px solid #ccc; /* Đường viền của div con */
                border-radius: 5px; /* Bo góc cho div con */
                padding: 10px; /* Khoảng cách lề bên trong div con */
            }

            .show-all {
                width: 100%;
                margin-top: 15px; /* Khoảng cách giữa div con và div show-all */
            }

            .show-all a {
                display: block;
                text-align: right;
                text-decoration: none;
                color: #007BFF;
            }

            body {
                margin-top: 20px;
            }
            .list-account {
                font-size: 1.5rem;
                /* Adjust font size as needed */
                font-weight: bold;
                /* Make the text bold */
                margin-bottom: 1rem;
                margin-left: 17rem;
            }

            .main-box {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid rgba(0, 0, 0, .125);
                border-radius: 7px;
                padding: 10px;
                /* Remove border */
                margin-bottom: 20px;
                /* Adjust spacing */
            }

            /* USER LIST TABLE */
            .user-list tbody td>img {
                position: relative;
                max-width: 50px;
                float: left;
                margin-right: 15px;
            }

            .user-list tbody td .user-link {
                display: block;
                font-size: 1.25em;
                padding-top: 3px;
            }

            .user-list tbody td .user-subhead {
                font-size: 0.875em;
                font-style: italic;
            }

            /* TABLES */
            .table {
                border-collapse: separate;
            }

            .table-hover>tbody>tr:hover>td,
            .table-hover>tbody>tr:hover>th {
                background-color: #eee;
            }

            .table thead>tr>th {
                border-bottom: 1px solid #C2C2C2;
                padding-bottom: 0;
            }

            .table tbody>tr>td {
                font-size: 0.875em;
                background: #f5f5f5;
                border-top: 10px solid #fff;
                vertical-align: middle;
                padding: 12px 8px;
            }

            .table tbody>tr>td:first-child,
            .table thead>tr>th:first-child {
                padding-left: 20px;
            }

            .table thead>tr>th span {
                border-bottom: 2px solid #C2C2C2;
                display: inline-block;
                padding: 0 5px;
                padding-bottom: 5px;
                font-weight: normal;
            }

            .table thead>tr>th>a span {
                color: #344644;
            }

            .table thead>tr>th>a span:after {
                content: "\f0dc";
                font-family: FontAwesome;
                font-style: normal;
                font-weight: normal;
                text-decoration: inherit;
                margin-left: 5px;
                font-size: 0.75em;
            }

            .table thead>tr>th>a.asc span:after {
                content: "\f0dd";
            }

            .table thead>tr>th>a.desc span:after {
                content: "\f0de";
            }

            .table thead>tr>th>a:hover span {
                text-decoration: none;
                color: #2bb6a3;
                border-color: #2bb6a3;
            }

            .table.table-hover tbody>tr>td {
                -webkit-transition: background-color 0.15s ease-in-out 0s;
                transition: background-color 0.15s ease-in-out 0s;
            }

            .table tbody tr td .call-type {
                display: block;
                font-size: 0.75em;
                text-align: center;
            }

            .table tbody tr td .first-line {
                line-height: 1.5;
                font-weight: 400;
                font-size: 1.125em;
            }

            .table tbody tr td .first-line span {
                font-size: 0.875em;
                color: #969696;
                font-weight: 300;
            }

            .table tbody tr td .second-line {
                font-size: 0.875em;
                line-height: 1.2;
            }

            .table a.table-link {
                margin: 0 5px;
                font-size: 1.125em;
            }

            .table a.table-link:hover {
                text-decoration: none;
                color: #2aa493;
            }

            .table a.table-link.danger {
                color: #fe635f;
            }

            .table a.table-link.danger:hover {
                color: #dd504c;
            }

            .table-products tbody>tr>td {
                background: none;
                border: none;
                border-bottom: 1px solid #ebebeb;
                -webkit-transition: background-color 0.15s ease-in-out 0s;
                transition: background-color 0.15s ease-in-out 0s;
                position: relative;
            }

            .table-products tbody>tr:hover>td {
                text-decoration: none;
                background-color: #f6f6f6;
            }

            .table-products .name {
                display: block;
                font-weight: 600;
                padding-bottom: 7px;
            }

            .table-products .price {
                display: block;
                text-decoration: none;
                width: 50%;
                float: left;
                font-size: 0.875em;
            }

            .table-products .price>i {
                color: #8dc859;
            }

            .table-products .warranty {
                display: block;
                text-decoration: none;
                width: 50%;
                float: left;
                font-size: 0.875em;
            }

            .table-products .warranty>i {
                color: #f1c40f;
            }

            .table tbody>tr.table-line-fb>td {
                background-color: #9daccb;
                color: #262525;
            }

            .table tbody>tr.table-line-twitter>td {
                background-color: #9fccff;
                color: #262525;
            }

            .table tbody>tr.table-line-plus>td {
                background-color: #eea59c;
                color: #262525;
            }

            .table-stats .status-social-icon {
                font-size: 1.9em;
                vertical-align: bottom;
            }

            .table-stats .table-line-fb .status-social-icon {
                color: #556484;
            }

            .table-stats .table-line-twitter .status-social-icon {
                color: #5885b8;
            }

            .table-stats .table-line-plus .status-social-icon {
                color: #a75d54;
            }
            @media (max-width: 600px) {
                .right-side {
                    display: none;
                }
            }

            .create-button{
                background: linear-gradient(135deg, #9a3cbf, #4397ce);
                cursor: pointer;
                color: white;
                border: none;
                padding: 10px 15px;
            }
            .create-button:hover{
                background-color: #0056b3;
                color: #fff;
            }


            .nav-pills .nav-item {
                display: inline-block;
                margin-left: 125px;
            }

            .nav-pills .nav-link {
                text-decoration: none;
                color: #fff;
                font-weight: bold;
                font-size: 16px;
                border-radius: 5px;
            }

            .nav-pills .nav-link:hover {
                background-color: rgba(255, 255, 255, 0.2);
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

            /* Viền cho create-topic-container */
            .create-topic-container {
                border: 1px solid #ccc; /* Màu và kích thước viền */
                border-radius: 5px; /* Góc bo tròn của viền */
                padding: 20px; /* Khoảng cách bên trong div */
            }

            /* Border cho list-topic-container */
            .list-topic-container {
                border: 1px solid #ccc; /* Màu và kích thước viền */
                border-radius: 5px; /* Góc bo tròn của viền */
                padding: 20px; /* Khoảng cách bên trong div */
                margin-bottom: 15px;
            }


        </style>
        <script>
            function DeleteTopic(id)
            {
                var conf = confirm("Are you sure?");
                if (conf) {
                    window.location.href = '<%=request.getContextPath()%>/admin/topic-management/delete-topic?topicId=' + id;
                }
            }
        </script>
    </head>
    <body>
        <header>
            <form action="home" method="POST">
                <div class="container">
                    <div class="row">
                        <div class="header">
                            <div class="logo col-md-2">
                                <a href="<%= request.getContextPath() %>/home">QUIZWIZ</a>
                            </div>

                            <div class="col-md-6">
                                <ul class="nav nav-pills">
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%= request.getContextPath() %>/home">
                                            <i class="fas fa-folder-open"></i> Home
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%= request.getContextPath() %>/admin/group-management">
                                            <i class="fas fa-list-ul"></i> View List Group
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%= request.getContextPath() %>/admin/account-management">
                                            <i class="fas fa-book"></i> View List Account
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="login col-md-2">
                                <ul id="nav" class="nav nav-pills">
                                    <li class="nav-item dropdown">
                                        <div class="circle-background">
                                            <img class="profile-image" src="<%= request.getContextPath() %>/image/avatar.jpg" alt="Profile Image">
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
                </div>
            </form>
        </header>
        <div class="container">
            <div class="row">
                <div class="space"></div>
            </div>
            <div class="row justify-content-end ">
                <c:if test="${requestScope.url == 'create'}">
                    <div class="col-lg-4">
                        <div class="container-fluid create-topic-container">
                            <h2 class="mb-4">Create Topic</h2>
                            <form action="create-topic" method="POST" class="needs-validation" novalidate>
                                <div class="form-group">
                                    <label for="topicName">Topic Name:</label>
                                    <input type="text" class="form-control" id="topicName" name="topicName" required>
                                    <div class="invalid-feedback">Please enter a topic name.</div>
                                </div>
                                <div class="btn-container d-flex">
                                    <button type="submit" class="btn btn-primary" value="Save">Save</button><br/>
                                    <a href="<%=request.getContextPath()%>/admin/topic-management" class="btn btn-default">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </c:if>
                <div class="col-lg-8 list-topic-container">
                    <a href="<%=request.getContextPath()%>/admin/topic-management/create-topic" class="btn btn-success mb-3 create-button" id="toggleFormLink">Create Topic</a>
                    <div class="container-fluid">
                        <h2 class="mb-4">View List Topic</h2>
                        <table class="table table-striped" id="myTable">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Topic Id</th>
                                    <th>Topic Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="tableBody">
                                <c:forEach items="${requestScope.listTopic}" var="topic">
                                    <tr>
                                        <td>${topic.topicId}</td>
                                        <td>${topic.topicName}</td>
                                        <td>
                                            <button class="btn btn-danger" onclick="DeleteTopic(${topic.topicId})">Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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
                </div>
            </div>
        </div>
        <footer>
            <div id="footer">
                <div class="socials-list">
                    <a href=""><i class="fa-brands fa-facebook"></i></a>
                    <a href=""><i class="fa-brands fa-instagram"></i></a>
                    <a href=""><i class="fa-solid fa-bell"></i></a>
                </div>
                <p class="slogan">Khám phá sức thông minh cùng <a href="#">Quizwiz</a> </p>
            </div>
        </footer>
    </body>

</html>
