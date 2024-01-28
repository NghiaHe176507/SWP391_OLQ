/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class Class extends BaseEntity {

    private int classId;
    private String className;
    private AccountInfo lectureInfo;
    private Topic topic;
    private Status status;

    public Class() {
    }

    public Class(int classId, String className, AccountInfo lectureInfo, Topic topic, Status status) {
        this.classId = classId;
        this.className = className;
        this.lectureInfo = lectureInfo;
        this.topic = topic;
        this.status = status;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
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
