/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Register;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

}
