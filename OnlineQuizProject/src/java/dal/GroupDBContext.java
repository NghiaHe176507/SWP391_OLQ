/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */

public class GroupDBContext extends DBContext<Group> {

    @Override
    public Group getById(String Id) {
        AccountInfoDBContext accountInfoDB = new AccountInfoDBContext();
        StatusDBContext statusDB = new StatusDBContext();
        TopicDBContext topicDB = new TopicDBContext();
        try {
            String sql = """
                         SELECT [group_id]
                               ,[group_name]
                               ,[lecture_id]
                               ,[topic_id]
                               ,[status_id]
                           FROM [Group]
                           WHERE [group_id] =?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Group newClass = new Group();
                newClass.setGroupId(rs.getInt("group_id"));
                newClass.setGroupName(rs.getString("group_name"));
                newClass.setLectureInfo(accountInfoDB.getById(String.valueOf(rs.getInt("lecture_id"))));
                newClass.setTopic(topicDB.getById(String.valueOf(rs.getInt("topic_id"))));
                newClass.setStatus(statusDB.getById(String.valueOf(rs.getInt("status_id"))));
                return newClass;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
