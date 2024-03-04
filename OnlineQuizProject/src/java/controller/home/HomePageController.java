/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import controller.authentication.BaseRequiredAuthenController;
import dal.AccountDBContext;
import dal.AccountInfoDBContext;
import dal.ControllerDBContext;
import dal.GroupDBContext;
import dal.RegisterDBContext;
import dal.RoleDBContext;
import dal.RoleFeatureDBContext;
import dal.StatusDBContext;
import dal.TopicDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.Group;
import entity.Register;
import entity.Role;
import entity.RoleFeature;
import entity.Status;
import entity.Topic;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author nghia
 */
public class HomePageController extends BaseRequiredAuthenController {

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
        ControllerDBContext db = new ControllerDBContext();
        AccountInfoDBContext acountInfo = new AccountInfoDBContext();
        RoleFeatureDBContext rb = new RoleFeatureDBContext();
        GroupDBContext gb = new GroupDBContext();
        StatusDBContext sb = new StatusDBContext();
        TopicDBContext tb = new TopicDBContext();

        switch (cdb.getRoleFeatureByAccountId(LoggedUser.getAccountId()).getRole().getRoleId()) {
            case 1:

                ArrayList<AccountInfo> listAccount = db.getListAccountWithInfo();
                ArrayList<RoleFeature> listRoleFeature = db.getListRoleFeatureByListAccount(listAccount);
                ArrayList<Role> listRole = db.getListRole();
                ArrayList<Status> listStatus = sb.getAllStatus();

//                String keyword = request.getParameter("query");
//                ArrayList<AccountInfo> searchAccount = acountInfo.searchAccount(keyword);
//                int pageSize = 5; // Number of items per page                                                                                       
//                int page = 1; // Default page number
//                if (request.getParameter("page") != null) {
//                    page = Integer.parseInt(request.getParameter("page"));
//                }
//
//                // Paginate the data
//                int totalItems = listAccount.size();
//                int totalPages = (int) Math.ceil((double) totalItems / pageSize);
//                request.setAttribute("totalPages", totalPages);
//                request.setAttribute("currentPage", page);
//
//                int startIndex = (page - 1) * pageSize;
//                int endIndex = Math.min(startIndex + pageSize, totalItems);
//                ArrayList<AccountInfo> paginatedList = new ArrayList<>(listAccount.subList(startIndex, endIndex));
                String keyword = request.getParameter("query");

                int pageSize = 10; // Number of items per page
                int page = 1; // Default page number
                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }

//              Paginate the data
                int totalItems;
                ArrayList<AccountInfo> paginatedList = new ArrayList<>();

                if (keyword == null || keyword == "") {
                    totalItems = listAccount.size();
                    int totalPages = (int) Math.ceil((double) totalItems / pageSize);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("currentPage", page);

                    int startIndex = (page - 1) * pageSize;
                    int endIndex = Math.min(startIndex + pageSize, totalItems);
                    paginatedList = new ArrayList<>(listAccount.subList(startIndex, endIndex));
                } else {
                    ArrayList<AccountInfo> searchAccount = acountInfo.searchAccount(keyword);
                    totalItems = searchAccount.size();
                    int totalPages = (int) Math.ceil((double) totalItems / pageSize);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("currentPage", page);

                    int startIndex = (page - 1) * pageSize;
                    int endIndex = Math.min(startIndex + pageSize, totalItems);
                    paginatedList = new ArrayList<>(searchAccount.subList(startIndex, endIndex));
                }

                int totalTopics = tb.getTotalTopics();
                int totalStudents = rb.getTotalStudents();
                int totalLectures = rb.getTotalLectures();
                int totalGroups = gb.getTotalGroups();
                int totalGroupsOnline = gb.getTotalGroupsOnline();

                request.setAttribute("totalTopics", totalTopics);
                request.setAttribute("totalGroups", totalGroups);
                request.setAttribute("totalGroupsOnline", totalGroupsOnline);
                request.setAttribute("totalLectures", totalLectures);
                request.setAttribute("totalStudents", totalStudents);
// Set the paginated list to request attribute
                request.setAttribute("paginatedList", paginatedList);
                request.setAttribute("paginatedList", paginatedList);
                request.setAttribute("listRoleFeatureByListAccount", listRoleFeature);
                request.setAttribute("listAccountWithInfo", listAccount);
                request.setAttribute("listRole", listRole);
                request.setAttribute("listStatus", listStatus);
                request.getRequestDispatcher("view/home/homeAdmin.jsp").forward(request, response);
                break;
            case 2:

                int lecturerId = LoggedUser.getAccountId();
                AccountInfoDBContext ab = new AccountInfoDBContext();
                int accountInfoId = ab.getAccountInfoIdByAccountId(lecturerId);
//                GroupDBContext gb = new GroupDBContext();
                ArrayList<Group> listGroup = gb.getGroupByLectureId(accountInfoId);

                request.setAttribute("listGroup", listGroup);
                request.getRequestDispatcher("view/home/homeLecturer.jsp").forward(request, response);
                break;
            case 3:
                String keywords = request.getParameter("searchQuery");

                // Gọi hàm searchGroup từ GroupDBContext để tìm kiếm
//                GroupDBContext gb = new GroupDBContext();
                GroupDBContext gdb = new GroupDBContext();
                ArrayList<Group> searchResults = gdb.searchGroup(keywords);

                // Đặt kết quả tìm kiếm vào attribute của request để truyền cho JSP
                request.setAttribute("searchResults", searchResults);

                // Chuyển hướng đến trang JSP để hiển thị kết quả
//                response.sendRedirect("result.jsp");
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
                break;
            default:
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
