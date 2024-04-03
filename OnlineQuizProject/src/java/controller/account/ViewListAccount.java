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
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author PC
 */
public class ViewListAccount extends BasedAuthorizationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        ControllerDBContext db = new ControllerDBContext();
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
            Collections.reverse(listAccount);
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);
    }
}
