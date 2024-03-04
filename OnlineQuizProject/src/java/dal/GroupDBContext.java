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
import java.util.List;
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
            String sql = "SELECT [group_id], [group_name], [lecture_id], [topic_id], [status_id],[group_invite_code] "
                    + "FROM [Group] "
                    + "WHERE [group_name] LIKE ? ";

            try (PreparedStatement stm = connection.prepareStatement(sql)) {
                stm.setString(1, "%" + keyword + "%");

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

    public void joinGroup(int accountId, String groupCode) {
        try {
            // Tìm group_id dựa vào group_invite_code
            String groupQuery = "SELECT [group_id] FROM [Group] WHERE [group_invite_code] = ?";
            PreparedStatement groupStm = connection.prepareStatement(groupQuery);
            groupStm.setString(1, groupCode);
            ResultSet groupRs = groupStm.executeQuery();

            if (groupRs.next()) {
                int groupId = groupRs.getInt("group_id");

                // Kiểm tra xem sinh viên đã đăng ký vào nhóm chưa
                String checkQuery = "SELECT COUNT(*) AS count FROM [Register] WHERE [student_id] = ? AND [group_id] = ?";
                PreparedStatement checkStm = connection.prepareStatement(checkQuery);
                checkStm.setInt(1, accountId);
                checkStm.setInt(2, groupId);
                ResultSet checkRs = checkStm.executeQuery();

                if (checkRs.next() && checkRs.getInt("count") == 0) {
                    // Nếu sinh viên chưa đăng ký vào nhóm, thêm vào bảng Register
                    String insertQuery = "INSERT INTO [Register] ([register_date], [student_id], [group_id]) VALUES (GETDATE(), ?, ?)";
                    PreparedStatement insertStm = connection.prepareStatement(insertQuery);
                    insertStm.setInt(1, accountId);
                    insertStm.setInt(2, groupId);
                    insertStm.executeUpdate();
                    System.out.println("Student with ID " + accountId + " has joined the group.");
                } else {
                    System.out.println("Student with ID " + accountId + " is already registered in the group.");
                }
            } else {
                System.out.println("Group with code " + groupCode + " does not exist.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getTotalGroups() {
        int totalGroups = 0;

        try {
            String sql = "SELECT COUNT([group_id]) AS TotalGroups FROM [Group]";

            try (PreparedStatement stm = connection.prepareStatement(sql)) {
                try (ResultSet rs = stm.executeQuery()) {
                    if (rs.next()) {
                        totalGroups = rs.getInt("TotalGroups");
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return totalGroups;
    }

    public int getTotalGroupsOnline() {
        int totalGroupsOnline = 0;

        try {
            String sql = "SELECT COUNT(*) AS TotalGroups FROM [Group] WHERE [status_id] = 1";

            try (PreparedStatement stm = connection.prepareStatement(sql)) {
                try (ResultSet rs = stm.executeQuery()) {
                    if (rs.next()) {
                        totalGroupsOnline = rs.getInt("TotalGroups");
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return totalGroupsOnline;
    }

    public static void main(String[] args) {
        GroupDBContext dao = new GroupDBContext();
        List<Group> list = dao.searchGroup("SE1755");

        for (Group o : list) {
            System.out.println(o);
        }
    }

}
