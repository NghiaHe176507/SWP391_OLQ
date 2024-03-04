/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import entity.Register;
import entity.Topic;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nghia
 */
public class RegisterDBContext extends DBContext<Register> {

    AccountInfoDBContext accountInfoDB = new AccountInfoDBContext();
    GroupDBContext groupDB = new GroupDBContext();
    TopicDBContext topicDB = new TopicDBContext();

    @Override
    public Register getById(String Id) {
        try {
            String sql = """
                         SELECT [register_id]
                               ,[register_date]
                               ,[student_id]
                               ,[group_id]
                           FROM [Register]
                           WHERE [register_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Register register = new Register();
                register.setRegisterId(rs.getInt("register_id"));
                register.setRegisterDate(rs.getDate("register_date"));
                register.setStudentInfo(accountInfoDB.getById(String.valueOf(rs.getInt("student_id"))));
                register.setClassRegister(groupDB.getById(String.valueOf(rs.getInt("group_id"))));
                return register;
            }

        } catch (SQLException ex) {
            Logger.getLogger(RegisterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Register> getByStudentId(int studentId) {
        ArrayList<Register> registers = new ArrayList<>();
        try {
            String sql = "SELECT r.register_id, r.register_date, r.student_id, "
                    + "r.group_id, g.group_name, g.lecture_id, g.topic_id, t.topic_name "
                    + "FROM Register r "
                    + "INNER JOIN [Group] g ON r.group_id = g.group_id "
                    + "INNER JOIN Topic t ON g.topic_id = t.topic_id "
                    + "WHERE r.student_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, studentId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Register register = new Register();
                register.setRegisterId(rs.getInt("register_id"));
                register.setRegisterDate(rs.getDate("register_date"));
                // Lấy thông tin của Student từ AccountInfoDBContext
                int studentInfoId = rs.getInt("student_id");
                register.setStudentInfo(accountInfoDB.getById(String.valueOf(studentInfoId)));
                // Lấy thông tin của Class từ GroupDBContext
                int classId = rs.getInt("group_id");
                register.setClassRegister(groupDB.getById(String.valueOf(classId)));
                // Lấy thông tin của Topic từ TopicDBContext
                int topicId = rs.getInt("topic_id");
                register.setTopic(topicDB.getById(String.valueOf(topicId)));
                registers.add(register);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return registers;
    }

    public ArrayList<Register> searchRegister(String keyword) {
        ArrayList<Register> registers = new ArrayList<>();
        String sql = "SELECT r.register_id, r.register_date, r.student_id, "
                + "r.group_id, g.group_name, g.lecture_id, g.topic_id, t.topic_name "
                + "FROM Register r "
                + "INNER JOIN [Group] g ON r.group_id = g.group_id "
                + "INNER JOIN Topic t ON g.topic_id = t.topic_id "
                + "WHERE t.topic_name LIKE ? OR g.group_name LIKE ?";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, "%" + keyword + "%");
            stm.setString(2, "%" + keyword + "%");

            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Register register = new Register();
                    register.setRegisterId(rs.getInt("register_id"));
                    register.setRegisterDate(rs.getDate("register_date"));
                    // Lấy thông tin của Student từ AccountInfoDBContext
                    int studentInfoId = rs.getInt("student_id");
                    register.setStudentInfo(accountInfoDB.getById(String.valueOf(studentInfoId)));
                    // Lấy thông tin của Class từ GroupDBContext
                    int classId = rs.getInt("group_id");
                    register.setClassRegister(groupDB.getById(String.valueOf(classId)));
                    // Lấy thông tin của Topic từ TopicDBContext
                    int topicId = rs.getInt("topic_id");
                    register.setTopic(topicDB.getById(String.valueOf(topicId)));
                    registers.add(register);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return registers;
    }

}
