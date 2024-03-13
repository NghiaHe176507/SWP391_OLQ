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
import java.util.ArrayList;

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

        newTopic.setTopicName(topicName);
        db.createNewTopic(newTopic);
        response.sendRedirect(request.getContextPath() + "/admin/topic-management");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        ControllerDBContext db = new ControllerDBContext();
        ArrayList<Topic> listTopic = db.getListTopic();
        request.setAttribute("listTopic", listTopic);
        request.setAttribute("url", "create");
        request.getRequestDispatcher("/view/controllerTopic/TopicManagement.jsp").forward(request, response);
    }
}
