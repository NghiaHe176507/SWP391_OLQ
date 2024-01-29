<%-- 
    Document   : ChangeUserDetail
    Created on : Jan 29, 2024, 8:44:02 AM
    Author     : Đạt Phạm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ChangeUserDetails" method="post">
                <h1>Change info</h1>
                <hr>
                <label for="accMail"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="accMail" required value="${accMail}">
                <label for="accName"><b>Full Name</b></label>
                <input type="text" placeholder="Enter Name" name="accName" required value="${accName}">
                <label for="accName"><b>Display Name</b></label>
                <input type="text" placeholder="Enter Name" name="accDisplayName" required value="${accDisplayName}">
                <label for="accAdrress"><b>Dob</b></label>
                <input type="text" placeholder="Enter Address" name="accAdrress"  required value="${accAdrress}">
                <hr>
                <button type="submit" class="registerbtn">Done</button>
            </form>
    </body>
</html>
