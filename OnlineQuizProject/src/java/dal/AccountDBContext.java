/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
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

    public Account getAccount(String mail, String password) {
        try {
            String sql = """
                         SELECT *  FROM [Account]
                           WHERE [mail] = ? AND [password] = ?""";
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

    public void registerNewAccount(Account account) {
        try {
            connection.setAutoCommit(false);

            String sql_insert = """
                                INSERT INTO [Account]
                                           ([mail]
                                           ,[password]
                                           ,[displayname]
                                           )
                                     VALUES
                                           (?,?,?)""";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setString(1, account.getMail());
            stm.setString(2, account.getPassword());
            stm.setString(3, account.getDisplayName());
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
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
            e.printStackTrace();
        }

        return false; // Return false in case of an error
    }

    public void updatePasswordAccount(Account account) {
        try {
            String sql_update = """
                            UPDATE [Account]
                               SET [mail] = ?
                                  ,[password] = ?
                             WHERE [mail]=?""";
            try (PreparedStatement stm = connection.prepareStatement(sql_update)) {
                stm.setString(1, account.getMail());
                stm.setString(2, account.getPassword());
                stm.setString(3, account.getMail()); // Assuming mail is the primary key
                stm.executeUpdate();
            }

            // Commit the changes
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
