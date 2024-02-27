
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.AccountInfoDBContext;
import dal.ControllerDBContext;
import dal.GroupDBContext;
import dal.RegisterDBContext;
import dal.StatusDBContext;
import dal.TopicDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.Group;
import entity.Register;
import entity.Role;
import entity.RoleFeature;
import entity.Topic;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

import controller.authentication.BasedRequiredAuthenticationController;

/**
 *
 * @author nghia
 */
public class HomePageController extends BasedRequiredAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @param LoggedUser
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException {
        ControllerDBContext cdb = new ControllerDBContext();

        switch (cdb.getRoleFeatureByAccountId(LoggedUser.getAccountId()).getRole().getRoleId()) {
            case 1 -> {
                ControllerDBContext db = new ControllerDBContext();
                AccountInfoDBContext acountInfo = new AccountInfoDBContext();
                int pageSize = 5; // Number of items per page
                int page = 1; // Default page number
                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }

                ArrayList<AccountInfo> listAccount = db.getListAccountWithInfo();
                ArrayList<RoleFeature> listRoleFeature = db.getListRoleFeatureByListAccount(listAccount);
                request.setAttribute("listAccountWithInfo", listAccount);
                int totalItems = listAccount.size();
                int totalPages = (int) Math.ceil((double) totalItems / pageSize);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", page);

                int startIndex = (page - 1) * pageSize;
                int endIndex = Math.min(startIndex + pageSize, totalItems);
                ArrayList<AccountInfo> paginatedList = new ArrayList<>(listAccount.subList(startIndex, endIndex));
                request.setAttribute("paginatedList", paginatedList);
                request.setAttribute("listRoleFeatureByListAccount", listRoleFeature);

                ArrayList<Role> listRole = db.getListRole();
                request.setAttribute("listRole", listRole);

                StatusDBContext sb = new StatusDBContext();
                int statusId = LoggedUser.getAccountId();
//                ArrayList<Status> listStatus = sb.getById(statusId);

                request.getRequestDispatcher("view/home/homeAdmin.jsp").forward(request, response);
            }
            case 2 -> {
                int pageSizeGroup = 5; // Number of items per page
                int pageGroup = 1; // Default page number
                if (request.getParameter("page") != null) {
                    pageGroup = Integer.parseInt(request.getParameter("page"));
                }
                int lecturerId = LoggedUser.getAccountId();
                AccountInfoDBContext ab = new AccountInfoDBContext();
                int accountInfoId = ab.getAccountInfoIdByAccountId(lecturerId);
                GroupDBContext gb = new GroupDBContext();
                ArrayList<Group> listGroup = gb.getGroupByLectureId(accountInfoId);

                int totalItemsGroup = listGroup.size();
                int totalPagesGroup = (int) Math.ceil((double) totalItemsGroup / pageSizeGroup);
                request.setAttribute("totalPages", totalPagesGroup);
                request.setAttribute("currentPage", pageGroup);

                int startIndexGroup = (pageGroup - 1) * pageSizeGroup;
                int endIndexGroup = Math.min(startIndexGroup + pageSizeGroup, totalItemsGroup);
                ArrayList<Group> paginatedGroup = new ArrayList<>(listGroup.subList(startIndexGroup, endIndexGroup));
                request.setAttribute("paginatedList", paginatedGroup);

                request.setAttribute("listGroup", listGroup);
                request.getRequestDispatcher("view/home/homeLecture.jsp").forward(request, response);
            }
            case 3 -> {
                String keyword = request.getParameter("searchQuery");

                GroupDBContext gdb = new GroupDBContext();
                ArrayList<Group> searchResults = gdb.searchGroup(keyword);

                request.setAttribute("searchResults", searchResults);

                TopicDBContext tb = new TopicDBContext();
                ArrayList<Topic> listTopic = tb.getAllTopics();
                request.setAttribute("listTopic", listTopic);

                int studentId = LoggedUser.getAccountId();
                RegisterDBContext rg = new RegisterDBContext();
                ArrayList<Register> listRegister = rg.getByStudentId(studentId);
                listRegister.size();
                request.setAttribute("listRegister", listRegister);

                AccountInfoDBContext abi = new AccountInfoDBContext();
                int accountId = abi.getAccountInfoIdByAccountId(studentId);
                ArrayList<Group> groups = gdb.getGroupByLectureId(accountId);
                request.setAttribute("groups", groups);

                request.getRequestDispatcher("view/home/homeStudent.jsp").forward(request, response);
            }
            default ->
                request.getRequestDispatcher("view/home/home.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

}
