<%-- 
    Document   : createAccount
    Created on : Jan 17, 2024, 7:39:11 PM
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <script src="home.js"></script>

        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }

            table td, table th {
                padding: 5px;
                border: 0.1px solid #ddd;
                text-align: left;
            }

            .center-div {
                display: flex;
                justify-content: center;
            }

            h2{
                padding-top: .5rem;
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
                <h2 class="text-center">Update Information Account</h2>
                <div class="row">

                    <form action="createaccount" method="POST"> 
                        <div class="center-div">
                            <table>
                                <tr>
                                    <td>Mail:</td>
                                    <td><input type="text" name="mail" /></td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td><input type="text" name="password" /></td>
                                </tr>
                                <tr>
                                    <td>Display Name:</td>
                                    <td><input type="text" name="displayname" /></td>
                                </tr>
                                <tr>
                                    <td>Full Name:</td>
                                    <td><input type="text" name="fullname" /></td>
                                </tr>
                                <tr>
                                    <td>Dob:</td>
                                    <td><input type="date" name="dob" value="1999-01-01"/></td>
                                </tr>
                                <tr>
                                    <td>Status:</td>
                                    <td><select  name="status">
                                            <c:forEach items="${requestScope.listStatus}" var="status">
                                                <option 
                                                    value="${status.statusName}">${status.statusName}</option>
                                            </c:forEach>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Role:</td>
                                    <td><c:forEach items="${requestScope.listRole}" var="role">
                                            <c:if test="${role.roleId != 1}">
                                                <input type="radio" value="${role.roleId}" name="roleId"/> ${role.roleName}
                                            </c:if>
                                        </c:forEach></td>
                                </tr>
                            </table>
                        </div>
                        <input type="submit" value="Save"style="margin: 5px; padding: 5px;"/>
                    </form>
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

        <script>
            // Function to show confirmation dialog
            function confirmSave() {
                return confirm("Do you want to save your changes?");
            }

            // Add event listener to document for mouse click
            document.addEventListener("mousedown", function (event) {
                // Get the form element
                var form = document.querySelector("form");

                // Check if the click is outside the form
                if (!form.contains(event.target)) {
                    // Call confirmSave function
                    if (confirmSave()) {
                        // If confirmed, submit the form
                        form.submit();
                    } else {
                        // If not confirmed, redirect to home
                        window.location.href = "${pageContext.request.contextPath}/home";
                    }
                }
            });
        </script>


    </body>

</html>