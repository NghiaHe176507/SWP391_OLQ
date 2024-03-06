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
    AccountInfoDBContext accountInfoDB = new AccountInfoDBContext();
    RoleFeatureDBContext roleFeatureDB = new RoleFeatureDBContext();
    GroupDBContext groupDB = new GroupDBContext();
    RoleDBContext roleDB = new RoleDBContext();
    TopicDBContext topicDB = new TopicDBContext();
    StatusDBContext statusDB = new StatusDBContext();

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
        if (getClassByLectureId(getAccountInfoByAccountId(roleFeature.getAccount().getAccountId()).getAccountInfoId()) == null) {

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
        if (getRoleFeatureByAccountId(accountId).getRole().getRoleId() != 1 && getClassByLectureId(getAccountInfoByAccountId(accountId).getAccountInfoId()) == null) {

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

    /**
     *
     * @param lectureId
     * @return
     */
    public Group getClassByLectureId(int lectureId) {
        try {
            String sql = """
                         SELECT [group_id]
                               ,[lecture_id]
                           FROM [Group]
                         WHERE [lecture_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lectureId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Group group = new Group();
                group = groupDB.getById(String.valueOf(rs.getInt("group_id")));
                return group;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
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

    @Override
    public BaseEntity getById(String Id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public AccountInfo getAccountInfoByAccount_Id(int Id) {
        AccountDBContext accountDb = new AccountDBContext();
        try {
            String sql = "SELECT [accountInfo_id]\n"
                    + "      ,[fullname]\n"
                    + "      ,[dob]\n"
                    + "      ,[account_id]\n"
                    + "  FROM [AccountInfo]\n"
                    + "	WHERE [account_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                AccountInfo accountInfo = new AccountInfo();
                accountInfo.setAccountInfoId(rs.getInt("accountInfo_id"));
                accountInfo.setFullName(rs.getString("fullname"));
                accountInfo.setDob(rs.getDate("dob"));
                accountInfo.setAccount(accountDb.getById(String.valueOf(rs.getInt("account_id"))));
                return accountInfo;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

//-------------------------------------------------------------------------------
    public int getAccountInfoIdByAccountId(int accountId) {
        try {
            String sql = "SELECT [accountInfo_id] FROM [AccountInfo] WHERE [account_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("accountInfo_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1; // Trả về -1 nếu không tìm thấy
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

//    
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

//    
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

//    
    public int getTotalStudents() {
        int totalStudents = 0;
        RoleDBContext roleDB = new RoleDBContext();
        AccountDBContext accountDb = new AccountDBContext();
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
            Logger.getLogger(AccountInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalStudents;
    }

    public int getTotalLectures() {
        int totalLectures = 0;
        RoleDBContext roleDB = new RoleDBContext();
        AccountDBContext accountDb = new AccountDBContext();
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
            Logger.getLogger(AccountInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalLectures;
    }

//    
    public Status getByAccountId(int accountId) {
        try {
            String sql = "SELECT [status_id], [status_name] FROM [Status] WHERE [status_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Status status = new Status();
                status.setStatusId(rs.getInt("status_id"));
                status.setStatusName(rs.getString("status_name"));
                return status;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatusDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Status> getAllStatus() {
        ArrayList<Status> statusList = new ArrayList<>();
        try {
            String sql = "SELECT [status_id], [status_name] FROM [Status]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Status status = new Status();
                status.setStatusId(rs.getInt("status_id"));
                status.setStatusName(rs.getString("status_name"));
                statusList.add(status);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StatusDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return statusList;
    }

//    
    public ArrayList<Topic> getAllTopics() {
        ArrayList<Topic> topics = new ArrayList<>();
        try {
            String sql = "SELECT [topic_id], [topic_name] FROM [Topic]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Topic topic = new Topic();
                topic.setTopicId(rs.getInt("topic_id"));
                topic.setTopicName(rs.getString("topic_name"));
                topics.add(topic);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TopicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return topics;
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

    public int getTotalTopics() {
        int totalTopics = 0;

        try {
            String sql = "SELECT COUNT(*) AS totalTopic FROM [Topic]";

            try (PreparedStatement stm = connection.prepareStatement(sql)) {
                try (ResultSet rs = stm.executeQuery()) {
                    if (rs.next()) {
                        totalTopics = rs.getInt("totalTopic");
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return totalTopics;
    }

}
