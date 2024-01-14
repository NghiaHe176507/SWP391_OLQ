<%-- 
    Document   : register
    Created on : 13 Jan 2024, 6:23:49 pm
    Author     : tuann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration</title>
        <link href="css/registerstyle.css" rel="stylesheet" type="text/css"/>
        <script src="js/validation.js" type="text/javascript"></script>
    </head>

    <body>
        <div class="main">

            <form action="" method="POST" class="form" id="form-1">                
                <div>
                    <h1 class="heading">Registration</h1>
                </div>
                <div class="spacer"></div>

                <div class="form-group">
                    <label for="fullname" class="form-label">Username <span class="required">(*)</span></label>
                    <input id="fullname" name="fullname" type="text" placeholder="Enter your username" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="email" class="form-label">Email <span class="required">(*)</span></label>
                    <input id="email" name="email" type="text" placeholder="Enter your gmail" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="type" class="form-label">Roles <span class="required">(*)</span></label>
                    <select id="type" name="type" class="form-control">
                        <option value="">Choose Roles</option>
                        <option value="std">Lecture</option>
                        <option value="ltr">Student</option>
                    </select>

                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">Password <span class="required">(*)</span></label>
                    <input id="password" name="password" type="password" placeholder="Create password" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="form-group">
                    <label for="password_confirmation" class="form-label">Confirm password <span class="required">(*)</span></label>
                    <input id="password_confirmation" name="password_confirmation" placeholder="Confirm password"
                           type="password" class="form-control">
                    <span class="form-message"></span>
                </div>

                <div class="policy">
                    <input type="checkbox" id="acceptTerms">
                    <h4>I accept all terms & condition</h4>
                </div>
                <button class="form-submit">Register Now</button>
                <div class="text">
                    <h3>Already have an account? <a href="#">Login now</a></h3>
                </div>
            </form>
        </div>
    </body>

    <script>

        document.addEventListener('DOMContentLoaded', function () {
            // Mong muốn của chúng ta
            Validator({
                form: '#form-1',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.isRequiredUsername('#fullname'),
                    Validator.isEmail('#email'),
                    Validator.minLength('#password', 6),
                    Validator.isRequired('#password_confirmation'),
                    Validator.isRequired('#type', 'Roles cannot be blank'),
                    Validator.isConfirmed('#password_confirmation', function () {
                        return document.querySelector('#form-1 #password').value;
                    }, 'Repeat password does not match with password')
                ],
                onSubmit: function (data) {
                    // Call API
                    console.log(data);
                }
            });


            Validator({
                form: '#form-2',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.isEmail('#email'),
                    Validator.minLength('#password', 6),
                ],
                onSubmit: function (data) {
                    // Call API
                    console.log(data);
                }
            });
        });

    </script>
</body>

</html>
