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
//        ArrayList<ExamQuestionMapping> listExamQuestionMapping = db.getListExamQuestionMappingByExamId(1);
//
//        // Khởi tạo biến score
//        int score = 0;
//
//        for (ExamQuestionMapping examQuestionMapping : listExamQuestionMapping) {
//            // Lấy danh sách câu trả lời từ người dùng
//            String questionIdParam = "q" + examQuestionMapping.getQuestion().getQuestionId();
//            String[] selectedAnswers = request.getParameterValues(questionIdParam);
//
//            if (selectedAnswers != null && selectedAnswers.length > 0) {
//                ArrayList<Integer> selectedAnswerIds = new ArrayList<>();
//                for (String answer : selectedAnswers) {
//                    selectedAnswerIds.add(Integer.parseInt(answer));
//                }
//
//                // Lấy danh sách đáp án đúng từ CSDL
//                ArrayList<OptionAnswer> correctAnswers = db.getListOptionAnswerByQuestionId(examQuestionMapping.getQuestion().getQuestionId());
//
//                // So sánh câu trả lời của người dùng với đáp án đúng
//                boolean isCorrect = true;
//                for (OptionAnswer correctAnswer : correctAnswers) {
//                    if (!selectedAnswerIds.contains(correctAnswer.getOptionAnswerId())) {
//                        isCorrect = false;
//                        break;
//                    }
//                }
//
//                // Nếu câu trả lời đúng, cộng điểm
//                if (isCorrect) {
//                    score += 1; // Điểm mỗi câu là 1, bạn có thể thay đổi nếu muốn
//                }
//            }
//        }
//
//        // Tính điểm theo quy tắc của bạn
//        score += listExamQuestionMapping.size() / 10;
//
//        request.setAttribute("score", score);

// Lấy thông tin câu trả lời từ request
    ArrayList<ExamQuestionMapping> listExamQuestionMapping = db.getListExamQuestionMappingByExamId(1);

    // Khởi tạo biến score
    int score = 0;

    for (ExamQuestionMapping examQuestionMapping : listExamQuestionMapping) {
        // Lấy danh sách câu trả lời từ người dùng
        ArrayList<String> selectedAnswerContents = new ArrayList<>();
        for (int i = 1; ; i++) {
            String answerIdParam = "q" + examQuestionMapping.getQuestion().getQuestionId() + "." + i;
            String selectedAnswer = request.getParameter(answerIdParam);
            if (selectedAnswer != null && !selectedAnswer.isEmpty()) {
                selectedAnswerContents.add(selectedAnswer);
            } else {
                break;
            }
        }

        // Lấy danh sách đáp án đúng từ CSDL
        ArrayList<OptionAnswer> correctAnswers = db.getListOptionAnswerByQuestionId(examQuestionMapping.getQuestion().getQuestionId());
        // So sánh câu trả lời của người dùng với đáp án đúng
        boolean isCorrect = true;
        for (OptionAnswer correctAnswer : correctAnswers) {
            // Kiểm tra nếu câu trả lời của người dùng không nằm trong danh sách đáp án đúng
            if (!selectedAnswerContents.contains(correctAnswer.getAnswerContent())) {
                isCorrect = false;
                break;
            }
        }

        // Nếu câu trả lời đúng, cộng điểm
        if (isCorrect) {
            score += 1; // Điểm mỗi câu là 1, bạn có thể thay đổi nếu muốn
        }
    }

    // Tính điểm theo quy tắc của bạn
    score += listExamQuestionMapping.size() / 10;

    // Đặt điểm số vào request để hiển thị
    request.setAttribute("score", score);

    // Chuyển hướng đến JSP để hiển thị kết quả
    request.getRequestDispatcher("view/test/ViewTotalResultTest.jsp").forward(request, response);
}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles) throws ServletException, IOException {
        processRequest(request, response, LoggedUser, roles);
    }

}
