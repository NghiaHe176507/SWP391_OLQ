/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.AccountInfo;
import entity.RoleFeature;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class RoleFeatureDBContext extends DBContext<RoleFeature> {

    @Override
    public RoleFeature getById(String Id) {
        RoleDBContext roleDB = new RoleDBContext();
        AccountDBContext accountDb = new AccountDBContext();
        try {
            String sql = """
                         SELECT [roleFeature_id]
                               ,[role_id]
                               ,[account_id]
                           FROM [RoleFeature]
                           WHERE [roleFeature_id]=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                RoleFeature roleFeature = new RoleFeature();
                roleFeature.setRoleFeatureId(rs.getInt("roleFeature_id"));
                roleFeature.setAccount(accountDb.getById(String.valueOf(rs.getInt("account_id"))));
                roleFeature.setRole(roleDB.getById(String.valueOf(rs.getInt("role_id"))));
                return roleFeature;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountInfoDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
