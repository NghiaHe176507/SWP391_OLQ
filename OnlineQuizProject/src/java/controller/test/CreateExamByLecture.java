/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.test;

import controller.authentication.BasedAuthorizationController;
import dal.ControllerDBContext;
import dal.GroupDBContext;
import dal.StatusDBContext;
import entity.Account;
import entity.Exam;
import entity.ExamQuestionMapping;
import entity.OptionAnswer;
import entity.Question;
import entity.RoleAccess;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.TimeZone;

/**
 *
 * @author PC
 */
public class CreateExamByLecture extends BasedAuthorizationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @param LoggedUser
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        ControllerDBContext db = new ControllerDBContext();
        GroupDBContext groupDB = new GroupDBContext();
        StatusDBContext statusDB = new StatusDBContext();
        int numberOfQuestion = Integer.parseInt(request.getParameter("numQuestion"));

        try {
            long milisTime = System.currentTimeMillis();
            Timestamp currentTime = new Timestamp(milisTime);
            // Parse the time strings from request parameters
            String examStartTimeParam = ((!request.getParameter("examStartTime").isEmpty() || !request.getParameter("examStartTime").isBlank()) ? request.getParameter("examStartTime") : "00:00");
            String examEndTimeParam = ((!request.getParameter("examEndTime").isEmpty() || !request.getParameter("examEndTime").isBlank()) ? request.getParameter("examStartTime") : "23:59");

            Timestamp startDateExam = ((!request.getParameter("examStartDate").isEmpty() || !request.getParameter("examStartDate").isBlank()) ? Timestamp.valueOf(request.getParameter("examStartDate") + " " + examStartTimeParam + ":00") : currentTime);
            Timestamp endDateExam = Timestamp.valueOf(request.getParameter("examEndDate") + " " + examEndTimeParam + ":00");

            int examTimeMinutes = Integer.parseInt(request.getParameter("examTimeToTest"));
            long milliseconds = examTimeMinutes * 60 * 1000;
            Time examTime = new Time(milliseconds);
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
            String formattedTime = sdf.format(examTime);
            examTime = Time.valueOf(formattedTime);
            
            Exam newExam = new Exam();
            newExam.setExamTitle(request.getParameter("examTitle"));

            newExam.setExamStartDate(startDateExam);

            newExam.setGroup(groupDB.getById(request.getParameter("groupId")));
            newExam.setIsPractice((request.getParameterValues("isPractice") != null) ? true : false);
            newExam.setLectureInfo(db.getAccountInfoByAccountId(LoggedUser.getAccountId()));

            if (startDateExam.after(currentTime)) {
                newExam.setStatus(statusDB.getById("2"));
            } else {
                newExam.setStatus(statusDB.getById("1"));
            }

            newExam.setExamTime(examTime);

            if ((request.getParameterValues("isPractice") == null)) {
                newExam.setExamEndDate(endDateExam);
                newExam.setExamAttemp(Integer.parseInt(request.getParameter("attempt")));
            } else {
                newExam.setExamEndDate(null);
            }

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
            response.sendRedirect(request.getContextPath());
        } catch (IllegalArgumentException | NullPointerException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {

        request.setAttribute("groupId", request.getParameter("groupId"));
        request.getRequestDispatcher("view/test/CreateExamByLecture.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);
    }

}
