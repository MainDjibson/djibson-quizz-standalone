package com.quizgame.dao;

import com.quizgame.models.Candidat;
import com.quizgame.utils.DatabaseManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CandidatDAO {

    public void insert(Candidat candidat) throws Exception {
        String sql = "INSERT INTO candidat (prenom, nom, date_naissance) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, candidat.getPrenom());
            pstmt.setString(2, candidat.getNom());
            if (candidat.getDateNaissance() != null) {
                pstmt.setDate(3, Date.valueOf(candidat.getDateNaissance()));
            } else {
                pstmt.setNull(3, Types.DATE);
            }
            pstmt.executeUpdate();
            
            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                candidat.setId(rs.getInt(1));
            }
        }
    }

    public Candidat findById(int id) throws Exception {
        String sql = "SELECT * FROM candidat WHERE id = ?";
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

    public List<Candidat> findAll() throws Exception {
        List<Candidat> candidats = new ArrayList<>();
        String sql = "SELECT * FROM CANDIDAT ORDER BY nom, prenom";
        try (Connection conn = DatabaseManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                candidats.add(mapResultSet(rs));
            }
        }
        return candidats;
    }

    public void update(Candidat candidat) throws Exception {
        String sql = "UPDATE CANDIDAT SET prenom = ?, nom = ?, date_naissance = ? WHERE id = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, candidat.getPrenom());
            pstmt.setString(2, candidat.getNom());
            if (candidat.getDateNaissance() != null) {
                pstmt.setDate(3, Date.valueOf(candidat.getDateNaissance()));
            } else {
                pstmt.setNull(3, Types.DATE);
            }
            pstmt.setInt(4, candidat.getId());
            pstmt.executeUpdate();
        }
    }

    public void delete(int id) throws Exception {
        String sql = "DELETE FROM CANDIDAT WHERE id = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }

    private Candidat mapResultSet(ResultSet rs) throws Exception {
        Candidat c = new Candidat();
        c.setId(rs.getInt("id"));
        c.setPrenom(rs.getString("prenom"));
        c.setNom(rs.getString("nom"));
        Date dateNaissance = rs.getDate("date_naissance");
        if (dateNaissance != null) {
            c.setDateNaissance(dateNaissance.toLocalDate());
        }
        return c;
    }
}