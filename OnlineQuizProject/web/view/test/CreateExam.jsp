<%-- 
    Document   : CreateExam
    Created on : Mar 11, 2024, 8:58:18 AM
    Author     : Đạt Phạm
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <form method="GET" class="mt-5">
                <div class="mb-3">
                    <label for="numQuestion" class="form-label">Enter number of questions:</label>
                    <input type="number" class="form-control" id="numQuestion" name="numQuestion">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>

            <c:if test="${not empty param.numQuestion}">
                <c:set var="numQuestion" value="${param.numQuestion}" />
                <c:if test="${numQuestion > 0}">
                    <form id="questionForm" method="POST" class="mt-5">
                        <div class="mb-3">
                            <label for="examDate" class="form-label">Exam Date:</label>
                            <input type="date" class="form-control" id="examDate" name="examDate" min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
                        </div>

                        <div class="mb-3">
                            <label for="examTime" class="form-label">Exam Time:</label>
                            <input type="time" class="form-control" id="examTime" name="examTime">
                        </div>

                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="isPractice" name="isPractice" value="true">
                            <label class="form-check-label" for="isPractice">Is this exam for practice?</label>
                        </div>

                        <c:forEach var="i" begin="1" end="${numQuestion}">
                            <div class="mb-3">
                                <label class="form-label">Question ${i}:</label>
                                <input type="text" class="form-control" name="question${i}">
                            </div>

                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="addToBank${i}" name="addToBank${i}" value="${i}">
                                <label class="form-check-label" for="addToBank${i}">Add to Question Bank</label>
                            </div>

                            <div id="answerContainer_${i}">
                                <input type="text" class="form-control mb-2" name="answer${i}_1" placeholder="Answer 1">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="correctAnswer${i}_1" name="correctAnswer${i}_1" value="1">
                                    <label class="form-check-label" for="correctAnswer${i}_1">Correct Answer</label>
                                </div>
                            </div>

                            <button type="button" onclick="addAnswer(${i})" class="btn btn-secondary mt-2">Add Answer</button>
                            <hr> <!-- Line to split questions -->
                        </c:forEach>
                        <button type="button" onclick="submitForm()" class="btn btn-primary mt-3">Submit</button>
                    </form>
                </c:if>
            </c:if>
        </div>

        <script>
            function addAnswer(questionNum) {
                var answerContainer = document.getElementById('answerContainer_' + questionNum);
                var answerCount = answerContainer.getElementsByTagName('input').length / 2 + 1; // divide by 2 to exclude checkboxes
                var newInput = document.createElement('input');
                newInput.type = 'text';
                newInput.classList.add('form-control', 'mb-2');
                newInput.name = 'answer' + questionNum + '_' + answerCount;
                newInput.placeholder = 'Answer ' + answerCount;
                answerContainer.appendChild(newInput);

                var checkbox = document.createElement('input');
                checkbox.type = 'checkbox';
                checkbox.classList.add('form-check-input');
                checkbox.name = 'correctAnswer' + questionNum + '_' + answerCount;
                checkbox.value = answerCount;
                answerContainer.appendChild(checkbox);

                var label = document.createElement('label');
                label.innerHTML = 'Correct Answer';
                label.classList.add('form-check-label');
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

            // Validate exam date and time
            document.getElementById('examDate').addEventListener('change', function () {
                var today = new Date().toISOString().split('T')[0];
                if (this.value < today) {
                    this.value = today;
                    alert("You cannot choose a date less than today.");
                }
            });

            document.getElementById('examTime').addEventListener('change', function () {
                var now = new Date();
                var selectedTime = new Date(now.toDateString() + ' ' + this.value);
                if (selectedTime < now) {
                    alert("You cannot choose a time less than now.");
                    this.value = '';
                }
            });
        </script>
    </body>
</html>



