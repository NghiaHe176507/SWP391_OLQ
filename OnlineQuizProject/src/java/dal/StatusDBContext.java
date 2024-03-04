/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Status;
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
public class StatusDBContext extends DBContext<Status> {

    @Override
    public Status getById(String Id) {
        try {
            String sql = "SELECT [status_id]\n"
                    + "      ,[status_name]\n"
                    + "  FROM [Status]\n"
                    + "  WHERE [status_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
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

}
