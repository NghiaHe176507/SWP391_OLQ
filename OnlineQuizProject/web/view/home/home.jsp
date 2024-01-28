<%-- 
    Document   : home
    Created on : Jan 14, 2024, 2:36:55 PM
    Author     : Phạm Văn Nghĩa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Metadata -->
        <meta charset="UTF-8">
        <title>QuizWiz</title>
        <!-- Favicon -->
        <link rel="icon" href="../image/iconlogo.PNG" type="image/x-icon" />
        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/home.css">
        <!-- Link to your javascripts -->
        <link rel="stylesheet" href="home.js">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
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
                        <div class="login column-gap-md-2">
                            <ul id="nav">
                                <li><a href="#">Sign In</a></li>
                                <li><a href="#">Sign Up</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Empty space -->
                <div class="row">
                    <div class="space"></div>
                </div>
            </div>
            <!-- End of header section -->

            <!-- Carousel -->
            <div id="carouselExampleIndicators" class="carousel slide">
                <div class="carousel-indicators">
                    <!-- Carousel indicators buttons -->
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" class="active"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>
                <!-- Carousel inner content -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <!-- Image 1 -->
                        <img src="image/Slider1.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <!-- Image 2 -->
                        <img src="image/slider2.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <!-- Image 3 -->
                        <img src="image/slider3.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <!-- Carousel control buttons -->
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
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
            <!-- End of footer section -->

            <!-- End of main container div -->
        </form>
    </body>

</html>
