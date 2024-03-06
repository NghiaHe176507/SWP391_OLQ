<%-- 
    Document   : CreateGroupByLecture
    Created on : Feb 25, 2024, 4:22:31 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new group</title>
    </head>
    <body>
        <a href="<%=request.getContextPath()%>/GroupOwned">View List group owned</a> <br/>
        <form action="CreateGroup" method="POST"> 
            Group Name: <input type="text" name="groupName" /> <br/>
            Topic:  
            <select name="topicId">
                <c:forEach items="${requestScope.listTopic}" var="topic">
                    <option value="${topic.topicId}">${topic.topicName}</option>
                </c:forEach>
            </select><br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
