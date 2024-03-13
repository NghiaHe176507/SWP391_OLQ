/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import controller.authentication.BasedAuthorizationController;
import dal.ControllerDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.RoleAccess;
import entity.RoleFeature;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class DeleteAccountByAdmin extends BasedAuthorizationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        int accountId = Integer.parseInt((request.getParameter("accountId")));
        ControllerDBContext db = new ControllerDBContext();
        db.deleteAccountById(accountId);
        ArrayList<AccountInfo> listAccount = db.getListAccountWithInfo();
        ArrayList<RoleFeature> listRoleFeature = db.getListRoleFeatureByListAccount(listAccount);
        request.setAttribute("listAccountWithInfo", listAccount);
        request.setAttribute("listRoleFeatureByListAccount", listRoleFeature);

        response.sendRedirect(request.getContextPath() + "/admin/account-management");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, roles);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, roles);
    }
}
