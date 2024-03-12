/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class Question extends BaseEntity {

    private int questionId;
    private String questionContent;
    private Topic topic;
    private boolean inBank;
    private String questionAnswerDetail;

    public Question() {
    }

    public Question(int questionId, String questionContent, Topic topic, boolean inBank, String questionAnswerDetail) {
        this.questionId = questionId;
        this.questionContent = questionContent;
        this.topic = topic;
        this.inBank = inBank;
        this.questionAnswerDetail = questionAnswerDetail;
    }

    public String getQuestionAnswerDetail() {
        return questionAnswerDetail;
    }

    public void setQuestionAnswerDetail(String questionAnswerDetail) {
        this.questionAnswerDetail = questionAnswerDetail;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public boolean isInBank() {
        return inBank;
    }

    public void setInBank(boolean inBank) {
        this.inBank = inBank;
    }

}
