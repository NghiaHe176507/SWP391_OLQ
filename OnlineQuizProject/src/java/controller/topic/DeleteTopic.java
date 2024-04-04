/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.topic;

import controller.authentication.BasedAuthorizationController;
import dal.ControllerDBContext;
import entity.Account;
import entity.RoleAccess;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class DeleteTopic extends BasedAuthorizationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        int topicId = Integer.parseInt((request.getParameter("topicId")));
        ControllerDBContext db = new ControllerDBContext();

        boolean checkTopicIsEmpty = db.getListGroupByTopicId(topicId).isEmpty();

        if (checkTopicIsEmpty) {
            db.deleteTopicById(topicId);
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Topic deleted successfully!");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Cannot delete topic with existing groups!");
        }

        response.sendRedirect(request.getContextPath() + "/admin/topic-management");

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
