<%-- 
    Document   : ViewOwnedGroupForLecture
    Created on : Feb 25, 2024, 4:22:57 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function DeleteGroup(id)
            {
                var conf = confirm("are you sure?");
                if (conf) {
                    window.location.href = 'DeleteGroupByLecture?groupId=' + id;
                }
            }
        </script>
    </head>
    <body>
        <table border="1px">
            <tr>
                <td>Group Name</td>
                <td>Topic Name</td>
                <td>Status</td>
                <td>Action</td>
            </tr>
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
    </body>
</html>
