/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import controller.authentication.BasedAuthorizationController;
import dal.ControllerDBContext;
import dal.TestDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.Register;
import entity.Result;
import entity.RoleAccess;
import entity.Topic;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hatua
 */
public class ViewListStudentForLecture extends BasedAuthorizationController {

    ControllerDBContext db = new ControllerDBContext();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int groupID = Integer.parseInt(request.getParameter("groupID"));
        ArrayList<Register> listOfStudentHasTest = db.getListAccountRegistedExamByGroup(groupID);
        request.setAttribute("listOfStudentHasTest", listOfStudentHasTest);

        int lecturerAccountId = LoggedUser.getAccountId();
        AccountInfo accountInfo = db.getAccountInfoByAccountId(lecturerAccountId);
        
        ArrayList<Result> listExaminationOfStudent = db.getListExaminationOfStudent(accountInfo.getAccountInfoId());
        request.setAttribute("listExaminationOfStudent", listExaminationOfStudent);
        request.getRequestDispatcher("view/test/ViewListStudentForExam.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);
    }

}
