/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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

}
