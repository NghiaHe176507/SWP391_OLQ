<%-- 
    Document   : ViewListAccount
    Created on : Jan 17, 2024, 9:55:11 PM
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
            function deleteAccount(id)
            {
                var conf = confirm("are you sure?");
                if (conf) {
                    window.location.href = 'deleteaccount?accountId='+id;
                }
            }
        </script>
    </head>
    <body>
        <table border="1px">
            <tr>
                <td>Id</td>
                <td>Mail</td>
                <td>Password</td>
                <td>Display Name</td>
                <td>Status</td>
                <td>Action</td>
            </tr>
            <c:forEach items="${requestScope.listAccount}" var="account">
                <tr>
                    <td>${account.accountId}</td>
                    <td>${account.mail}</td>
                    <td>${account.password}</td>
                    <td>${account.displayName}</td>
                    <td>${account.accountStatus}</td>
                    <td>
                        <a href="updateaccount?accountId=${account.accountId}">Edit</a>
                        <input type="button" value="Delete" onclick="deleteAccount(${account.accountId})"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
