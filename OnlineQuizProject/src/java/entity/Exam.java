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
public class Exam extends BaseEntity {

    private int examId;
    private String examTitle;
    private Group classExam;
    private Date examStartDate;
    private Date examEndDate;
    private String examTime;
    private Status status;
    private AccountInfo lectureInfo;
    private int examAttemp;
    private boolean isPractice;

    public Exam() {
    }

    public Exam(int examId, String examTitle, Group classExam, Date examStartDate, Date examEndDate, String examTime, Status status, AccountInfo lectureInfo, int examAttemp, boolean isPractice) {
        this.examId = examId;
        this.examTitle = examTitle;
        this.classExam = classExam;
        this.examStartDate = examStartDate;
        this.examEndDate = examEndDate;
        this.examTime = examTime;
        this.status = status;
        this.lectureInfo = lectureInfo;
        this.examAttemp = examAttemp;
        this.isPractice = isPractice;
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public String getExamTitle() {
        return examTitle;
    }

    public void setExamTitle(String examTitle) {
        this.examTitle = examTitle;
    }

    public Group getClassExam() {
        return classExam;
    }

    public void setClassExam(Group classExam) {
        this.classExam = classExam;
    }

    public Date getExamStartDate() {
        return examStartDate;
    }

    public void setExamStartDate(Date examStartDate) {
        this.examStartDate = examStartDate;
    }

    public Date getExamEndDate() {
        return examEndDate;
    }

    public void setExamEndDate(Date examEndDate) {
        this.examEndDate = examEndDate;
    }

    public String getExamTime() {
        return examTime;
    }

    public void setExamTime(String examTime) {
        this.examTime = examTime;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public AccountInfo getLectureInfo() {
        return lectureInfo;
    }

    public void setLectureInfo(AccountInfo lectureInfo) {
        this.lectureInfo = lectureInfo;
    }

    public int getExamAttemp() {
        return examAttemp;
    }

    public void setExamAttemp(int examAttemp) {
        this.examAttemp = examAttemp;
    }

    public boolean isIsPractice() {
        return isPractice;
    }

    public void setIsPractice(boolean isPractice) {
        this.isPractice = isPractice;
    }

}
