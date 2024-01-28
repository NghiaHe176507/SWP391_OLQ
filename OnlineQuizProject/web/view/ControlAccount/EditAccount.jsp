<%-- 
    Document   : EditAccount
    Created on : Jan 17, 2024, 10:24:27 PM
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
            Mail: <input type="text" name="mail" value="${requestScope.accountNeedToUpdate.mail}"/> <br/>
            Password: <input type="text" name="password" value="${requestScope.accountNeedToUpdate.password}"/> <br/>
            Display Name: <input type="text" name="displayname" value="${requestScope.accountNeedToUpdate.displayName}"/> <br/>
            Full Name: <input type="text" name="fullname" value="${requestScope.infoAbountAccountNeedToUpdate.fullName}"/> <br/>
            Dob: <input type="date" name="dob" value="${requestScope.infoAbountAccountNeedToUpdate.dob}"/> <br/>
            Status: <input type="text" name="status" value="${requestScope.accountNeedToUpdate.accountStatus}"/> <br/>
            Role: 
            <c:forEach items="${requestScope.listRole}" var="role">
                <c:if test="${role.roleId != 1}">
                    <input <c:if test="${requestScope.roleFeatureAbountAccountNeedToUpdate.role.roleId==role.roleId}">
                            checked="checked"
                        </c:if>
                        type="radio" value="${role.roleId}" name="roleId"/> ${role.roleName}
                </c:if>
            </c:forEach><br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
