/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class Group extends BaseEntity {

    private int groupId;
    private String groupName;
    private AccountInfo lectureInfo;
    private Topic topic;
    private Status status;

    public Group() {
    }

    public Group(int classId, String className, AccountInfo lectureInfo, Topic topic, Status status) {
        this.groupId = classId;
        this.groupName = className;
        this.lectureInfo = lectureInfo;
        this.topic = topic;
        this.status = status;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public AccountInfo getLectureInfo() {
        return lectureInfo;
    }

    public void setLectureInfo(AccountInfo lectureInfo) {
        this.lectureInfo = lectureInfo;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

}
