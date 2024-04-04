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
public class ViewListTopic extends BasedAuthorizationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        ControllerDBContext db = new ControllerDBContext();
        ArrayList<Topic> listTopic = db.getListTopic();
        HttpSession session = request.getSession();

        // Lấy thông báo lỗi nếu có
        String errorMessage = (String) session.getAttribute("errorMessage");
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            session.removeAttribute("errorMessage"); // Xóa thông báo sau khi đã sử dụng
        }

// Lấy thông báo thành công nếu có
        String successMessage = (String) session.getAttribute("successMessage");
        if (successMessage != null) {
            request.setAttribute("successMessage", successMessage);
            session.removeAttribute("successMessage"); // Xóa thông báo sau khi đã sử dụng
        }

        Collections.reverse(listTopic);
        // Pagination parameters
        int pageSize = 8; // Number of items per page
        int currentPage = 1; // Default current page number

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

        // Forward the request to the JSP page
        request.getRequestDispatcher("/view/controllerTopic/TopicManagement.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);
    }

}
