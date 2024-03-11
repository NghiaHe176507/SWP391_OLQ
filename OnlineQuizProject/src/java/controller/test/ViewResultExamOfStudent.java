/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.test;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.ResultTotalExamDBContext;
import entity.Account;
import entity.Result;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author tuann
 */
public class ViewResultExamOfStudent extends BasedRequiredAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException {
//        int studentID = Integer.parseInt(request.getParameter("studentID"));
        ResultTotalExamDBContext resultExam = new ResultTotalExamDBContext();
        Result result = resultExam.getByStudentId(11);
        request.setAttribute("resultTotalExam", result);
        request.getRequestDispatcher("view/test/ViewTotalResultTest.jsp").forward(request, response);
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
