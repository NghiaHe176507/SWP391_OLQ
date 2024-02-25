<%-- 
    Document   : CreateTopic
    Created on : Feb 24, 2024, 8:58:06 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="<%=request.getContextPath()%>/listTopic">View Detail List Topic</a> <br/>
        <form action="createtopic" method="POST"> 
            Topic Name: <input type="text" name="topicName" /> <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
