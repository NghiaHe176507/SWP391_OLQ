/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class ExamQuestionMapping extends BaseEntity {

    private int examQuestionMappingId;
    private Question question;
    private Exam exam;

    public ExamQuestionMapping() {
    }

    public ExamQuestionMapping(int examQuestionMappingId, Question question, Exam exam) {
        this.examQuestionMappingId = examQuestionMappingId;
        this.question = question;
        this.exam = exam;
    }

    public int getExamQuestionMappingId() {
        return examQuestionMappingId;
    }

    public void setExamQuestionMappingId(int examQuestionMappingId) {
        this.examQuestionMappingId = examQuestionMappingId;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

}
