/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.test;

import controller.authentication.BasedAuthorizationController;
import dal.ControllerDBContext;
import dal.ResultDBContext;
import entity.Account;
import entity.ExamQuestionMapping;
import entity.OptionAnswer;
import entity.Result;
import entity.RoleAccess;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author tuann
 */
public class ViewResultExamOfStudent extends BasedAuthorizationController {

    ControllerDBContext db = new ControllerDBContext();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
//        ArrayList<ExamQuestionMapping> listExamQuestionMapping = db.getListExamQuestionMappingByExamId(1);
//
//        // Tạo một danh sách để chứa danh sách đáp án đúng cho mỗi câu hỏi
//        ArrayList<ArrayList<OptionAnswer>> optionAnswersForEachQuestion = new ArrayList<>();
//
//        // Duyệt qua danh sách các câu hỏi và lấy danh sách các đáp án đúng cho mỗi câu hỏi
//        for (ExamQuestionMapping examQuestionMapping : listExamQuestionMapping) {
//            ArrayList<OptionAnswer> listCorrectOptionAnswers = db.getListOptionAnswerByQuestionId(examQuestionMapping.getQuestion().getQuestionId());
//            optionAnswersForEachQuestion.add(listCorrectOptionAnswers);
//        }
//
//        // Đặt danh sách câu hỏi và danh sách các đáp án đúng vào request để gửi đến JSP
//        request.setAttribute("listQuestion", listExamQuestionMapping);
//        request.setAttribute("optionAnswersForEachQuestion", optionAnswersForEachQuestion);
//
////        int studentID = Integer.parseInt(request.getParameter("studentID"));
//        ResultDBContext resultExam = new ResultDBContext();
//        Result result = resultExam.getByStudentId(11);
//        request.setAttribute("resultTotalExam", result);

// Lấy danh sách câu hỏi và danh sách các đáp án đúng từ request
        request.getRequestDispatcher("view/test/ViewTotalResultTest.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        ArrayList<ExamQuestionMapping> listQuestion = (ArrayList<ExamQuestionMapping>) request.getAttribute("listQuestion");
        ArrayList<ArrayList<OptionAnswer>> optionAnswersForEachQuestion = (ArrayList<ArrayList<OptionAnswer>>) request.getAttribute("optionAnswersForEachQuestion");

        // Lấy danh sách các optionAnswerId được chọn từ request
        Map<Integer, Integer> selectedOptions = new HashMap<>();
        for (ExamQuestionMapping examQuestionMapping : listQuestion) {
            int questionIndex = examQuestionMapping.getQuestion().getQuestionId();
            String optionAnswerIdStr = request.getParameter("q" + questionIndex);
            if (optionAnswerIdStr != null && !optionAnswerIdStr.isEmpty()) {
                int optionAnswerId = Integer.parseInt(optionAnswerIdStr);
                selectedOptions.put(questionIndex, optionAnswerId);
            }
        }

        // Tính điểm số
        int score = 0;
        for (int i = 0; i < listQuestion.size(); i++) {
            ExamQuestionMapping examQuestionMapping = listQuestion.get(i);
            int questionIndex = examQuestionMapping.getQuestion().getQuestionId();
            ArrayList<OptionAnswer> correctOptions = optionAnswersForEachQuestion.get(i);
            int selectedOptionId = selectedOptions.getOrDefault(questionIndex, -1);

            for (OptionAnswer correctOption : correctOptions) {
                if (correctOption.getOptionAnswerId() == selectedOptionId) {
                    score += listQuestion.size() / 10;
                    break;
                }
            }
        }

        // Đưa điểm số vào request để hiển thị ở JSP hoặc thực hiện các thao tác khác
        request.setAttribute("score", score);
        request.getRequestDispatcher("view/test/ViewTotalResultTest.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);
    }

}
