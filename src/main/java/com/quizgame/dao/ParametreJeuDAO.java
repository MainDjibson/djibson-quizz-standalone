package com.quizgame.dao;

import com.quizgame.models.ParametreJeu;
import com.quizgame.utils.DatabaseManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ParametreJeuDAO {

    public void insert(ParametreJeu parametre) throws Exception {
        String sql = "INSERT INTO parametre_jeu (cle, valeur) VALUES (?, ?)";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, parametre.getCle());
            pstmt.setString(2, parametre.getValeur());
            pstmt.executeUpdate();
        }
    }

    public ParametreJeu findByCle(String cle) throws Exception {
        String sql = "SELECT * FROM parametre_jeu WHERE cle = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, cle);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new ParametreJeu(rs.getString("cle"), rs.getString("valeur"));
            }
        }
        return null;
    }

    public List<ParametreJeu> findAll() throws Exception {
        List<ParametreJeu> parametres = new ArrayList<>();
        String sql = "SELECT * FROM parametre_jeu ORDER BY cle";
        try (Connection conn = DatabaseManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                parametres.add(new ParametreJeu(rs.getString("cle"), rs.getString("valeur")));
            }
        }
        return parametres;
    }

    public void update(ParametreJeu parametre) throws Exception {
        String sql = "UPDATE parametre_jeu SET valeur = ? WHERE cle = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, parametre.getValeur());
            pstmt.setString(2, parametre.getCle());
            pstmt.executeUpdate();
        }
    }

    public void upsert(String cle, String valeur) throws Exception {
        ParametreJeu existing = findByCle(cle);
        if (existing != null) {
            existing.setValeur(valeur);
            update(existing);
        } else {
            insert(new ParametreJeu(cle, valeur));
        }
    }

    public void delete(String cle) throws Exception {
        String sql = "DELETE FROM parametre_jeu WHERE cle = ?";
        try (Connection conn = DatabaseManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, cle);
            pstmt.executeUpdate();
        }
    }

    public String getValeur(String cle, String defaut) throws Exception {
        ParametreJeu param = findByCle(cle);
        return param != null ? param.getValeur() : defaut;
    }

    public int getValeurInt(String cle, int defaut) throws Exception {
        String valeur = getValeur(cle, String.valueOf(defaut));
        try {
            return Integer.parseInt(valeur);
        } catch (NumberFormatException e) {
            return defaut;
        }
    }

    public boolean getValeurBoolean(String cle, boolean defaut) throws Exception {
        String valeur = getValeur(cle, String.valueOf(defaut));
        return Boolean.parseBoolean(valeur);
    }
}