/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.test;

import controller.authentication.BasedAuthorizationController;
import dal.ControllerDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.Result;
import entity.RoleAccess;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author nghia
 */
public class AchivementDetail extends BasedAuthorizationController {

    ControllerDBContext db = new ControllerDBContext();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        AccountInfo accountInfo = db.getAccountInfoByAccountId(LoggedUser.getAccountId());
        ArrayList<Result> listResult = db.getResultByStudentId(accountInfo.getAccountInfoId());


        request.setAttribute("check", request.getParameter("check"));
        request.setAttribute("selectedResultId", request.getParameter("resultId"));
        request.setAttribute("GroupId", request.getParameter("GroupId"));
        request.setAttribute("studentInfoId", accountInfo.getAccountInfoId());
        request.setAttribute("listResult", listResult);
        request.getRequestDispatcher("view/test/AchivementDetail.jsp").forward(request, response);
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
