<%-- 
    Document   : result
    Created on : Feb 25, 2024, 12:47:33 AM
    Author     : nghia
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Results</title>
</head>
<body>
    <h1>Search Results</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Group ID</th>
                <th>Group Name</th>
                <th>Lecture ID</th>
                <th>Topic ID</th>
                <th>Status ID</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${searchResults}" var="group">
                <tr>
                    <td>${group.groupId}</td>
                    <td>${group.groupName}</td>
                    <td>${group.lectureId}</td>
                    <td>${group.topicId}</td>
                    <td>${group.statusId}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
