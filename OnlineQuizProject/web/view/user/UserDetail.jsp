
<%-- 
    Document   : UserDetail.jsp
    Created on : Jan 23, 2024, 10:34:20 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>UserDetails</title>
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <link rel="stylesheet" href="css/userdetail.css">
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script> 
    </head>
    <body>
        <!-- Header section -->
        <div class="row">
            <div class="header">
                <!-- Logo -->
                <div class="logo col-md-2">
                    <a href="<%= request.getContextPath() %>/home">QUIZWIZ</a>
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

                        <div class="circle-background">
                            <img class="profile-image" src="image/hero-image.webp" alt="Profile Image">
                        </div>

                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Empty space -->
        <div class="row">
            <div class="space"></div>
        </div>
<!--        <div>
            <div class ="mid ">
                <div class="logo ">
                    <a href="#UserDetail">Profile</a>
                </div>

                <p><strong>Display Name:</strong> <%= request.getAttribute("displayname") %></p>
                <p><strong>Email:</strong> <%= request.getAttribute("mail") %></p>
                <p><strong>Full Name:</strong> <%= request.getAttribute("fullname") %></p>
                <p><strong>Date of Birth:</strong> <%= request.getAttribute("dob") %></p>
            </div>
        </div>-->
        <div class="profile-container">
            <div class="profile-heading">Profile</div>
            <div class="profile-info">
                <div class="circle-background">
                    <img class="profile-image" src="image/hero-image.webp" alt="Profile Image">
                </div>
                <div class="info-item"><p><strong>Display Name:</strong> <%= request.getAttribute("displayname") %></p></div>
                <div class="info-item"><p><strong>Email:</strong> <%= request.getAttribute("mail") %></p></div>
                <div class="info-item"><p><strong>Full Name:</strong> <%= request.getAttribute("fullname") %></p></div>
                <div class="info-item"><p><strong>Date of Birth:</strong> <%= request.getAttribute("dob") %></p></div>
            </div>
        </div>


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