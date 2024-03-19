/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.OptionAnswer;
import entity.StudentAnswer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class StudentAnswerDBContext extends DBContext<StudentAnswer> {

    @Override
    public StudentAnswer getById(String Id) {
        QuestionDBContext questionDB = new QuestionDBContext();
        OptionAnswerDBContext optionAnswerDB = new OptionAnswerDBContext();
        ExamDBContext examDB = new ExamDBContext();
        AccountInfoDBContext accountInfoDB = new AccountInfoDBContext();
        try {
            String sql = """
                         SELECT [studentAnswer_id]
                               ,[exam_id]
                               ,[question_id]
                               ,[option_answer_id]
                               ,[student_id]
                               ,[attempt_number]
                           FROM [StudentAnswer]
                           WHERE [studentAnswer_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                StudentAnswer studentAnswer = new StudentAnswer();
                studentAnswer.setStudentAnswerId(rs.getInt("studentAnswer_id"));
                studentAnswer.setExam(examDB.getById(String.valueOf(rs.getInt("exam_id"))));
                studentAnswer.setQuestion(questionDB.getById(String.valueOf(rs.getInt("question_id"))));
                studentAnswer.setOptionAnswer(optionAnswerDB.getById(String.valueOf(rs.getInt("option_answer_id"))));
                studentAnswer.setStudentInfo(accountInfoDB.getById(String.valueOf(rs.getInt("student_id"))));
                studentAnswer.setAttemptNumber(rs.getInt("attempt_number"));
                return studentAnswer;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExamQuestionMappingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
