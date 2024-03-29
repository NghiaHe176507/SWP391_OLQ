<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>List Group</title>
        <meta charset="UTF-8">
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>     
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
                position: fixed;
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

            body{
                margin-top:20px;
                background-color:#eee;
            }
            .project-list-table {
                border-collapse: separate;
                border-spacing: 0 12px
            }

            .project-list-table tr {
                background-color: #fff
            }

            .table-nowrap td, .table-nowrap th {
                white-space: nowrap;
            }
            .table-borderless>:not(caption)>*>* {
                border-bottom-width: 0;
            }
            .table>:not(caption)>*>* {
                padding: 0.75rem 0.75rem;
                background-color: var(--bs-table-bg);
                border-bottom-width: 1px;
                box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
            }

            .avatar-sm {
                height: 2rem;
                width: 2rem;
            }
            .rounded-circle {
                border-radius: 50%!important;
            }
            .me-2 {
                margin-right: 0.5rem!important;
            }
            img, svg {
                vertical-align: middle;
            }

            a {
                color: #3b76e1;
                text-decoration: none;
            }

            .badge-soft-danger {
                color: #f56e6e !important;
                background-color: rgba(245,110,110,.1);
                font-size: 13px;
            }
            .badge-soft-success {
                color: #63ad6f !important;
                background-color: rgba(99,173,111,.1);
                font-size: 13px;
            }

            .badge-soft-primary {
                color: #3b76e1 !important;
                background-color: rgba(59,118,225,.1);
                font-size: 13px;
            }

            .badge-soft-info {
                color: #57c9eb !important;
                background-color: rgba(87,201,235,.1);
                font-size: 13px;
            }

            .avatar-title {
                align-items: center;
                background-color: #3b76e1;
                color: #fff;
                display: flex;
                font-weight: 500;
                height: 100%;
                justify-content: center;
                width: 100%;
            }
            .bg-soft-primary {
                background-color: rgba(59,118,225,.25)!important;
                font-size: 13px;
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
            .nav-pills .nav-item {
                display: inline-block; /* Hiển thị các mục trên cùng 1 hàng */
                margin-left: 125px; /* Khoảng cách giữa các mục */
            }

            .nav-pills .nav-link {
                text-decoration: none;
                color: #fff;
                font-weight: bold;
                font-size: 16px;
                border-radius: 5px;
            }

            .nav-pills .nav-link:hover {
                background-color: rgba(255, 255, 255, 0.2); /* Màu nền khi hover */
            }
        </style>
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
                                        <a class="nav-link" href="<%= request.getContextPath() %>/admin/account-management">
                                            <i class="fa-solid fa-list-ul"></i> View List Account
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%= request.getContextPath() %>/admin/topic-management">
                                            <i class="fas fa-book"></i> View List Topic
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
        <div class="container">
            <div class="row">
                <div class="space"></div>
            </div>
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="mb-3">
                        <h5 class="card-title">View List Group <span class="text-muted fw-normal ms-2">(${requestScope.totalGroups})</span></h5>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class>
                        <div class="table-responsive">
                            <div class="col-md-6">
                                <!-- Form for filtering -->
                                <form action="group-management" method="GET">
                                    <div class="row align-items-center">
                                        <div class="col-md-6 mb-3">
                                            <select class="form-select" name="filterBy">
                                                <option value="groupName">Group Name</option>
                                                <option value="lectureName">Lecture Name</option>
                                                <option value="topicName">Topic Name</option>
                                                <!-- Add more options for additional filter criteria if needed -->
                                            </select>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="keyword" placeholder="Enter keyword...">
                                                <button type="submit" class="btn btn-primary">Filter</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <table class="table project-list-table table-nowrap align-middle table-borderless">
                            <thead>
                                <tr>
                                    <th scope="col">Group ID</th>
                                    <th scope="col">Group Name</th>
                                    <th scope="col">Lecture Name</th>
                                    <th scope="col">Topic Name</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.listGroup}" var="group">
                                    <tr>
                                        <td>${group.groupId}</td>
                                        <td>${group.groupName}</td>
                                        <td>${group.lectureInfo.fullName}</td>
                                        <td>${group.topic.topicName}</td>
                                        <c:choose>
                                            <c:when test="${group.status.statusName eq 'Pending'}">
                                                <td><span class="badge badge-soft-primary mb-0">${group.status.statusName}</span></td>
                                                </c:when>
                                                <c:when test="${group.status.statusName eq 'Closed'}">
                                                <td><span class="badge badge-soft-danger mb-0">${group.status.statusName}</span></td>
                                                </c:when>
                                                <c:otherwise>
                                                <td><span class="badge badge-soft-info mb-0">${group.status.statusName}</span></td>
                                                </c:otherwise>
                                            </c:choose>
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
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="pagination-container">
                            <c:if test="${not empty totalPages}">
                                <c:if test="${currentPage > 1}">
                                    <a href="?page=1&filterBy=${param.filterBy}&keyword=${param.keyword}">&laquo; First</a>
                                    <a href="?page=${currentPage - 1}&filterBy=${param.filterBy}&keyword=${param.keyword}">&lsaquo; Previous</a>
                                </c:if>

                                <c:forEach var="pageNum" begin="1" end="${totalPages}">
                                    <c:choose>
                                        <c:when test="${pageNum == currentPage}">
                                            <span class="current-page">${pageNum}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="?page=${pageNum}&filterBy=${param.filterBy}&keyword=${param.keyword}">${pageNum}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <c:if test="${currentPage < totalPages}">
                                    <a href="?page=${currentPage + 1}&filterBy=${param.filterBy}&keyword=${param.keyword}">Next &rsaquo;</a>
                                    <a href="?page=${totalPages}&filterBy=${param.filterBy}&keyword=${param.keyword}">Last &raquo;</a>
                                </c:if>

                                <!-- Allow user to enter page number -->
                                <form action="${pageContext.request.contextPath}/admin/group-management" method="GET" style="display: inline-block;">
                                    <input type="text" name="page"  style="width: 50px; margin: 0 5px; padding: 3px 5px; border-radius: 4px">
                                    <input type="hidden" name="filterBy" value="${param.filterBy}">
                                    <input type="hidden" name="keyword" value="${param.keyword}">
                                    <button type="submit" style="width: 50px; margin: 0 -4px; padding: 3px 5px; border-radius: 4px">Go</button>
                                </form>
                            </c:if>
                        </div>
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

    </footer>
    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
    </script>
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