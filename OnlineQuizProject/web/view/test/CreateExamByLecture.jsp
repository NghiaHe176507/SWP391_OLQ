<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }

            form {
                max-width: 600px;
                margin: 20px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                background-color: #ffffff;
            }

            label {
                display: block;
                margin: 10px 0;
                font-weight: bold;
            }

            input[type="number"],
            input[type="text"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            input[type="checkbox"] {
                margin-right: 5px;
            }
        </style>
    </head>
    <body>
        <form method="GET">
            Enter number of questions: <input type="number" name="numQuestion">
            <input type="submit" value="Submit">
        </form>
        
        <c:if test="${not empty param.numQuestion}">

            <c:set var="numQuestion" value="${param.numQuestion}" />

            <c:if test="${numQuestion > 0}">
                <form id="questionForm" method="POST">
                    <c:forEach var="i" begin="1" end="${numQuestion}">
                        <label>Question ${i}:</label>
                        <input type="text" name="question${i}">

                        <label>Add to Question Bank:</label>
                        <input type="checkbox" name="addToBank${i}" value="${i}">
                        <br>

                        <label>Answers:</label>
                        <div id="answerContainer_${i}">
                            <input type="text" name="answer${i}_1" placeholder="Answer 1">
                            <input type="checkbox" name="correctAnswer${i}_1" value="1">
                            <label>Correct Answer</label>
                            <br>
                        </div>
                        <button type="button" onclick="addAnswer(${i})">Add Answer</button>
                        <hr> <!-- Line to split questions -->
                    </c:forEach>
                    <button type="button" onclick="submitForm()">Submit</button>
                </form>
            </c:if>
        </c:if>

        <script>
            function addAnswer(questionNum) {
                var answerContainer = document.getElementById('answerContainer_' + questionNum);
                var answerCount = answerContainer.getElementsByTagName('input').length / 2 + 1; // divide by 2 to exclude checkboxes
                var newInput = document.createElement('input');
                newInput.type = 'text';
                newInput.name = 'answer' + questionNum + '_' + answerCount;
                newInput.placeholder = 'Answer ' + answerCount;
                answerContainer.appendChild(newInput);

                var checkbox = document.createElement('input');
                checkbox.type = 'checkbox';
                checkbox.name = 'correctAnswer' + questionNum + '_' + answerCount;
                checkbox.value = answerCount;
                answerContainer.appendChild(checkbox);

                var label = document.createElement('label');
                label.innerHTML = 'Correct Answer';
                answerContainer.appendChild(label);

                var br = document.createElement('br');
                answerContainer.appendChild(br);
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
        </script>
    </body>
</html>