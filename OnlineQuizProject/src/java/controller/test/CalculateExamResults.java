/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.test;

import controller.authentication.BasedAuthorizationController;
import dal.AccountInfoDBContext;
import dal.ControllerDBContext;
import dal.ExamDBContext;
import dal.OptionAnswerDBContext;
import dal.QuestionDBContext;
import dal.StudentAnswerDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.Exam;
import entity.ExamQuestionMapping;
import entity.Question;
import entity.Result;
import entity.RoleAccess;
import entity.StudentAnswer;
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
public class CalculateExamResults extends BasedAuthorizationController {

    ControllerDBContext db = new ControllerDBContext();
    StudentAnswerDBContext studentAnswerDB = new StudentAnswerDBContext();
    ExamDBContext examDB = new ExamDBContext();
    QuestionDBContext questionDB = new QuestionDBContext();
    OptionAnswerDBContext optionAnswerDB = new OptionAnswerDBContext();
    AccountInfoDBContext accountInfoDB = new AccountInfoDBContext();

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
        Exam exam = examDB.getById(request.getParameter("examId"));
        AccountInfo studentInfo = db.getAccountInfoByAccountId(LoggedUser.getAccountId());
        int attemptNumber = Integer.parseInt(request.getParameter("attemptNumber"));
        Double finalScore = 0.0;
        String[] listStudentAnswerId = request.getParameterValues("answerOption");
        ArrayList<StudentAnswer> listOptionAnswerStudentSelected = new ArrayList<>();
        if (listStudentAnswerId != null) {

            for (String studentAnswerId : listStudentAnswerId) {
                StudentAnswer optionAnswerStudentSelected = new StudentAnswer();
                optionAnswerStudentSelected.setExam(exam);
                optionAnswerStudentSelected.setQuestion(optionAnswerDB.getById(studentAnswerId).getQuestion());
                optionAnswerDB.getById(studentAnswerId).getQuestion().getQuestionId();
                optionAnswerStudentSelected.setOptionAnswer(optionAnswerDB.getById(studentAnswerId));
                optionAnswerStudentSelected.setStudentInfo(studentInfo);
                optionAnswerStudentSelected.setAttemptNumber(attemptNumber);
                db.createNewStudentAnswer(optionAnswerStudentSelected);

                listOptionAnswerStudentSelected.add(optionAnswerStudentSelected);

            }

            ArrayList<ExamQuestionMapping> listExamQuestionMapping = db.getListExamQuestionMappingByExamId(exam.getExamId());

            finalScore = db.calculateScoreResultExamOfStudent(listExamQuestionMapping,
                    studentInfo.getAccountInfoId(),
                    attemptNumber);
        }
        Result newResult = new Result();
        newResult.setAttemptNumber(attemptNumber);
        newResult.setExam(exam);
        newResult.setStudentInfo(studentInfo);
        newResult.setScore(finalScore);

        db.updateScoreOfResultByExamIdAndStudentId(newResult);
        request.setAttribute("newResult", newResult);
        request.setAttribute("examId", exam.getExamId());
        request.setAttribute("studentInfoId", studentInfo.getAccountInfoId());
        request.setAttribute("resultTotalExam", db.getResultByStudentIdAndExamIdAndNumberAttempt(exam.getExamId(), studentInfo.getAccountInfoId(), attemptNumber));
        request.getRequestDispatcher("view/test/ViewResultAfterTest.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
