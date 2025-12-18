package com.quizgame.dao;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DatabaseManager {

    private static Connection conn;

    private static Path appDir() {
        String appData = System.getenv("APPDATA");
        if (appData != null && !appData.isBlank()) {
            return Paths.get(appData, "DjibsonQuizz");
        }
        return Paths.get(System.getProperty("user.home"), ".DjibsonQuizz");
    }

    public static synchronized Connection getConnection() throws Exception {
        if (conn != null && !conn.isClosed()) return conn;

        Path dir = appDir();
        Files.createDirectories(dir);

        String dbFile = dir.resolve("quizgame").toString().replace("\\", "/");
        String url = "jdbc:h2:file:" + dbFile + ";AUTO_SERVER=TRUE";

        conn = DriverManager.getConnection(url, "sa", "");

        try (Statement st = conn.createStatement()) {
            st.execute("""
                CREATE TABLE IF NOT EXISTS candidates(
                  id IDENTITY PRIMARY KEY,
                  nom VARCHAR(100),
                  prenom VARCHAR(100),
                  date_naissance DATE
                )
            """);
        }

        System.out.println("DB OK -> " + dir);
        return conn;
    }

    public static synchronized void close() {
        try { if (conn != null) conn.close(); } catch (Exception ignored) {}
    }
}
