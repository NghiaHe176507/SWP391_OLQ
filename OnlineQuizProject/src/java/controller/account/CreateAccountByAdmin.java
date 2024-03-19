/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import controller.authentication.BasedAuthorizationController;
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
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author PC
 */
public class CreateAccountByAdmin extends BasedAuthorizationController {

    RoleDBContext roleDB = new RoleDBContext();
    ControllerDBContext db = new ControllerDBContext();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        Account newAccount = new Account();
        AccountInfo newAccountInfo = new AccountInfo();
        RoleFeature newRoleFeature = new RoleFeature();

        String mail = request.getParameter("mail");
        String password = request.getParameter("password");
        String displayname = request.getParameter("displayname");
        String fullname = request.getParameter("fullname");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String status = request.getParameter("status");
        String roleId = request.getParameter("roleId");

        newAccount.setMail(mail);
        newAccount.setPassword(password);
        newAccount.setDisplayName(displayname);
        newAccount.setAccountStatus(status);

        newAccountInfo.setFullName(fullname);
        newAccountInfo.setDob(dob);
        newAccountInfo.setAccount(newAccount);

        newRoleFeature.setRole(roleDB.getById(roleId));
        newRoleFeature.setAccount(newAccount);

        db.createNewAccount(newAccount);
        db.createNewAccountInfo(newAccountInfo);
        db.createNewRoleFeature(newRoleFeature);

        response.sendRedirect(request.getContextPath() + "/admin/account-management");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        ArrayList<Role> listRole = db.getListRole();
        ArrayList<Status> listStatus = db.getListStatus();
        request.setAttribute("listStatus", listStatus);
        request.setAttribute("listRole", listRole);
        request.setAttribute("url", "create");
//        ArrayList<AccountInfo> listAccount = db.getListAccountWithInfo();
//        ArrayList<RoleFeature> listRoleFeature = db.getListRoleFeatureByListAccount(listAccount);
//        request.setAttribute("listAccountWithInfo", listAccount);
//        request.setAttribute("listRoleFeatureByListAccount", listRoleFeature);

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
        request.getRequestDispatcher("/view/controllerAccount/AccountManagement.jsp").forward(request, response);
    }

}
