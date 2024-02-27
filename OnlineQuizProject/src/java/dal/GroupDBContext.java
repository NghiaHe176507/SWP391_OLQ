/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Group;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class GroupDBContext extends DBContext<Group> {

    AccountInfoDBContext accountInfoDB = new AccountInfoDBContext();
    StatusDBContext statusDB = new StatusDBContext();
    TopicDBContext topicDB = new TopicDBContext();

    @Override
    public Group getById(String Id) {
        try {
            String sql = """
                         SELECT [group_id]
                               ,[group_name]
                               ,[lecture_id]
                               ,[topic_id]
                               ,[status_id]
                               ,[group_invite_code]
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
                newClass.setGroupInvite(rs.getString("group_invite_code"));
                return newClass;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Group> getGroupByLectureId(int lecturerId) {
        StatusDBContext statusDB = new StatusDBContext();
        TopicDBContext topicDB = new TopicDBContext();
        ArrayList<Group> groups = new ArrayList<>();

        try {
            String sql = "SELECT [group_id], [group_name], [lecture_id], [topic_id], [status_id], [group_invite_code] "
                    + "FROM [Group] "
                    + "WHERE [lecture_id] = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lecturerId);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Group group = new Group();
                group.setGroupId(rs.getInt("group_id"));
                group.setGroupName(rs.getString("group_name"));
                group.setTopic(topicDB.getById(String.valueOf(rs.getInt("topic_id"))));
                group.setStatus(statusDB.getById(String.valueOf(rs.getInt("status_id"))));
                group.setGroupInvite(rs.getString("group_invite_code"));
                groups.add(group);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return groups;
    }

    public ArrayList<Group> searchGroup(String keyword) {
        ArrayList<Group> groups = new ArrayList<>();

        try {
            String sql = "SELECT [group_id], [group_name], [lecture_id], [topic_id], [status_id],, [group_invite_code] "
                    + "FROM [Group] "
                    + "WHERE [group_name] LIKE ? ";
//            OR [topic_id] IN (SELECT [topic_id] FROM [Topic] WHERE [topic_name] LIKE ?)

            try (PreparedStatement stm = connection.prepareStatement(sql)) {
                stm.setString(1, "%" + keyword + "%");
//                stm.setString(2, "%" + keyword + "%");

                try (ResultSet rs = stm.executeQuery()) {
                    while (rs.next()) {
                        Group group = new Group();
                        group.setGroupId(rs.getInt("group_id"));
                        group.setGroupName(rs.getString("group_name"));
                        group.setLectureInfo(accountInfoDB.getById(String.valueOf(rs.getInt("lecture_id"))));
                        group.setTopic(topicDB.getById(String.valueOf(rs.getInt("topic_id"))));
                        group.setStatus(statusDB.getById(String.valueOf(rs.getInt("status_id"))));
                        group.setGroupInvite(rs.getString("group_invite_code"));

                        groups.add(group);
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return groups;
    }

}
