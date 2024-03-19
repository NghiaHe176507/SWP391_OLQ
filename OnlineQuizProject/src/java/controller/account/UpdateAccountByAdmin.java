/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import controller.authentication.BasedAuthorizationController;
import dal.AccountDBContext;
import dal.AccountInfoDBContext;
import dal.ControllerDBContext;
import dal.RoleDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.Role;
import entity.RoleAccess;
import entity.RoleFeature;
import entity.Status;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class UpdateAccountByAdmin extends BasedAuthorizationController {

    RoleDBContext roleDB = new RoleDBContext();
    AccountInfoDBContext accountInfoDB = new AccountInfoDBContext();
    ControllerDBContext db = new ControllerDBContext();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {

        Account accountNeedToUpdate = new Account();
        AccountInfo accountInfoNeedToUpdate = new AccountInfo();
        RoleFeature roleFeatureNeedToUpdate = new RoleFeature();

        int accountId = Integer.parseInt(request.getParameter("accountId"));
        String mail = request.getParameter("mail");
        String password = request.getParameter("password");
        String displayname = request.getParameter("displayname");
        String fullname = request.getParameter("fullname");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String status = request.getParameter("status");
        String roleId = request.getParameter("roleId");

        accountNeedToUpdate.setAccountId(accountId);
        accountNeedToUpdate.setMail(mail);
        accountNeedToUpdate.setPassword(password);
        accountNeedToUpdate.setDisplayName(displayname);
        accountNeedToUpdate.setAccountStatus(status);

        accountInfoNeedToUpdate.setAccountInfoId(db.getAccountInfoByAccountId(accountId).getAccountInfoId());
        accountInfoNeedToUpdate.setFullName(fullname);
        accountInfoNeedToUpdate.setDob(dob);
        accountInfoNeedToUpdate.setAccount(accountNeedToUpdate);

        roleFeatureNeedToUpdate.setRoleFeatureId(db.getRoleFeatureByAccountId(accountId).getRoleFeatureId());
        roleFeatureNeedToUpdate.setRole(roleDB.getById(roleId));
        roleFeatureNeedToUpdate.setAccount(accountNeedToUpdate);

        db.updateAccount(accountNeedToUpdate);
        db.updateAccountInfo(accountInfoNeedToUpdate);
        db.updateRoleFeature(roleFeatureNeedToUpdate);
        response.sendRedirect(request.getContextPath() + "/admin/account-management");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        AccountDBContext accountDB = new AccountDBContext();
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        Account accountNeedToUpdate = accountDB.getById(String.valueOf(accountId));
        AccountInfo infoAbountAccountNeedToUpdate = db.getAccountInfoByAccountId(accountNeedToUpdate.getAccountId());
        RoleFeature roleFeatureAbountAccountNeedToUpdate = db.getRoleFeatureByAccountId(accountNeedToUpdate.getAccountId());

        ArrayList<AccountInfo> listAccount = db.getListAccountWithInfo();
//        ArrayList<RoleFeature> listRoleFeature = db.getListRoleFeatureByListAccount(listAccount);
        String keyword = request.getParameter("query");

        int pageSize = 8; // Number of items per page
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

        request.setAttribute("paginatedList", paginatedList);
//        request.setAttribute("listRoleFeatureByListAccount", listRoleFeature);
//        request.setAttribute("listAccountWithInfo", listAccount);
        ArrayList<RoleFeature> listRoleFeature = db.getListRoleFeatureByListAccount(paginatedList);
        request.setAttribute("listAccountWithInfo", listAccount);
        request.setAttribute("listRoleFeatureByListAccount", listRoleFeature);

        ArrayList<Status> listStatus = db.getListStatus();
        request.setAttribute("listStatus", listStatus);
        ArrayList<Role> listRole = db.getListRole();
        request.setAttribute("listRole", listRole);
        request.setAttribute("accountNeedToUpdate", accountNeedToUpdate);
        request.setAttribute("infoAbountAccountNeedToUpdate", infoAbountAccountNeedToUpdate);
        request.setAttribute("roleFeatureAbountAccountNeedToUpdate", roleFeatureAbountAccountNeedToUpdate);
        request.setAttribute("url", "update");

//        ArrayList<AccountInfo> listAccount = db.getListAccountWithInfo();
//        ArrayList<RoleFeature> listRoleFeature = db.getListRoleFeatureByListAccount(listAccount);
        request.setAttribute("listAccountWithInfo", listAccount);
        request.setAttribute("listRoleFeatureByListAccount", listRoleFeature);
        request.getRequestDispatcher("/view/controllerAccount/AccountManagement.jsp").forward(request, response);
    }

}
