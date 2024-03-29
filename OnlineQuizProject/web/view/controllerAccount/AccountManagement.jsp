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
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/AccountManagement.css"/>

        <title>Mange Account</title>
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

            .search-container {
                width: 100%
            }

            .create-button{
                background: linear-gradient(135deg, #9a3cbf, #4397ce);
                cursor: pointer;
                color: white;
                border: none;
                padding: 7px 12px;
            }
            .create-button:hover{
                background-color: #0056b3; /* Màu nền hover */
                color: #fff; /* Màu chữ hover */
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
                            <div class="col-md-6">
                                <ul class="nav nav-pills">
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%= request.getContextPath() %>/home">
                                            <i class="fas fa-folder-open"></i> Home
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%= request.getContextPath() %>/admin/group-management">
                                            <i class="fas fa-list-ul"></i> View List group
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
                                            <li><a href="<%= request.getContextPath() %>/logout"><i class="fas fa-right-from-bracket"></i> Log out</a></li>

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
                                                Status: 
                                                <select name="status" class="form-select" required>
                                                    <c:forEach items="${requestScope.listStatus}" var="status">
                                                        <option value="${status.statusName}">${status.statusName}</option>
                                                    </c:forEach>
                                                </select><br/>

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
                                                Status: 
                                                <select name="status" class="form-select" required>
                                                    <c:forEach items="${requestScope.listStatus}" var="status">
                                                        <option  
                                                            <c:if test="${status.statusName eq requestScope.accountNeedToUpdate.accountStatus}">
                                                                selected
                                                            </c:if>
                                                            value="${status.statusName}">${status.statusName}</option>
                                                    </c:forEach>
                                                </select><br/>

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
                            <a href="<%=request.getContextPath()%>/admin/account-management/create-account" class="btn btn-primary mb-2 create-button" id="toggleFormLink">Create Account</a>
                            <span class="list-account" style="margin-left: 10rem;">Management List Account</span>
                            <form action="<%=request.getContextPath()%>/admin/account-management" method="GET">
                                <div class="search-container">
                                    <input name="query" type="text" id="searchInput" placeholder="Vui lòng nhập mail của account..." style=" border: 1px solid #000;">
                                    <button type="submit" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                                </div>
                            </form>
                            <table id="paginationButtons" class="table user-list">
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
                                    <c:forEach items="${requestScope.paginatedList}" var="accountInfo">
                                        <tr>
                                            <td>${accountInfo.account.accountId}</td>
                                            <td>
                                                <a href="#" class="user-link">${accountInfo.fullName}</a>
                                                <span class="user-subhead" style="${requestScope.listRoleFeatureByListAccount.get(requestScope.paginatedList.indexOf(accountInfo)).getRole().getRoleName() == 'Admin' ? 'color: red;' : ''}">
                                                    ${requestScope.listRoleFeatureByListAccount.get(requestScope.paginatedList.indexOf(accountInfo)).getRole().getRoleName()}
                                                </span>

                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${requestScope.listRoleFeatureByListAccount.get(requestScope.paginatedList.indexOf(accountInfo)).getRole().getRoleName() eq 'Admin'}">*****</c:when>
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
                                                <c:if test="${requestScope.listRoleFeatureByListAccount.get(requestScope.paginatedList.indexOf(accountInfo)).getRole().getRoleId() != 1}">
                                                    <a href="<%=request.getContextPath()%>/admin/account-management/update-account?accountId=${accountInfo.account.accountId}" class="table-link">
                                                        <span class="fa-stack">
                                                            <i class="fas fa-square fa-stack-2x"></i>
                                                            <i class="fas fa-pencil fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                    </a>
                                                </c:if>
                                                <c:choose>
                                                    <c:when test="${accountInfo.account.accountStatus=='Pending'}">
                                                        <input type="button" class="btn btn-primary" value="Active" onclick="window.location.href = '<%=request.getContextPath()%>/active-account?accountId=${accountInfo.account.accountId}'"/>
                                                    </c:when>
                                                    <c:when test="${accountInfo.account.accountStatus=='Active'}">
                                                        <input type="button" class="btn btn-primary" value="Close" onclick="window.location.href = '<%=request.getContextPath()%>/close-account?accountId=${accountInfo.account.accountId}'"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
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
        </div>
        <footer>
            <div id="footer">
                <!-- Social Icons -->
                <div class="socials-list">
                    <a href=""><i class="fab fa-facebook"></i></a>
                    <a href=""><i class="fab fa-instagram"></i></a>
                    <a href=""><i class="fas fa-bell"></i></a>
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
        </footer>
    </body>
</html>

