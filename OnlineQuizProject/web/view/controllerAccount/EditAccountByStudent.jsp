<%-- 
    Document   : EditAccountByStudent
    Created on : Feb 18, 2024, 9:47:34 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="updateaccount" method="POST"> 
            Id: <input name="accountId" type="text" readonly="readonly" value="${requestScope.accountNeedToUpdate.accountId}"/> <br/>
            Password: <input type="text" name="password" value="${requestScope.accountNeedToUpdate.password}"/> <br/>
            Display Name: <input type="text" name="displayname" value="${requestScope.accountNeedToUpdate.displayName}"/> <br/>
            Full Name: <input type="text" name="fullname" value="${requestScope.infoAbountAccountNeedToUpdate.fullName}"/> <br/>
            Dob: <input type="date" name="dob" value="${requestScope.infoAbountAccountNeedToUpdate.dob}"/> <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>