/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class StudentAnswer extends BaseEntity {

    private int studentAnswer;
    private Exam exam;
    private Question question;
    private OptionAnswer optionAnswer;
    private AccountInfo studentInfo;

    public StudentAnswer() {
    }

    public StudentAnswer(int studentAnswer, Exam exam, Question question, OptionAnswer optionAnswer, AccountInfo studentInfo) {
        this.studentAnswer = studentAnswer;
        this.exam = exam;
        this.question = question;
        this.optionAnswer = optionAnswer;
        this.studentInfo = studentInfo;
    }

    public int getStudentAnswer() {
        return studentAnswer;
    }

    public void setStudentAnswer(int studentAnswer) {
        this.studentAnswer = studentAnswer;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public OptionAnswer getOptionAnswer() {
        return optionAnswer;
    }

    public void setOptionAnswer(OptionAnswer optionAnswer) {
        this.optionAnswer = optionAnswer;
    }

    public AccountInfo getStudentInfo() {
        return studentInfo;
    }

    public void setStudentInfo(AccountInfo studentInfo) {
        this.studentInfo = studentInfo;
    }

}
