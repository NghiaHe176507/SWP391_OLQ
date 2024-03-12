<%-- 
    Document   : DoExamForStudent.jsp
    Created on : Mar 12, 2024, 8:52:30 AM
    Author     : nghia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
    <head>
        <!-- Metadata -->
        <meta charset="UTF-8">
        <title>QuizWiz</title>
        <!-- Favicon -->
        <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/DoExamForStudent.css">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <!--<script src="home.js"></script>-->
        <script src="js/jquery.twbsPagination.js" type="text/javascript"></script>
    </head>

    <body>

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
                        <button type="button" class="btn btn-primary" id="joinGroupButton" data-toggle="modal" data-target="#exampleModal"
                                data-whatever="@mdo">Join group</button>
                    </div>

                    <!-- Search container -->
                    <form action="search" method="GET" class="col-md-5">
                        <div class="search-container">
                            <input name="query" type="text" id="searchInput" placeholder="Tìm kiếm câu hỏi, topic hoặc group...">
                            <button type="submit" id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>



                    <!-- Login section -->
                    <div class="login col-md-3">
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

            <div class="quiz">
                <div class="question">
                    <div class="question-text">Câu hỏi 1: Đâu là thành phố đông dân nhất thế giới?</div>
                    <div class="answer">
                        <input type="checkbox" id="q1a" name="q1" value="a">
                        <label for="q1a">A. Tokyo</label><br>
                        <input type="checkbox" id="q1b" name="q1" value="b">
                        <label for="q1b">B. Mumbai</label><br>
                        <input type="checkbox" id="q1c" name="q1" value="c">
                        <label for="q1c">C. Seoul</label><br>
                        <input type="checkbox" id="q1d" name="q1" value="d">
                        <label for="q1d">D. Jakarta</label>
                    </div>
                </div>

                <div class="question">
                    <div class="question-text">Câu hỏi 2: Ai là nhà văn viết "Tôi thấy hoa vàng trên cỏ xanh"?</div>
                    <div class="answer">
                        <input type="checkbox" id="q2a" name="q2" value="a">
                        <label for="q2a">A. Nguyễn Du</label><br>
                        <input type="checkbox" id="q2b" name="q2" value="b">
                        <label for="q2b">B. Tố Hữu</label><br>
                        <input type="checkbox" id="q2c" name="q2" value="c">
                        <label for="q2c">C. Nguyễn Khắc Huy</label><br>
                        <input type="checkbox" id="q2d" name="q2" value="d">
                        <label for="q2d">D. Xuân Diệu</label>
                    </div>
                </div>

                <div class="question">
                    <div class="question-text">Câu hỏi 3: Tác giả của cuốn sách "Nghìn lẻ một đêm" là ai?</div>
                    <div class="answer">
                        <input type="checkbox" id="q3a" name="q3" value="a">
                        <label for="q3a">A. Homer</label><br>
                        <input type="checkbox" id="q3b" name="q3" value="b">
                        <label for="q3b">B. Shakespeare</label><br>
                        <input type="checkbox" id="q3c" name="q3" value="c">
                        <label for="q3c">C. Alexandre Dumas</label><br>
                        <input type="checkbox" id="q3d" name="q3" value="d">
                        <label for="q3d">D. Antoine Galland</label>
                    </div>
                </div>

                <div class="question">
                    <div class="question-text">Câu hỏi 4: Thành phố nào được biết đến với tượng Nữ thần Tự do?</div>
                    <div class="answer">
                        <input type="checkbox" id="q4a" name="q4" value="a">
                        <label for="q4a">A. New York City</label><br>
                        <input type="checkbox" id="q4b" name="q4" value="b">
                        <label for="q4b">B. Paris</label><br>
                        <input type="checkbox" id="q4c" name="q4" value="c">
                        <label for="q4c">C. London</label><br>
                        <input type="checkbox" id="q4d" name="q4" value="d">
                        <label for="q4d">D. Tokyo</label>
                    </div>
                </div>

                <div class="question">
                    <div class="question-text">Câu hỏi 5: Ai là người phát minh ra bóng đèn điện?</div>
                    <div class="answer">
                        <input type="checkbox" id="q5a" name="q5" value="a">
                        <label for="q5a">A. Thomas Edison</label><br>
                        <input type="checkbox" id="q5b" name="q5" value="b">
                        <label for="q5b">B. Nikola Tesla</label><br>
                        <input type="checkbox" id="q5c" name="q5" value="c">
                        <label for="q5c">C. Alexander Graham Bell</label><br>
                        <input type="checkbox" id="q5d" name="q5" value="d">
                        <label for="q5d">D. Galileo Galilei</label>
                    </div>
                </div>

                <div class="question">
                    <div class="question-text">Câu hỏi 6: Ai là người phát minh ra bóng đèn điện?</div>
                    <div class="answer">
                        <input type="checkbox" id="q6a" name="q6" value="a">
                        <label for="q6a">A. Thomas Edison</label><br>
                        <input type="checkbox" id="q6b" name="q6" value="b">
                        <label for="q6b">B. Nikola Tesla</label><br>
                        <input type="checkbox" id="q6c" name="q6" value="c">
                        <label for="q6c">C. Alexander Graham Bell</label><br>
                        <input type="checkbox" id="q6d" name="q6" value="d">
                        <label for="q6d">D. Galileo Galilei</label>
                    </div>
                </div>

                <div class="question">
                    <div class="question-text">Câu hỏi 7: Ai là người phát minh ra bóng đèn điện?</div>
                    <div class="answer">
                        <input type="checkbox" id="q7a" name="q7" value="a">
                        <label for="q7a">A. Thomas Edison</label><br>
                        <input type="checkbox" id="q7b" name="q7" value="b">
                        <label for="q7b">B. Nikola Tesla</label><br>
                        <input type="checkbox" id="q7c" name="q7" value="c">
                        <label for="q7c">C. Alexander Graham Bell</label><br>
                        <input type="checkbox" id="q7d" name="q7" value="d">
                        <label for="q7d">D. Galileo Galilei</label>
                    </div>
                </div>

                <div class="question">
                    <div class="question-text">Câu hỏi 8: Ai là người phát minh ra bóng đèn điện?</div>
                    <div class="answer">
                        <input type="checkbox" id="q8a" name="q8" value="a">
                        <label for="q8a">A. Thomas Edison</label><br>
                        <input type="checkbox" id="q8b" name="q8" value="b">
                        <label for="q8b">B. Nikola Tesla</label><br>
                        <input type="checkbox" id="q8c" name="q8" value="c">
                        <label for="q8c">C. Alexander Graham Bell</label><br>
                        <input type="checkbox" id="q8d" name="q8" value="d">
                        <label for="q8d">D. Galileo Galilei</label>
                    </div>
                </div>
                <button class="submit-button" onclick="submitQuiz()">Finish Quiz!!!</button>
            </div>

        </div>

        <!-- End of header section -->

        <!-- Admin content section -->

        <!-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
          aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Join group by code</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form>
                  <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Code:</label>
                    <input type="text" class="form-control" id="recipient-name" placeholder="Enter code here........">
                  </div>
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Join <i class="fa-solid fa-right-to-bracket"></i> </button>
              </div>
            </div>
          </div>
        </div> -->

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
            function submitQuiz() {
                // Lấy danh sách tất cả các câu hỏi
                var questions = document.querySelectorAll('.question');

                // Biến để kiểm tra xem có câu hỏi nào chưa được chọn không
                var hasUncheckedQuestion = false;
                var allUnchecked = true; // Biến kiểm tra xem tất cả câu hỏi đều chưa được chọn
                var alertShown = false; // Biến để kiểm tra xem đã hiển thị thông báo chưa

                questions.forEach(function (question) {
                    // Lấy danh sách các checkbox trong câu hỏi
                    var checkboxes = question.querySelectorAll('input[type="checkbox"]');
                    var isChecked = false;

                    // Kiểm tra xem có ít nhất 1 checkbox được chọn không
                    checkboxes.forEach(function (checkbox) {
                        if (checkbox.checked) {
                            isChecked = true;
                            allUnchecked = false; // Có ít nhất 1 checkbox được chọn, không phải tất cả đều chưa được chọn
                        }
                    });

                    // Nếu không có checkbox nào được chọn, đánh dấu có câu hỏi chưa được chọn
                    if (!isChecked) {
                        hasUncheckedQuestion = true;
                        // Scroll đến câu hỏi chưa được chọn và hiển thị thông báo nếu chưa hiển thị
                        if (!alertShown) {
                            question.scrollIntoView({behavior: 'smooth', block: 'end'});
                            alert("Vui lòng chọn ít nhất một đáp án cho mỗi câu hỏi trước khi nộp bài.");
                            alertShown = true;
                        }
                        return;
                    }
                });

                // Nếu tất cả câu hỏi đều chưa được chọn, hiển thị thông báo nếu chưa hiển thị
                if (allUnchecked && !alertShown) {
                    alert("Vui lòng chọn ít nhất một đáp án cho mỗi câu hỏi trước khi nộp bài.");
                    alertShown = true;
                    return;
                }

                // Nếu không có câu hỏi nào chưa được chọn và đã có ít nhất 1 câu hỏi được chọn, hiển thị thông báo xác nhận
                if (!hasUncheckedQuestion && !alertShown) {
                    var confirmSubmit = confirm("Bạn có chắc chắn muốn nộp bài không?");
                    if (confirmSubmit) {
                        alert("Bài thi đã được nộp thành công!");
                        // Ở đây bạn có thể thực hiện các hành động khác sau khi người dùng nộp bài
                    }
                    alertShown = true;
                }
            }

        </script>

        <!--
        
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
                    $('#exampleModal').on('show.bs.modal', function (event) {
                        var button = $(event.relatedTarget) // Button that triggered the modal
                        var recipient = button.data('whatever') // Extract info from data-* attributes
                        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                        var modal = $(this)
                        // modal.find('.modal-title').text('New message to ' + recipient)
                        // modal.find('.modal-body input').val(recipient)
                    })
                </script>-->


        <!--        <script>
                    function toggleDropdown(event) {
                        const dropdown = event.currentTarget;
                        const dropdownList = dropdown.querySelector(".dropdown-list");
        
                        // Toggle class "show" for dropdown list
                        dropdownList.classList.toggle("show");
        
                        // Get height of the dropdown list
                        const dropdownHeight = dropdownList.offsetHeight;
        
                        // Get next sibling element (in this case, the element below the dropdown)
                        const nextElement = dropdown.nextElementSibling;
        
                        // If dropdown list is visible, add margin to next sibling
                        if (dropdownList.classList.contains("show")) {
                            nextElement.style.marginTop = ${dropdownHeight}px;
                        } else {
                            nextElement.style.marginTop = 0;
                        }
                    }
        
                    // Đóng dropdown khi click bên ngoài
                    window.addEventListener("click", function (event) {
                        const dropdowns = document.querySelectorAll(".dropdown");
                        dropdowns.forEach(function (dropdown) {
                            const dropdownList = dropdown.querySelector(".dropdown-list");
                            if (!dropdown.contains(event.target)) {
                                dropdownList.classList.remove("show");
                                const nextElement = dropdown.nextElementSibling;
                                nextElement.style.marginTop = 0;
                            }
                        });
                    });
                </script>-->

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var quizDiv = document.querySelector('.quiz');

                document.querySelectorAll('a').forEach(function (link) {
                    if (!quizDiv.contains(link)) {
                        link.addEventListener('click', function (event) {
                            event.preventDefault();
                        });
                    }
                });

                document.querySelectorAll('button').forEach(function (button) {
                    if (!quizDiv.contains(button)) {
                        button.addEventListener('click', function (event) {
                            event.preventDefault();
                        });
                    }
                });

                document.querySelectorAll('input').forEach(function (input) {
                    if (!quizDiv.contains(input)) {
                        input.addEventListener('click', function (event) {
                            event.preventDefault();
                        });
                    }
                });

                document.querySelectorAll('select').forEach(function (select) {
                    if (!quizDiv.contains(select)) {
                        select.addEventListener('click', function (event) {
                            event.preventDefault();
                        });
                    }
                });

                document.querySelectorAll('textarea').forEach(function (textarea) {
                    if (!quizDiv.contains(textarea)) {
                        textarea.addEventListener('click', function (event) {
                            event.preventDefault();
                        });
                    }
                });

                document.querySelectorAll('label').forEach(function (label) {
                    if (!quizDiv.contains(label)) {
                        label.addEventListener('click', function (event) {
                            event.preventDefault();
                        });
                    }
                });

                document.querySelectorAll('span').forEach(function (span) {
                    if (!quizDiv.contains(span)) {
                        span.addEventListener('click', function (event) {
                            event.preventDefault();
                        });
                    }
                });
            });

        </script>

    </body>

</html>