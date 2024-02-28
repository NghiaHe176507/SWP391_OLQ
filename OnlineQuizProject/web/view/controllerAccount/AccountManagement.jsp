<%-- 
    Document   : AccountManager
    Created on : Feb 25, 2024, 10:20:43 PM
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
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/homeStudent.js"></script>
        <title>Mange Account</title>
        <style>
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
                padding: 5px;
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


            /*  */
            /* .topic {
              display: flex;
              justify-content: space-between;
              align-items: flex-start; 
            }
            
            .topic-info {
              flex: 1; 
              border: 1px solid #ccc; 
              padding: 10px; 
            }
            
            .show-all {
              margin-top: 10px;
            }
            
            .show-all a {
              display: block;
              text-align: right; 
              text-decoration: none;
              color: #007BFF;
            } */


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
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                height: 100vh;
                justify-content: center;
                align-items: center;
            }

            .container {
                display: flex;
                max-width: 800px;
                width: 100%;
                justify-content: center;
                margin-top: 70px;
                /* Align items to the right side of the container */
            }

            .left-side,
            .right-side {
                padding: 20px;
                box-sizing: border-box;
                border: 1px solid #ddd;
                border-radius: 8px;
                width: 130%; /* Adjust the width as needed */
                margin: 10px 5px; /* Add margin for spacing */
            }

            .left-side h2 {
                color: #007bff;
                margin-bottom: 20px;
            }

            .btn-create {
                margin-bottom: 10px;
            }

            .table-responsive {
                overflow-x: auto;
            }

            .table th,
            .table td {
                text-align: center;
            }

            .action-links a {
                margin-right: 10px;
            }
            @media (max-width: 600px) {
                .right-side {
                    display: none;
                }
            </style>
            <script>
                function deleteAccount(id)
                {
                    var conf = confirm("Are you sure?");
                    if (conf) {
                        window.location.href = '<%=request.getContextPath()%>/admin/account-management/delete-account?accountId=' + id;
                    }
                }
            </script>
        </head>

        <body>
            <header>
                <form action="home" method="POST">
                    <!-- Main container div -->
                    <div class="container">
                        <!-- Header section -->
                        <div class="row">
                            <div class="header">
                                <!-- Logo -->
                                <div class="logo col-md-2">
                                    <a href="#">QUIZWIZ</a>
                                </div>

                                <!-- Search container -->
                                <div class="search-container col-md-6">
                                    <input type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi...">
                                    <button type="button" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                                </div>

                                <!-- Login section -->
                                <div class="login col-md-2">
                                    <ul id="nav" class="nav nav-pills">
                                        <li><a href="#"><i class="fa-regular fa-bell"></i> </a></li>
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
                    </div>
                </form>
            </header>
            <div class="container">

                <div class="right-side" id="formContainer">
                    <c:if test="${requestScope.url == 'create'}">
                        <h2 class="mb-4">Create Form</h2>
                        <form action="create-account" method="POST" class="needs-validation" onsubmit="return validateForm()"> 
                            Mail: <input type="email" name="mail" required /> <br/>
                            Password: <input type="password" name="password" required minlength="8" /> <br/>
                            Display Name: <input type="text" name="displayname" required /> <br/>
                            Full Name: <input type="text" name="fullname" required /> <br/>
                            Dob: <input type="date" name="dob" value="1999-01-01" /> <br/>
                            Status: <input type="text" name="status" required /> <br/>
                            Role: 
                            <c:forEach items="${requestScope.listRole}" var="role">
                                <c:if test="${role.roleId != 1}">
                                    <input type="radio" value="${role.roleId}" name="roleId" required/> ${role.roleName}
                                </c:if>
                            </c:forEach><br/>
                            <div class="col-sm-10 col-sm-offset-2">
                                <div class="btn-container d-flex">
                                <button type="submit" class="btn btn-primary" value="Save">Submit</button><br/>
                                <a href="<%=request.getContextPath()%>/admin/account-management" class="btn btn-default">Cancel</a>
                            </div>
                            </div>
                        </form>
                        <script>
                            function validateForm() {
                                var form = document.forms[0];

                                if (!form.checkValidity()) {
                                    alert("Please fill out all required fields.");
                                    return false;
                                }
                                return true;
                            }
                        </script>
                    </c:if>
                    <c:if test="${requestScope.url == 'update'}">
                        <h2 class="mb-4">Update Form</h2>
                        <form action="update-account" method="POST" class="needs-validation" novalidate> 
                            Id: <input name="accountId" type="text" readonly="readonly" value="${requestScope.accountNeedToUpdate.accountId}"/> <br/>
                            Mail: <input type="text" name="mail" value="${requestScope.accountNeedToUpdate.mail}"/> <br/>
                            Password: <input type="password" name="password" value="${requestScope.accountNeedToUpdate.password}"/> <br/>
                            Display Name: <input type="text" name="displayname" value="${requestScope.accountNeedToUpdate.displayName}"/> <br/>
                            Full Name: <input type="text" name="fullname" value="${requestScope.infoAbountAccountNeedToUpdate.fullName}"/> <br/>
                            Dob: <input type="date" name="dob" value="${requestScope.infoAbountAccountNeedToUpdate.dob}"/> <br/>
                            Status: <input type="text" name="status" value="${requestScope.accountNeedToUpdate.accountStatus}"/> <br/>
                            Role: 
                            <c:forEach items="${requestScope.listRole}" var="role">
                                <c:if test="${role.roleId != 1}">
                                    <input <c:if test="${requestScope.roleFeatureAbountAccountNeedToUpdate.role.roleId==role.roleId}">
                                            checked="checked"
                                        </c:if>
                                        type="radio" value="${role.roleId}" name="roleId"/> ${role.roleName}
                                </c:if>
                            </c:forEach><br/>
                            <div class="col-sm-10 col-sm-offset-2">
                                <div class="btn-container d-flex">
                                <button type="submit" class="btn btn-primary" value="Save">Submit</button>
                                <a href="<%=request.getContextPath()%>/admin/account-management" class="btn btn-default">Cancel</a>
                                </div>
                            </div>
                        </form>
                    </c:if>

                </div>
                <div class="left-side">
                    <a href="<%=request.getContextPath()%>/admin/account-management/create-account" class="btn btn-success mb-3" id="toggleFormLink">Create</a>
                    <h2>List of Account</h2>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="myTable">
                            <thead>
                                <tr>
                                    <td>Id</td>
                                    <td>Mail</td>
                                    <td>Password</td>
                                    <td>Display Name</td>
                                    <td>Full Name</td>
                                    <td>Role</td>
                                    <td>Status</td>
                                    <td>Action</td>
                                </tr>
                            </thead>
                            <tbody id="tableBody">
                                <c:forEach items="${requestScope.listAccountWithInfo}" var="accountInfo">
                                    <tr>
                                        <td>${accountInfo.account.accountId}</td>
                                        <td>${accountInfo.account.mail}</td>
                                        <td>${accountInfo.account.password}</td>
                                        <td>${accountInfo.account.displayName}</td>
                                        <td>${accountInfo.fullName}</td>
                                        <td>${requestScope.listRoleFeatureByListAccount.get(requestScope.listAccountWithInfo.indexOf(accountInfo)).getRole().getRoleName()}</td>
                                        <td>${accountInfo.account.accountStatus}</td>
                                        <td>
                                            <div class="btn-container d-flex">
                                            <c:if test="${requestScope.listRoleFeatureByListAccount.get(requestScope.listAccountWithInfo.indexOf(accountInfo)).getRole().getRoleId() != 1}">
                                                <a href="<%=request.getContextPath()%>/admin/account-management/update-account?accountId=${accountInfo.account.accountId}" class="btn btn-warning btn-sm b">Edit</a>
                                                <input type="button" value="Delete" onclick="deleteAccount(${accountInfo.account.accountId})" class="btn btn-danger btn-sm"/>
                                            </c:if>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                        </table>
                        </tbody>
                        </table>
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
                <!-- End of footer section -->

                <!-- End of main container div -->
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        // Get the logo element
                        var logo = document.querySelector('.logo a');

                        // Add click event listener to the logo
                        logo.addEventListener('click', function () {
                            // Reload the page
                            location.reload();
                        });
                    });
                </script>

            </footer>
        </body>

    </html>









