/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.group;

import controller.authentication.BasedAuthorizationController;
import controller.authentication.BasedRequiredAuthenticationController;
import dal.ControllerDBContext;
import dal.GroupDBContext;
import entity.Account;
import entity.Group;
import entity.RoleAccess;
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
public class DeleteGroupInviteCode extends BasedAuthorizationController {

    ControllerDBContext db = new ControllerDBContext();
    GroupDBContext GroupDB = new GroupDBContext();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException {
        Group groupNeedToCreateInviteCode = GroupDB.getById(request.getParameter("groupId"));
        groupNeedToCreateInviteCode.setGroupInviteCode(null);
        db.updateGroupInviteCode(groupNeedToCreateInviteCode);
        response.sendRedirect(request.getContextPath() + "/group-management");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }


}
