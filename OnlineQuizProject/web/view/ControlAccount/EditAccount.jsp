<%-- 
    Document   : EditAccount
    Created on : Jan 17, 2024, 10:24:27 PM
    Author     : PC
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
        <link rel="icon" href="imgage/iconlogo.PNG" type="image/x-icon" />
        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/homeAdmin.css">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <script src="home.js"></script>
    </head>

    <body>
            <!-- Main container div -->
            <div class="container">
                <!-- Header section -->
                <div class="row">
                    <div class="header">
                        <!-- Logo -->
                        <div class="logo col-md-2">
                            <a href="#home">QUIZWIZ</a>
                        </div>

                        <div class="create col-md-1">
                            <a href="#"><i class="fa-solid fa-plus"></i> Tạo đề thi</a>
                        </div>

                        <!-- Search container -->
                        <div class="search-container col-md-5">
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
                                        <li><a href="#"><i class="fa-solid fa-user"></i> User Details</a></li>
                                        <li><a href="#"><i class="fa-solid fa-lock"></i> Change Password</a></li>
                                        <li><a><i class="fa-solid fa-trophy"></i> Achievement</a></li>
                                        <li><a href="#"><i class="fa-solid fa-right-from-bracket"></i> Log out</a></li>

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

                <div class="custom">
                    <h2 class="text-center">Admin Dashboard</h2>
                    <form action="updateaccount" method="POST"> 
                        Id: <input name="accountId" type="text" readonly="readonly" value="${requestScope.accountNeedToUpdate.accountId}"/> <br/>
                        Mail: <input type="text" name="mail" value="${requestScope.accountNeedToUpdate.mail}"/> <br/>
                        Password: <input type="text" name="password" value="${requestScope.accountNeedToUpdate.password}"/> <br/>
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
                        <input type="submit" value="Save"/>
                    </form>
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
    </body>

</html>
