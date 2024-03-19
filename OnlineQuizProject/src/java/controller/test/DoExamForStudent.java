/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.test;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.ControllerDBContext;
import entity.Account;
import entity.ExamQuestionMapping;
import entity.OptionAnswer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class DoExamForStudent extends BasedRequiredAuthenticationController {

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
        String examIdParam = request.getParameter("examId");
        String examTime = request.getParameter("examTime");
        request.setAttribute("examTime", examTime);

        int examId = Integer.parseInt(examIdParam);
        ArrayList<ExamQuestionMapping> listExamQuestionMapping = db.getListExamQuestionMappingByExamId(examId);
        request.setAttribute("listQuestion", listExamQuestionMapping);

        ArrayList<ArrayList<OptionAnswer>> optionAnswersForEachQuestion = new ArrayList<>();

        for (ExamQuestionMapping examQuestionMapping : listExamQuestionMapping) {
            ArrayList<OptionAnswer> listOptionAnswerByQuestion = db.getListOptionAnswerByQuestionId(examQuestionMapping.getQuestion().getQuestionId());
            optionAnswersForEachQuestion.add(listOptionAnswerByQuestion);
        }
        request.setAttribute("optionAnswersForEachQuestion", optionAnswersForEachQuestion);

        request.getRequestDispatcher("view/test/DoExamForStudent.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        String examIdParam = request.getParameter("examId");
        int examId = Integer.parseInt(examIdParam);
        ArrayList<ExamQuestionMapping> listExamQuestionMapping = db.getListExamQuestionMappingByExamId(examId);
        request.setAttribute("listQuestion", listExamQuestionMapping);

        ArrayList<ArrayList<OptionAnswer>> optionAnswersForEachQuestion = new ArrayList<>();

        for (ExamQuestionMapping examQuestionMapping : listExamQuestionMapping) {
            ArrayList<OptionAnswer> listOptionAnswerByQuestion = db.getListOptionAnswerByQuestionId(examQuestionMapping.getQuestion().getQuestionId());
            optionAnswersForEachQuestion.add(listOptionAnswerByQuestion);
        }
        request.setAttribute("optionAnswersForEachQuestion", optionAnswersForEachQuestion);

        request.getRequestDispatcher("view/test/DoExamForStudent.jsp").forward(request, response);
    }

}
