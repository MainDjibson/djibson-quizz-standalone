package com.quizgame.dao;

import com.quizgame.models.Manche;
import com.quizgame.utils.DatabaseManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MancheDAO {

    public void insert(Manche manche) throws Exception {
    // Calcul de l'ID suivant : MAX + 1 (ou 1 si la table est vide)
    String sql = "INSERT INTO MANCHE (id, nom) " +
                 "VALUES ((SELECT COALESCE(MAX(id), 0) + 1 FROM MANCHE m), ?)";

    try (Connection conn = DatabaseManager.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
        
        // Le nom est maintenant le premier (et seul) paramètre "?"
        pstmt.setString(1, manche.getNom());
        
        pstmt.executeUpdate();

        // Récupération de l'ID généré pour mettre à jour l'objet Java
        try (ResultSet rs = pstmt.getGeneratedKeys()) {
            if (rs.next()) {
                manche.setId(rs.getInt(1));
            }
        }
    }
}

    public Manche findById(int id) throws Exception {
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

    public List<Manche> findAll() throws Exception {
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

    public void update(Manche manche) throws Exception {
        String sql = "UPDATE manche SET nom = ? WHERE id = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, manche.getNom());
            pstmt.setInt(2, manche.getId());
            pstmt.executeUpdate();
        }
    }

    public void delete(int id) throws Exception {
        String sql = "DELETE FROM manche WHERE id = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }

    public long count() throws Exception {
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