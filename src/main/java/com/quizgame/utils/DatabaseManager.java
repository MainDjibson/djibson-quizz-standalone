package com.quizgame.utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DatabaseManager {

    private static Connection conn;

    /**
     * Définit le dossier de stockage de la base de données (APPDATA sur Windows)
     */
    private static Path appDir() {
        String appData = System.getenv("APPDATA");
        if (appData != null && !appData.isBlank()) {
            return Paths.get(appData, "DjibsonQuizz");
        }
        return Paths.get(System.getProperty("user.home"), ".DjibsonQuizz");
    }

    /**
     * Récupère la connexion et initialise la base si nécessaire
     */
    public static synchronized Connection getConnection() throws Exception {
        if (conn != null && !conn.isClosed()) {
            return conn;
        }

        // 1. Création du dossier de l'application
        Path dir = appDir();
        if (!Files.exists(dir)) {
            Files.createDirectories(dir);
        }

        // 2. Configuration de l'URL H2
        String dbFile = dir.resolve("quizgame").toString().replace("\\", "/");
        // AUTO_SERVER=TRUE permet d'ouvrir la base avec un outil externe en même temps
        // String url = "jdbc:h2:file:" + dbFile + ";AUTO_SERVER=TRUE;DB_CLOSE_DELAY=-1";
       
        String url = "jdbc:h2:file:" + dbFile + ";AUTO_SERVER=TRUE;DB_CLOSE_DELAY=-1;DATABASE_TO_UPPER=FALSE;CASE_INSENSITIVE_IDENTIFIERS=TRUE";

        System.out.println("Tentative de connexion à : " + url);
        
        try {
            conn = DriverManager.getConnection(url, "sa", "");
            
            // 3. Initialisation des tables depuis le fichier SQL
            initDatabase();
            
            System.out.println("Base de données opérationnelle dans : " + dir);
        } catch (Exception e) {
            System.err.println("ERREUR lors de l'initialisation de la base : " + e.getMessage());
            throw e;
        }

        return conn;
    }

    /**
     * Lit et exécute le fichier quizgame.sql situé dans src/main/resources
     * CORRECTION : Gestion améliorée des commentaires et des instructions SQL
     */
    private static void initDatabase() {
        InputStream is = DatabaseManager.class.getResourceAsStream("/quizgame.sql");
        
        if (is == null) {
            System.err.println("ERREUR : Le fichier /quizgame.sql est introuvable dans src/main/resources !");
            return;
        }

        try (BufferedReader br = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
             Statement st = conn.createStatement()) {

            StringBuilder currentStatement = new StringBuilder();
            String line;
            
            while ((line = br.readLine()) != null) {
                line = line.trim();
                
                // Ignorer les lignes vides et les commentaires
                if (line.isEmpty() || line.startsWith("--") || line.startsWith("#")) {
                    continue;
                }
                
                // Ajouter la ligne au statement courant
                currentStatement.append(line).append(" ");
                
                // Si la ligne se termine par un point-virgule, exécuter le statement
                if (line.endsWith(";")) {
                    String sql = currentStatement.toString().trim();
                    
                    // Retirer le point-virgule final (H2 n'en a pas besoin avec execute())
                    if (sql.endsWith(";")) {
                        sql = sql.substring(0, sql.length() - 1).trim();
                    }
                    
                    // Exécuter uniquement si non vide
                    if (!sql.isEmpty()) {
                        try {
                            st.execute(sql);
                        } catch (Exception e) {
                            // Afficher l'erreur mais continuer (ex: table existe déjà)
                            System.out.println("Note SQL : " + e.getMessage());
                        }
                    }
                    
                    // Réinitialiser pour le prochain statement
                    currentStatement.setLength(0);
                }
            }
            
            System.out.println("Script SQL exécuté avec succès.");
            System.out.println("Tables de base de données initialisées.");

            // Afficher les tables créées
            System.out.println("=== TABLES DISPONIBLES ===");
            var rs = st.executeQuery("SHOW TABLES");
            while (rs.next()) {
                System.out.println("  - " + rs.getString(1));
            }
            System.out.println("==========================");

        } catch (Exception e) {
            System.err.println("ERREUR lors de l'exécution du script SQL : " + e.getMessage());
            e.printStackTrace(); 
        }
    }

    /**
     * Ferme proprement la connexion
     */
    public static synchronized void close() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("Connexion H2 fermée.");
            }
        } catch (Exception e) {
            System.err.println("Erreur lors de la fermeture : " + e.getMessage());
        }
    }
}