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
        <link rel="stylesheet" href="css/home.css">
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
                    <a href="#home">QUIZWIZ</a>
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
        <section class="vh-100" style="background-color: #f4f5f7;">
            <div class="container py-5 h-100 ">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-6 mb-4 mb-lg-0">
                        <div class="card mb-3" style="border-radius: .5rem;">
                            <div class="row g-0">
                                <div class="col-md-4 gradient-custom text-center text-white"
                                     style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="Avatar"
                                         class="img-fluid my-5" style="width: 80px;" />
                                    <h5><%= request.getAttribute("fullname") %></h5>
                                    <p><%= request.getAttribute("displayname") %></p> 
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">
                                        <h6>Information</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Email</h6>
                                                <p class="text-muted"><%= request.getAttribute("mail") %></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Day Of Birthday</h6>
                                                <p class="text-muted"><%= request.getAttribute("dob") %></p>
                                            </div>
                                        </div>
                                        <h6>Information</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>ID</h6>
                                                <p class="text-muted"><%= request.getAttribute("account_id") %></p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Status</h6>
                                                <p class="text-muted"><%= request.getAttribute("account_status") %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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