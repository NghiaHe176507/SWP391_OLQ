/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.test;

import dal.ControllerDBContext;
import dal.GroupDBContext;
import dal.StatusDBContext;
import entity.Account;
import entity.Exam;
import entity.ExamQuestionMapping;
import entity.OptionAnswer;
import entity.Question;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.sql.Time;

/**
 *
 * @author PC
 */
public class CreateExamByLecture extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ControllerDBContext db = new ControllerDBContext();
        GroupDBContext groupDB = new GroupDBContext();
        StatusDBContext statusDB = new StatusDBContext();
        int numberOfQuestion = Integer.parseInt(request.getParameter("numQuestion"));

        try {
            // Parse the time strings from request parameters
            String examTimeParam = request.getParameter("examTime");
            String examEndTimeParam = request.getParameter("examEndTime");

            Timestamp startDateExam = Timestamp.valueOf(request.getParameter("examDate") + " " + examTimeParam + ":00");
            Timestamp endDateExam = Timestamp.valueOf(request.getParameter("examEndDate") + " " + examEndTimeParam + ":00");

            // Append ":00" to convert time strings into "hh:mm:ss" format
            String formattedStartTime = examTimeParam + ":00";
            String formattedEndTime = examEndTimeParam + ":00";

            // Convert time strings to Time objects
            Time timeStartExam = Time.valueOf(formattedStartTime);
            Time timeEndExam = Time.valueOf(formattedEndTime);

            // Calculate duration in milliseconds
            long durationMillis = timeEndExam.getTime() - timeStartExam.getTime();

            // Convert duration to seconds
            long durationSeconds = durationMillis / 1000;

            int hours = (int) (durationSeconds / 3600);
            int minutes = (int) ((durationSeconds % 3600) / 60);
            int seconds = (int) (durationSeconds % 60);

            String formattedDuration = String.format("%02d:%02d:%02d", hours, minutes, seconds);

            Exam newExam = new Exam();
            newExam.setExamTitle("title jkedfbngkjvdfbn");
            newExam.setExamStartDate(startDateExam);
            newExam.setGroup(groupDB.getById("4"));
            newExam.setIsPractice(true);
            newExam.setLectureInfo(db.getAccountInfoByAccountId(1));
            newExam.setStatus(statusDB.getById("1"));
            newExam.setExamTime(Time.valueOf(formattedDuration));
            newExam.setExamEndDate(endDateExam);
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
        } catch (IllegalArgumentException | NullPointerException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/test/CreateExamByLecture.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}
