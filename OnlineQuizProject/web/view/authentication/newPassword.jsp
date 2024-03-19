<%-- 
    Document   : newPassword
    Created on : 19 Mar 2024, 2:54:29 pm
    Author     : hatua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Reset Password</title>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
        <style>
            a {
                text-decoration: none;
            }
            .login-page {
                width: 100%;
                height: 100vh;
                display: inline-block;
                display: flex;
                align-items: center;
            }
            .form-right i {
                font-size: 100px;
            }
        </style>
    </head>
    <body>
        <div class="container" >
            <div class="row" style="margin-top: 143px;">
                <div class="col-lg-10 offset-lg-1">
                    <div class="bg-white shadow rounded">
                        <div class="row">
                            <div class="col-md-7 pe-0">
                                <div class="form-left h-100 py-5 px-5">
                                    <form class="row g-4" id="changePasswordForm" action="new-password" method="post" onsubmit="return validateForm()">

                                        <div class="col-12">
                                            <label>New Password<span class="text-danger"> *</span></label>
                                            <div class="input-group">
                                                <div class="input-group-text"><i class="bi bi-lock-fill"></i></div>
                                                <input type="password" class="form-control" id="newPassword" name="password" placeholder="Enter New Password" required>
                                            </div>
                                            <small id="newPasswordError" class="form-text text-danger"></small>
                                        </div>
                                        <div class="col-12">
                                            <label>Confirm New Password<span class="text-danger"> *</span></label>
                                            <div class="input-group">
                                                <div class="input-group-text"><i class="bi bi-lock-fill"></i></div>
                                                <input type="password" class="form-control" id="confirmPassword" name="confPassword" placeholder="Confirm New Password" required>
                                            </div>
                                            <small id="confirmPasswordError" class="form-text text-danger"></small>
                                        </div>
                                        <c:if test="${not empty error}">
                                            <div class="danger" role="alert">
                                                ${error}
                                            </div>
                                        </c:if>
                                        <c:if test="${not empty success}">
                                            <div class="danger" role="alert">
                                                ${success}
                                            </div>
                                        </c:if>
                                        <div class="col-12">
                                            <button type="button" class="btn btn-secondary px-4 float-end mt-4" id="cancelBtn">Cancel</button>
                                            <button type="submit" class="btn btn-primary px-4 float-end mt-4 me-2">Change Password</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-5 ps-0 d-none d-md-block">
                                <div class="form-right h-100 bg-primary text-white text-center pt-5">
                                    <i class="fa-solid fa-lock-open"></i>
                                    <h2 class="fs-1" style="margin-top: 49px;">Reset Password</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function validateForm() {
                var newPassword = document.getElementById("newPassword").value;
                var confirmPassword = document.getElementById("confirmPassword").value;

                // Clear any previous error messages
                document.getElementById("newPasswordError").textContent = "";
                document.getElementById("confirmPasswordError").textContent = "";

                // Check if the new password meets any validation criteria (e.g., minimum length)
                if (newPassword.length < 8) {
                    document.getElementById("newPasswordError").textContent = "New password must be at least 8 characters long.";
                    return false;
                }

                // Check if the new password matches the confirmation password
                if (newPassword !== confirmPassword) {
                    document.getElementById("confirmPasswordError").textContent = "Passwords do not match.";
                    return false;
                }

                // Form is valid, proceed with submission
                return true;
            }

            function togglePasswordVisibility(inputId) {
                var input = document.getElementById(inputId);
                if (input.type === "password") {
                    input.type = "text";
                } else {
                    input.type = "password";
                }
            }
        </script>
        <!-- Bootstrap Bundle JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </body>
</html>

