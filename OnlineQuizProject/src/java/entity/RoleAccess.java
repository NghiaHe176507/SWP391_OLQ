/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class RoleAccess extends BaseEntity {

    private int roleAccessId;
    private Role role;
    private Url url;

    public RoleAccess() {
    }

    public RoleAccess(int roleAccessId, Role role, Url url) {
        this.roleAccessId = roleAccessId;
        this.role = role;
        this.url = url;
    }

    public int getRoleAccessId() {
        return roleAccessId;
    }

    public void setRoleAccessId(int roleAccessId) {
        this.roleAccessId = roleAccessId;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Url getUrl() {
        return url;
    }

    public void setUrl(Url url) {
        this.url = url;
    }

}
