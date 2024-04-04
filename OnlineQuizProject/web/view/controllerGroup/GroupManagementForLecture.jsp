<%-- 
    Document   : GroupManagementForLecture
    Created on : Feb 27, 2024, 10:45:59 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>     
        <title>Management Group</title>
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
                padding: 39px;
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

            /* Pagination container */
            .pagination-container {
                margin-bottom: 10px;
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


            @media (max-width: 600px) {
                .right-side {
                    display: none;
                }
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

            .create-button{
                background: linear-gradient(135deg, #9a3cbf, #4397ce);
                cursor: pointer;
                color: white;
                border: none;
            }
            .create-button:hover{
                background-color: #0056b3;
                color: #fff;
            }

            .list-group-container {
                border: 1px solid #ccc; /* Màu và kích thước viền */
                border-radius: 5px; /* Góc bo tròn của viền */
            }

        </style>
        <script>
            function deleteGroup(groupId, status) {
                if (status === "Active") {
                    // Display notification
                    alert("Cannot delete a group that is in active status.");

                    // Optionally, you can prevent further execution
                    return;
                }

                // Proceed with deletion
                if (confirm("Are you sure you want to delete this group?")) {
                    // Perform deletion action
                    window.location.href = '<%=request.getContextPath()%>/group-management/delete-group?groupId=' + groupId;
                }
            }
        </script>
    </head>

    <body>
        <header>
            <div class="container">
                <!-- Header section -->
                <div class="row">
                    <div class="header">
                        <!-- Logo -->
                        <div class="logo col-md-2">
                            <a href="<%= request.getContextPath() %>/home">QUIZWIZ</a>
                        </div>

                        <div class="menu-icon col-md-1">
                            <div class="dropdown">
                                <button class="dropbtn" style="font-size: 19px;"><i class="fa-solid fa-bars" style="padding-right: 4px;"></i>Menu</button>
                                <div class="dropdown-content">
                                    <a href="<%= request.getContextPath() %>/show-list-group-exam"><i class="fa-solid fa-plus"></i> Create An Exam</a>
                                    <a href="<%= request.getContextPath() %>/home"><i class="fa-solid fa-rotate-left"></i> Return Home</a>
                                </div>
                            </div>
                        </div>

                        <form action="search" method="GET" class="col-md-6">
                            <div class="search-container" style="width:100%;">
                                <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm...">
                                <button type="submit" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </form>

                        <!-- Login section -->
                        <div class="login col-md-2">
                            <ul id="nav" class="nav nav-pills">
                                <li class="nav-item dropdown">
                                    <div class="circle-background">
                                        <img class="profile-image" src="<%=request.getContextPath()%>/image/avatar.jpg" alt="Profile Image">
                                    </div>
                                    <ul class="subnav">
                                        <li><a href="<%= request.getContextPath() %>/UserDetail"><i class="fa-solid fa-user"></i> User Details</a></li>
                                        <li><a href="<%= request.getContextPath() %>/change-password-student"><i class="fa-solid fa-lock"></i> Change Password</a></li>
                                        <li><a href="<%= request.getContextPath() %>/logout"><i class="fa-solid fa-right-from-bracket"></i> Log out</a></li>

                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container">
            <div class="row">
                <div class="space"></div>
            </div>
            <div class="row justify-content-end">
                <c:if test="${requestScope.url == 'create'}">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="align-items-lg-center py-3 flex-column flex-lg-row">
                                    <h2 class="h5 mb-3 mb-lg-0"> Create New Group</h2>
                                </div>
                                <form action="create-group" method="POST"> 
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="mb-12">
                                                <label class="form-label">Group Name:</label>
                                                <input type="text" name="groupName" class="form-control" /> <br/>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="mb-12">
                                                <label class="form-label" >Topic:</label>
                                                <select name="topicId" class="form-control">
                                                    <c:forEach items="${requestScope.listTopic}" var="topic">
                                                        <option value="${topic.topicId}">${topic.topicName}</option>
                                                    </c:forEach>
                                                </select><br/>
                                                <div class="btn-container d-flex">
                                                    <button type="submit" class="btn btn-primary" value="save">Save</button><br/>
                                                    <a href="<%=request.getContextPath()%>/group-management" class="btn btn-default">Cancel</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:if>

                <%-- Hiển thị thông báo lỗi nếu có --%>
                <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                <% if (errorMessage != null) { %>
                <div class="alert alert-danger">
                    <%= errorMessage %>
                </div>
                <% } %>

                <%-- Hiển thị thông báo thành công nếu có --%>
                <% String successMessage = (String) request.getAttribute("successMessage"); %>
                <% if (successMessage != null) { %>
                <div class="alert alert-success">
                    <%= successMessage %>
                </div>
                <% } %>

                <%-- Tiếp tục viết mã HTML/Java để hiển thị nội dung của trang --%>

                <div class="col-lg-8 list-group-container"> 
                    <div class="container-fluid">
                        <div style="display: flex;">
                            <a style="color: #fff; text-decoration: none; margin-top: 5px" href="<%=request.getContextPath()%>/group-management/create-group" class="btn btn-primary mb-3 create-button" id="toggleFormLink">Create</a>
                            <h2 class="mb-4" style="padding-left: 205px; padding-right: 182px">View list group</h2>
                            <form class="form-inline mb-3">
                                <select class="form-control" id="groupNameFilter" name="groupName">
                                    <option value="">All Groups</option>
                                    <c:forEach items="${requestScope.listGroupToFilter}" var="listGroup">
                                        <option value="${listGroup.groupName}">${listGroup.groupName}</option>
                                    </c:forEach>
                                </select>
                                <button type="submit" class="btn btn-primary ml-2" style="background: linear-gradient(135deg, #9a3cbf, #4397ce);
                                        cursor: pointer;
                                        color: white;
                                        border: none;"><i class="fa fa-filter" aria-hidden="true"></i></button>
                            </form>
                        </div>

                        <table class="table table-striped" id="myTable">
                            <!-- Table header -->
                            <thead class="thead-dark">
                                <tr>
                                    <td style="background-color: #002d72; color: #fff; padding: 15px"><span>Group Name</span></td>
                                    <td style="background-color: #002d72; color: #fff; padding: 15px"><span>Topic Name</span></td>
                                    <td style="background-color: #002d72; color: #fff; padding: 15px"><span>Invite Code</span></td>
                                    <td style="background-color: #002d72; color: #fff; padding: 15px"><span>Status</span></td>
                                    <td style="background-color: #002d72; color: #fff; padding: 15px"><span>Action</span></td>
                                    <td style="background-color: #002d72; color: #fff; padding: 15px"><span></span></td>
                                    <td style="background-color: #002d72; color: #fff; padding: 15px"><span></span></td>
                                </tr>
                            </thead>
                            <tbody id="tableBody">
                                <!-- Table body rows -->
                                <c:forEach items="${requestScope.listGroup}" var="group">
                                    <tr>
                                        <td>${group.groupName}</td>
                                        <td>${group.topic.topicName}</td>
                                        <td>${group.groupInviteCode}</td>
                                        <td>${group.status.statusName}</td>
                                        <td>
                                            <c:if test="${group.status.statusId!=3}">
                                                <c:choose>
                                                    <c:when test="${not empty group.groupInviteCode}">
                                                        <input type="button" class="btn btn-danger" value="Remove invite code" onclick="window.location.href = '<%=request.getContextPath()%>/group-management/delete-invite-code?groupId=${group.groupId}'"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="button" class="btn btn-primary" value="Create invite code" onclick="window.location.href = '<%=request.getContextPath()%>/group-management/create-invite-code?groupId=${group.groupId}'"/>
                                                    </c:otherwise>
                                                </c:choose>     
                                            </c:if>  
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${group.status.statusId==1}">
                                                    <input type="button" class="btn btn-danger" value="Close" onclick="window.location.href = '<%=request.getContextPath()%>/close-group?groupId=${group.groupId}'"/>
                                                </c:when>
                                                <c:when test="${group.status.statusId==2}">
                                                    <input type="button" class="btn btn-primary" value="Active" onclick="window.location.href = '<%=request.getContextPath()%>/active-group?groupId=${group.groupId}'"/>
                                                </c:when>
                                                <c:otherwise></c:otherwise>
                                            </c:choose>                         
                                        </td>
                                        <td>
                                            <c:if test="${group.status.statusId==2}">
                                                <button type="button" style="color: #333; background-color: transparent; border-color: transparent;" onclick="deleteGroup(${group.groupId}, '${group.status.statusName}')">
                                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                                </button>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <!-- Pagination -->


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
                <!-- Social Icons -->
                <div class="socials-list">
                    <a href=""><i class="fa-brands fa-facebook"></i></a>
                    <a href=""><i class="fa-brands fa-instagram"></i></a>
                    <a href=""><i class="fa-solid fa-bell"></i></a>
                </div>
                <!-- Slogan -->
                <p class="slogan">Khám phá sức thông minh cùng <a href="#">Quizwiz</a> </p>
            </div>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </footer>

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
