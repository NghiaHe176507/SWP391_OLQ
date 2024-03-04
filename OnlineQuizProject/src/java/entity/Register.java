/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author PC
 */
public class Register extends BaseEntity {

    private int registerId;
    private Date registerDate;
    private AccountInfo studentInfo;
    private Group classRegister;

    public Register() {
    }

    public Register(int registerId, Date registerDate, AccountInfo studentInfo, Group classRegister) {
        this.registerId = registerId;
        this.registerDate = registerDate;
        this.studentInfo = studentInfo;
        this.classRegister = classRegister;
    }

    public int getRegisterId() {
        return registerId;
    }

    public void setRegisterId(int registerId) {
        this.registerId = registerId;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public AccountInfo getStudentInfo() {
        return studentInfo;
    }

    public void setStudentInfo(AccountInfo studentInfo) {
        this.studentInfo = studentInfo;
    }

    public Group getClassRegister() {
        return classRegister;
    }

    public void setClassRegister(Group classRegister) {
        this.classRegister = classRegister;
    }

}
