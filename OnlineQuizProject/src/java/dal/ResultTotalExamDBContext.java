/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.AccountInfo;
import entity.Exam;
import entity.Group;
import entity.Result;
import entity.Status;
import entity.Topic;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tuann
 */
public class ResultTotalExamDBContext extends DBContext<Result> {

    public Result getByStudentId(int studentID) {
        try {
            String sql = """
                         SELECT e.[exam_id]
                               ,[exam_title]
                               ,g.[group_name]
                               ,[startDate]
                               ,[endDate]
                               ,[time]
                               ,s.[status_name]
                               ,[attempt]
                               ,[isPractice]
                               ,ac.fullname
                               ,r.score
                               ,t.topic_name
                           FROM [Exam] e INNER JOIN [Group] g ON e.group_id = g.group_id
                           INNER JOIN [Status] s ON g.status_id = s.status_id
                           INNER JOIN [Topic] t ON g.topic_id = t.topic_id
                           INNER JOIN [Result] r ON e.exam_id = r.exam_id
                           INNER JOIN [AccountInfo] ac ON r.student_id = ac.account_id
                           WHERE ac.account_id = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, studentID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Exam e = new Exam();
                e.setExamId(rs.getInt("exam_id"));
                e.setExamTitle(rs.getString("exam_title"));
                e.setExamEndDate(rs.getDate("endDate"));
                e.setExamTime(rs.getDate("time"));
                e.setExamAttemp(rs.getInt("attempt"));
                e.setIsPractice(rs.getBoolean("isPractice"));
                e.setExamStartDate(rs.getDate("startDate"));
                Status s = new Status();
                s.setStatusName(rs.getString("status_name"));
                e.setStatus(s);
                Topic t = new Topic();
                t.setTopicName(rs.getString("topic_name"));
                Group g = new Group();
                g.setGroupName(rs.getString("group_name"));
                g.setTopic(t);
                e.setClassExam(g);
                Result r = new Result();
                r.setScore(rs.getDouble("score"));
                AccountInfo ac = new AccountInfo();
                ac.setFullName(rs.getString("fullname"));
                r.setStudentInfo(ac);
                r.setExam(e);
                return r;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ResultTotalExamDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateLectureComment(int resultId, String lectureComment) {
        try {
            String sql = "UPDATE Result SET comment_content = ? WHERE result_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lectureComment);
            stm.setInt(2, resultId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ResultTotalExamDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Result getById(String Id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
