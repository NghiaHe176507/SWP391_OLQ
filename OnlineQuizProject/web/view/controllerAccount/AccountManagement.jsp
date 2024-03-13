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
                <div class="container">
                    <div class="row">
                        <div class="header">
                            <div class="logo col-md-2">
                                <a href="<%= request.getContextPath() %>/home">QUIZWIZ</a>
                            </div>

                            <li><a style="
                                   text-decoration: none;
                                   color: #fff;
                                   font-weight: bold;
                                   font-size: 16px" href="<%= request.getContextPath() %>/home"><i class="fa-regular fa-folder-open"></i> Home</a></li>
                            <li><a style="
                                   text-decoration: none;
                                   color: #fff;
                                   font-weight: bold;
                                   font-size: 16px" href="<%= request.getContextPath() %>/admin/group-management"><i class="fa-solid fa-list-ul"></i> View List group</a></li>
                            <li><a style="
                                   text-decoration: none;
                                   color: #fff;
                                   font-weight: bold;
                                   font-size: 16px" href="<%= request.getContextPath() %>/admin/topic-management"><i class="fa-solid fa-book"></i> View List Topic</a></li>

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
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
            <div class="row">
                <div class="space"></div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <c:if test="${requestScope.url == 'create'}">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="align-items-lg-center py-3 flex-column flex-lg-row">
                                    <h2 class="h5 mb-3 mb-lg-0">Create new account</h2>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <c:if test="${requestScope.url == 'create'}">
                                            <form action="create-account" method="POST" class="needs-validation" onsubmit="return validateForm()"> 
                                                Mail: <input type="email" name="mail" class="form-control" required /> <br/>
                                                Password: <input type="password" name="password" class="form-control" required minlength="8" /> <br/>
                                                Display Name: <input type="text" name="displayname" class="form-control" required /> <br/>
                                                Full Name: <input type="text" name="fullname" class="form-control" required /> <br/>
                                                Dob: <input type="date" name="dob" class="form-control" value="1999-01-01" /> <br/>
                                                Status: <input type="text" name="status" class="form-control" required /> <br/>
                                                <label style="margin-right: 40px">Role</label>
                                                <c:forEach items="${requestScope.listRole}" var="role">
                                                    <c:if test="${role.roleId != 1}">
                                                        <input type="radio" value="${role.roleId}" name="roleId" class="form-check-input" required/> <span style="    padding-right: 90px;">${role.roleName}</span>
                                                    </c:if>
                                                </c:forEach><br/>
                                                <div class="d-grid gap-2">
                                                    <button type="submit" class="btn btn-primary" value="Save">Submit</button>
                                                    <a href="<%=request.getContextPath()%>/admin/account-management" class="btn btn-light">Cancel</a>
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${requestScope.url == 'update'}">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="align-items-lg-center py-3 flex-column flex-lg-row">
                                    <h2 class="h5 mb-3 mb-lg-0">Update Form</h2>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <c:if test="${requestScope.url == 'update'}">
                                            <form action="update-account" method="POST" class="form-control" class="needs-validation" novalidate> 
                                                Id: <input name="accountId" type="text" class="form-control" readonly="readonly" value="${requestScope.accountNeedToUpdate.accountId}"/> <br/>
                                                Mail: <input type="text" name="mail" class="form-control" value="${requestScope.accountNeedToUpdate.mail}"/> <br/>
                                                Password: <input type="password" class="form-control" name="password" value="${requestScope.accountNeedToUpdate.password}"/> <br/>
                                                Display Name: <input type="text" class="form-control" name="displayname" value="${requestScope.accountNeedToUpdate.displayName}"/> <br/>
                                                Full Name: <input type="text" class="form-control" name="fullname" value="${requestScope.infoAbountAccountNeedToUpdate.fullName}"/> <br/>
                                                Dob: <input type="date" class="form-control" name="dob" value="${requestScope.infoAbountAccountNeedToUpdate.dob}"/> <br/>
                                                Status: <input type="text" class="form-control" name="status" value="${requestScope.accountNeedToUpdate.accountStatus}"/> <br/>
                                                <label style="margin-right: 40px">Role</label>
                                                <c:forEach items="${requestScope.listRole}" var="role">
                                                    <c:if test="${role.roleId != 1}">
                                                        <input <c:if test="${requestScope.roleFeatureAbountAccountNeedToUpdate.role.roleId==role.roleId}">
                                                                checked="checked"
                                                            </c:if>
                                                            type="radio" value="${role.roleId}" name="roleId"/> <span style="padding-right: 60px;">${role.roleName}</span>
                                                    </c:if>
                                                </c:forEach><br/>
                                                <div class="d-grid gap-2">
                                                    <button type="submit" class="btn btn-primary" value="Save">Submit</button>
                                                    <a href="<%=request.getContextPath()%>/admin/account-management" class="btn btn-default">Cancel</a>
                                                </div>
                                            </form>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
                <div class="col-lg-8">
                    <div class="main-box clearfix">
                        <div class="table-responsive">
                            <a href="<%=request.getContextPath()%>/admin/account-management/create-account" class="btn btn-primary mb-3" id="toggleFormLink">Create</a>
                            <span class="list-account">List Account</span>
                            <table class="table user-list">
                                <!-- Table headers -->
                                <thead>
                                    <tr>
                                        <th><span>ID</span></th>
                                        <th><span>User</span></th>
                                        <th><span>Password</span></th>
                                        <th class="text-center"><span>Status</span></th>
                                        <th><span>Email</span></th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listAccountWithInfo}" var="accountInfo">
                                        <tr>
                                            <td>${accountInfo.account.accountId}</td>
                                            <td>
                                                <a href="#" class="user-link">${accountInfo.fullName}</a>
                                                <span class="user-subhead" style="${requestScope.listRoleFeatureByListAccount.get(requestScope.listAccountWithInfo.indexOf(accountInfo)).getRole().getRoleName() == 'Admin' ? 'color: red;' : ''}">
                                                    ${requestScope.listRoleFeatureByListAccount.get(requestScope.listAccountWithInfo.indexOf(accountInfo)).getRole().getRoleName()}
                                                </span>

                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${requestScope.listRoleFeatureByListAccount.get(requestScope.listAccountWithInfo.indexOf(accountInfo)).getRole().getRoleName() eq 'Admin'}">*****</c:when>
                                                    <c:otherwise>${accountInfo.account.password}</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-center">
                                                <span class="label label-default">${accountInfo.account.accountStatus}</span>
                                            </td>
                                            <td>
                                                <a href="#">${accountInfo.account.mail}</a>
                                            </td> 
                                            <td style="width: 20%;">
                                                <c:if test="${requestScope.listRoleFeatureByListAccount.get(requestScope.listAccountWithInfo.indexOf(accountInfo)).getRole().getRoleId() != 1}">
                                                    <a href="<%=request.getContextPath()%>/admin/account-management/update-account?accountId=${accountInfo.account.accountId}" class="table-link">
                                                        <span class="fa-stack">
                                                            <i class="fa fa-square fa-stack-2x"></i>
                                                            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                    </a>
                                                    <a href="#" class="table-link danger" onclick="deleteAccount(${accountInfo.account.accountId})">
                                                        <span class="fa-stack">
                                                            <i class="fa fa-square fa-stack-2x"></i>
                                                            <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                    </a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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

