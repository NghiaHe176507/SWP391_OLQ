/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.ExamQuestionMapping;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class ExamQuestionMappingDBContext extends DBContext<ExamQuestionMapping> {

    @Override
    public ExamQuestionMapping getById(String Id) {
        ExamDBContext examDB = new ExamDBContext();
        QuestionDBContext questionDB = new QuestionDBContext();
        try {
            String sql = """
                         SELECT [mapping_id]
                               ,[question_id]
                               ,[exam_id]
                           FROM [ExamQuestionMapping]
                           WHERE [mapping_id]=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                ExamQuestionMapping examQuestionMapping = new ExamQuestionMapping();
                examQuestionMapping.setExamQuestionMappingId(rs.getInt("mapping_id"));
                examQuestionMapping.setQuestion(questionDB.getById(String.valueOf(rs.getString("question_id"))));
                examQuestionMapping.setExam(examDB.getById(String.valueOf(rs.getInt("exam_id"))));
                return examQuestionMapping;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExamQuestionMappingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
