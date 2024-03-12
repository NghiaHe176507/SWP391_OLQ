/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.ExamQuestionMapping;
import entity.OptionAnswer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class OptionAnswerDBContext extends DBContext<OptionAnswer> {

    @Override
    public OptionAnswer getById(String Id) {
        QuestionDBContext questionDB = new QuestionDBContext();
        try {
            String sql = """
                         SELECT [optionAnswer_id]
                               ,[answer_content]
                               ,[isCorrect]
                               ,[question_id]
                           FROM [OptionAnswer]
                           WHERE [optionAnswer_id] =?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                OptionAnswer optionAnswer = new OptionAnswer();
                optionAnswer.setOptionAnswerId(rs.getInt("optionAnswer_id"));
                optionAnswer.setAnswerContent(rs.getString("answer_content"));
                optionAnswer.setIsCorrect(rs.getBoolean("isCorrect"));
                optionAnswer.setQuestion(questionDB.getById(String.valueOf(rs.getInt("question_id"))));
                
                return optionAnswer;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExamQuestionMappingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
