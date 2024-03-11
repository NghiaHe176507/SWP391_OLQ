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

    private String lectureComment;
    private int resultId;
    private Exam exam;
    private AccountInfo studentInfo;
    private Double score;

    public Result() {
    }

    public void setLectureComment(String lectureComment) {
        this.lectureComment = lectureComment;
    }

    public Result(int resultId, Exam exam, AccountInfo studentInfo, Double score) {
        this.resultId = resultId;
        this.exam = exam;
        this.studentInfo = studentInfo;
        this.score = score;
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

    public String getLectureComment() {
        return lectureComment;
    }
}
