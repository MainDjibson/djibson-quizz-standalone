package com.quizgame.dao;

import com.quizgame.models.Manche;
import com.quizgame.utils.DatabaseManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MancheDAO {

    public void insert(Manche manche) throws SQLException {
        String sql = "INSERT INTO manche (nom) VALUES (?)";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, manche.getNom());
            pstmt.executeUpdate();
            
            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                manche.setId(rs.getInt(1));
            }
        }
    }

    public Manche findById(int id) throws SQLException {
        String sql = "SELECT * FROM manche WHERE id = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new Manche(rs.getInt("id"), rs.getString("nom"));
            }
        }
        return null;
    }

    public List<Manche> findAll() throws SQLException {
        List<Manche> manches = new ArrayList<>();
        String sql = "SELECT * FROM manche ORDER BY id";
        try (Connection conn = DatabaseManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                manches.add(new Manche(rs.getInt("id"), rs.getString("nom")));
            }
        }
        return manches;
    }

    public void update(Manche manche) throws SQLException {
        String sql = "UPDATE manche SET nom = ? WHERE id = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, manche.getNom());
            pstmt.setInt(2, manche.getId());
            pstmt.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM manche WHERE id = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }

    public long count() throws SQLException {
        String sql = "SELECT COUNT(*) FROM manche";
        try (Connection conn = DatabaseManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getLong(1);
            }
        }
        return 0;
    }
}