<%-- 
    Document   : CreateExam
    Created on : Mar 11, 2024, 8:58:18 AM
    Author     : Đạt Phạm
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css">
        <style>
            body{
                background:#eee;
            }
            .main-box.no-header {
                padding-top: 20px;
            }
            .main-box {
                background: #FFFFFF;
                -webkit-box-shadow: 1px 1px 2px 0 #CCCCCC;
                -moz-box-shadow: 1px 1px 2px 0 #CCCCCC;
                -o-box-shadow: 1px 1px 2px 0 #CCCCCC;
                -ms-box-shadow: 1px 1px 2px 0 #CCCCCC;
                box-shadow: 1px 1px 2px 0 #CCCCCC;
                margin-bottom: 16px;
                -webikt-border-radius: 3px;
                -moz-border-radius: 3px;
                border-radius: 3px;
            }
            .table a.table-link.danger {
                color: #e74c3c;
            }
            .label {
                border-radius: 3px;
                font-size: 0.875em;
                font-weight: 600;
            }
            .user-list tbody td .user-subhead {
                font-size: 0.875em;
                font-style: italic;
            }
            .user-list tbody td .user-link {
                display: block;
                font-size: 1.25em;
                padding-top: 3px;
                margin-left: 60px;
            }
            a {
                color: #3498db;
                outline: none!important;
            }
            .user-list tbody td>img {
                position: relative;
                max-width: 50px;
                float: left;
                margin-right: 15px;
            }

            .table thead tr th {
                text-transform: uppercase;
                font-size: 0.875em;
            }
            .table thead tr th {
                border-bottom: 2px solid #e7ebee;
            }
            .table tbody tr td:first-child {
                font-size: 1.125em;
                font-weight: 300;
            }
            .table tbody tr td {
                font-size: 0.875em;
                vertical-align: middle;
                border-top: 1px solid #e7ebee;
                padding: 12px 8px;
            }
            a:hover{
                text-decoration:none;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="main-box no-header clearfix">
                        <div class="main-box-body clearfix">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>User</th>
                                            <th>Created</th>
                                            <th class="text-center">Status</th>
                                            <th>Email</th>
                                            <th>&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <img src="https://bootdey.com/img/Content/user_1.jpg" alt="">
                                                <a href="#" class="user-link">Full name 1</a>
                                                <span class="user-subhead">Member</span>
                                            </td>
                                            <td>2013/08/12</td>
                                            <td class="text-center">
                                                <span class="badge bg-secondary">pending</span>
                                            </td>
                                            <td>
                                                <a href="#">marlon@brando.com</a>
                                            </td>
                                            <td style="width: 20%;">
                                                <a href="#" class="text-warning">
                                                    <i class="fa fa-search-plus"></i>
                                                </a>
                                                <a href="#" class="text-info">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                                <a href="#" class="text-danger">
                                                    <i class="fa fa-trash-o"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="https://bootdey.com/img/Content/user_3.jpg" alt="">
                                                <a href="#" class="user-link">Full name 2</a>
                                                <span class="user-subhead">Admin</span>
                                            </td>
                                            <td>2013/08/12</td>
                                            <td class="text-center">
                                                <span class="badge bg-success">Active</span>
                                            </td>
                                            <td>
                                                <a href="#">marlon@brando.com</a>
                                            </td>
                                            <td style="width: 20%;">
                                                <a href="#" class="text-warning">
                                                    <i class="fa fa-search-plus"></i>
                                                </a>
                                                <a href="#" class="text-info">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                                <a href="#" class="text-danger">
                                                    <i class="fa fa-trash-o"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="https://bootdey.com/img/Content/user_2.jpg" alt="">
                                                <a href="#" class="user-link">Full name 3</a>
                                                <span class="user-subhead">Member</span>
                                            </td>
                                            <td>2013/08/12</td>
                                            <td class="text-center">
                                                <span class="badge bg-danger">inactive</span>
                                            </td>
                                            <td>
                                                <a href="#">marlon@brando.com</a>
                                            </td>
                                            <td style="width: 20%;">
                                                <a href="#" class="text-warning">
                                                    <i class="fa fa-search-plus"></i>
                                                </a>
                                                <a href="#" class="text-info">
                                                    <i class="fa fa-pencil"></i>
                                                </a>
                                                <a href="#" class="text-danger">
                                                    <i class="fa fa-trash-o"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

