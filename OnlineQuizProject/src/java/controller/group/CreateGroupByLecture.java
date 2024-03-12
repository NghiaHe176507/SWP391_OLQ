/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.group;

import controller.authentication.BasedAuthorizationController;
import dal.AccountDBContext;
import dal.AccountInfoDBContext;
import dal.ControllerDBContext;
import dal.StatusDBContext;
import dal.TopicDBContext;
import entity.Account;
import entity.Group;
import entity.RoleAccess;
import entity.Status;
import entity.Topic;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class CreateGroupByLecture extends BasedAuthorizationController {

    ControllerDBContext db = new ControllerDBContext();
    AccountInfoDBContext accountInfoDB = new AccountInfoDBContext();
    AccountDBContext accountDB = new AccountDBContext();
    StatusDBContext statusDB = new StatusDBContext();
    TopicDBContext topicDB = new TopicDBContext();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {

        Topic topic = topicDB.getById(request.getParameter("topicId"));
        Status status = statusDB.getById("2");
        String groupName = request.getParameter("groupName");

        Group newGroup = new Group();
        newGroup.setGroupName(groupName);
        newGroup.setLectureInfo(db.getAccountInfoByAccountId(LoggedUser.getAccountId()));
        newGroup.setTopic(topic);
        newGroup.setStatus(status);

        db.createNewGroupByLecture(newGroup);

        response.sendRedirect("../group-management");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        ArrayList<Status> listStatus = db.getListStatus();
        ArrayList<Topic> listTopic = db.getListTopic();
        request.setAttribute("url", "create");
        request.setAttribute("listTopic", listTopic);
        ControllerDBContext db = new ControllerDBContext();
        ArrayList<Group> listGroup = db.getListGroupOwnedByLectureId(db.getAccountInfoByAccountId(LoggedUser.getAccountId()).getAccountInfoId());
        request.setAttribute("listGroup", listGroup);
        request.getRequestDispatcher("/view/controllerGroup/GroupManagementForLecture.jsp").forward(request, response);
    }

}
