/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.group;

import controller.authentication.BasedAuthorizationController;
import dal.ControllerDBContext;
import dal.StatusDBContext;
import dal.TopicDBContext;
import entity.Account;
import entity.Group;
import entity.RoleAccess;
import entity.Status;
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
public class CreateGroupByLecture extends BasedAuthorizationController {

    ControllerDBContext db = new ControllerDBContext();
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
        int pageSize = 5; // Number of items per page
        int page = 1; // Default page number
        String groupNameFilter = request.getParameter("groupName"); // Get group name filter from request

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        int lectureId = db.getAccountInfoByAccountId(LoggedUser.getAccountId()).getAccountInfoId();

        // Fetch groups for the current page
        ArrayList<Group> listGroup = db.getListGroupOwnedByLectureId(lectureId);

        // Filter the list by group name if the filter is provided
        if (groupNameFilter != null && !groupNameFilter.isEmpty()) {
            listGroup = filterGroupByName(listGroup, groupNameFilter);
        }

        // Paginate the data
        int totalItems = listGroup.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        int startIndex = (page - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalItems);

        ArrayList<Group> paginatedList = new ArrayList<>(listGroup.subList(startIndex, endIndex));

        ArrayList<Group> listGroupToFilter = db.getListGroupToFilter();

        request.setAttribute("listGroup", paginatedList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("listGroupToFilter", listGroupToFilter);

        ArrayList<Status> listStatus = db.getListStatus();
        ArrayList<Topic> listTopic = db.getListTopic();
        request.setAttribute("url", "create");
        request.setAttribute("listTopic", listTopic);
//        ArrayList<Group> listGroup = db.getListGroupOwnedByLectureId(db.getAccountInfoByAccountId(LoggedUser.getAccountId()).getAccountInfoId());
//        request.setAttribute("listGroup", listGroup);
        request.getRequestDispatcher("/view/controllerGroup/GroupManagementForLecture.jsp").forward(request, response);
    }

    private ArrayList<Group> filterGroupByName(ArrayList<Group> listGroup, String groupNameFilter) {
        ArrayList<Group> filteredList = new ArrayList<>();
        for (Group group : listGroup) {
            if (group.getGroupName().contains(groupNameFilter)) {
                filteredList.add(group);
            }
        }
        return filteredList;
    }

}
