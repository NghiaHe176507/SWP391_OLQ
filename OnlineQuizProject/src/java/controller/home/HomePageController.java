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

        switch (cdb.getRoleFeatureByAccountId(LoggedUser.getAccountId()).getRole().getRoleId()) {
            case 1:
                ControllerDBContext db = new ControllerDBContext();
                ArrayList<AccountInfo> listAccount = db.getListAccountWithInfo();
                ArrayList<RoleFeature> listRoleFeature = db.getListRoleFeatureByListAccount(listAccount);
                request.setAttribute("listAccountWithInfo", listAccount);
                request.setAttribute("listRoleFeatureByListAccount", listRoleFeature);
                request.getRequestDispatcher("view/home/homeAdmin.jsp").forward(request, response);
                break;
            case 2:
                int lecturerId = LoggedUser.getAccountId();
                AccountInfoDBContext ab = new AccountInfoDBContext();
                int accountInfoId = ab.getAccountInfoIdByAccountId(lecturerId);
                GroupDBContext gb = new GroupDBContext();
                ArrayList<Group> listGroup = gb.getGroupByLectureId(accountInfoId);
                request.setAttribute("listGroup", listGroup);
                request.getRequestDispatcher("view/home/homeLecturer.jsp").forward(request, response);
                break;
            case 3:
                TopicDBContext tb = new TopicDBContext();
                ArrayList<Topic> listTopic = tb.getAllTopics();
                request.setAttribute("listTopic", listTopic);

                int studentId = LoggedUser.getAccountId();
                RegisterDBContext rg = new RegisterDBContext();
                ArrayList<Register> listRegister = rg.getByStudentId(studentId);
                request.setAttribute("listRegister", listRegister);
                
                AccountInfoDBContext abi = new AccountInfoDBContext();
                int accountId = abi.getAccountInfoIdByAccountId(studentId);
                GroupDBContext gdb = new GroupDBContext();
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
