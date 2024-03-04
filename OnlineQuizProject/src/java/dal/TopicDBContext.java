/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Topic;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class TopicDBContext extends DBContext<Topic> {

    @Override
    public Topic getById(String Id) {
        try {
            String sql = "SELECT [topic_id]\n"
                    + "      ,[topic_name]\n"
                    + "  FROM [Topic]\n"
                    + "  WHERE [topic_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Topic topic = new Topic();
                topic.setTopicId(rs.getInt("topic_id"));
                topic.setTopicName(rs.getString("topic_name"));
                return topic;
            }

        } catch (SQLException ex) {
            Logger.getLogger(TopicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Topic> getAllTopics() {
        ArrayList<Topic> topics = new ArrayList<>();
        try {
            String sql = "SELECT [topic_id], [topic_name] FROM [Topic]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Topic topic = new Topic();
                topic.setTopicId(rs.getInt("topic_id"));
                topic.setTopicName(rs.getString("topic_name"));
                topics.add(topic);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TopicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return topics;
    }

    public ArrayList<Topic> searchTopic(String keyword) {
        ArrayList<Topic> topics = new ArrayList<>();
        String sql = "SELECT [topic_id], [topic_name] FROM [Topic] WHERE [topic_name] LIKE ?";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, "%" + keyword + "%");

            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Topic topic = new Topic();
                    topic.setTopicId(rs.getInt("topic_id"));
                    topic.setTopicName(rs.getString("topic_name"));
                    topics.add(topic);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(TopicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return topics;
    }

    public int getTotalTopics() {
        int totalTopics = 0;

        try {
            String sql = "SELECT COUNT(*) AS totalTopic FROM [Topic]";

            try (PreparedStatement stm = connection.prepareStatement(sql)) {
                try (ResultSet rs = stm.executeQuery()) {
                    if (rs.next()) {
                        totalTopics = rs.getInt("totalTopic");
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return totalTopics;
    }

}
