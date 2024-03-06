/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.test;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.TestDBContext;
import entity.Account;
import entity.OptionAnswer;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ViewAnswerQuestionController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TestDBContext test = new TestDBContext();
        ArrayList<OptionAnswer> listQuestionAndAnswer = test.getListQuestionAndAnswer();
        ArrayList<OptionAnswer> listQuestion = test.getListQuestion();

        request.setAttribute("questionAndAnswerOption", listQuestionAndAnswer);
        request.setAttribute("listQuestion", listQuestion);
        request.getRequestDispatcher("view/test/ViewAnswer.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}