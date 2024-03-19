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
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Types;
import java.text.DecimalFormat;

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
    ExamQuestionMappingDBContext examQuestionMappingDB = new ExamQuestionMappingDBContext();
    ExamDBContext examDB = new ExamDBContext();
    OptionAnswerDBContext optionAnswerDB = new OptionAnswerDBContext();
    ResultDBContext resultDB = new ResultDBContext();
    QuestionDBContext questionDB = new QuestionDBContext();

    @Override
    public BaseEntity getById(String Id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

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

    public ArrayList<RoleAccess> getRolesAndFeatures(String username, String url) {
        ArrayList<RoleAccess> roles = new ArrayList<>();
        try {
            String sql = """
                         SELECT r.[role_id]
                               ,r.[role_name]
                         \t  ,u.url_id
                         \t  ,u.[url]
                           FROM [Role] r INNER JOIN [RoleAccess] ra ON r.role_id = ra.role_id
                           INNER JOIN [Url] u ON ra.url_id = u.url_id
                           INNER JOIN [RoleFeature] rf ON r.role_id = rf.role_id
                           INNER JOIN [Account] a ON a.account_id = rf.account_id
                           WHERE a.displayname = ? AND u.[url] = ?""";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, url);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleId(rs.getInt("role_id"));
                r.setRoleName(rs.getString("role_name"));

                Url u = new Url();
                u.setUrlId(rs.getString("url_id"));
                u.setUrl(rs.getString("url"));

                RoleAccess ra = new RoleAccess();
                ra.setRole(r);
                ra.setUrl(u);
                roles.add(ra);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roles;
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
        if (getListGroupOwnedByLectureId(getAccountInfoByAccountId(roleFeature.getAccount().getAccountId()).getAccountInfoId()).isEmpty()) {
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
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
        if (getRoleFeatureByAccountId(accountId).getRole().getRoleId() != 1 && getListGroupOwnedByLectureId(getAccountInfoByAccountId(accountId).getAccountInfoId()).isEmpty()) {

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

    public ArrayList<Group> getListGroupOwnedByLectureId(int LectureId) {
        ArrayList<Group> listGroup = new ArrayList<>();
        try {
            String sql = """
                         SELECT  [group_id]
                                ,[group_name]
                                ,[lecture_id]
                                ,[topic_id]
                                ,[status_id]
                            FROM [Group]
                            WHERE [lecture_id] = ?""";
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
                                           ,[status_id])
                                     VALUES
                                           (?,?,?,?)""";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setString(1, newGroup.getGroupName());
            stm.setInt(2, newGroup.getLectureInfo().getAccountInfoId());
            stm.setInt(3, newGroup.getTopic().getTopicId());
            stm.setInt(4, newGroup.getStatus().getStatusId());
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

    public ArrayList<AccountInfo> getListAccountLimit(int idPage) {
        ArrayList<AccountInfo> accountList = new ArrayList<>();
        AccountDBContext accountDb = new AccountDBContext();
        int pageSize = 5;
        int offset = (idPage - 1) * pageSize;

        try {
            String sql = "SELECT [accountInfo_id]\n"
                    + "      ,[fullname]\n"
                    + "      ,[dob]\n"
                    + "      ,[account_id]\n"
                    + "  FROM [AccountInfo]\n"
                    + "  ORDER BY [accountInfo_id] ASC\n"
                    + "  OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, offset);
            stm.setInt(2, pageSize + offset);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                AccountInfo accountInfo = new AccountInfo();
                accountInfo.setAccountInfoId(rs.getInt("accountInfo_id"));
                accountInfo.setFullName(rs.getString("fullname"));
                accountInfo.setDob(rs.getDate("dob"));
                accountInfo.setAccount(accountDb.getById(String.valueOf(rs.getInt("account_id"))));
                accountList.add(accountInfo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return accountList;
    }

    public ArrayList<AccountInfo> searchAccount(String keyword) {
        ArrayList<AccountInfo> accountInfos = new ArrayList<>();
        AccountDBContext accountDb = new AccountDBContext();
        try {
            // Query để tìm kiếm theo email
            String sqlByEmail = "SELECT ai.accountInfo_id, ai.fullname, ai.dob, ai.account_id "
                    + "FROM AccountInfo ai "
                    + "INNER JOIN Account a ON ai.account_id = a.account_id "
                    + "WHERE a.mail LIKE ?";

            // Query để tìm kiếm theo accountInfo_id
            String sqlById = "SELECT ai.accountInfo_id, ai.fullname, ai.dob, ai.account_id "
                    + "FROM AccountInfo ai "
                    + "INNER JOIN Account a ON ai.account_id = a.account_id "
                    + "WHERE ai.account_id = ?";

            PreparedStatement stm;
            ResultSet rs;

            // Kiểm tra xem keyword có phải là số (id) hay không
            boolean isNumeric = keyword.chars().allMatch(Character::isDigit);

            if (isNumeric) {
                // Nếu keyword là số (id), thực hiện tìm kiếm theo accountInfo_id
                stm = connection.prepareStatement(sqlById);
                stm.setString(1, keyword);
            } else {
                // Nếu không phải là số, thực hiện tìm kiếm theo email
                stm = connection.prepareStatement(sqlByEmail);
                stm.setString(1, "%" + keyword + "%");
            }

            rs = stm.executeQuery();

            while (rs.next()) {
                AccountInfo accountInfo = new AccountInfo();
                accountInfo.setAccountInfoId(rs.getInt("accountInfo_id"));
                accountInfo.setFullName(rs.getString("fullname"));
                accountInfo.setDob(rs.getDate("dob"));
                accountInfo.setAccount(accountDb.getById(String.valueOf(rs.getInt("account_id"))));
                accountInfos.add(accountInfo);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accountInfos;
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

//    public void joinGroup(int accountId, String groupCode) {
//        try {
//            // Tìm group_id dựa vào group_invite_code
//            String groupQuery = "SELECT [group_id] FROM [Group] WHERE [group_invite_code] = ?";
//            PreparedStatement groupStm = connection.prepareStatement(groupQuery);
//            groupStm.setString(1, groupCode);
//            ResultSet groupRs = groupStm.executeQuery();
//
//            if (groupRs.next()) {
//                int groupId = groupRs.getInt("group_id");
//
//                // Kiểm tra xem sinh viên đã đăng ký vào nhóm chưa
//                String checkQuery = "SELECT COUNT(*) AS count FROM [Register] WHERE [student_id] = ? AND [group_id] = ?";
//                PreparedStatement checkStm = connection.prepareStatement(checkQuery);
//                checkStm.setInt(1, accountId);
//                checkStm.setInt(2, groupId);
//                ResultSet checkRs = checkStm.executeQuery();
//
//                if (checkRs.next() && checkRs.getInt("count") == 0) {
//                    // Nếu sinh viên chưa đăng ký vào nhóm, thêm vào bảng Register
//                    String insertQuery = "INSERT INTO [Register] ([register_date], [student_id], [group_id]) VALUES (GETDATE(), ?, ?)";
//                    PreparedStatement insertStm = connection.prepareStatement(insertQuery);
//                    insertStm.setInt(1, accountId);
//                    insertStm.setInt(2, groupId);
//                    insertStm.executeUpdate();
//                    System.out.println("Student with ID " + accountId + " has joined the group.");
//                } else {
//                    System.out.println("Student with ID " + accountId + " is already registered in the group.");
//                }
//            } else {
//                System.out.println("Group with code " + groupCode + " does not exist.");
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
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

    public ArrayList<Topic> searchTopic(String keyword) {
        ArrayList<Topic> topics = new ArrayList<>();
        String sql = "SELECT [topic_id], [topic_name] FROM [Topic] WHERE [topic_name] LIKE ?";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, "%" + keyword + "%");

            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Topic topic = new Topic();
                    topic.setTopicId(rs.getInt("topic_id"));
                    topic.setTopicName(rs.getString("topic_name"));
                    topics.add(topic);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(TopicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return topics;
    }

    public ArrayList<Register> getRegisterByStudentId(int studentId) {
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
                register.setGroup(groupDB.getById(String.valueOf(classId)));
                // Lấy thông tin của Topic từ TopicDBContext
                int topicId = rs.getInt("topic_id");
                register.getGroup().setTopic(topicDB.getById(String.valueOf(topicId)));
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
                    register.setGroup(groupDB.getById(String.valueOf(classId)));
                    // Lấy thông tin của Topic từ TopicDBContext
                    int topicId = rs.getInt("topic_id");
                    register.getGroup().setTopic(topicDB.getById(String.valueOf(topicId)));
                    registers.add(register);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return registers;
    }

    public int getTotalStudents() {
        int totalStudents = 0;
        try {
            String sql = """
                     SELECT COUNT(*) AS TotalStudents
                     FROM [RoleFeature] AS R
                     INNER JOIN [Role] AS RF ON R.[role_id] = RF.[role_id]
                     WHERE R.[role_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, 3);  // Chọn role_id cần đếm, ở đây là 3
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalStudents = rs.getInt("TotalStudents");
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalStudents;
    }

    public int getTotalLectures() {
        int totalLectures = 0;
        try {
            String sql = """
                 SELECT COUNT(*) AS TotalLectures
                 FROM [RoleFeature] AS R
                 INNER JOIN [Role] AS RF ON R.[role_id] = RF.[role_id]
                 WHERE RF.[role_name] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "lecture");  // Chọn role_name cần đếm, ở đây là 'lecturer'
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalLectures = rs.getInt("TotalLectures");
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalLectures;
    }

    public void updateGroupInviteCode(Group groupNeedToUpdate) {
        try {
            String sql_update = """
                                UPDATE [Group]
                                   SET [group_invite_code] = ?
                                 WHERE [group_id]=?""";
            PreparedStatement stm = connection.prepareStatement(sql_update);
            stm.setString(1, groupNeedToUpdate.getGroupInviteCode());
            stm.setInt(2, groupNeedToUpdate.getGroupId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String generateRandomString(int length) {
        Random RANDOM = new Random();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            char randomChar;
            if (RANDOM.nextBoolean()) {
                randomChar = (char) (RANDOM.nextInt(26) + 'A');
            } else {
                randomChar = (char) (RANDOM.nextInt(10) + '0');
            }
            sb.append(randomChar);
        }
        return sb.toString();
    }

    public boolean checkContainGroupInviteCode(String inviteCode) {
        ArrayList<String> listInviteCode = new ArrayList<>();
        try {
            String sql = """
                         SELECT[group_invite_code]
                           FROM [Group]""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listInviteCode.add(rs.getString("group_invite_code"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listInviteCode.contains(inviteCode);
    }

    public Group getGroupByInviteCode(String inviteCode) {
        ArrayList<Group> listGroup = getListGroup();
        for (Group group : listGroup) {
            if (group != null && group.getGroupInviteCode() != null && group.getGroupInviteCode().equals(inviteCode)) {
                return group;
            }
        }
        return null;
    }

    public void createNewRegister(Register newRegister) {
        if (checkRegister(newRegister)) {
            return;
        }
        try {
            connection.setAutoCommit(false);

            String sql_insert = """
                                INSERT INTO [Register]
                                           ([register_date]
                                           ,[student_id]
                                           ,[group_id])
                                     VALUES
                                           (?
                                           ,?
                                           ,?)""";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setDate(1, newRegister.getRegisterDate());
            stm.setInt(2, newRegister.getStudentInfo().getAccountInfoId());
            stm.setInt(3, newRegister.getGroup().getGroupId());
            stm.executeUpdate();

            String sql_getid = "SELECT @@IDENTITY as [register_id]";
            PreparedStatement stm2 = connection.prepareStatement(sql_getid);
            ResultSet rs = stm2.executeQuery();
            if (rs.next()) {
                newRegister.setRegisterId(rs.getInt("register_id"));
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

    public boolean checkRegister(Register register) {
        try {
            String sql = """
                         SELECT [register_id]
                               ,[student_id]
                               ,[group_id]
                           FROM [Register]
                           WHERE [student_id]=? AND [group_id]=? """;
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, register.getStudentInfo().getAccountInfoId());
            stm.setInt(2, register.getGroup().getGroupId());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void unEnrollForStudent(Register register) {
        if (!checkStudentActivitiesInGroupByRegister(register)) {
            try {
                String sql_delete = """
                                    DELETE FROM [Register]
                                          WHERE [student_id]=? AND [group_id]=?""";
                PreparedStatement stm = connection.prepareStatement(sql_delete);
                stm.setInt(1, register.getStudentInfo().getAccountInfoId());
                stm.setInt(2, register.getGroup().getGroupId());
                stm.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public boolean checkStudentActivitiesInGroupByRegister(Register register) {
        try {
            String sql = """
                         SELECT r.[result_id] 
                           FROM [Result] r
                           INNER JOIN [Exam] e ON e.exam_id=r.exam_id
                           WHERE r.[student_id]=? AND e.[group_id]=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, register.getStudentInfo().getAccountInfoId());
            stm.setInt(2, register.getGroup().getGroupId());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<ExamQuestionMapping> getListExamQuestionMappingByExamId(int ExamId) {
        ArrayList<ExamQuestionMapping> listExamQuestionMapping = new ArrayList<>();
        try {
            String sql = """
                         SELECT [mapping_id]
                           FROM [ExamQuestionMapping] WHERE[exam_id]=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, ExamId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ExamQuestionMapping examQuestionMapping = new ExamQuestionMapping();
                examQuestionMapping = examQuestionMappingDB.getById(String.valueOf(rs.getInt("mapping_id")));
                listExamQuestionMapping.add(examQuestionMapping);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listExamQuestionMapping;
    }

    public ArrayList<OptionAnswer> getListOptionAnswerByQuestionId(int questionId) {
        ArrayList<OptionAnswer> listOptionAnswer = new ArrayList<>();
        try {
            String sql = """
                         SELECT [optionAnswer_id]
                               ,[answer_content]
                               ,[isCorrect]
                               ,[question_id]
                           FROM [OptionAnswer]
                           WHERE [question_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OptionAnswer optionAnswer = new OptionAnswer();
                optionAnswer = optionAnswerDB.getById(String.valueOf(rs.getInt("optionAnswer_id")));
                listOptionAnswer.add(optionAnswer);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listOptionAnswer;
    }

    public ArrayList<Exam> getListExamByGroupId(int groupId) {
        ArrayList<Exam> listExam = new ArrayList<>();
        try {
            String sql = """
                         SELECT [exam_id]
                             FROM [Exam]
                             WHERE [group_id]=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, groupId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Exam exam = new Exam();
                exam = examDB.getById(String.valueOf(rs.getInt("exam_id")));
                listExam.add(exam);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listExam;
    }

    public void createNewOptionAnswer(OptionAnswer newOptionAnswer) {
        try {
            connection.setAutoCommit(false);

            String sql_insert = """
                                INSERT INTO [OptionAnswer]
                                           ([answer_content]
                                           ,[isCorrect]
                                           ,[question_id])
                                     VALUES
                                           (?,?,?)""";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setString(1, newOptionAnswer.getAnswerContent());
            stm.setBoolean(2, newOptionAnswer.isIsCorrect());
            stm.setInt(3, newOptionAnswer.getQuestion().getQuestionId());
            stm.executeUpdate();

            String sql_getid = "SELECT @@IDENTITY as [optionAnswer_id]";
            PreparedStatement stm2 = connection.prepareStatement(sql_getid);
            ResultSet rs = stm2.executeQuery();
            if (rs.next()) {
                newOptionAnswer.setOptionAnswerId(rs.getInt("optionAnswer_id"));
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

    public void createNewQuestion(Question newQuestion) {
        try {
            connection.setAutoCommit(false);

            String sql_insert = """
                                INSERT INTO [Question]
                                           ([topic_id]
                                           ,[question_content]
                                           ,[inBank]
                                           ,[question_answer_detail])
                                     VALUES
                                           (?,?,?,?)""";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setInt(1, newQuestion.getTopic().getTopicId());
            stm.setString(2, newQuestion.getQuestionContent());
            stm.setBoolean(3, newQuestion.isInBank());
            stm.setString(4, newQuestion.getQuestionAnswerDetail());
            stm.executeUpdate();

            String sql_getid = "SELECT @@IDENTITY as [question_id]";
            PreparedStatement stm2 = connection.prepareStatement(sql_getid);
            ResultSet rs = stm2.executeQuery();
            if (rs.next()) {
                newQuestion.setQuestionId(rs.getInt("question_id"));
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

    public Exam createNewExam(Exam newExam) {
        try {
            connection.setAutoCommit(false);

            String sql_insert = """
                                INSERT INTO [Exam]
                                           ([exam_title]
                                           ,[group_id]
                                           ,[startDate]
                                           ,[endDate]
                                           ,[time]
                                           ,[status_id]
                                           ,[lecture_id]
                                           ,[attempt]
                                           ,[isPractice])
                                     VALUES
                                           (?,?,?,?,?,?,?,?,?)""";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setString(1, newExam.getExamTitle());
            stm.setInt(2, newExam.getGroup().getGroupId());
            stm.setTimestamp(3, newExam.getExamStartDate());
            stm.setTimestamp(4, newExam.getExamEndDate());
            stm.setTime(5, newExam.getExamTime());
            stm.setInt(6, newExam.getStatus().getStatusId());
            stm.setInt(7, newExam.getLectureInfo().getAccountInfoId());
            Integer examAttempt = newExam.getExamAttemp();
            if (examAttempt != null) {
                stm.setInt(8, examAttempt.intValue());
            } else {
                stm.setNull(8, Types.INTEGER);
            }
            stm.setBoolean(9, newExam.isIsPractice());
            stm.executeUpdate();

            String sql_getid = "SELECT @@IDENTITY as [exam_id]";
            PreparedStatement stm2 = connection.prepareStatement(sql_getid);
            ResultSet rs = stm2.executeQuery();
            if (rs.next()) {
                newExam.setExamId(rs.getInt("exam_id"));
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
        return examDB.getById(String.valueOf(newExam.getExamId()));
    }

    public void createNewExamQuestionMapping(ExamQuestionMapping newExamQuestionMapping) {
        if (checkExistedExamQuestionMapping(newExamQuestionMapping)) {
            return;
        }
        try {
            connection.setAutoCommit(false);

            String sql_insert = """
                                INSERT INTO [ExamQuestionMapping]
                                           ([question_id]
                                           ,[exam_id])
                                     VALUES
                                           (?,?)""";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setInt(1, newExamQuestionMapping.getQuestion().getQuestionId());
            stm.setInt(2, newExamQuestionMapping.getExam().getExamId());
            stm.executeUpdate();

            String sql_getid = "SELECT @@IDENTITY as [mapping_id]";
            PreparedStatement stm2 = connection.prepareStatement(sql_getid);
            ResultSet rs = stm2.executeQuery();
            if (rs.next()) {
                newExamQuestionMapping.setExamQuestionMappingId(rs.getInt("mapping_id"));
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

    public boolean checkExistedExamQuestionMapping(ExamQuestionMapping examQuestionMapping) {
        try {
            String sql = """
                         SELECT [mapping_id]
                               ,[question_id]
                               ,[exam_id]
                           FROM [ExamQuestionMapping]
                           WHERE [question_id] = ? AND [exam_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, examQuestionMapping.getQuestion().getQuestionId());
            stm.setInt(2, examQuestionMapping.getExam().getExamId());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Group> getListActiveGroupByLectureId(int LectureId) {
        ArrayList<Group> listGroup = new ArrayList<>();
        try {
            String sql = """
                         SELECT  [group_id]
                                ,[group_name]
                                ,[lecture_id]
                                ,[topic_id]
                                ,[status_id]
                            FROM [Group]
                            WHERE [lecture_id] = ? AND [status_id] =1""";
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

    public void createNewStudentAnswer(StudentAnswer newStudentAnswer) {
        try {
            connection.setAutoCommit(false);

            String sql_insert = """
                                INSERT INTO [StudentAnswer]
                                           ([exam_id]
                                           ,[question_id]
                                           ,[option_answer_id]
                                           ,[student_id]
                                           ,[attempt_number])
                                     VALUES
                                           (?,?,?,?,?)""";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setInt(1, newStudentAnswer.getExam().getExamId());
            stm.setInt(2, newStudentAnswer.getQuestion().getQuestionId());
            stm.setInt(3, newStudentAnswer.getOptionAnswer().getOptionAnswerId());
            stm.setInt(4, newStudentAnswer.getStudentInfo().getAccountInfoId());
            stm.setInt(5, newStudentAnswer.getAttemptNumber());
            stm.executeUpdate();

            String sql_getid = "SELECT @@IDENTITY as [studentAnswer_id]";
            PreparedStatement stm2 = connection.prepareStatement(sql_getid);
            ResultSet rs = stm2.executeQuery();
            if (rs.next()) {
                newStudentAnswer.setStudentAnswerId(rs.getInt("studentAnswer_id"));
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

    public Result createNewResult(Result newStudentResult) {
        try {
            connection.setAutoCommit(false);

            String sql_insert = """
                                INSERT INTO [Result]
                                           ([exam_id]
                                           ,[student_id]
                                           ,[score]
                                           ,[comment_content]
                                           ,[attempt_number])
                                     VALUES
                                           (?,?,?,?,?)""";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setInt(1, newStudentResult.getExam().getExamId());
            stm.setInt(2, newStudentResult.getStudentInfo().getAccountInfoId());
            stm.setDouble(3, newStudentResult.getScore());
            stm.setString(4, newStudentResult.getCommentContent());
            stm.setInt(5, getCurrentAttemptOfExamByStudentId(newStudentResult.getStudentInfo().getAccountInfoId(), newStudentResult.getExam().getExamId()) + 1);
            stm.executeUpdate();

            String sql_getid = "SELECT @@IDENTITY as [result_id]";
            PreparedStatement stm2 = connection.prepareStatement(sql_getid);
            ResultSet rs = stm2.executeQuery();
            if (rs.next()) {
                newStudentResult.setResultId(rs.getInt("result_id"));
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
        return newStudentResult;
    }

    public int getCurrentAttemptOfExamByStudentId(int studentId, int examId) {
        int numberAttempt = 0;
        try {
            String sql = """
                         SELECT COUNT(*) AS [attempt]
                         FROM [Result]
                         WHERE [exam_id] = ? AND [student_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, examId);
            stm.setInt(2, studentId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                numberAttempt = rs.getInt("attempt");
                return numberAttempt;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numberAttempt;
    }

    public void updateScoreOfResultByExamIdAndStudentId(Result resultNeedToUpdate) {
        try {
            String sql_update = """
                                UPDATE [Result]
                                 SET [score] = ?
                                 WHERE [exam_id]=? AND [student_id]=? AND [attempt_number]=? """;
            PreparedStatement stm = connection.prepareStatement(sql_update);
            stm.setDouble(1, resultNeedToUpdate.getScore());
            stm.setInt(2, resultNeedToUpdate.getExam().getExamId());
            stm.setInt(3, resultNeedToUpdate.getStudentInfo().getAccountInfoId());
            stm.setInt(4, resultNeedToUpdate.getAttemptNumber());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean checkAttemptPermissionOfExamByStudentId(int studentId, int examId) {
        Exam exam = examDB.getById(String.valueOf(examId));

        if (!exam.isIsPractice()) {
            if (getCurrentAttemptOfExamByStudentId(studentId, examId) == exam.getExamAttemp()) {
                return false;
            }
        }
        return true;
    }

    public void deleteAllResultByExamIdAndStudentId(int studentId, int examId) {
        try {
            String sql_delete = """
                                DELETE FROM [Result]
                                      WHERE [student_id]=? AND [exam_id]=?""";
            PreparedStatement stm = connection.prepareStatement(sql_delete);
            stm.setInt(1, studentId);
            stm.setInt(2, examId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getNumbersCorrectAnswerOfQuestionByQuestionId(int questionId) {
        int numberCorrectAnswer = 0;
        try {
            String sql = """
                         SELECT COUNT(*) AS [number_correct_answer]
                           FROM [OptionAnswer]
                           WHERE [question_id]= ? AND [isCorrect] = 'true'""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                numberCorrectAnswer = rs.getInt("number_correct_answer");
                return numberCorrectAnswer;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numberCorrectAnswer;
    }

    public int getNumbersCorrectAnswerOfStudentAnswer(int examId, int questionId, int studentId, int attemptNumber) {
        int numberCorrectAnswer = 0;
        try {
            String sql = """
                         SELECT COUNT(*) AS [number_correct_answer_of_student]
                           FROM [StudentAnswer] sa
                           INNER JOIN OptionAnswer oa ON sa.option_answer_id=oa.optionAnswer_id
                           WHERE oa.[isCorrect] = 'true' 
                           AND sa.[exam_id]=?
                           AND sa.[question_id]=?
                           AND sa.[student_id]=? 
                           AND sa.[attempt_number]=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, examId);
            stm.setInt(2, questionId);
            stm.setInt(3, studentId);
            stm.setInt(4, attemptNumber);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                numberCorrectAnswer = rs.getInt("number_correct_answer_of_student");
                return numberCorrectAnswer;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numberCorrectAnswer;
    }

    public int getNumbersFalseAnswerOfStudentAnswer(int examId, int questionId, int studentId, int attemptNumber) {
        int numberFalseAnswer = 0;
        try {
            String sql = """
                         SELECT COUNT(*) AS [number_false_answer_of_student]
                           FROM [StudentAnswer] sa
                           INNER JOIN OptionAnswer oa ON sa.option_answer_id=oa.optionAnswer_id
                           WHERE oa.[isCorrect] = 'false' 
                           AND sa.[exam_id]=?
                           AND sa.[question_id]=?
                           AND sa.[student_id]=? 
                           AND sa.[attempt_number]=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, examId);
            stm.setInt(2, questionId);
            stm.setInt(3, studentId);
            stm.setInt(4, attemptNumber);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                numberFalseAnswer = rs.getInt("number_false_answer_of_student");
                return numberFalseAnswer;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numberFalseAnswer;
    }

    public boolean compareAnswerOfStudent(int examId, int questionId, int studentId, int attemptNumber) {
        if ((getNumbersCorrectAnswerOfStudentAnswer(examId, questionId, studentId, attemptNumber) == getNumbersCorrectAnswerOfQuestionByQuestionId(questionId)
                & (getNumbersFalseAnswerOfStudentAnswer(examId, questionId, studentId, attemptNumber) == 0))) {
            return true;
        }
        return false;
    }

    public Double calculateScoreResultExamOfStudent(ArrayList<ExamQuestionMapping> listExamQuestionMapping, int studentId, int attemptNumber) {
        int totalQuestion = listExamQuestionMapping.size();
        int totalCorrectAnswer = 0;
        for (ExamQuestionMapping examQuestionMapping : listExamQuestionMapping) {
            if (compareAnswerOfStudent(examQuestionMapping.getExam().getExamId(), examQuestionMapping.getQuestion().getQuestionId(), studentId, attemptNumber)) {
                totalCorrectAnswer++;
            }
        }

        double score = (double) totalCorrectAnswer / totalQuestion * 10;

        DecimalFormat df = new DecimalFormat("#.##");
        String formattedScore = df.format(score);

        return Double.parseDouble(formattedScore);
    }

    public Result getResultByStudentIdAndExamIdAndNumberAttempt(int examId, int studentId, int attemptNumber) {
        ExamDBContext examDB = new ExamDBContext();
        AccountInfoDBContext accountInfoDB = new AccountInfoDBContext();
        try {
            String sql = """
                         SELECT [result_id]
                               ,[exam_id]
                               ,[student_id]
                               ,[score]
                               ,[comment_content]
                               ,[attempt_number]
                           FROM [Result]
                         WHERE exam_id = ? AND student_id = ? And attempt_number = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, examId);
            stm.setInt(2, studentId);
            stm.setInt(3, attemptNumber);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Result result = new Result();
                result.setResultId(rs.getInt("result_id"));
                result.setExam(examDB.getById(String.valueOf(rs.getInt("exam_id"))));
                result.setStudentInfo(accountInfoDB.getById(String.valueOf(rs.getInt("student_id"))));
                result.setScore(rs.getDouble("score"));
                result.setCommentContent(rs.getString("comment_content"));
                result.setAttemptNumber(rs.getInt("attempt_number"));
                return result;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
