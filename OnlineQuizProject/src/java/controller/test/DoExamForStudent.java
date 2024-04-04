/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.test;

import controller.authentication.BasedAuthorizationController;
import controller.authentication.BasedRequiredAuthenticationController;
import dal.ControllerDBContext;
import dal.ExamDBContext;
import dal.ResultDBContext;
import entity.Account;
import entity.ExamQuestionMapping;
import entity.OptionAnswer;
import entity.Result;
import entity.RoleAccess;
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
public class DoExamForStudent extends BasedAuthorizationController {

    ControllerDBContext db = new ControllerDBContext();
    ExamDBContext examDb = new ExamDBContext();
    ResultDBContext resultDB = new ResultDBContext();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
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
            
            Result studentDefaultResult = new Result();
            studentDefaultResult.setExam(examDb.getById(String.valueOf(examId)));
            studentDefaultResult.setScore(0.0);
            studentDefaultResult.setStudentInfo(db.getAccountInfoByAccountId(LoggedUser.getAccountId()));
            if (db.checkAttemptLimit(Integer.parseInt(examIdParam), db.getAccountInfoByAccountId(LoggedUser.getAccountId()).getAccountInfoId())) {
            studentDefaultResult = db.createNewResult(studentDefaultResult);
            studentDefaultResult = resultDB.getById(String.valueOf(studentDefaultResult.getResultId()));
            request.setAttribute("attemptNumber", studentDefaultResult.getAttemptNumber());
            }
            request.setAttribute("optionAnswersForEachQuestion", optionAnswersForEachQuestion);
            request.setAttribute("examId", examId);
            request.setAttribute("timeExam", examDb.getById(String.valueOf(examId)).getExamTime());
            request.getRequestDispatcher("view/test/DoExamForStudent.jsp").forward(request, response);
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);

    }

}
