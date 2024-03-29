/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.group;

import controller.authentication.BasedAuthorizationController;
import dal.ControllerDBContext;
import dal.GroupDBContext;
import dal.StatusDBContext;
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
public class ActivedGroup extends BasedAuthorizationController {

    ControllerDBContext db = new ControllerDBContext();
    GroupDBContext groupDB = new GroupDBContext();
    StatusDBContext statusDB = new StatusDBContext();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        int groupId = Integer.parseInt(request.getParameter("groupId"));
        Group group = groupDB.getById(String.valueOf(groupId));
        if (group.getStatus().getStatusId() != 3) {
            group.setStatus(statusDB.getById("1"));
            db.updateGroupStatus(group);
        }
        if (db.getRoleOfAccount(LoggedUser).getRole().getRoleId() == 1) {
            response.sendRedirect(request.getContextPath() + "/admin/group-management");
        } else if (db.getRoleOfAccount(LoggedUser).getRole().getRoleId() == 2) {
            response.sendRedirect(request.getContextPath() + "/group-management");
        }
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
