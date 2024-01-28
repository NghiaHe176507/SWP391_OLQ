/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.BaseEntity;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 * @param <T>
 */
public abstract class DBContext<T extends BaseEntity> {

    protected Connection connection;

   public DBContext() {
        try {
            String url = "jdbc:sqlserver://localhost\\DESKTOP-KRG8A16\\NGHIA2003:1433;databaseName=Quiz;encrypt=true;trustServerCertificate=true";
            String user = "sa";
            String pass = "Nghia2003@@";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }



    public abstract T getById(String Id);
}