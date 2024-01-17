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
    private String answerOption;
    private boolean isCorrect;
    private Question question;

    public OptionAnswer() {
    }

    public OptionAnswer(int optionAnswerId, String answerOption, boolean isCorrect, Question question) {
        this.optionAnswerId = optionAnswerId;
        this.answerOption = answerOption;
        this.isCorrect = isCorrect;
        this.question = question;
    }

    public int getOptionAnswerId() {
        return optionAnswerId;
    }

    public void setOptionAnswerId(int optionAnswerId) {
        this.optionAnswerId = optionAnswerId;
    }

    public String getAnswerOption() {
        return answerOption;
    }

    public void setAnswerOption(String answerOption) {
        this.answerOption = answerOption;
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
