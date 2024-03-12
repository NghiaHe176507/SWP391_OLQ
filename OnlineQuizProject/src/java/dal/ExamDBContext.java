/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Exam;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class ExamDBContext extends DBContext<Exam> {

    @Override
    public Exam getById(String Id) {
        AccountInfoDBContext accountInfoDB = new AccountInfoDBContext();
        GroupDBContext groupDB = new GroupDBContext();
        StatusDBContext statusDB = new StatusDBContext();
        try {
            String sql = """
                         SELECT [exam_id]
                               ,[exam_title]
                               ,[group_id]
                               ,[startDate]
                               ,[endDate]
                               ,[time]
                               ,[status_id]
                               ,[lecture_id]
                               ,[attempt]
                               ,[isPractice]
                           FROM [Exam] WHERE [exam_id]=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Exam exam = new Exam();
                exam.setExamId(rs.getInt("exam_id"));
                exam.setExamTitle(rs.getString("exam_title"));
                exam.setGroup(groupDB.getById(String.valueOf(rs.getInt("group_id"))));
                exam.setExamStartDate(rs.getTimestamp("startDate"));
                exam.setExamEndDate(rs.getTimestamp("endDate"));
                exam.setExamTime(rs.getTime("time"));
                exam.setStatus(statusDB.getById(String.valueOf(rs.getInt("status_id"))));
                exam.setLectureInfo(accountInfoDB.getById(String.valueOf(rs.getInt("lecture_id"))));
                exam.setExamAttemp(getNullableInt(rs, "attempt"));
                exam.setIsPractice(rs.getBoolean("isPractice"));
                return exam;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private Integer getNullableInt(ResultSet rs, String columnLabel) throws SQLException {
        int value = rs.getInt(columnLabel);
        return rs.wasNull() ? null : value;
    }

}
