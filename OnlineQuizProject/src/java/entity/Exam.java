/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Timestamp;

/**
 *
 * @author PC
 */
public class Exam extends BaseEntity {

    private int examId;
    private String examTitle;
    private Class classExam;
    private Timestamp examStartDate;
    private Timestamp examEndDate;
    private Timestamp examTime;
    private Status status;
    private AccountInfo lectureInfo;
    private int examAttemp;
    private boolean isPractice;

    public Exam() {
    }

    public Exam(int examId, String examTitle, Class classExam, Timestamp examStartDate, Timestamp examEndDate, Timestamp examTime, Status status, AccountInfo lectureInfo, int examAttemp, boolean isPractice) {
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

    public Class getClassExam() {
        return classExam;
    }

    public void setClassExam(Class classExam) {
        this.classExam = classExam;
    }

    public Timestamp getExamStartDate() {
        return examStartDate;
    }

    public void setExamStartDate(Timestamp examStartDate) {
        this.examStartDate = examStartDate;
    }

    public Timestamp getExamEndDate() {
        return examEndDate;
    }

    public void setExamEndDate(Timestamp examEndDate) {
        this.examEndDate = examEndDate;
    }

    public Timestamp getExamTime() {
        return examTime;
    }

    public void setExamTime(Timestamp examTime) {
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