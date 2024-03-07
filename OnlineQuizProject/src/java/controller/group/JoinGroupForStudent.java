/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.group;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.ControllerDBContext;
import dal.GroupDBContext;
import entity.Account;
import entity.Group;
import entity.Register;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.sql.Date;

/**
 *
 * @author PC
 */
public class JoinGroupForStudent extends BasedRequiredAuthenticationController {

    ControllerDBContext db = new ControllerDBContext();
    GroupDBContext GroupDB = new GroupDBContext();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException {
        if (db.checkContainGroupInviteCode(request.getParameter("inviteCode"))){
            LocalDate currentDate = LocalDate.now();
            Register newRegister = new Register();
            Group groupNeedToJoin = db.getGroupByInviteCode(request.getParameter("inviteCode"));
            newRegister.setGroup(groupNeedToJoin);
            newRegister.setRegisterDate(Date.valueOf(currentDate));
            newRegister.setStudentInfo(db.getAccountInfoByAccountId(LoggedUser.getAccountId()));
            db.createNewRegister(newRegister);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

}