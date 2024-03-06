<%-- 
    Document   : createAccount
    Created on : Jan 17, 2024, 7:39:11 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new account</title>
    </head>
    <body>
        <a href="<%=request.getContextPath()%>/listaccount">View Detail List Account</a> <br/>
        <form action="createaccount" method="POST"> 
            Mail: <input type="text" name="mail" /> <br/>
            Password: <input type="text" name="password" /> <br/>
            Display Name: <input type="text" name="displayname" /> <br/>
            Full Name: <input type="text" name="fullname" /> <br/>
            Dob: <input type="date" name="dob" value="1999-01-01"/> <br/>
            Status: <input type="text" name="status" /> <br/>
            Role: 
            <c:forEach items="${requestScope.listRole}" var="role">
                <c:if test="${role.roleId != 1}">
                    <input type="radio" value="${role.roleId}" name="roleId"/> ${role.roleName}
                </c:if>
            </c:forEach><br/>
            <input type="submit" value="Save"/>

        </form>
    </body>
</html>
