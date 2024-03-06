<%-- 
    Document   : viewListTopic
    Created on : Feb 19, 2024, 12:31:49 AM
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
            function DeleteTopic(id)
            {
                var conf = confirm("are you sure?");
                if (conf) {
                    window.location.href = 'DeleteTopic?topicId=' + id;
                }
            }
        </script>
    </head>
    <body>
        <table border="1px">
            <tr>
                <td>Topic Id</td>
                <td>Topic Name</td>
                <td>Action</td>
            </tr>
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
    </body>
</html>
