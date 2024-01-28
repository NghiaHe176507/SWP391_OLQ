/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.ControllerDBContext;
import dal.RoleDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.RoleFeature;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author tuann
 */
public class Register extends HttpServlet {

    RoleDBContext roleDB = new RoleDBContext();
    ControllerDBContext db = new ControllerDBContext();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mail = request.getParameter("gmail");
        String password = request.getParameter("password");
        String displayname = request.getParameter("username");
        ControllerDBContext acc = new ControllerDBContext();
        if (acc.isEmailExists(mail)) {
            // Email already exists, redirect back to register page with an error message
            request.setAttribute("errorMessage", "Gmail has already been registered");
            request.getRequestDispatcher("view/authentication/register.jsp").forward(request, response);
        } else {
            // Email does not exist, proceed with registration
            Account newAccount = new Account();
            AccountInfo newAccountInfo = new AccountInfo();
            RoleFeature newRoleFeature = new RoleFeature();

            String fullname = request.getParameter("fullname");
            Date dob = Date.valueOf(request.getParameter("dob"));

            newAccount.setMail(mail);
            newAccount.setPassword(password);
            newAccount.setDisplayName(displayname);
            newAccount.setAccountStatus("Active");

            newAccountInfo.setFullName(fullname);
            newAccountInfo.setDob(dob);
            newAccountInfo.setAccount(newAccount);

            newRoleFeature.setRole(roleDB.getById("3"));
            newRoleFeature.setAccount(newAccount);

            db.createNewAccount(newAccount);
            db.createNewAccountInfo(newAccountInfo);
            db.createNewRoleFeature(newRoleFeature);

            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

}
