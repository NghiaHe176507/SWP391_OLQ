<%-- 
    Document   : UserDetail
    Created on : Mar 7, 2024, 2:57:42 PM
    Author     : Đạt Phạm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Details</title>
        <link rel="icon" href="../image/iconlogo.PNG" type="image/x-icon" />
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/homeStudent.css">
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>   
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
            /* Create Styles */
            .create {
                text-align: center;
            }

            .create a {
                text-decoration: none;
                font-family: "Poppins", sans-serif;
                font-weight: bold;
                font-size: 16px;
                color: #fff;
                padding: 10px 20px;
                background: linear-gradient(135deg, #9a3cbf, #4397ce);
                border-radius: 5px;
                transition: background 0.3s ease, transform 0.2s ease-in-out;
            }

            .create a:hover {
                background: linear-gradient(135deg, #4397ce, #9a3cbf);
                transform: scale(1.05);
            }

            .create a:active {
                transform: scale(0.95);
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

            /* Style for User Profile */
            .card {
                background-color: #f7f7f7;
                padding: 20px;
            }

            .card-header {
                background-color: #007bff;
                color: white;
                font-size: 24px;
                text-align: center;
                padding: 10px;
            }

            .table-bordered {
                border: 1px solid #dee2e6;
            }

            .table-bordered th,
            .table-bordered td {
                border: 1px solid #dee2e6;
                padding: 8px;
            }

            .table-bordered th {
                background-color: #f2f2f2;
            }

            /* Responsive Image */
            .img-fluid {
                max-width: 100%;
                height: auto;
            }

            /* Center align text in table */
            .table td.text-center,
            .table th.text-center {
                text-align: center;
            }

            /* Form input style */
            .form-control[readonly] {
                background-color: #f7f7f7;
                border: none;
            }

            /* Additional styles for Account Status and Mail */
            .table-bordered th,
            .table-bordered td {
                border: 1px solid #dee2e6;
                padding: 12px;
            }

            /* Style for Account Status label */
            .text-end-label {
                font-weight: bold;
            }

            /* Center align text in the table cells */
            .table td.text-center,
            .table th.text-center {
                text-align: center;
            }

            /* Responsive Image */
            .img-fluid {
                max-width: 100%;
                height: auto;
            }

            /* Center align text in table */
            .table td.text-center,
            .table th.text-center {
                text-align: center;
            }

            /* Form input style */
            .form-control[readonly] {
                background-color: #f7f7f7;
                border: none;
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
                        <a href="#">QUIZWIZ</a>
                    </div>

                    <div class="create col-md-2">
                        <a href="${pageContext.request.contextPath}/home">Return Home</a>
                    </div>

                    <!-- Search container -->
                    <form action="search" method="GET" class=" col-md-5">
                        <div class="search-container">
                            <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm...">
                            <button type="submit" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>


                    <!-- Login section -->
                    <div class="login col-md-2">
                        <ul id="nav" class="nav nav-pills">
                            <li class="nav-item dropdown">
                                <div class="circle-background">
                                    <img class="profile-image" src="image/avatar.jpg" alt="Profile Image">
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
            <!-- Empty space -->

            <section class="min-vh-100 bg-light">
                <div class="row">
                    <div class="space"></div>
                </div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="card border-0 shadow-sm rounded">
                                <div class="card-body p-5 border">
                                    <h2 class="text-center mb-5">User Profile</h2>
                                    <table class="table table-bordered">
                                        <tbody>
                                            <tr>
                                                <td class="text-center" colspan="2">
                                                    <img src="image/avatar.jpg"
                                                         class="img-fluid rounded-circle" alt="User avatar"
                                                         style="width: 150px; height: 150px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-end" style="width: 40%;">
                                                    Fullname:
                                                </td>
                                                <td>
                                                    <input type="text" name="fullname" placeholder="Fullname" class="form-control"
                                                           value="${requestScope.listAccountWithInfo.fullName}" readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-end">
                                                    Display Name:
                                                </td>
                                                <td>
                                                    <input type="text" name="displayname" placeholder="Display Name"
                                                           class="form-control" value="${requestScope.listAccountWithInfo.account.displayName}"
                                                           readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-end">
                                                    Day of Birthday:
                                                </td>
                                                <td>
                                                    <input type="date" name="dob" placeholder="Day of Birthday" class="form-control"
                                                           value="${requestScope.listAccountWithInfo.dob}" readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-end">
                                                    Account Status:
                                                </td>
                                                <td>
                                                    <input type="text" name="account_status" placeholder="Account Status"
                                                           class="form-control" value="${requestScope.listAccountWithInfo.account.accountStatus}"
                                                           readonly>
                                                </td>
                                            </tr><tr>
                                                <td class="text-end">
                                                    Mail:
                                                </td>
                                                <td>
                                                    <input type="email" name="email" placeholder="Email"
                                                           class="form-control" value="${requestScope.listAccountWithInfo.account.mail}"
                                                           readonly>
                                                </td>
                                            </tr>



                                            <tr>
                                                <td class="text-end">
                                                    Password:
                                                </td>
                                                <td>
                                                    <input type="password" id="current_password" name="current_password"
                                                           placeholder="Current Password" class="form-control"
                                                           value="${requestScope.listAccountWithInfo.account.password}" readonly>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <div id="footer">
            <div class="socials-list">
                <a href=""><i class="fa-brands fa-facebook"></i></a>
                <a href=""><i class="fa-brands fa-instagram"></i></a>
                <a href=""><i class="fa-solid fa-bell"></i></a>
            </div>
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