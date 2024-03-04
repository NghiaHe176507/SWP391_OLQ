/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.*;
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
public class ControllerDBContext extends DBContext<BaseEntity> {

    AccountDBContext accountDB = new AccountDBContext();
    StatusDBContext statusDB = new StatusDBContext();
    AccountInfoDBContext accountInfoDB = new AccountInfoDBContext();
    RoleFeatureDBContext roleFeatureDB = new RoleFeatureDBContext();
    GroupDBContext groupDB = new GroupDBContext();
    RoleDBContext roleDB = new RoleDBContext();
    TopicDBContext topicDB = new TopicDBContext();

    public ArrayList<AccountInfo> getListAccountWithInfo() {
        ArrayList<AccountInfo> listAccount = new ArrayList<>();
        try {
            String sql = """
                         SELECT [accountInfo_id],[account_id]
                           FROM [AccountInfo] ORDER BY [account_id]""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                AccountInfo accountInfo = new AccountInfo();
                accountInfo = accountInfoDB.getById(String.valueOf(rs.getInt("accountInfo_id")));
                listAccount.add(accountInfo);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAccount;
    }

    public ArrayList<RoleFeature> getListRoleFeatureByListAccount(ArrayList<AccountInfo> listAccountWithInfo) {
        ArrayList<RoleFeature> listRoleFeature = new ArrayList<>();
        for (AccountInfo account : listAccountWithInfo) {
            RoleFeature roleFeateture = new RoleFeature();
            roleFeateture = getRoleOfAccount(account.getAccount());
            listRoleFeature.add(roleFeateture);
        }
        return listRoleFeature;
    }

    public RoleFeature getRoleOfAccount(Account account) {
        try {
            String sql = """
                         SELECT [roleFeature_id]
                                 ,[role_id]
                                 ,[account_id]
                             FROM [RoleFeature]
                             WHERE [account_id]=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, String.valueOf(account.getAccountId()));
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                RoleFeature roleFeature = new RoleFeature();
                roleFeature = roleFeatureDB.getById(String.valueOf(rs.getInt("roleFeature_id")));
                return roleFeature;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void createNewAccount(Account account) {
        try {
            connection.setAutoCommit(false);

            String sql_insert = """
                                INSERT INTO [Account]
                                           ([mail]
                                           ,[password]
                                           ,[displayname]
                                           ,[account_status])
                                     VALUES
                                           (?,?,?,?)""";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setString(1, account.getMail());
            stm.setString(2, account.getPassword());
            stm.setString(3, account.getDisplayName());
            stm.setString(4, account.getAccountStatus());
            stm.executeUpdate();

            String sql_getid = "SELECT @@IDENTITY as [account_id]";
            PreparedStatement stm2 = connection.prepareStatement(sql_getid);
            ResultSet rs = stm2.executeQuery();
            if (rs.next()) {
                account.setAccountId(rs.getInt("account_id"));
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }

            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void createNewAccountInfo(AccountInfo accountInfo) {
        try {
            connection.setAutoCommit(false);

            String sql_insert = """
                                INSERT INTO [AccountInfo]
                                                      ([fullname]
                                                      ,[dob]
                                                      ,[account_id])
                                                VALUES
                                                      (?,?,?)""";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setString(1, accountInfo.getFullName());
            stm.setDate(2, accountInfo.getDob());
            stm.setInt(3, accountInfo.getAccount().getAccountId());
            stm.executeUpdate();

            String sql_getid = "SELECT @@IDENTITY as [accountInfo_id]";
            PreparedStatement stm2 = connection.prepareStatement(sql_getid);
            ResultSet rs = stm2.executeQuery();
            if (rs.next()) {
                accountInfo.setAccountInfoId(rs.getInt("accountInfo_id"));
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }

            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public void createNewRoleFeature(RoleFeature roleFeature) {
        try {
            connection.setAutoCommit(false);

            String sql_insert = """
                                INSERT INTO [RoleFeature]
                                           ([role_id]
                                           ,[account_id])
                                     VALUES
                                           (?,?)""";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setInt(1, roleFeature.getRole().getRoleId());
            stm.setInt(2, roleFeature.getAccount().getAccountId());
            stm.executeUpdate();

            String sql_getid = "SELECT @@IDENTITY as [roleFeature_id]";
            PreparedStatement stm2 = connection.prepareStatement(sql_getid);
            ResultSet rs = stm2.executeQuery();
            if (rs.next()) {
                roleFeature.setRoleFeatureId(rs.getInt("roleFeature_id"));
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }

            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public ArrayList<Role> getListRole() {
        ArrayList<Role> listRole = new ArrayList<>();
        try {
            String sql = """
                         SELECT [role_id]
                             FROM [Role]""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role role = new Role();
                role = roleDB.getById(String.valueOf(rs.getInt("role_id")));
                listRole.add(role);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listRole;
    }

    public void updateAccount(Account account) {
        try {
            String sql_update = """
                                UPDATE [Account]
                                   SET [mail] = ?
                                      ,[password] = ?
                                      ,[displayname] = ?
                                      ,[account_status] = ?
                                 WHERE [account_id]=?""";
            PreparedStatement stm = connection.prepareStatement(sql_update);
            stm.setString(1, account.getMail());
            stm.setString(2, account.getPassword());
            stm.setString(3, account.getDisplayName());
            stm.setString(4, account.getAccountStatus());
            stm.setInt(5, account.getAccountId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateAccountInfo(AccountInfo accountInfo) {
        try {
            String sql_update = """
                                UPDATE [AccountInfo]
                                   SET [fullname] = ?
                                      ,[dob] = ?
                                      ,[account_id] = ?
                                 WHERE [accountInfo_id]=?""";
            PreparedStatement stm = connection.prepareStatement(sql_update);
            stm.setString(1, accountInfo.getFullName());
            stm.setDate(2, accountInfo.getDob());
            stm.setInt(3, accountInfo.getAccount().getAccountId());
            stm.setInt(4, accountInfo.getAccountInfoId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateRoleFeature(RoleFeature roleFeature) {
        if (getListGroupOwnedByLecture(getAccountInfoByAccountId(roleFeature.getAccount().getAccountId()).getAccountInfoId()).isEmpty()) {
            try {
                String sql_update = """
                                UPDATE [RoleFeature]
                                   SET [role_id] = ?
                                      ,[account_id] = ?
                                 WHERE [roleFeature_id]=?""";
                PreparedStatement stm = connection.prepareStatement(sql_update);
                stm.setInt(1, roleFeature.getRole().getRoleId());
                stm.setInt(2, roleFeature.getAccount().getAccountId());
                stm.setInt(3, roleFeature.getRoleFeatureId());
                stm.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public AccountInfo getAccountInfoByAccountId(int Id) {
        try {
            String sql = "SELECT [accountInfo_id]\n"
                    + "      ,[account_id]\n"
                    + "  FROM [AccountInfo]\n"
                    + "	WHERE [account_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                AccountInfo accountInfo = accountInfoDB.getById(String.valueOf(rs.getInt("accountInfo_id")));
                return accountInfo;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public RoleFeature getRoleFeatureByAccountId(int Id) {
        try {
            String sql = "SELECT [roleFeature_id]\n"
                    + "      ,[account_id]\n"
                    + "  FROM [RoleFeature]\n"
                    + "	WHERE [account_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                RoleFeature roleFeature = roleFeatureDB.getById(String.valueOf(rs.getInt("roleFeature_id")));
                return roleFeature;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void deleteStudentResultById(int accountId) {
        try {
            String sql_delete = """
                                DELETE [Result]
                                 WHERE [account_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql_delete);
            stm.setInt(1, accountId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteStudentAnswerById(int accountId) {
        try {
            String sql_delete = """
                                DELETE [StudentAnswer]
                                 WHERE [account_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql_delete);
            stm.setInt(1, accountId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteStudentRegisterById(int accountId) {
        try {
            String sql_delete = """
                                DELETE [Register]
                                 WHERE [account_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql_delete);
            stm.setInt(1, accountId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAccountInfoById(int accountId) {
        try {
            String sql_delete = """
                                DELETE [AccountInfo]
                                 WHERE [account_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql_delete);
            stm.setInt(1, accountId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteRoleFeatureById(int accountId) {
        try {
            String sql_delete = """
                                DELETE [RoleFeature]
                                 WHERE [account_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql_delete);
            stm.setInt(1, accountId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAccountById(int accountId) {
        if (getRoleFeatureByAccountId(accountId).getRole().getRoleId() != 1 && getListGroupOwnedByLecture(getAccountInfoByAccountId(accountId).getAccountInfoId()).isEmpty()) {

            try {
                deleteStudentResultById(accountId);
                deleteStudentAnswerById(accountId);
                deleteStudentRegisterById(accountId);
                deleteAccountInfoById(accountId);
                deleteRoleFeatureById(accountId);
                String sql_delete = """
                                DELETE [Account]
                                 WHERE [account_id] = ?""";
                PreparedStatement stm = connection.prepareStatement(sql_delete);
                stm.setInt(1, accountId);
                stm.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    // This method checks if the email already exists in the database
    public boolean isEmailExists(String email) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) FROM Account WHERE mail = ?")) {
            preparedStatement.setString(1, email);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            // Handle any SQL exceptions, log them, or throw an exception
        }

        return false; // Return false in case of an error
    }

    public Account getAccountByMail(String mail) {
        try {
            String sql = """
                         SELECT [account_id]
                               ,[mail]
                               ,[password]
                               ,[displayname]
                               ,[account_status]
                           FROM [Account]
                           WHERE [mail] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, mail);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setAccountId(rs.getInt("account_id"));
                account.setMail(rs.getString("mail"));
                account.setPassword(rs.getString("password"));
                account.setDisplayName(rs.getString("displayname"));
                account.setAccountStatus(rs.getString("account_status"));
                return account;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Topic> getListTopic() {
        ArrayList<Topic> listTopic = new ArrayList<>();
        try {
            String sql = "SELECT [topic_id]\n"
                    + "      ,[topic_name]\n"
                    + "  FROM [Topic]\n"
                    + "  ORDER BY [topic_id]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Topic topic = new Topic();
                topic = topicDB.getById(String.valueOf(rs.getInt("topic_id")));
                listTopic.add(topic);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listTopic;

    }

    public void createNewTopic(Topic newTopic) {
        try {
            connection.setAutoCommit(false);

            String sql_insert = "INSERT INTO [Topic]\n"
                    + "           ([topic_name])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setString(1, newTopic.getTopicName());
            stm.executeUpdate();

            String sql_getid = "SELECT @@IDENTITY as [topic_id]";
            PreparedStatement stm2 = connection.prepareStatement(sql_getid);
            ResultSet rs = stm2.executeQuery();
            if (rs.next()) {
                newTopic.setTopicId(rs.getInt("topic_id"));
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }

            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Group> getListGroupByTopicId(int topicId) {
        ArrayList<Group> listGroup = new ArrayList<>();
        try {
            String sql = """
                         SELECT [group_id]
                               ,[group_name]
                               ,[lecture_id]
                               ,[topic_id]
                               ,[status_id]
                           FROM [Group]
                           WHERE [topic_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, String.valueOf(topicId));
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group group = new Group();
                group = groupDB.getById(String.valueOf(rs.getInt("group_id")));
                listGroup.add(group);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listGroup;
    }

    public void deleteTopicById(int topicId) {
        if (getListGroupByTopicId(topicId).isEmpty()) {
            try {
                String sql_delete = """
                                DELETE FROM [Topic]
                                 WHERE [topic_id] = ?""";
                PreparedStatement stm = connection.prepareStatement(sql_delete);
                stm.setInt(1, topicId);
                stm.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Group> getListGroup() {
        ArrayList<Group> listGroup = new ArrayList<>();
        try {
            String sql = """
                         SELECT [group_id]
                           FROM [Group]""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group group = new Group();
                group = groupDB.getById(String.valueOf(rs.getInt("group_id")));
                listGroup.add(group);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listGroup;
    }

    public void deletePendingGroup(int groupId) {
        if ("Pending".equals(groupDB.getById(String.valueOf(groupId)).getStatus().getStatusName())) {
            try {
                String sql_delete = """
                                DELETE FROM [Group]
                                 WHERE [group_id] = ?""";
                PreparedStatement stm = connection.prepareStatement(sql_delete);
                stm.setInt(1, groupId);
                stm.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Group> getListGroupOwnedByLecture(int LectureId) {
        ArrayList<Group> listGroup = new ArrayList<>();
        try {
            String sql = "SELECT [group_id]\n"
                    + "                               ,[group_name]\n"
                    + "                               ,[lecture_id]\n"
                    + "                               ,[topic_id]\n"
                    + "                               ,[status_id]\n"
                    + "                           FROM [Group]\n"
                    + "                           WHERE [lecture_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, String.valueOf(LectureId));
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group group = new Group();
                group = groupDB.getById(String.valueOf(rs.getInt("group_id")));
                listGroup.add(group);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listGroup;
    }

    public void createNewGroupByLecture(Group newGroup) {
        try {
            connection.setAutoCommit(false);

            String sql_insert = """
                                INSERT INTO [Group]
                                           ([group_name]
                                           ,[lecture_id]
                                           ,[topic_id]
                                           ,[status_id]
                                           ,[group_invite_code])
                                     VALUES
                                           (?,?,?,?,?)""";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setString(1, newGroup.getGroupName());
            stm.setInt(2, newGroup.getLectureInfo().getAccountInfoId());
            stm.setInt(3, newGroup.getTopic().getTopicId());
            stm.setInt(4, newGroup.getStatus().getStatusId());
            stm.setString(5, newGroup.getGroupName());
            stm.executeUpdate();

            String sql_getid = "SELECT @@IDENTITY as [group_id]";
            PreparedStatement stm2 = connection.prepareStatement(sql_getid);
            ResultSet rs = stm2.executeQuery();
            if (rs.next()) {
                newGroup.setGroupId(rs.getInt("group_id"));
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }

            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Status> getListStatus() {
        ArrayList<Status> listStatus = new ArrayList<>();
        try {
            String sql = """
                         SELECT [status_id]
                           FROM [Status]""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Status status = new Status();
                status = statusDB.getById(String.valueOf(rs.getInt("status_id")));
                listStatus.add(status);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listStatus;
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
                group.setGroupInviteCode(rs.getString("group_invite_code"));
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
                        group.setGroupInviteCode(rs.getString("group_invite_code"));

                        groups.add(group);
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return groups;
    }

    @Override
    public BaseEntity getById(String Id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
