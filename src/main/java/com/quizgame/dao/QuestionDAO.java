package com.quizgame.dao;

import com.quizgame.models.Question;
import com.quizgame.utils.DatabaseManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {

    public void insert(Question question) throws SQLException {
        String sql = "INSERT INTO question (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, question.getLibelle());
            pstmt.setInt(2, question.getIdManche());
            pstmt.setInt(3, question.getPoints());
            pstmt.setString(4, question.getDifficulte());
            if (question.getTempsLimiteSecondes() != null) {
                pstmt.setInt(5, question.getTempsLimiteSecondes());
            } else {
                pstmt.setNull(5, Types.INTEGER);
            }
            pstmt.executeUpdate();
            
            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                question.setId(rs.getInt(1));
            }
        }
    }

    public Question findById(int id) throws SQLException {
        String sql = "SELECT * FROM question WHERE id = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return mapResultSet(rs);
            }
        }
        return null;
    }

    public List<Question> findByManche(int idManche) throws SQLException {
        List<Question> questions = new ArrayList<>();
        String sql = "SELECT * FROM question WHERE id_manche = ? ORDER BY id";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idManche);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                questions.add(mapResultSet(rs));
            }
        }
        return questions;
    }

    public List<Question> findAll() throws SQLException {
        List<Question> questions = new ArrayList<>();
        String sql = "SELECT * FROM question ORDER BY id_manche, id";
        try (Connection conn = DatabaseManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                questions.add(mapResultSet(rs));
            }
        }
        return questions;
    }

    public void update(Question question) throws SQLException {
        String sql = "UPDATE question SET libelle = ?, id_manche = ?, points = ?, difficulte = ?, temps_limite_secondes = ? WHERE id = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, question.getLibelle());
            pstmt.setInt(2, question.getIdManche());
            pstmt.setInt(3, question.getPoints());
            pstmt.setString(4, question.getDifficulte());
            if (question.getTempsLimiteSecondes() != null) {
                pstmt.setInt(5, question.getTempsLimiteSecondes());
            } else {
                pstmt.setNull(5, Types.INTEGER);
            }
            pstmt.setInt(6, question.getId());
            pstmt.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM question WHERE id = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }

    private Question mapResultSet(ResultSet rs) throws SQLException {
        Question q = new Question();
        q.setId(rs.getInt("id"));
        q.setLibelle(rs.getString("libelle"));
        q.setIdManche(rs.getInt("id_manche"));
        q.setPoints(rs.getInt("points"));
        q.setDifficulte(rs.getString("difficulte"));
        int temps = rs.getInt("temps_limite_secondes");
        if (!rs.wasNull()) {
            q.setTempsLimiteSecondes(temps);
        }
        return q;
    }
}