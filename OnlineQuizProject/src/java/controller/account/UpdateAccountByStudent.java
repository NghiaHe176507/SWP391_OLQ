/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.AccountInfoDBContext;
import dal.ControllerDBContext;
import entity.Account;
import entity.AccountInfo;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
@WebServlet(name = "UpdateAccountByStudent", urlPatterns = {"/UpdateAccountByStudent"})
public class UpdateAccountByStudent extends BasedRequiredAuthenticationController {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException {
        Account accountNeedToUpdate = LoggedUser;
        AccountInfo accountInfoNeedToUpdate = db.getAccountInfoByAccountId(accountNeedToUpdate.getAccountId());

        String password = request.getParameter("password");
        String displayname = request.getParameter("displayname");
        String fullname = request.getParameter("fullname");
        Date dob = Date.valueOf(request.getParameter("dob"));
        accountNeedToUpdate.setPassword(password);
        accountNeedToUpdate.setDisplayName(displayname);

        accountInfoNeedToUpdate.setFullName(fullname);
        accountInfoNeedToUpdate.setDob(dob);
        accountInfoNeedToUpdate.setAccount(accountNeedToUpdate);

        db.updateAccount(accountNeedToUpdate);
        db.updateAccountInfo(accountInfoNeedToUpdate);
        response.sendRedirect("updateaccount");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        Account accountNeedToUpdate = LoggedUser;
        AccountInfo accountInfoNeedToUpdate = db.getAccountInfoByAccountId(accountNeedToUpdate.getAccountId());

        request.setAttribute("accountNeedToUpdate", accountNeedToUpdate);
        request.setAttribute("infoAbountAccountNeedToUpdate", accountInfoNeedToUpdate);
        request.getRequestDispatcher("/view/controllerAccount/UpdateAccountByStudent.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

}
