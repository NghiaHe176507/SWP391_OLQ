<%-- 
    Document   : homeAdmin
    Created on : Feb 21, 2024, 12:42:00 AM
    Author     : nghia
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Metadata -->
        <meta charset="UTF-8">
        <title>QuizWiz</title>
        <!-- Favicon -->
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/homeAdmin.css">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="home.js"></script>
        
        <script>
            function deleteAccount(id)
            {
                var conf = confirm("are you sure?");
                if (conf) {
                    window.location.href = 'deleteaccount?accountId=' + id;
                }
            }
        </script>
    </head>

    <body>
        <form>
            <!-- Main container div -->
            <div class="container">
                <!-- Header section -->
                <div class="row">
                    <div class="header">
                        <!-- Logo -->
                        <div class="logo col-md-2">
                            <a href="#home">QUIZWIZ</a>
                        </div>

                        <div class="create col-md-1">
                            <a href="#"><i class="fa-solid fa-plus"></i> Tạo đề thi</a>
                        </div>

                        <!-- Search container -->
                        <div class="search-container col-md-5">
                            <input type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi...">
                            <button type="button" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>

                        <!-- Login section -->
                        <div class="login col-md-2">
                            <ul id="nav" class="nav nav-pills">
                                <li><a href="#"><i class="fa-regular fa-bell"></i> </a></li>
                                <li class="nav-item dropdown">
                                    <div class="circle-background">
                                        <img class="profile-image" src="image/avatar.jpg" alt="Profile Image">
                                    </div>
                                    <ul class="subnav">
                                        <li><a href="<%= request.getContextPath() %>/UserDetail"><i class="fa-solid fa-user"></i> User Details</a></li>
                                        <li><a href="#"><i class="fa-solid fa-lock"></i> Change Password</a></li>
                                        <li><a><i class="fa-solid fa-trophy"></i> Achievement</a></li>
                                        <li><a href="<%= request.getContextPath() %>/logout"><i class="fa-solid fa-right-from-bracket"></i> Log out</a></li>

                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Empty space -->
                <div class="row">
                    <div class="space"></div>
                </div>

                <div class="custom">
                    <h2 class="text-center">Admin Dashboard</h2>
                    <div class="row">
                        <div class="col-md-3">
                            <table class="table admin-functions table-admin">
                                <tbody>
                                    <tr>
                                        <td><a href="#" data-content-id="viewAccountContent">View List Account</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" data-content-id="createAccountContent">Create Account</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" data-content-id="updateAccountContent">Update Account</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" data-content-id="deleteAccountContent">Delete Account</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" data-content-id="createTopicContent">Create a topic</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#" data-content-id="deleteTopicContent">Delete a topic</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="col-md-9 admin">
                            <div id="viewAccountContent" class="admin-content">
                                <div>
                                    <table id="paginationButtons" class="custom-table">
                                        <tr class="account-row">
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
                                                <td>${requestScope.listRoleFeatureByListAccount.get(requestScope.listAccountWithInfo.indexOf(accountInfo)).getRole().getRoleName()}</td>
                                                <td>${accountInfo.account.accountStatus}</td>
                                                <td>
                                                    <c:if test="${requestScope.listRoleFeatureByListAccount.get(requestScope.listAccountWithInfo.indexOf(accountInfo)).getRole().getRoleId() != 1}">
                                                        <a href="updateaccount?accountId=${accountInfo.account.accountId}" >Edit</a>
                                                        <input type="button" value="Delete" onclick="deleteAccount(${accountInfo.account.accountId})"/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                    <br />
                                    <p>Note: Delete account đối với student là xóa tất cả mọi thông tin liên quan đến account bao gồm thông
                                        tin,
                                        lớp đã join, kết quả ktra trong database.<br />
                                        Chỉ có thể update role/delete account giảng viên khi tài khoản chưa có hoạt động gì.<br />
                                        Không thể delete account Admin.</p>
                                </div>
                            </div>

                            <div id="createAccountContent" class="admin-content">
                                <a href="#" class="detail-link">View Detail List Account</a> <br />
                                <form action="createaccount" method="POST">
                                    <table>
                                        <tr>
                                            <td>Mail:</td>
                                            <td><input type="text" name="mail" /></td>
                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td><input type="text" name="password" /></td>
                                        </tr>
                                        <tr>
                                            <td>Display Name:</td>
                                            <td><input type="text" name="displayname" /></td>
                                        </tr>
                                        <tr>
                                            <td>Full Name:</td>
                                            <td><input type="text" name="fullname" /></td>
                                        </tr>
                                        <tr>
                                            <td>Dob:</td>
                                            <td><input type="date" name="dob" value="1999-01-01" /></td>
                                        </tr>
                                        <tr>
                                            <td>Status:</td>
                                            <td><input type="text" name="status" /></td>
                                        </tr>
                                        <tr>
                                            <td>Role:</td>
                                            <td>
                                                <c:forEach items="${requestScope.listRole}" var="role">
                                                    <c:if test="${role.roleId != 1}">
                                                        <input type="radio" value="${role.roleId}" name="roleId" /> ${role.roleName}
                                                    </c:if>
                                                </c:forEach><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="submit" value="Save" /></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>

                            <div id="updateAccountContent" class="admin-content">
                                <form action="updateaccount" method="POST">
                                    <table>
                                        <tr>
                                            <td>Id:</td>
                                            <td><input name="accountId" type="text" readonly="readonly" value="${requestScope.accountNeedToUpdate.accountId}" /></td>
                                        </tr>
                                        <tr>
                                            <td>Mail:</td>
                                            <td><input type="text" name="mail" value="${requestScope.accountNeedToUpdate.mail}" /></td>
                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td><input type="text" name="password" value="${requestScope.accountNeedToUpdate.password}" /></td>
                                        </tr>
                                        <tr>
                                            <td>Display Name:</td>
                                            <td><input type="text" name="displayname" value="${requestScope.accountNeedToUpdate.displayName}" /></td>
                                        </tr>
                                        <tr>
                                            <td>Full Name:</td>
                                            <td><input type="text" name="fullname" value="${requestScope.infoAbountAccountNeedToUpdate.fullName}" /></td>
                                        </tr>
                                        <tr>
                                            <td>Dob:</td>
                                            <td><input type="date" name="dob" value="${requestScope.infoAbountAccountNeedToUpdate.dob}" /></td>
                                        </tr>
                                        <tr>
                                            <td>Status:</td>
                                            <td><input type="text" name="status" value="${requestScope.accountNeedToUpdate.accountStatus}" /></td>
                                        </tr>
                                        <tr>
                                            <td>Role:</td>
                                            <td>
                                                <c:forEach items="${requestScope.listRole}" var="role">
                                                    <c:if test="${role.roleId != 1}">
                                                        <input <c:if test="${requestScope.roleFeatureAbountAccountNeedToUpdate.role.roleId==role.roleId}">
                                                                checked="checked"
                                                            </c:if>
                                                            type="radio" value="${role.roleId}" name="roleId"/> ${role.roleName}
                                                    </c:if>
                                                </c:forEach><br/>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2"><input type="submit" value="Save" /></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>

                            <div id="deleteAccountContent" class="admin-content">
                                <h1>Delete Account Content</h1>
                                <p>This is the content for CRUD account.</p>
                            </div>
                            <div id="createTopicContent" class="admin-content">
                                <h1>Create Topic Content</h1>
                                <p>This is the content for Create a topic.</p>
                            </div>
                            <div id="deleteTopicContent" class="admin-content">
                                <h1>Delete Topic Content</h1>
                                <p>This is the content for Delete a topic.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- End of header section -->

            <div>

            </div>

            <!-- Footer section -->
            <div id="footer">
                <!-- Social Icons -->
                <div class="socials-list">
                    <a href=""><i class="fa-brands fa-facebook"></i></a>
                    <a href=""><i class="fa-brands fa-instagram"></i></a>
                    <a href=""><i class="fa-solid fa-bell"></i></a>
                </div>
                <!-- Slogan -->
                <p class="slogan">Khám phá sức thông minh cùng <a href="#">Quizwiz</a> </p>
            </div>
            <!-- End of footer section -->

            <!-- End of main container div -->
            <script>
                $(document).ready(function () {
                    $('.admin-functions td a').on('click', function (e) {
                        e.preventDefault();
                        var contentId = $(this).data('content-id');
                        $('.admin-content').hide();
                        $('#' + contentId).show();
                    });
                });
            </script>

            
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Get the logo element
                    var logo = document.querySelector('.logo a');

                    // Add click event listener to the logo
                    logo.addEventListener('click', function () {
                        // Reload the page
                        location.reload();
                    });
                });
            </script>

        </form>
    </body>

</html>