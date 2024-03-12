/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.test;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.ControllerDBContext;
import dal.GroupDBContext;
import dal.StatusDBContext;
import entity.Account;
import entity.Exam;
import entity.ExamQuestionMapping;
import entity.Group;
import entity.OptionAnswer;
import entity.Question;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.sql.Time;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class CreateExamByLecture extends BasedRequiredAuthenticationController {

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
        ControllerDBContext db = new ControllerDBContext();
        GroupDBContext groupDB = new GroupDBContext();
        StatusDBContext statusDB = new StatusDBContext();
        int numberOfQuestion = Integer.valueOf(request.getParameter("numQuestion"));
        Exam newExam = new Exam();
        newExam.setExamTitle("title jkedfbngkjvdfbn");
        newExam.setExamStartDate(Timestamp.valueOf("2024-03-12 12:34:56"));
        newExam.setGroup(groupDB.getById("4"));
        newExam.setIsPractice(true);
        newExam.setLectureInfo(db.getAccountInfoByAccountId(LoggedUser.getAccountId()));
        newExam.setStatus(statusDB.getById("1"));
        newExam.setExamTime(Time.valueOf("00:30:00"));
        newExam.setExamEndDate(null);
        newExam = db.createNewExam(newExam);
        for (int i = 1; i <= numberOfQuestion; i++) {
            ExamQuestionMapping newExamQuestionMapping = new ExamQuestionMapping();
            Question newQuestion = new Question();
            newQuestion.setQuestionContent(request.getParameter("question" + i));
            newQuestion.setInBank((request.getParameterValues("addToBank" + i) != null) ? true : false);
            newQuestion.setTopic(newExam.getGroup().getTopic());
            newQuestion.setQuestionAnswerDetail(null);
            db.createNewQuestion(newQuestion);
            int optionAnswerNumber = 1;
            while (!(request.getParameter("answer" + i + "_" + optionAnswerNumber) == null)) {
                OptionAnswer newOptionAnswer = new OptionAnswer();
                newOptionAnswer.setAnswerContent(request.getParameter("answer" + i + "_" + optionAnswerNumber));
                newOptionAnswer.setIsCorrect((request.getParameterValues("correctAnswer" + i + "_" + optionAnswerNumber) != null) ? true : false);
                newOptionAnswer.setQuestion(newQuestion);
                db.createNewOptionAnswer(newOptionAnswer);
                optionAnswerNumber++;
            }
            newExamQuestionMapping.setExam(newExam);
            newExamQuestionMapping.setQuestion(newQuestion);
            db.createNewExamQuestionMapping(newExamQuestionMapping);
        }
        request.getRequestDispatcher("view/test/CreateExamByLecture.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        request.getRequestDispatcher("view/test/CreateExamByLecture.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

}
