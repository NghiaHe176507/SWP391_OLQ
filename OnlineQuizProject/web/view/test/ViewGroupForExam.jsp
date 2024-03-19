<%-- 
    Document   : AddQuestion
    Created on : 11 Mar 2024, 07:50:21
    Author     : MINH TUAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Group</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- FontAwesome kit code -->
        <script src="https://kit.fontawesome.com/ce03f1d68b.js" crossorigin="anonymous"></script>
        <style>
            body{
                margin-top:20px;
            }
            .shadow {
                box-shadow: 0 0 3px rgb(53 64 78 / 20%) !important;
            }
            .rounded {
                border-radius: 5px !important;
            }
            .bg-light {
                background-color: #f7f8fa !important;
            }
            .bg-primary, .btn-primary, .btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active, .btn-outline-primary.active, .btn-outline-primary.focus, .btn-outline-primary:not(:disabled):not(.disabled):active, .badge-primary, .nav-pills .nav-link.active, .pagination .active a, .custom-control-input:checked ~ .custom-control-label:before, #preloader #status .spinner > div, .social-icon li a:hover, .back-to-top:hover, .back-to-home a, ::selection, #topnav .navbar-toggle.open span:hover, .owl-theme .owl-dots .owl-dot.active span, .owl-theme .owl-dots.clickable .owl-dot:hover span, .watch-video a .play-icon-circle, .sidebar .widget .tagcloud > a:hover, .flatpickr-day.selected, .flatpickr-day.selected:hover, .tns-nav button.tns-nav-active, .form-check-input.form-check-input:checked {
                background-color: #6dc77a !important;
            }

            .badge {
                padding: 5px 8px;
                border-radius: 3px;
                letter-spacing: 0.5px;
                font-size: 12px;
            }

            .btn-primary, .btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active, .btn-outline-primary.active, .btn-outline-primary.focus, .btn-outline-primary:not(:disabled):not(.disabled):active {
                box-shadow: 0 3px 7px rgb(109 199 122 / 50%) !important;
            }
            .btn-primary, .btn-outline-primary, .btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active, .btn-outline-primary.active, .btn-outline-primary.focus, .btn-outline-primary:not(:disabled):not(.disabled):active, .bg-soft-primary .border, .alert-primary, .alert-outline-primary, .badge-outline-primary, .nav-pills .nav-link.active, .pagination .active a, .form-group .form-control:focus, .form-group .form-control.active, .custom-control-input:checked ~ .custom-control-label:before, .custom-control-input:focus ~ .custom-control-label::before, .form-control:focus, .social-icon li a:hover, #topnav .has-submenu.active.active .menu-arrow, #topnav.scroll .navigation-menu > li:hover > .menu-arrow, #topnav.scroll .navigation-menu > li.active > .menu-arrow, #topnav .navigation-menu > li:hover > .menu-arrow, .flatpickr-day.selected, .flatpickr-day.selected:hover, .form-check-input:focus, .form-check-input.form-check-input:checked, .container-filter li.active, .container-filter li:hover {
                border-color: #6dc77a !important;
            }
            .bg-primary, .btn-primary, .btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active, .btn-outline-primary.active, .btn-outline-primary.focus, .btn-outline-primary:not(:disabled):not(.disabled):active, .badge-primary, .nav-pills .nav-link.active, .pagination .active a, .custom-control-input:checked ~ .custom-control-label:before, #preloader #status .spinner > div, .social-icon li a:hover, .back-to-top:hover, .back-to-home a, ::selection, #topnav .navbar-toggle.open span:hover, .owl-theme .owl-dots .owl-dot.active span, .owl-theme .owl-dots.clickable .owl-dot:hover span, .watch-video a .play-icon-circle, .sidebar .widget .tagcloud > a:hover, .flatpickr-day.selected, .flatpickr-day.selected:hover, .tns-nav button.tns-nav-active, .form-check-input.form-check-input:checked {
                background-color: #6dc77a !important;
            }
            .btn {
                padding: 8px 20px;
                outline: none;
                text-decoration: none;
                font-size: 16px;
                letter-spacing: 0.5px;
                transition: all 0.3s;
                font-weight: 600;
                border-radius: 5px;
            }
            .btn-primary {
                background-color: #6dc77a !important;
                border: 1px solid #6dc77a !important;
                color: #fff !important;
                box-shadow: 0 3px 7px rgb(109 199 122 / 50%);
            }

            a {
                text-decoration:none;
            }
        </style>
    </head>

    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <div class="container mt-5 pt-4">
            <div class="row align-items-end mb-4 pb-2">
                <div class="col-md-8">
                    <div class="section-title text-center text-md-start">
                        <h4 class="title mb-4">Group list for create exam</h4>
                        <p class="text-muted mb-0 para-desc">Prepare to demonstrate your knowledge and critical thinking skills as you tackle each question with clarity and focus. Success lies not only in correct answers but also in the effort and thoughtfulness you invest.</p>
                    </div>
                </div>

            </div>

            <div class="row">
                <span class="text-muted d-block"><i class="fa fa-bar-chart" style="margin-right: 6px;" aria-hidden="true"></i>Number of exam: ${listGroupExam.size()}</span>
                <c:forEach items="${requestScope.listGroupExam}" var="groupE">
                    <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card border-0 bg-light rounded shadow">
                            <div class="card-body p-4">
                                <span class="badge rounded-pill bg-primary float-md-end mb-3 mb-sm-0">${accountInfo.fullName}</span>
                                <h5>${groupE.groupName}</h5>
                                <div class="mt-3">
                                    <span class="text-muted d-block"><i class="fa fa-graduation-cap" aria-hidden="true"></i> ${groupE.topic.topicName}</span>
                                </div>

                                <div class="mt-3">
                                    <a href="<%= request.getContextPath() %>/create-exam?groupId=${groupE.groupId}" class="btn btn-primary">Create Exam</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="row justify-content-end mb-4 mt-2 pb-2">
                    <div class="col-md-4 mt-4 mt-sm-0 d-none d-md-block">
                        <div class="text-center text-md-end">
                            <a href="#" class="text-primary">View more group <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right fea icon-sm"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
