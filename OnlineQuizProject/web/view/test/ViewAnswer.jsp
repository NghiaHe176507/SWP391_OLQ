<%-- 
    Document   : ViewAnswer
    Created on : 25 Feb 2024, 11:58:32 pm
    Author     : tuann
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Online Quiz</title>
        <link rel="stylesheet" href="css/testContent.css">
    </head>

    <body>
        <div class="container">


            <c:forEach var="option" items="${questionAndAnswerOption}">
                <div class="question">
                    <h2>Question ${option.optionAnswerId}</h2>
                    <c:forEach var="listQuestion" items="${listQuestion}">
                        <p>${listQuestion.question.questionContent}</p>
                    </c:forEach>
                </div>
                <div class="options">
                    <div class="option">
                        <input type="radio" id="option1" name="answer" value="option1">
                        <span for="option1">Option 1</span>
                    </div>
                    <div class="option correct">
                        <input type="radio" id="option2" name="answer" value="option2" checked>
                        <span for="option2">Option 2 (Correct)</span>
                    </div>
                    <div class="option">
                        <input type="radio" id="option3" name="answer" value="option3">
                        <span for="option3">Option 3</span>
                    </div>
                    <div class="option">
                        <input type="radio" id="option4" name="answer" value="option4">
                        <span for="option4">Option 4</span>
                    </div>
                    <div class="detailed-answer">
                        <p>Detailed answer for Question 1 goes here.</p>
                    </div>
                    <p class="show-answer">Show Answer</p>
                </div>
            </c:forEach>
            <div class="back-btn">
                <a href="#">Home</a>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const showAnswerElements = document.querySelectorAll('.show-answer');

                showAnswerElements.forEach(function (element) {
                    element.addEventListener('click', function () {
                        const detailedAnswer = this.parentElement.querySelector('.detailed-answer');
                        detailedAnswer.style.display = detailedAnswer.style.display === 'none' ? 'block' : 'none';
                    });
                });
            });
        </script>
    </body>

</html>
