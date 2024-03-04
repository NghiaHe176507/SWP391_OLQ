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

}
