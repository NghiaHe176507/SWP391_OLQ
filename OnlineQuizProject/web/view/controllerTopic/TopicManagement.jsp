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
        <title>Form and Table</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                height: 100vh;
            }

            .container {
                flex: 1;
                display: flex;
                justify-content: flex-end;
                /* Align items to the right side of the container */
            }

            .left-side,
            .right-side {
                padding: 20px;
                box-sizing: border-box;
            }

            .left-side {
                overflow: auto;
                width: 50%;
            }

            .right-side {
                overflow: auto;
                width: 50%;
                /* Initially hide the right-side form */
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th,
            td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            #toggleFormLink {
                margin-left: 20px;
                align-self: flex-start;
                cursor: pointer;
                color: blue;
                text-decoration: underline;
            }
        </style>
        <script>
            function DeleteTopic(id)
            {
                var conf = confirm("are you sure?");
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
                    <h2>Create Topic</h2>
                    <form action="create-topic" method="POST"> 
                        Topic Name: <input type="text" name="topicName" /> <br/>
                        <input type="submit" value="Save"/>
                    </form>
                </c:if>
            </div>
            <div class="left-side">
                <a href="<%=request.getContextPath()%>/admin/topic-management/create-topic" id="toggleFormLink">Create</a>
                <h2>Display Table</h2>
                <table id="myTable">
                    <thead>
                        <tr>
                            <td>Topic Id</td>
                            <td>Topic Name</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                        <c:forEach items="${requestScope.listTopic}" var="topic">
                            <tr>
                                <td>${topic.topicId}</td>
                                <td>${topic.topicName}</td>
                                <td>
                                    <c:if test="true">
                                        <input type="button" value="Delete" onclick="DeleteTopic(${topic.topicId})"/>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                </table>
                </tbody>
                </table>
            </div>
        </div>

    </body>

</html>
