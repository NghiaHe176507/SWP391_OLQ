/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import entity.AccountInfo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class AccountDBContext extends DBContext<Account> {

    public Account getAccount(String mail, String password) {
        try {
            String sql = "SELECT *"
                    + "  FROM [Account]\n"
                    + "  WHERE [mail] = ? AND [password] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, mail);
            stm.setString(2, password);
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
    public Account getById(String Id) {
        try {
            String sql = """
                         SELECT [account_id]
                               ,[mail]
                               ,[password]
                               ,[displayname]
                               ,[account_status]
                           FROM [Account]
                           WHERE [account_id] = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
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

}
