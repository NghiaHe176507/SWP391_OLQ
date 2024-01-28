/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Url;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class UrlDBContext extends DBContext<Url> {

    @Override
    public Url getById(String Id) {
        try {
            String sql = "SELECT [url_id]\n"
                    + "      ,[url]\n"
                    + "  FROM [Url]\n"
                    + "  WHERE [url_id]= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Url url = new Url();
                url.setUrlId(rs.getString("url_id"));
                url.setUrl(rs.getString("url"));
                return url;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UrlDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
