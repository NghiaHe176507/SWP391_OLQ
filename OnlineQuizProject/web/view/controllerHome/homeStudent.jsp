<%-- 
    Document   : homeStudent
    Created on : Jan 27, 2024, 1:27:21 AM
    Author     : nghia
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
    <!-- Metadata -->
    <meta charset="UTF-8">
    <title>QuizWiz</title>
    <!-- Favicon -->
    <link rel="icon" href="image/iconlogo.PNG" type="image/x-icon" />
    <!-- Stylesheets -->
    <link rel="stylesheet" href="css/homeStudent.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="icons/fontawesome-free-6.5.1-web/css/all.min.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="js/homeStudent.js"></script>
    <style>
        .create {
            text-align: center;
        }


        #joinGroupButton {
            text-decoration: none;
            font-family: "Poppins", sans-serif;
            font-weight: bold;
            font-size: 16px;
            color: #fff;
            padding: 10px 20px;
            background: linear-gradient(135deg, #9a3cbf, #4397ce);
            border-radius: 5px;
            transition: background 0.3s ease, transform 0.2s ease-in-out;
        }

        #joinGroupButton:hover {
            background: linear-gradient(135deg, #4397ce, #9a3cbf);
            transform: scale(1.05);
        }

        #joinGroupButton:active {
            transform: scale(0.95);
        }
        /* CSS */

        .code {
            margin-top: 20px;
            display: inline block;
            text-align: center;
            width: 100%;
        }

        #groupNameInput{
            width: 80%;
            padding: 20px;
        }

        #joinGroupButton {
            padding: 11px;
            background: linear-gradient(135deg, #9a3cbf, #4397ce);
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        #joinGroupButton:hover {
            background: linear-gradient(135deg, #4397ce, #9a3cbf);
            transform: scale(1.05);
        }

        #joinGroupButton  :active {
            transform: scale(0.95);
        }

        .unenrollButton{
            align-items: center;
            display: block;
            /*                background-color: red;
                            border-radius: 10px;
                            padding: 5px;
                            color: white;
                            text-decoration: none;
                            font-family: "Poppins", sans-serif;
                            font-weight: bold;
                            font-size: 15px;
                            transition: background 0.3s ease, transform 0.2s ease-in-out;
                            margin: 10px 10px;*/
        }

        .btn-1 {
            font-family: "Poppins", sans-serif;
            font-weight: 100;
            transition: all .25s;
            border: 1px solid #000;
            border-radius: 0;

            svg {
                height: 39px;
                left: 0;
                position: absolute;
                top: 0;
                width: 100%;
            }

            rect {
                fill: none;
                stroke: #fff;
                stroke-width: 2;
                stroke-dasharray: 422, 0;
                transition-delay: none;
            }
        }

        .btn-1:hover {
            font-weight: 900;
            letter-spacing: 2px;
            rect {
                stroke-width: 5;
                stroke-dasharray: 15, 310;
                stroke-dashoffset: 48;
                transition: all 1.35s cubic-bezier(0.19, 1, 0.22, 1);
            }
        }

        .btn-1.color-red:hover {
            color: red;
            rect {
                stroke: red;
            }
        }

        .btn-1.color-black:hover {
            color: black;
            rect {
                stroke: black;
            }
        }

        .btn {
            color: #000;
            cursor: pointer;
            display: block;
            font-size:16px;
            font-weight: 400;
            line-height: 24px;
            /*margin: 10px 10px;*/
            /*margin: 0 0 2em;*/
            /*max-width: 160px;*/
            position: relative;
            text-decoration: none;
            text-transform: uppercase;
            /*width: 100%;*/
        }

    </style>
    <script>
        function redirectHome() {
            var baseUrl = "<%= request.getContextPath() %>";
            window.location.href = baseUrl + "/home";
        }
    </script>

</head>

