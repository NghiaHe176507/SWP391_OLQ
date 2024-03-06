/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import controller.authentication.BaseRequiredAuthenController;
import dal.*;
import entity.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author nghia
 */
public class HomePageController extends BaseRequiredAuthenController {
    ControllerDBContext db = new ControllerDBContext();
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

        switch (db.getRoleFeatureByAccountId(LoggedUser.getAccountId()).getRole().getRoleId()) {
            case 1:
                ArrayList<AccountInfo> listAccount = db.getListAccountWithInfo();
                ArrayList<RoleFeature> listRoleFeature = db.getListRoleFeatureByListAccount(listAccount);
                ArrayList<Role> listRole = db.getListRole();
                ArrayList<Status> listStatus = db.getAllStatus();

//                String keyword = request.getParameter("query");
//                ArrayList<AccountInfo> searchAccount = acountInfo.searchAccount(keyword);
//                int pageSize = 5; // Number of items per page                                                                                       
//                int page = 1; // Default page number
//                if (request.getParameter("page") != null) {
//                    page = Integer.parseInt(request.getParameter("page"));
//                }
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
                    ArrayList<AccountInfo> searchAccount = db.searchAccount(keyword);
                    totalItems = searchAccount.size();
                    int totalPages = (int) Math.ceil((double) totalItems / pageSize);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("currentPage", page);

                    int startIndex = (page - 1) * pageSize;
                    int endIndex = Math.min(startIndex + pageSize, totalItems);
                    paginatedList = new ArrayList<>(searchAccount.subList(startIndex, endIndex));
                }

                int totalTopics = db.getTotalTopics();
                int totalStudents = db.getTotalStudents();
                int totalLectures = db.getTotalLectures();
                int totalGroups = db.getTotalGroups();
                int totalGroupsOnline = db.getTotalGroupsOnline();

                request.setAttribute("totalTopics", totalTopics);
                request.setAttribute("totalGroups", totalGroups);
                request.setAttribute("totalGroupsOnline", totalGroupsOnline);
                request.setAttribute("totalLectures", totalLectures);
                request.setAttribute("totalStudents", totalStudents);
                request.setAttribute("paginatedList", paginatedList);
                request.setAttribute("listRoleFeatureByListAccount", listRoleFeature);
                request.setAttribute("listAccountWithInfo", listAccount);
                request.setAttribute("listRole", listRole);
                request.setAttribute("listStatus", listStatus);
                request.getRequestDispatcher("view/home/homeAdmin.jsp").forward(request, response);
                break;
            case 2:

                int lecturerId = LoggedUser.getAccountId();
                int accountInfoId = db.getAccountInfoIdByAccountId(lecturerId);
//                GroupDBContext gb = new GroupDBContext();
                ArrayList<Group> listGroup = db.getGroupByLectureId(accountInfoId);

                request.setAttribute("listGroup", listGroup);
                request.getRequestDispatcher("view/home/homeLecturer.jsp").forward(request, response);
                break;
            case 3:
                String keywords = request.getParameter("searchQuery");

                ArrayList<Group> searchResults = db.searchGroup(keywords);

                // Đặt kết quả tìm kiếm vào attribute của request để truyền cho JSP
                request.setAttribute("searchResults", searchResults);

                // Chuyển hướng đến trang JSP để hiển thị kết quả
//                response.sendRedirect("result.jsp");
                ArrayList<Topic> listTopic = db.getAllTopics();
                request.setAttribute("listTopic", listTopic);

                int studentId = LoggedUser.getAccountId();
                ArrayList<Register> listRegister = db.getByStudentId(studentId);
                listRegister.size();
                request.setAttribute("listRegister", listRegister);

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
