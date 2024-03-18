/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class Result extends BaseEntity {

    private int resultId;
    private Exam exam;
    private AccountInfo studentInfo;
    private Double score;
    private String commentContent;
    private int attemptNumber;

    public Result() {
    }

    public Result(int resultId, Exam exam, AccountInfo studentInfo, Double score, String commentContent, int attemptNumber) {
        this.resultId = resultId;
        this.exam = exam;
        this.studentInfo = studentInfo;
        this.score = score;
        this.commentContent = commentContent;
        this.attemptNumber = attemptNumber;
    }

    public int getResultId() {
        return resultId;
    }

    public void setResultId(int resultId) {
        this.resultId = resultId;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    public AccountInfo getStudentInfo() {
        return studentInfo;
    }

    public void setStudentInfo(AccountInfo studentInfo) {
        this.studentInfo = studentInfo;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public int getAttemptNumber() {
        return attemptNumber;
    }

    public void setAttemptNumber(int attemptNumber) {
        this.attemptNumber = attemptNumber;
    }

}
