<%-- 
    Document   : GroupManagementForLecture
    Created on : Feb 27, 2024, 10:45:59 PM
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
            function DeleteGroup(id)
            {
                var conf = confirm("are you sure?");
                if (conf) {
                    window.location.href = '<%=request.getContextPath()%>/group-management/delete-group?groupId=' + id;
                }
            }
        </script>
    </head>

    <body>
        <div class="container">

            <div class="right-side" id="formContainer">
                <c:if test="${requestScope.url == 'create'}">
                    <form action="create-group" method="POST"> 
                        Group Name: <input type="text" name="groupName" /> <br/>
                        Topic:  
                        <select name="topicId">
                            <c:forEach items="${requestScope.listTopic}" var="topic">
                                <option value="${topic.topicId}">${topic.topicName}</option>
                            </c:forEach>
                        </select><br/>
                        <input type="submit" value="Save"/>
                    </form>
                </c:if>
            </div>
            <div class="left-side">
                <a href="<%=request.getContextPath()%>/group-management/create-group" id="toggleFormLink">Create</a>
                <h2>Display Table</h2>
                <table id="myTable">
                    <thead>
                        <tr>
                            <td>Group Name</td>
                            <td>Topic Name</td>
                            <td>Status</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                        <c:forEach items="${requestScope.listGroup}" var="group">
                            <tr>
                                <td>${group.groupName}</td>
                                <td>${group.topic.topicName}</td>
                                <td>${group.status.statusName}</td>
                                <td>
                                    <c:if test="true">
                                        <input type="button" value="Delete" onclick="DeleteGroup(${group.groupId})"/>
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
