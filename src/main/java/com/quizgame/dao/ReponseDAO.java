package com.quizgame.dao;

import com.quizgame.models.Reponse;
import com.quizgame.utils.DatabaseManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReponseDAO {

    public void insert(Reponse reponse) throws Exception {
        String sql = "INSERT INTO reponse (libelle, juste, id_question) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, reponse.getLibelle());
            pstmt.setBoolean(2, reponse.isJuste());
            pstmt.setInt(3, reponse.getIdQuestion());
            pstmt.executeUpdate();
            
            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                reponse.setId(rs.getInt(1));
            }
        }
    }

    public Reponse findById(int id) throws Exception {
        String sql = "SELECT * FROM reponse WHERE id = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new Reponse(
                    rs.getInt("id"),
                    rs.getString("libelle"),
                    rs.getBoolean("juste"),
                    rs.getInt("id_question")
                );
            }
        }
        return null;
    }

    public List<Reponse> findByQuestion(int idQuestion) throws Exception {
        List<Reponse> reponses = new ArrayList<>();
        String sql = "SELECT * FROM reponse WHERE id_question = ? ORDER BY RAND()";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idQuestion);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                reponses.add(new Reponse(
                    rs.getInt("id"),
                    rs.getString("libelle"),
                    rs.getBoolean("juste"),
                    rs.getInt("id_question")
                ));
            }
        }
        return reponses;
    }

    public Reponse findCorrectAnswer(int idQuestion) throws Exception {
        String sql = "SELECT * FROM reponse WHERE id_question = ? AND juste = TRUE LIMIT 1";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idQuestion);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new Reponse(
                    rs.getInt("id"),
                    rs.getString("libelle"),
                    rs.getBoolean("juste"),
                    rs.getInt("id_question")
                );
            }
        }
        return null;
    }

    public void update(Reponse reponse) throws Exception {
        String sql = "UPDATE reponse SET libelle = ?, juste = ?, id_question = ? WHERE id = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, reponse.getLibelle());
            pstmt.setBoolean(2, reponse.isJuste());
            pstmt.setInt(3, reponse.getIdQuestion());
            pstmt.setInt(4, reponse.getId());
            pstmt.executeUpdate();
        }
    }

    public void delete(int id) throws Exception {
        String sql = "DELETE FROM reponse WHERE id = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }

    public void deleteByQuestion(int idQuestion) throws Exception {
        String sql = "DELETE FROM reponse WHERE id_question = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idQuestion);
            pstmt.executeUpdate();
        }
    }
}