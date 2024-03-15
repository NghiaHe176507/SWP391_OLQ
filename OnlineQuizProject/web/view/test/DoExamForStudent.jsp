<%-- 
    Document   : DoExamForStudent.jsp
    Created on : Mar 12, 2024, 8:52:30 AM
    Author     : nghia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
    <head>
        <!-- Metadata -->
        <meta charset="UTF-8">
        <title>QuizWiz</title>
        <!-- Favicon -->
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/DoExamForStudent.css">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <!--<script src="home.js"></script>-->
        <script src="js/jquery.twbsPagination.js" type="text/javascript"></script>
        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            html {
                font-family: "Poppins", sans-serif;
                scroll-behavior: smooth;
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

            /*  */
            .main-div {
                position: relative;
            }

            .dropdown {
                position: relative;
                z-index: 1;
            }

            .dropdown-title {
                cursor: pointer;
                padding: 10px;
                background-color: #f0f0f0;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .dropdown-list {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                width: 100%;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 5px;
                z-index: 2;
            }

            .dropdown-list.show {
                display: block;
            }

            .dropdown-item {
                padding: 10px;
                border-bottom: 1px solid #ccc;
                cursor: pointer;
            }

            .dropdown-item:last-child {
                border-bottom: none;
            }

            .other-content {
                margin-top: 20px;
                background-color: #f9f9f9;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }


            /* CSS để xóa viền và thêm border */
            body {
                font-family: Arial, sans-serif;
            }

            .quiz {
                border: 2px solid #ccc;
                padding: 20px;
                border-radius: 10px;
            }

            .question {
                margin-bottom: 20px;
                border: 1px solid #ddd;
                padding: 10px;
                border-radius: 5px;
            }

            .question-text {
                font-weight: bold;
            }

            .answer {
                margin-left: 20px;
            }

            /* CSS để thay đổi giao diện khi hover */
            .question:hover {
                background-color: #f5f5f5;
            }

            /* CSS để thay đổi giao diện khi chọn */
            .answer input[type="checkbox"]:checked+label {
                background-color: #e0e0e0;
            }

            /* CSS cho label và input cùng một hàng */
            .answer label,
            .answer input[type="checkbox"] {
                display: inline-block;
                vertical-align: middle;
            }

            /* Khoảng cách giữa checkbox và label */
            .answer label {
                margin-left: 5px;
            }


            /* CSS cho nút Nộp bài */
            .submit-button {
                display: block;
                margin-top: 20px;
                padding: 10px 20px;
                background-color: rgb(223, 58, 58);
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .submit-button:hover {
                background-color: rgb(119, 33, 33);
            }


            .create {
                text-align: center;
            }

            .countdown-container {
                position: fixed;
                top: 80px;
                right: 40px;
                border: 2px solid #ccc;
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 5px;
            }

            .countdown-timer {
                font-size: 24px;
                font-weight: bold;
            }

            /* Định dạng số giờ, phút, giây */
            #hours, #minutes, #seconds {
                padding: 0 5px;
                border-right: 1px solid #ccc;
            }

            #seconds {
                border-right: none; /* Loại bỏ border phía bên phải của giây */
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
                        <button type="button" class="btn btn-primary" id="joinGroupButton" data-toggle="modal" data-target="#exampleModal"
                                data-whatever="@mdo">Join group</button>
                    </div>

                    <!-- Search container -->
                    <form action="search" method="GET" class="col-md-5">
                        <div class="search-container">
                            <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi, topic hoặc group...">
                            <button type="submit" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>



                    <!-- Login section -->
                    <div class="login col-md-3">
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

            <!-- Empty space -->
            <div class="row">
                <div class="space"></div>
            </div>

            <form action="view-total" method="POST" id="quiz-form">
                <div class="quiz">
                    <c:forEach items="${requestScope.listQuestion}" var="eachQuestion" varStatus="questionIndex">
                        <div class="question">
                            <div class="question-text">
                                Câu hỏi ${questionIndex.index + 1}: ${eachQuestion.question.questionContent}
                            </div>

                            <c:forEach items="${requestScope.optionAnswersForEachQuestion[questionIndex.index]}" var="answer" varStatus="answerIndex">
                                <div class="answer">
                                    <input type="checkbox" id="q${questionIndex.index + 1}.${answerIndex.index + 1}" name="q${questionIndex.index + 1}" value="${answerIndex.index + 1}" data-option-answer-id="${answer.optionAnswerId}">
                                    <label for="q${questionIndex.index + 1}.${answerIndex.index + 1}">${answerIndex.index + 1}: ${answer.answerContent}</label><br>
                                </div>
                            </c:forEach>
                        </div>
                    </c:forEach>

                    <button class="submit-button" onclick="submitQuiz()">Hoàn thành bài thi!!!</button>
                </div>


                <div class="countdown-container">
                    <div class="countdown">
                        <div class="countdown-timer">
                            <span id="hours">00</span>:
                            <span id="minutes">00</span>:
                            <span id="seconds">00</span>
                        </div>
                    </div>
                </div>
            </form>

        </div>

        <!-- End of header section -->

        <!-- Admin content section -->


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
    <script>
        // Lấy ra các phần tử của đồng hồ
        const hoursElement = document.getElementById('hours');
        const minutesElement = document.getElementById('minutes');
        const secondsElement = document.getElementById('seconds');

        // Thời gian ban đầu để đếm ngược (dạng "00:00:00")
        let countdownInput = "00:00:30";

        // Chuyển đổi đầu vào "00:00:00" thành số giây
        let [inputHours, inputMinutes, inputSeconds] = countdownInput.split(":");
        let countdownTime = parseInt(inputHours) * 3600 + parseInt(inputMinutes) * 60 + parseInt(inputSeconds);

        // Biến kiểm tra đã nộp bài hay chưa
        let hasSubmitted = false;

        function updateCountdown() {
            const hours = Math.floor(countdownTime / 3600);
            const minutes = Math.floor((countdownTime % 3600) / 60);
            const seconds = countdownTime % 60;

            // Hiển thị giờ, phút, giây với định dạng "00"
            hoursElement.textContent = hours.toString().padStart(2, '0');
            minutesElement.textContent = minutes.toString().padStart(2, '0');
            secondsElement.textContent = seconds.toString().padStart(2, '0');

            // Giảm thời gian đếm ngược mỗi giây
            countdownTime--;

            // Dừng đếm ngược khi hết thời gian
            if (countdownTime < 0) {
                clearInterval(countdownInterval);
                submitQuizTimeout();
            }
        }

        // Cập nhật đồng hồ mỗi giây
        const countdownInterval = setInterval(updateCountdown, 1000);

        // Hàm tự động submit và hiển thị thông báo khi hết thời gian
        function submitQuizTimeout() {
            const quizForm = document.getElementById('quiz-form');
            quizForm.submit();

            alert("Bạn đã hết thời gian làm bài!");

        }


        // Hàm tự động submit và hiển thị thông báo
        function submitQuiz() {
            // Lấy danh sách tất cả các câu hỏi
            var questions = document.querySelectorAll('.question');

            // Biến để kiểm tra xem có câu hỏi nào chưa được chọn không
            var hasUncheckedQuestion = false;
            var allUnchecked = true; // Biến kiểm tra xem tất cả câu hỏi đều chưa được chọn
            var alertShown = false; // Biến để kiểm tra xem đã hiển thị thông báo chưa

            questions.forEach(function (question) {
                // Lấy danh sách các checkbox trong câu hỏi
                var checkboxes = question.querySelectorAll('input[type="checkbox"]');
                var isChecked = false;

                // Kiểm tra xem có ít nhất 1 checkbox được chọn không
                checkboxes.forEach(function (checkbox) {
                    if (checkbox.checked) {
                        isChecked = true;
                        allUnchecked = false; // Có ít nhất 1 checkbox được chọn, không phải tất cả đều chưa được chọn
                    }
                });

                // Nếu không có checkbox nào được chọn, đánh dấu có câu hỏi chưa được chọn
                if (!isChecked) {
                    hasUncheckedQuestion = true;
                    // Scroll đến câu hỏi chưa được chọn và hiển thị thông báo nếu chưa hiển thị
                    if (!alertShown) {
                        question.scrollIntoView({behavior: 'smooth', block: 'end'});
                        alert("Vui lòng chọn ít nhất một đáp án cho mỗi câu hỏi trước khi nộp bài.");
                        alertShown = true;
                        event.preventDefault();
                    }
                    return;
                }
            });

            // Nếu tất cả câu hỏi đều chưa được chọn, hiển thị thông báo nếu chưa hiển thị
            if (allUnchecked && !alertShown) {
                alert("Vui lòng chọn ít nhất một đáp án cho mỗi câu hỏi trước khi nộp bài.");
                alertShown = true;
                event.preventDefault();
                return;
            }

            // Nếu không có câu hỏi nào chưa được chọn và đã có ít nhất 1 câu hỏi được chọn, hiển thị thông báo xác nhận
            if (!hasUncheckedQuestion && !alertShown) {
                var confirmSubmit = confirm("Bạn có chắc chắn muốn nộp bài không?");
                if (confirmSubmit) {
                    alert("Bài thi đã được nộp thành công!");
                    // Ở đây bạn có thể thực hiện các hành động khác sau khi người dùng nộp bài
                    hasSubmitted = true; // Đánh dấu đã nộp bài
                } else {
                    event.preventDefault();
                }
                alertShown = true;
            }
        }

        // Xử lý sự kiện nút Submit
        const submitButton = document.getElementById('submit-button');
        submitButton.addEventListener('click', function () {
            // Kiểm tra nếu thời gian còn lại vẫn lớn hơn 0
            if (countdownTime > 0) {
                submitQuiz();
            } else if (countdownTime === 0) {
                // Thời gian đã hết, tự động submit bài và thông báo
                submitQuizTimeout();
            }
        });

    </script>


    <!--
    
            <script>
                $(document).ready(function () {
                    $('.admin-functions td a').on('click', function (e) {
                        e.preventDefault();
                        var contentId = $(this).data('content-id');
                        $('.admin-content').hide();
                        $('#' + contentId).show();
                    });
                });
            </script>
    
            <script>
                $('#exampleModal').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget) // Button that triggered the modal
                    var recipient = button.data('whatever') // Extract info from data-* attributes
                    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                    var modal = $(this)
                    // modal.find('.modal-title').text('New message to ' + recipient)
                    // modal.find('.modal-body input').val(recipient)
                })
            </script>-->


    <!--        <script>
                function toggleDropdown(event) {
                    const dropdown = event.currentTarget;
                    const dropdownList = dropdown.querySelector(".dropdown-list");
    
                    // Toggle class "show" for dropdown list
                    dropdownList.classList.toggle("show");
    
                    // Get height of the dropdown list
                    const dropdownHeight = dropdownList.offsetHeight;
    
                    // Get next sibling element (in this case, the element below the dropdown)
                    const nextElement = dropdown.nextElementSibling;
    
                    // If dropdown list is visible, add margin to next sibling
                    if (dropdownList.classList.contains("show")) {
                        nextElement.style.marginTop = ${dropdownHeight}px;
                    } else {
                        nextElement.style.marginTop = 0;
                    }
                }
    
                // Đóng dropdown khi click bên ngoài
                window.addEventListener("click", function (event) {
                    const dropdowns = document.querySelectorAll(".dropdown");
                    dropdowns.forEach(function (dropdown) {
                        const dropdownList = dropdown.querySelector(".dropdown-list");
                        if (!dropdown.contains(event.target)) {
                            dropdownList.classList.remove("show");
                            const nextElement = dropdown.nextElementSibling;
                            nextElement.style.marginTop = 0;
                        }
                    });
                });
            </script>-->

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var quizDiv = document.querySelector('.quiz');

            document.querySelectorAll('a').forEach(function (link) {
                if (!quizDiv.contains(link)) {
                    link.addEventListener('click', function (event) {
                        event.preventDefault();
                    });
                }
            });

            document.querySelectorAll('button').forEach(function (button) {
                if (!quizDiv.contains(button)) {
                    button.addEventListener('click', function (event) {
                        event.preventDefault();
                    });
                }
            });

            document.querySelectorAll('input').forEach(function (input) {
                if (!quizDiv.contains(input)) {
                    input.addEventListener('click', function (event) {
                        event.preventDefault();
                    });
                }
            });

            document.querySelectorAll('select').forEach(function (select) {
                if (!quizDiv.contains(select)) {
                    select.addEventListener('click', function (event) {
                        event.preventDefault();
                    });
                }
            });

            document.querySelectorAll('textarea').forEach(function (textarea) {
                if (!quizDiv.contains(textarea)) {
                    textarea.addEventListener('click', function (event) {
                        event.preventDefault();
                    });
                }
            });

            document.querySelectorAll('label').forEach(function (label) {
                if (!quizDiv.contains(label)) {
                    label.addEventListener('click', function (event) {
                        event.preventDefault();
                    });
                }
            });

            document.querySelectorAll('span').forEach(function (span) {
                if (!quizDiv.contains(span)) {
                    span.addEventListener('click', function (event) {
                        event.preventDefault();
                    });
                }
            });
        });

    </script>

</body>

</html>