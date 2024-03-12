/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class OptionAnswer extends BaseEntity {

    private int optionAnswerId;
    private String answerContent;
    private boolean isCorrect;
    private Question question;

    public OptionAnswer() {
    }

    public OptionAnswer(int optionAnswerId, String answerOption, boolean isCorrect, Question question) {
        this.optionAnswerId = optionAnswerId;
        this.answerContent = answerOption;
        this.isCorrect = isCorrect;
        this.question = question;
    }

    public int getOptionAnswerId() {
        return optionAnswerId;
    }

    public void setOptionAnswerId(int optionAnswerId) {
        this.optionAnswerId = optionAnswerId;
    }

    public String getAnswerContent() {
        return answerContent;
    }

    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }

    public boolean isIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(boolean isCorrect) {
        this.isCorrect = isCorrect;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

}
