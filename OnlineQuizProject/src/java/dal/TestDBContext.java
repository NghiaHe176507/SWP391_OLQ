/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tuann
 */
public class TestDBContext extends DBContext<OptionAnswer> {

    public ArrayList<OptionAnswer> getListQuestionAndAnswer() {
        ArrayList<OptionAnswer> listQuestion = new ArrayList<>();
        try {
            String sql = """
                         SELECT op.[optionAnswer_id]
                               ,op.[answer_content]
                               ,op.[isCorrect]
                               ,q.[question_id]
                               ,q.question_content
                         FROM [OptionAnswer] op INNER JOIN [Question] q ON op.question_id = q.question_id""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OptionAnswer op = new OptionAnswer();
                op.setOptionAnswerId(rs.getInt("optionAnswer_id"));
                op.setAnswerOption(rs.getString("answer_content"));
                op.setIsCorrect(rs.getBoolean("isCorrect"));
                Question q = new Question();
                q.setQuestionId(rs.getInt("question_id"));
                q.setQuestionContent(rs.getString("question_content"));
                op.setQuestion(q);
                listQuestion.add(op);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listQuestion;
    }

    public ArrayList<OptionAnswer> getListQuestion() {
        ArrayList<OptionAnswer> listQuestion = new ArrayList<>();
        try {
            String sql = """
                         SELECT DISTINCT question_content FROM Question q 
                         INNER JOIN OptionAnswer op ON q.question_id = op.question_id""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OptionAnswer op = new OptionAnswer();
                Question q = new Question();
                q.setQuestionContent(rs.getString("question_content"));
                op.setQuestion(q);
                listQuestion.add(op);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listQuestion;
    }

    public ArrayList<Result> getListExaminationOfStudent() {
        ArrayList<Result> listStudentExamResult = new ArrayList<>();
        try {
            String sql = """
                       SELECT [result_id]
                             ,e.exam_title
                       	     ,acI.fullname
                             ,[score]
                       	     ,e.isPractice
                             ,[comment_content]
                       FROM [dbo].[Result]  r INNER JOIN Exam e ON r.exam_id = e.exam_id
                       INNER JOIN AccountInfo acI ON r.student_id = acI.accountInfo_id
                       INNER JOIN [Group] g ON e.group_id = g.group_id
                       INNER JOIN [Topic] t ON g.topic_id = t.topic_id""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Result r = new Result();
                r.setResultId(rs.getInt("result_id"));
                r.setScore(rs.getDouble("score"));
                r.setCommentContent(rs.getString("comment_content"));
                AccountInfo acc = new AccountInfo();
                acc.setFullName(rs.getString("fullname"));
                r.setStudentInfo(acc);

                Exam e = new Exam();
                e.setExamTitle(rs.getString("exam_title"));
                r.setStudentInfo(acc);
                r.setExam(e);
                listStudentExamResult.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listStudentExamResult;
    }

    public ArrayList<Result> searchListExaminationOfStudentByName(String key) {
        ArrayList<Result> searchStudentExamResult = new ArrayList<>();
        try {
            String sql = """
                        SELECT [result_id]
                              ,t.topic_name
                              ,acI.fullname
                              ,[score]
                          FROM [Result] r INNER JOIN Exam e ON r.exam_id = e.exam_id
                          INNER JOIN Account a ON r.student_id = a.account_id
                          INNER JOIN AccountInfo acI ON a.account_id = acI.account_id
                          INNER JOIN [Group] g ON e.group_id = g.group_id
                          INNER JOIN [Topic] t ON g.topic_id = t.topic_id
                          WHERE aci.fullname LIKE ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, '%' + key + '%');
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Result r = new Result();
                r.setResultId(rs.getInt("result_id"));
                r.setScore(rs.getDouble("score"));
                AccountInfo acc = new AccountInfo();
                acc.setFullName(rs.getString("fullname"));
                r.setStudentInfo(acc);
                Topic t = new Topic();
                t.setTopicName(rs.getString("topic_name"));
                Group g = new Group();
                g.setTopic(t);
                Exam e = new Exam();
                e.setClassExam(g);
                r.setStudentInfo(acc);
                r.setExam(e);
                searchStudentExamResult.add(r);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return searchStudentExamResult;
    }

    @Override
    public OptionAnswer getById(String Id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
