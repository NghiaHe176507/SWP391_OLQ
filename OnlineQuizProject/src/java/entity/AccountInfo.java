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
public class AccountInfo extends BaseEntity {

    private int accountInfoId;
    private String fullName;
    private Date dob;
    private Account account;


    public AccountInfo() {
    }

    public AccountInfo(int accountInfo, String fullName, Date dob, Account account) {
        this.accountInfoId = accountInfo;
        this.fullName = fullName;
        this.dob = dob;
        this.account = account;
    }

    public int getAccountInfoId() {
        return accountInfoId;
    }

    public void setAccountInfoId(int accountInfoId) {
        this.accountInfoId = accountInfoId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

}
