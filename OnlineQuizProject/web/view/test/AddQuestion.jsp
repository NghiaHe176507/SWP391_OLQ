<%-- 
    Document   : AddQuestion
    Created on : 11 Mar 2024, 07:50:21
    Author     : MINH TUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Question Form</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- FontAwesome kit code -->
        <script src="https://kit.fontawesome.com/ce03f1d68b.js" crossorigin="anonymous"></script>
        <style>
            /* Style for the container */
            .container {
                max-width: 700px;
                margin: auto;
                padding: 20px;
            }

            /* Style for the form */
            #questionForm {
                border: 1px solid #ccc;
                border-radius: 10px;
                padding: 20px;
                background-color: #f9f9f9;
            }

            /* Style for the labels */
            .form-label {
                font-weight: bold;
            }

            /* Style for the textareas and inputs */
            .form-control {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            /* Style for the file input */
            input[type="file"] {
                margin-top: 5px;
            }

            /* Style for the buttons */
            .btn {
                padding: 10px 20px;
                margin-top: 10px;
                cursor: pointer;
                border-radius: 5px;
            }

            .btn-primary {
                background-color: #4CAF50;
                color: white;
                border: none;
            }

            .btn-success {
                background-color: #2196F3;
                color: white;
                border: none;
            }

            .btn-danger {
                background-color: #f44336;
                color: white;
                border: none;
            }

            /* Style for the options */
            .option {
                margin-bottom: 20px;
            }

            /* Style for the form-check */
            .form-check {
                margin-top: 5px;
            }

            /* Style for the success message */
            .success-message {
                color: green;
                font-weight: bold;
            }

            .option-container {
                position: relative;
            }

            .delete-option {
                position: absolute;
                top: -10px;
                right: -10px;
                background-color: #f44336;
                color: white;
                border: none;
                width: 30px;
                height: 30px;
                border-radius: 50%;
                font-size: 14px;
                padding: 0;
            }
        </style>
    </head>

    <body>
        <div class="container mt-5">
            <h2>Add Question</h2>
            <form id="questionForm">
                <div class="mb-3">
                    <label for="question" class="form-label">Question:</label>
                    <textarea class="form-control" id="question" name="question" rows="3"></textarea>
                </div>
                <div class="mb-3">
                    <label for="image" class="form-label">Upload Image:</label>
                    <input type="file" class="form-control" id="image" name="image">
                </div>

                <div id="options" class="mb-3">
                    <div class="option">
                        <label for="option1" class="form-label">Option 1:</label>
                        <input type="text" class="form-control" name="option[]" class="option-input">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="option1" name="correct_option[]">
                            <label class="form-check-label" for="option1">Correct</label>
                        </div>
                        <button type="button" class="btn btn-danger delete-option" onclick="deleteOption(this)"><i
                                class="fas fa-trash"></i></button>
                    </div>
                </div>
                <button type="button" class="btn btn-primary" onclick="addOption()">Add Option</button>
                <button type="button" class="btn btn-success" onclick="submitForm()">Submit</button>
            </form>
        </div>
        <script>
            function addOption() {
                var optionsDiv = document.getElementById("options");
                var newOptionDiv = document.createElement("div");
                newOptionDiv.classList.add("option");
                var optionNumber = optionsDiv.getElementsByClassName("option").length + 1;
                newOptionDiv.innerHTML = '<label for="option' + optionNumber + '" class="form-label">Option ' + optionNumber + ':</label>' +
                        '<input type="text" class="form-control" name="option[]" class="option-input">' +
                        '<div class="form-check">' +
                        '<input class="form-check-input" type="checkbox" value="option' + optionNumber + '" name="correct_option[]">' +
                        '<label class="form-check-label" for="option' + optionNumber + '">Correct</label>' +
                        '</div>' +
                        '<button type="button" class="btn btn-danger delete-option" onclick="deleteOption(this)"><i class="fas fa-trash"></i></button>';
                optionsDiv.appendChild(newOptionDiv);
            }

            function deleteOption(button) {
                var optionDiv = button.parentNode;
                optionDiv.parentNode.removeChild(optionDiv);
            }

            function submitForm() {
                var form = document.getElementById("questionForm");
                var formData = new FormData(form);

                // Send form data to backend using fetch API or XMLHttpRequest
                fetch("submit_question", {
                    method: "POST",
                    body: formData
                })
                        .then(response => {
                            if (response.ok) {
                                return response.text();
                            }
                            throw new Error("Network response was not ok.");
                        })
                        .then(data => {
                            console.log(data); // Handle success response
                        })
                        .catch(error => {
                            console.error("There was a problem with the fetch operation:", error);
                        });
            }
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
