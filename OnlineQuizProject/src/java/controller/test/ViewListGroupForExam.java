/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.test;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.ControllerDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.Exam;
import entity.Group;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author hatua
 */
public class ViewListGroupForExam extends BasedRequiredAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ControllerDBContext db = new ControllerDBContext();
        int lecturerId = LoggedUser.getAccountId();
        AccountInfo accountInfo = db.getAccountInfoByAccountId(lecturerId);
        ArrayList<Group> listGroupOwned = db.getListGroupOwnedByLectureId(accountInfo.getAccountInfoId());
        request.setAttribute("listGroupExam", listGroupOwned);
        request.setAttribute("accountInfo", accountInfo);
        request.getRequestDispatcher("view/test/ViewGroupForExam.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

}
