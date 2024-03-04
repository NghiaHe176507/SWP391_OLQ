/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class RoleFeature extends BaseEntity {

    private int roleFeatureId;
    private Role role;
    private Account account;

    public RoleFeature() {
    }

    public RoleFeature(int roleFeatureId, Role role, Account account) {
        this.roleFeatureId = roleFeatureId;
        this.role = role;
        this.account = account;
    }

    public int getRoleFeatureId() {
        return roleFeatureId;
    }

    public void setRoleFeatureId(int roleFeatureId) {
        this.roleFeatureId = roleFeatureId;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

}
