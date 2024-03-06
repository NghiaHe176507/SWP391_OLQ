/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import dal.AccountDBContext;
import dal.AccountInfoDBContext;
import dal.ControllerDBContext;
import dal.RoleDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.Role;
import entity.RoleFeature;
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
public class UpdateAccount extends HttpServlet {

    RoleDBContext roleDB = new RoleDBContext();
    AccountInfoDBContext accountInfoDB = new AccountInfoDBContext();
    ControllerDBContext db = new ControllerDBContext();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDBContext accountDB = new AccountDBContext();
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        Account accountNeedToUpdate = accountDB.getById(String.valueOf(accountId));
        AccountInfo infoAbountAccountNeedToUpdate = db.getAccountInfoByAccountId(accountNeedToUpdate.getAccountId());
        RoleFeature roleFeatureAbountAccountNeedToUpdate = db.getRoleFeatureByAccountId(accountNeedToUpdate.getAccountId());

        ArrayList<Role> listRole = db.getListRole();
        request.setAttribute("listRole", listRole);
        request.setAttribute("accountNeedToUpdate", accountNeedToUpdate);
        request.setAttribute("infoAbountAccountNeedToUpdate", infoAbountAccountNeedToUpdate);
        request.setAttribute("roleFeatureAbountAccountNeedToUpdate", roleFeatureAbountAccountNeedToUpdate);
        request.getRequestDispatcher("/view/ControlAccount/EditAccount.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        response.sendRedirect("listaccount");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
