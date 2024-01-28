/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener("DOMContentLoaded", function () {
    var showAllBtn = document.getElementById("showAllBtn");
    var showLessBtn = document.getElementById("showLessBtn");
    var topicInfos = document.querySelectorAll(".topic-info");

    // Ẩn các topic-info với index từ 3 trở đi
    for (var i = 3; i < topicInfos.length; i++) {
        topicInfos[i].style.display = "none";
    }

    showAllBtn.addEventListener("click", function () {
        // Hiện tất cả các topic-info
        topicInfos.forEach(function (topicInfo) {
            topicInfo.style.display = "flex";
        });

        // Ẩn nút Show all và hiện nút Show less
        showAllBtn.style.display = "none";
        showLessBtn.style.display = "block";
    });

    showLessBtn.addEventListener("click", function () {
        // Ẩn các topic-info với index từ 3 trở đi
        for (var i = 3; i < topicInfos.length; i++) {
            topicInfos[i].style.display = "none";
        }

        // Ẩn nút Show less và hiện nút Show all
        showAllBtn.style.display = "block";
        showLessBtn.style.display = "none";
    });
});
