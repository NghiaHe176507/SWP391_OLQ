package controller.group;

import controller.authentication.BasedAuthorizationController;
import dal.ControllerDBContext;
import entity.Account;
import entity.Group;
import entity.RoleAccess;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class ViewOwnedGroupForLecture extends BasedAuthorizationController {

    ControllerDBContext db = new ControllerDBContext();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        request.getRequestDispatcher("view/controllerGroup/GroupManagementForLecture.jsp").forward(request, response);
    }

// Method to filter the list of groups by group name
    private ArrayList<Group> filterGroupByName(ArrayList<Group> listGroup, String groupNameFilter) {
        ArrayList<Group> filteredList = new ArrayList<>();
        for (Group group : listGroup) {
            if (group.getGroupName().contains(groupNameFilter)) {
                filteredList.add(group);
            }
        }
        return filteredList;
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
