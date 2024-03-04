/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.AccountDBContext;
import dal.AccountInfoDBContext;
import dal.ControllerDBContext;
import dal.GroupDBContext;
import dal.RegisterDBContext;
import dal.TopicDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.Group;
import entity.Register;
import entity.RoleFeature;
import entity.Topic;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author nghia
 */
public class HomePageController extends BasedRequiredAuthenticationController {

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
                AccountInfoDBContext acountInfo = new AccountInfoDBContext();
                int pageSize = 5; // Number of items per page
                int page = 1; // Default page number
                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }

                ArrayList<AccountInfo> listAccount = db.getListAccountWithInfo();
                ArrayList<RoleFeature> listRoleFeature = db.getListRoleFeatureByListAccount(listAccount);
                request.setAttribute("listAccountWithInfo", listAccount);

                // Paginate the data
                int totalItems = listAccount.size();
                int totalPages = (int) Math.ceil((double) totalItems / pageSize);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", page);

                int startIndex = (page - 1) * pageSize;
                int endIndex = Math.min(startIndex + pageSize, totalItems);
                ArrayList<AccountInfo> paginatedList = new ArrayList<>(listAccount.subList(startIndex, endIndex));
                request.setAttribute("paginatedList", paginatedList);
                request.setAttribute("listRoleFeatureByListAccount", listRoleFeature);
                request.getRequestDispatcher("view/home/homeAdmin.jsp").forward(request, response);
                break;
            case 2:
                int lecturerId = LoggedUser.getAccountId();
                AccountInfoDBContext ab = new AccountInfoDBContext();
                int accountInfoId = ab.getAccountInfoIdByAccountId(lecturerId);
                ArrayList<Group> listGroup = db.getGroupByLectureId(accountInfoId);
                request.setAttribute("listGroup", listGroup);
                request.getRequestDispatcher("view/home/homeLecturer.jsp").forward(request, response);
                break;
            case 3:
                String keyword = request.getParameter("searchQuery");

                ArrayList<Group> searchResults = db.searchGroup(keyword);

                // Đặt kết quả tìm kiếm vào attribute của request để truyền cho JSP
                request.setAttribute("searchResults", searchResults);

                // Chuyển hướng đến trang JSP để hiển thị kết quả
//                response.sendRedirect("result.jsp");
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
                ArrayList<Group> groups = db.getGroupByLectureId(accountId);
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
