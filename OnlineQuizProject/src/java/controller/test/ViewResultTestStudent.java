/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.test;

import controller.authentication.BasedAuthorizationController;
import dal.ControllerDBContext;
import dal.TestDBContext;
import entity.Account;
import entity.Result;
import entity.RoleAccess;
import entity.Topic;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author tuann
 */
public class ViewResultTestStudent extends BasedAuthorizationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        int studentID = Integer.parseInt(request.getParameter("studentID"));
        int examId = Integer.parseInt(request.getParameter("examId"));
        response.setContentType("text/html;charset=UTF-8");

        TestDBContext test = new TestDBContext();
        ArrayList<Result> listExaminationOfStudent = test.getListExaminationOfStudent(studentID,examId);
        request.setAttribute("listExaminationOfStudent", listExaminationOfStudent);
        request.getRequestDispatcher("view/test/ViewListExamTest.jsp").forward(request, response);
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