<body>
    <!-- Main container div -->
    <div class="container">
        <!-- Header section -->
        <div class="row">
            <div class="header">
                <!-- Logo -->
                <div class="logo col-md-2">
                    <a href="#">QUIZWIZ</a>
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

        <div class="topic" id="topicContainer">
            <c:forEach var="register" items="${requestScope.listRegister}" varStatus="loop">
                <div class="col-md-4 mb-3">
                    <div class="topic-info" style="width: 18rem;">
                        <div class="topic-info-body">
                            <h4 class="topic-info-title">Class Name: ${register.group.groupName}</h4>
                            <h6 class="topic-info-subtitle mb-2">Topic Name: ${register.group.topic.topicName}</h6>
                            <h6 class="topic-info-subtitle mb-2">Lecturer: ${register.group.lectureInfo.fullName}</h6>
                            <h6 class="topic-info-subtitle mb-2">Start Date: ${register.registerDate}</h6>
                            <form action="viewGroupDetail" method="GET"> 
                                <div class="row">
                                    <div class="row" style="padding-left: 40px;margin-bottom: 5px;">
                                        <button type="submit" class="btn btn-1 color-black topic-info-link">
                                            <svg>
                                            <rect x="0" y="0" fill="none" width="100%" height="100%"/>
                                            </svg>
                                            More Details
                                        </button>
                                    </div>
                                    <input type="hidden" name="groupId" value="${register.group.groupId}" />
                            </form>

                            <form action="unenroll" method="POST"> 
                                <div class="row" style="padding-left: 27px;margin-bottom: 5px;    margin-right: 11px;">
                                    <input type="hidden" name="groupId" id="groupId" value="${register.group.groupId}"> 
                                    <button class="unenrollButton btn btn-1 color-red">
                                        <svg>
                                        <rect x="0" y="0" fill="none" width="100%" height="100%"/>
                                        </svg>
                                        Unenroll group</i>
                                    </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

    <div class="show-all">
        <a href="#" id="showAllBtn">Show all group</a>
        <a href="#" id="showLessBtn" style="display: none;">Show less</a>
    </div>
</div>

<% String alertMessage = (String) request.getAttribute("alertMessage"); %>
<% if (alertMessage != null && !alertMessage.isEmpty()) { %>
<script>
    alert("<%= alertMessage %>");
    var baseUrl = "<%= request.getContextPath() %>";
    window.location.href = baseUrl + "/home";
</script>
<% } %>

<c:if test="${not empty message}">
    <c:choose>
        <c:when test="${checkRegister eq 'true'}">
            <script>
                alert("${message}");
                redirectHome();
            </script>
        </c:when>
        <c:otherwise>
            <script>
                alert("${message}");
                redirectHome();
            </script>
        </c:otherwise>
    </c:choose>
</c:if>
</div>
<!-- End of header section -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Join group by code</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div> 
            <form id="joinGroupForm" action="join-group" method="POST">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Code:</label>
                        <input name="inviteCode" type="text" class="form-control" id="codegroup" placeholder="Enter code here........">
                        <div id="notificationMessage" class="text-danger"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary" id="joinButton" onclick="handleJoin()">Join <i class="fa-solid fa-right-to-bracket"></i> </button>
                </div>
            </form>
        </div>
    </div>
</div>


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


<!--    <script>
        function handleJoin() {
            var checkRegister = '${requestScope.checkRegister}';

            if (checkRegister === 'false') {
                alert('Join successful.');
                // Thực hiện các hành động cần thiết khi tham gia nhóm thành công
            } else {
                $('#exampleModal').modal('hide');
                alert('Bạn đã tham gia nhóm.');
                // Thực hiện các hành động cần thiết khi đã tham gia nhóm trước đó
            }
        }

    </script>-->


<!--    <script>
        $(document).ready(function () {
            var checkRegister = ${checkRegister};
            if (checkRegister) {
                var inputCode = $('#codegroup').val().trim();
                if (inputCode !== "") {
                    $('#notificationMessage').text('Bạn đã tham gia group.');
                    window.location.href = "/home";
                }
            } else {
                var inputCode = $('#codegroup').val().trim();
                if (inputCode !== "") {
                    $.ajax({
                        type: "POST",
                        url: "JoinGroupForStudent",
                        data: $("#joinGroupForm").serialize(),
                        success: function (response) {
                            $('#notificationMessage').removeClass('text-danger').addClass('text-success').text('Join thành công!');
                        },
                        error: function () {
                            $('#notificationMessage').removeClass('text-success').addClass('text-danger').text('Đã xảy ra lỗi khi tham gia nhóm!');
                        }
                    });
                }
            }
        });
    </script>-->


<script>
    document.add    EventListener("DOMContentLoaded", function () {
        // Get the logo element
        var logo = document.querySelector('.logo a');
        logo.addEventListener('click', function (event) {
            event.preventDefault();
            var baseUrl = "<%= request.getContextPath() %>";
            window.location.href = baseUrl + "/home";
        });
    });</script>

<script>
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('whatever') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        // modal.find('.modal-title').text('New message to ' + recipient)
        //                 modal.find('.modal-body input').val(recipient)
    })
</script>
</body>

</html>