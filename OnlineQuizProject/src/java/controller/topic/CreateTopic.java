/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.topic;

import controller.authentication.BasedAuthorizationController;
import dal.ControllerDBContext;
import entity.Account;
import entity.RoleAccess;
import entity.Topic;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author PC
 */
public class CreateTopic extends BasedAuthorizationController {

    ControllerDBContext db = new ControllerDBContext();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        Topic newTopic = new Topic();
        String topicName = request.getParameter("topicName");

        ArrayList<Topic> listTopic = db.getListTopic();

        boolean topicExists = false;
        for (Topic existingTopic : listTopic) {
            if (existingTopic.getTopicName().equalsIgnoreCase(topicName)) {
                // Nếu chủ đề đã tồn tại, đặt biến topicExists thành true và thoát vòng lặp
                topicExists = true;
                break;
            }
        }

        if (topicExists) {
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Chủ đề đã tồn tại trong danh sách.");
        } else {
            // Nếu chủ đề không tồn tại, tạo mới và thêm vào cơ sở dữ liệu
            newTopic.setTopicName(topicName);
            db.createNewTopic(newTopic);

            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Chủ đề đã được thêm thành công.");
        }

// Sau khi xử lý xong, chuyển hướng đến trang quản lý chủ đề
        response.sendRedirect(request.getContextPath() + "/admin/topic-management");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        ControllerDBContext db = new ControllerDBContext();
//        ArrayList<Topic> listTopic = db.getListTopic();
//        request.setAttribute("listTopic", listTopic);

        ArrayList<Topic> listTopic = db.getListTopic();
        Collections.reverse(listTopic);
        // Pagination parameters
        int pageSize = 8;
        int currentPage = 1;

        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }

        // Calculate startIndex and endIndex for pagination
        int totalItems = listTopic.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalItems);

        // Retrieve sublist of topics based on pagination
        ArrayList<Topic> paginatedList = new ArrayList<>(listTopic.subList(startIndex, endIndex));

        // Set attributes for pagination and paginated list
        request.setAttribute("listTopic", paginatedList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);

        request.setAttribute("url", "create");
        request.getRequestDispatcher("/view/controllerTopic/TopicManagement.jsp").forward(request, response);
    }
}
