<%-- 
    Document   : ViewListAccount
    Created on : Jan 17, 2024, 9:55:11 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function deleteAccount(id) {
                var conf = confirm("Are you sure?");
                if (conf) {
                    window.location.href = 'deleteaccount?accountId=' + id;
                }
            }
        </script>
        <style>

        </style>
    </head>
    <body>
        <table border="1px">
            <tr>
                <td>Id</td>
                <td>Mail</td>
                <td>Password</td>
                <td>Display Name</td>
                <td>Full Name</td>
                <td>Role</td>
                <td>Status</td>
                <td>Action</td>
            </tr>
            <c:forEach items="${requestScope.listAccountWithInfo}" var="accountInfo">
                <tr>
                    <td>${accountInfo.account.accountId}</td>
                    <td>${accountInfo.account.mail}</td>
                    <td>${accountInfo.account.password}</td>
                    <td>${accountInfo.account.displayName}</td>
                    <td>${accountInfo.fullName}</td>
                    <td>${requestScope.listRoleFeatureByListAccount[requestScope.listAccountWithInfo.indexOf(accountInfo)].role.roleName}</td>
                    <td>${accountInfo.account.accountStatus}</td>
                    <td>
                        <c:if test="${requestScope.listRoleFeatureByListAccount[requestScope.listAccountWithInfo.indexOf(accountInfo)].role.roleId != 1}">
                            <a href="updateaccount?accountId=${accountInfo.account.accountId}">Edit</a>
                            <input type="button" value="Delete" onclick="deleteAccount(${accountInfo.account.accountId})"/>
                        </c:if>
                    </td>
                </tr>

            </c:forEach>
        </table>

        <!-- Pagination links using JSTL -->

        <br/>
        Note: Delete account đối với student là xóa tất cả mọi thông tin liên quan đến account bao gồm thông tin, lớp đã join, kết quả ktra trong database.<br/>
        Chỉ có thể update role/delete account giảng viên khi tài khoản chưa có hoạt động gì.<br/>
        Không thể delete account Admin.
    </body>
</html>
