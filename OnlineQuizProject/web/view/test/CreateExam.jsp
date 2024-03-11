<%-- 
    Document   : CreateExam
    Created on : Mar 11, 2024, 8:58:18 AM
    Author     : Đạt Phạm
--%>
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
        <form method="POST">
            Enter number: <input type="number" name="numQuestion">
            <input type="submit" value="Submit">
        </form>

        <c:if test="${not empty param.numQuestion}">
            <c:set var="numQuestion" value="${param.numQuestion}" />

            <c:if test="${numQuestion > 0}">
                <form method="POST">
                    <c:forEach var="i" begin="1" end="${numQuestion}">
                        <label>Question ${i}:</label>
                        <input type="text" name="question${i}">

                        <label>Answers:</label>
                        <c:forEach var="j" begin="1" end="4">
                            <input type="text" name="answer${i}_${j}" placeholder="Answer ${j}">
                            <input type="checkbox" name="correctAnswer${i}" value="${j}">
                            <label>Correct Answer</label>
                            <br>
                        </c:forEach>
                    </c:forEach>
                    <input type="submit" value="Submit Answers">
                </form>
            </c:if>
        </c:if>
    </body>
</html>
