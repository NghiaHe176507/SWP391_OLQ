<%-- 
    Document   : CreateExam
    Created on : Mar 11, 2024, 8:58:18 AM        
    Author     : Đạt Phạm
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Exam</title>
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery.twbsPagination.js" type="text/javascript"></script>
        <style>
            @import url("https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap");
            .form-check {
                margin-top: .5rem;
            }

            .distance {
                margin-right: 5px;
            }

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

            #nav > li {
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
                content: ""; /* Tạo một pseudo-element để làm hình nền của hiệu ứng nhấp chuột */
                position: absolute; /* Đặt vị trí tuyệt đối để che phủ biểu tượng */
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                background-color: rgba(0,0, 0,0.2); /* Màu nền của hiệu ứng khi nhấp chuột */
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

            #footer a {
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
        </style>
    </head>
    <body>
        <header>
            <div class="container">
                <div class="row">
                    <div class="header">
                        <!-- Logo -->
                        <div class="logo col-md-2">
                            <a href="home">QUIZWIZ</a>
                        </div>

                        <form action="search" method="GET" class="col-md-6">
                            <div class="search-container" style="width: 100%">
                                <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi, topic hoặc group...">
                                <button id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </form>
                        <div class="login col-md-3">
                            <ul id="nav" class="nav nav-pills">
                                <li><a href="#"><i class="fa-regular fa-bell"></i> </a></li>
                                <li class="nav-item dropdown">
                                    <div class="circle-background">
                                        <img class="profile-image" src="image/avatar.jpg" alt="Profile Image">
                                    </div>
                                    <ul class="subnav">
                                        <li><a href="<%= request.getContextPath() %>/updateaccount"><i class="fa-solid fa-user"></i> User Details</a></li>
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
        </header>
        <div class="container mt-5 pt-4">
            <form method="GET" class="mt-5">
                <div class="mb-3">
                    <label for="numQuestion" class="form-label">Enter number of questions:</label>
                    <input type="number" class="form-control" id="numQuestion" name="numQuestion">
                    <input hidden="hidden" type="number" class="form-control" id="groupId" name="groupId" value="${requestScope.groupId}">

                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
            <br/>

            <c:if test="${not empty param.numQuestion}">
                <c:set var="numQuestion" value="${param.numQuestion}" />
                <c:if test="${numQuestion > 0}">
                    <form action="create-exam" id="questionForm" method="POST" class="mt-5">
                        <input hidden="hidden" type="number" class="form-control" id="numQuestion" name="numQuestion" value="${numQuestion}">
                        <input hidden="hidden" type="number" class="form-control" id="groupId" name="groupId" value="${requestScope.groupId}">
                        <label for="examTitle" class="form-label">Enter Title Of Exam:</label>
                        <input type="text" class="form-control" id="examTitle" name="examTitle"><br/>
                        Attempt: <input type="number" class="form-control" id="attempt" name="attempt"><br/>
                        <div class="row">
                            <div class="col-lg-6 mb-3">
                                <label for="examDate" class="form-label">Start Exam Date:</label>
                                <input type="date" class="form-control" id="examStartDate" name="examStartDate" min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required>
                            </div>
                            <div class="col-lg-6 mb-3">
                                <label for="examTime" class="form-label">Start Exam Time:</label>
                                <input type="time" class="form-control" id="examStartTime" name="examStartTime">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6 mb-3">
                                <label for="examEndDate" class="form-label">End Exam Date:</label>
                                <input type="date" class="form-control" id="examEndDate" name="examEndDate" min="<%= request.getParameter("examDate") %>" required>
                            </div>
                            <div class="col-lg-6 mb-3">
                                <label for="examEndTime" class="form-label">End Exam Time:</label>
                                <input type="time" class="form-control" id="examEndTime" name="examEndTime" min="<%= request.getParameter("examTime") %>" required>
                            </div>
                        </div>

                        <div class="col-lg-12 mb-3">
                            <label for="examEndTime" class="form-label">Create Time for Exam (minutes)</label>
                            <input type="number" class="form-control" name="examTimeToTest" required>
                        </div>

                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="isPractice" name="isPractice" >
                            <label class="form-check-label" for="isPractice">Is this exam for practice?</label>
                        </div>

                        <div id="questions">
                            <c:forEach var="i" begin="1" end="${numQuestion}">
                                <div class="question mb-4">
                                    <div class="mb-3">
                                        <label class="form-label">Question ${i}:</label>
                                        <input type="text" class="form-control" name="question${i}">
                                    </div>

                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input" id="addToBank${i}" name="addToBank${i}" value="${i}">
                                        <label class="form-check-label" for="addToBank${i}">Add to Question Bank</label>
                                    </div>

                                    <div id="answerContainer_${i}">
                                        <div class="answer mb-2">
                                            <input type="text" class="form-control" name="answer${i}_1" placeholder="Answer 1">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" name="correctAnswer${i}_1" value="1">
                                                <label class="form-check-label" for="correctAnswer${i}_1">Correct Answer</label>
                                                <button type="button" onclick="deleteAnswer(this)" class="btn btn-danger btn-sm ms-2">Delete Answer</button>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="button" onclick="addAnswer(${i})" class="btn btn-secondary mt-2">Add Answer</button>
                                    <button type="button" onclick="deleteQuestion(this)" class="btn btn-danger mt-2">Delete Question</button>
                                    <hr> <!-- Line to split questions -->
                                </div>
                            </c:forEach>
                        </div>

                        <button type="button" onclick="addQuestion()" class="btn btn-primary mt-3">Add Question</button>
                        <button type="button" onclick="submitForm()" class="btn btn-primary mt-3">Submit</button>
                    </form>
                </c:if>
            </c:if>
        </div>
        <div style="padding-bottom: 20px;"></div>

        <div id="footer">
            <div class="socials-list">
                <a href=""><i class="fa-brands fa-facebook"></i></a>
                <a href=""><i class="fa-brands fa-instagram"></i></a>
                <a href=""><i class="fa-solid fa-bell"></i></a>
            </div>
            <!-- Slogan -->
            <p class="slogan">Khám phá sức thông minh cùng <a href="#">Quizwiz</a> </p>
        </div>
        <script>
            function addAnswer(questionNum) {
                var answerContainer = document.getElementById('answerContainer_' + questionNum);
                var answerCount = answerContainer.querySelectorAll('.answer').length + 1;
                var answerDiv = document.createElement('div');
                answerDiv.classList.add('answer', 'mb-2');
                answerDiv.innerHTML = '<input type="text" class="form-control" name="answer' + questionNum + '_' + answerCount + '" placeholder="Answer ' + answerCount + '">' +
                        '<div class="form-check">' +
                        '<input type="checkbox" class="form-check-input" id="correctAnswer' + questionNum + '_' + answerCount + '" name="correctAnswer' + questionNum + '_' + answerCount + '" value="' + answerCount + '">' +
                        '<label class="form-check-label" for="correctAnswer' + questionNum + '_' + answerCount + '">Correct Answer</label>' +
                        '<button type="button" onclick="deleteAnswer(this)" class="btn btn-danger btn-sm ms-2">Delete Answer</button>' +
                        '</div>';
                answerContainer.appendChild(answerDiv);
            }

            function deleteAnswer(button) {
                var answerDiv = button.parentNode.parentNode; // Navigate to the parent of the parent element
                answerDiv.parentNode.removeChild(answerDiv);
            }

            function addQuestion() {
                var questionsDiv = document.getElementById('questions');
                var questionCount = questionsDiv.getElementsByClassName('question').length + 1;

                var questionDiv = document.createElement('div');
                questionDiv.classList.add('question', 'mb-4');

                var questionInput = document.createElement('div');
                questionInput.classList.add('mb-3');
                questionInput.innerHTML = '<label class="form-label">Question ' + questionCount + ':</label>' +
                        '<input type="text" class="form-control" name="question' + questionCount + '">';

                var addToBankInput = document.createElement('div');
                addToBankInput.classList.add('mb-3', 'form-check');
                addToBankInput.innerHTML = '<input type="checkbox" class="form-check-input" id="addToBank' + questionCount + '" name="addToBank' + questionCount + '" value="' + questionCount + '">' +
                        '<label class="form-check-label" for="addToBank' + questionCount + '">Add to Question Bank</label>';

                var answerContainer = document.createElement('div');
                answerContainer.id = 'answerContainer_' + questionCount;
                answerContainer.innerHTML = '<div class="answer mb-2">' +
                        '<input type="text" class="form-control" name="answer' + questionCount + '_1" placeholder="Answer 1">' +
                        '<div class="form-check">' +
                        '<input type="checkbox" class="form-check-input" name="correctAnswer' + questionCount + '_1" id="correctAnswer' + questionCount + '_1" value="1">' +
                        '<label class="form-check-label" for="correctAnswer' + questionCount + '_1">Correct Answer</label>' +
                        '<button type="button" onclick="deleteAnswer(this)" class="btn btn-danger btn-sm ms-2">Delete Answer</button>' +
                        '</div>';

                var addAnswerButton = document.createElement('button');
                addAnswerButton.type = 'button';
                addAnswerButton.classList.add('btn', 'btn-secondary', 'mt-2', 'distance');
                addAnswerButton.innerHTML = 'Add Answer';
                addAnswerButton.onclick = function () {
                    addAnswer(questionCount);
                };

                var deleteButton = document.createElement('button');
                deleteButton.type = 'button';
                deleteButton.classList.add('btn', 'btn-danger', 'mt-2');
                deleteButton.innerHTML = 'Delete Question';
                deleteButton.onclick = function () {
                    deleteQuestion(this);
                };

                questionDiv.appendChild(questionInput);
                questionDiv.appendChild(addToBankInput);
                questionDiv.appendChild(answerContainer);
                questionDiv.appendChild(addAnswerButton);
                questionDiv.appendChild(deleteButton);
                questionDiv.appendChild(document.createElement('hr'));

                questionsDiv.appendChild(questionDiv);
            }

            function deleteQuestion(button) {
                var questionDiv = button.parentNode;
                questionDiv.parentNode.removeChild(questionDiv);

                // Update question and answer numbers
                var questions = document.getElementsByClassName('question');
                for (var i = 0; i < questions.length; i++) {
                    var questionNumber = i + 1;
                    var questionInputs = questions[i].querySelectorAll('input[name^="question"]');
                    for (var j = 0; j < questionInputs.length; j++) {
                        questionInputs[j].setAttribute('name', 'question' + questionNumber);
                    }
                    var answerContainers = questions[i].querySelectorAll('[id^="answerContainer_"]');
                    for (var k = 0; k < answerContainers.length; k++) {
                        var answers = answerContainers[k].getElementsByClassName('answer');
                        for (var l = 0; l < answers.length; l++) {
                            var answerNumber = l + 1;
                            var answerInputs = answers[l].querySelectorAll('[name^="answer"], [name^="correctAnswer"]');
                            for (var m = 0; m < answerInputs.length; m++) {
                                var inputName = answerInputs[m].getAttribute('name').replace(/\d+/, questionNumber).replace(/\d+/, answerNumber);
                                answerInputs[m].setAttribute('name', inputName);
                                if (answerInputs[m].getAttribute('id')) {
                                    var inputId = answerInputs[m].getAttribute('id').replace(/\d+/, questionNumber).replace(/\d+/, answerNumber);
                                    answerInputs[m].setAttribute('id', inputId);
                                }
                            }
                        }
                    }
                }
            }



            function submitForm() {
                var selectedQuestions = [];
                var checkboxes = document.querySelectorAll('input[name^="addToBank"]:checked');
                checkboxes.forEach(function (checkbox) {
                    selectedQuestions.push(checkbox.value);
                });

                if (selectedQuestions.length === 0) {
                    alert("Please select at least one question to add to the question bank.");
                    return;
                }

                var confirmation = confirm("Are you sure you want to add the selected questions to the question bank?");
                if (confirmation) {
                    document.getElementById("questionForm").submit();
                }
            }

            // Validate exam date and time
            document.getElementById('examDate').addEventListener('change', function () {
                var today = new Date().toISOString().split('T')[0];
                if (this.value < today) {
                    this.value = today;
                    alert("You cannot choose an end date less than today.");
                }
            });

            document.getElementById('examTime').addEventListener('change', function () {
                var now = new Date();
                var selectedTime = new Date(now.toDateString() + ' ' + this.value);
                if (selectedTime < now) {
                    alert("You cannot choose an end time less than now.");
                    this.value = '';
                }
            });

            document.getElementById('examEndDate').addEventListener('change', function () {
                var today = new Date().toISOString().split('T')[0];
                if (this.value < today) {
                    this.value = today;
                    alert("You cannot choose an end date less than today.");
                }
            });

            document.getElementById('examEndTime').addEventListener('change', function () {
                var now = new Date();
                var selectedTime = new Date(now.toDateString() + ' ' + this.value);
                if (selectedTime < now) {
                    alert("You cannot choose an end time less than now.");
                    this.value = '';
                }
            });
        </script>
    </body>
</html>

