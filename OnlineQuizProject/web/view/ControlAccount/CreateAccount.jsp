<%-- 
    Document   : createAccount
    Created on : Jan 17, 2024, 7:39:11 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new account</title>
    </head>
    <body>
        <form action="createaccount" method="POST"> 
            Mail: <input type="text" name="mail" /> <br/>
            Password: <input type="text" name="password" /> <br/>
            Display Name: <input type="text" name="displayname" /> <br/>
            Status: <input type="text" name="status" /> <br/>
            
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
