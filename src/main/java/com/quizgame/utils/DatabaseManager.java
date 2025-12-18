package com.quizgame.utils;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseManager {
    private static final String DB_URL = "jdbc:h2:./quizgame;AUTO_SERVER=TRUE";
    private static final String DB_USER = "sa";
    private static final String DB_PASSWORD = "";
    
    private static Connection connection;

    // Dossier d'écriture autorisé sous Windows
    private static final Path APP_DIR =
            Paths.get(System.getenv("APPDATA") != null ? System.getenv("APPDATA") : System.getProperty("user.home"),
                    "DjibsonQuizz");
    

    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try {
                Files.createDirectories(APP_DIR);
            } catch (Exception e) {
                throw new SQLException("Impossible de créer le dossier DB: " + APP_DIR, e);
            }
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            initializeDatabase();
        }
        return connection;
    }

    private static void initializeDatabase() {
        try (Statement stmt = connection.createStatement()) {
            // ... Garde ton code de création de tables tel quel ...
            System.out.println("Tables de base de données initialisées.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}