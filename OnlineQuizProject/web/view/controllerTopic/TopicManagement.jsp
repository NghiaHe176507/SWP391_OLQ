<%-- 
    Document   : viewListTopic
    Created on : Feb 19, 2024, 12:31:49 AM
    Author     : PC
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/homeStudent.js"></script>
        <title>Topic</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                height: 100vh;
                justify-content: center;
                align-items: center; /* Center items vertically */
            }

            .container {

                display: flex;
                max-width: 800px;
                width: 100%;
                justify-content: center;
                /* Add margin for spacing on both sides */
            }

            .left-side,
            .right-side {
                padding: 20px;
                box-sizing: border-box;
                border: 1px solid #ddd;
                border-radius: 8px;
                width: 48%; /* Adjust the width to leave some space between left and right sides */
            }

            .left-side {
                overflow: auto;
                margin-right: 10px; /* Add margin between left and right sides */
            }

            .right-side {
                overflow: auto;
                margin-left: 10px; /* Add margin between left and right sides */
            }

            .left-side h2 {
                color: #007bff;
                margin-bottom: 20px;
            }

            .left-side a.btn {
                color: #fff;
            }

            .left-side a.btn:hover {
                text-decoration: none;
            }

            .left-side .btn-danger {
                background-color: #dc3545;
                border-color: #dc3545;
            }

            .left-side .btn-danger:hover {
                background-color: #bd2130;
                border-color: #bd2130;
            }
        </style>
        <script>
            function DeleteTopic(id)
            {
                var conf = confirm("Are you sure?");
                if (conf) {
                    window.location.href = '<%=request.getContextPath()%>/admin/topic-management/delete-topic?topicId=' + id;
                }
            }
        </script>
    </head>

    <body>
        <div class="container">

            <div class="right-side" id="formContainer">
                <c:if test="${requestScope.url == 'create'}">
                    <div class="container-fluid">
                        <h2 class="mb-4">Create Topic</h2>
                        <form action="create-topic" method="POST" class="needs-validation" novalidate>
                            <div class="form-group">
                                <label for="topicName">Topic Name:</label>
                                <input type="text" class="form-control" id="topicName" name="topicName" required>
                                <div class="invalid-feedback">Please enter a topic name.</div>
                            </div>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                    </div>
                </c:if>
            </div>
            <div class="left-side">
                <a href="<%=request.getContextPath()%>/admin/topic-management/create-topic" class="btn btn-success mb-3" id="toggleFormLink">Create</a>
                <div class="container-fluid">
                    <h2 class="mb-4">View List Topic</h2>
                    <table class="table table-striped" id="myTable">
                        <thead class="thead-dark">
                            <tr>
                                <th>Topic Id</th>
                                <th>Topic Name</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="tableBody">
                            <c:forEach items="${requestScope.listTopic}" var="topic">
                                <tr>
                                    <td>${topic.topicId}</td>
                                    <td>${topic.topicName}</td>
                                    <td>
                                        <button class="btn btn-danger" onclick="DeleteTopic(${topic.topicId})">Delete</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </body>

</html>
