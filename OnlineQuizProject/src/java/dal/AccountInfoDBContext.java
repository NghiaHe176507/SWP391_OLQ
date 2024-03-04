/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.AccountInfo;
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
public class AccountInfoDBContext extends DBContext<AccountInfo> {

    @Override
    public AccountInfo getById(String Id) {
        AccountDBContext accountDb = new AccountDBContext();
        try {
            String sql = "SELECT [accountInfo_id]\n"
                    + "      ,[fullname]\n"
                    + "      ,[dob]\n"  
                    + "      ,[account_id]\n"
                    + "  FROM [AccountInfo]\n"
                    + "	WHERE [accountInfo_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
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
                stm.setString(1,keyword);
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

}
