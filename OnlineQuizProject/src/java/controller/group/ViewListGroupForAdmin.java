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

public class ViewListGroupForAdmin extends BasedAuthorizationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int pageSize = 5; // Number of items per page
        int page = 1; // Default page number
        String filterBy = request.getParameter("filterBy"); // Get the filter criteria from request
        String keyword = request.getParameter("keyword"); // Get the keyword from request

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        ControllerDBContext db = new ControllerDBContext();
        ArrayList<Group> listGroup = db.getListGroup();

        int totalGroups = listGroup.size();

        // Filter the list based on the filter criteria and keyword
        if (filterBy != null && keyword != null && !keyword.isEmpty()) {
            listGroup = filterGroup(listGroup, filterBy, keyword);
        }

        // Paginate the data
        int totalItems = listGroup.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);

        int startIndex = (page - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalItems);

        ArrayList<Group> paginatedList = new ArrayList<>(listGroup.subList(startIndex, endIndex));

        request.setAttribute("listGroup", paginatedList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalGroups", totalGroups);
        request.getRequestDispatcher("/view/controllerGroup/ViewListGroup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);
    }

    private ArrayList<Group> filterGroup(ArrayList<Group> groupList, String filterBy, String keyword) {
        ArrayList<Group> filteredList = new ArrayList<>();
        for (Group group : groupList) {
            // Apply filtering logic based on the selected filter criteria
            switch (filterBy) {
                case "groupName":
                    if (group.getGroupName().equalsIgnoreCase(keyword)) {
                        filteredList.add(group);
                    }
                    break;
                case "lectureName":
                    if (group.getLectureInfo().getFullName().equalsIgnoreCase(keyword)) {
                        filteredList.add(group);
                    }
                    break;
                case "topicName":
                    if (group.getTopic().getTopicName().equalsIgnoreCase(keyword)) {
                        filteredList.add(group);
                    }
                    break;
                // Add more cases for additional filter criteria if needed
                default:
                    // No filtering applied
                    filteredList.add(group);
                    break;
            }
        }
        return filteredList;
    }
}
