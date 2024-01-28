<%-- 
    Document   : EditAccount
    Created on : Jan 17, 2024, 10:24:27 PM
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
        <form action="updateaccount" method="POST"> 
            Id: <input name="accountId" type="text" readonly="readonly" value="${requestScope.accountNeedToUpdate.accountId}"/> <br/>
            Mail: <input type="text" name="mail" value="${requestScope.accountNeedToUpdate.mail}"/> <br/>
            Password: <input type="text" name="password" value="${requestScope.accountNeedToUpdate.password}"/> <br/>
            Display Name: <input type="text" name="displayname" value="${requestScope.accountNeedToUpdate.displayName}"/> <br/>
            Status: <input type="text" name="status" value="${requestScope.accountNeedToUpdate.accountStatus}"/> <br/>

            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
