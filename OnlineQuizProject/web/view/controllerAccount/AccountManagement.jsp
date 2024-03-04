<%-- 
    Document   : AccountManager
    Created on : Feb 25, 2024, 10:20:43 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Form and Table</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                height: 100vh;
            }

            .container {
                flex: 1;
                display: flex;
                justify-content: flex-end;
                /* Align items to the right side of the container */
            }

            .left-side,
            .right-side {
                padding: 20px;
                box-sizing: border-box;
            }

            .left-side {
                overflow: auto;
                width: 50%;
            }

            .right-side {
                overflow: auto;
                width: 50%;
                /* Initially hide the right-side form */
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th,
            td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            #toggleFormLink {
                margin-left: 20px;
                align-self: flex-start;
                cursor: pointer;
                color: blue;
                text-decoration: underline;
            }
        </style>
        <script>
            function deleteAccount(id)
            {
                var conf = confirm("are you sure?");
                if (conf) {
                    window.location.href = '<%=request.getContextPath()%>/admin/account-management/delete-account?accountId=' + id;
                }
            }
        </script>
    </head>

    <body>
        <div class="container">

            <div class="right-side" id="formContainer">
                <c:if test="${requestScope.url == 'create'}">
                    <h2>Create Form</h2>
                    <form action="create-account" method="POST"> 
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
                </c:if>
                <c:if test="${requestScope.url == 'update'}">
                    <h2>Update Form</h2>
                    <form action="update-account" method="POST"> 
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
                </c:if>

            </div>
            <div class="left-side">
                <a href="<%=request.getContextPath()%>/admin/account-management/create-account" id="toggleFormLink">Create</a>
                <h2>Display Table</h2>
                <table id="myTable">
                    <thead>
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
                    </thead>
                    <tbody id="tableBody">
                        <c:forEach items="${requestScope.listAccountWithInfo}" var="accountInfo">
                            <tr>
                                <td>${accountInfo.account.accountId}</td>
                                <td>${accountInfo.account.mail}</td>
                                <td>${accountInfo.account.password}</td>
                                <td>${accountInfo.account.displayName}</td>
                                <td>${accountInfo.fullName}</td>
                                <td>${requestScope.listRoleFeatureByListAccount.get(requestScope.listAccountWithInfo.indexOf(accountInfo)).getRole().getRoleName()}</td>
                                <td>${accountInfo.account.accountStatus}</td>
                                <td>
                                    <c:if test="${requestScope.listRoleFeatureByListAccount.get(requestScope.listAccountWithInfo.indexOf(accountInfo)).getRole().getRoleId() != 1}">
                                        <a href="<%=request.getContextPath()%>/admin/account-management/update-account?accountId=${accountInfo.account.accountId}">Edit</a>
                                        <input type="button" value="Delete" onclick="deleteAccount(${accountInfo.account.accountId})"/>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                </table>
                </tbody>
                </table>

            </div>
        </div>

    </body>

</html>
