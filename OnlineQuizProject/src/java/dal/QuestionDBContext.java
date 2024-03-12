/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.ExamQuestionMapping;
import entity.Question;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class QuestionDBContext extends DBContext<Question> {

    @Override
    public Question getById(String Id) {
        TopicDBContext topicDB = new TopicDBContext();
        try {
            String sql = """
                         SELECT [question_id]
                               ,[topic_id]
                               ,[question_content]
                               ,[inBank]
                               ,[question_answer_detail]
                           FROM [Question] WHERE [question_id]=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Question question = new Question();
                question.setQuestionId(rs.getInt("question_id"));
                question.setTopic(topicDB.getById(String.valueOf(rs.getInt("topic_id"))));
                question.setQuestionContent(rs.getString("question_content"));
                question.setInBank(rs.getBoolean("inBank"));
                question.setQuestionAnswerDetail(rs.getString("question_answer_detail"));
                return question;
            }

        } catch (SQLException ex) {
            Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
