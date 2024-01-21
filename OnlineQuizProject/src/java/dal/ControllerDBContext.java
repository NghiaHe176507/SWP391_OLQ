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

    public ArrayList<Account> getListAccount() {
        ArrayList<Account> listAccount = new ArrayList<>();
        try {
            String sql = """
                         SELECT [account_id]
                           FROM [Account]""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account = accountDB.getById(String.valueOf(rs.getInt("account_id")));
                listAccount.add(account);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAccount;
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

    public void deleteAccountById(int accountId) {
        try {
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

    @Override
    public BaseEntity getById(String Id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}