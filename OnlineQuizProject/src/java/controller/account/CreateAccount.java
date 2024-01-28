/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import dal.ControllerDBContext;
import dal.RoleDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.Role;
import entity.RoleFeature;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author PC
 */
public class CreateAccount extends HttpServlet {

    RoleDBContext roleDB = new RoleDBContext();
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
        ArrayList<Role> listRole = db.getListRole();
        request.setAttribute("listRole", listRole);
        request.getRequestDispatcher("/view/ControlAccount/CreateAccount.jsp").forward(request, response);
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
        
        response.getWriter().println("Account created successful!");
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
