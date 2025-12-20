package com.quizgame;

import com.quizgame.dao.DatabaseManager;
import com.quizgame.ui.MainMenuController;
import com.quizgame.ui.MainMenuView;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class QuizGameApp extends Application {

    public static Stage primaryStage;

    @Override
    public void start(Stage stage) {
        primaryStage = stage;
        
        // UI d'abord
        var root = new MainMenuController();
        var scene = new Scene(root.getView(), 1024, 768);
        
        // Correction du chemin CSS - ajuste selon ton fichier réel
        try {
            scene.getStylesheets().add(
                getClass().getResource("/app.css").toExternalForm()
            );
        } catch (Exception e) {
            System.err.println("Fichier CSS non trouvé: " + e.getMessage());
        }

        stage.setTitle("DjibsonQuizz");
        stage.setScene(scene);
        stage.show();
        stage.toFront();
        stage.requestFocus();

        // DB ensuite (background)
        Thread t = new Thread(() -> {
            try {
                DatabaseManager.getConnection(); // crée DB + tables
            } catch (Throwable ex) {
                ex.printStackTrace();
                Platform.runLater(() -> {
                    Platform.exit();
                    System.exit(1);
                });
            }
        }, "db-init");
        t.setDaemon(true);
        t.start();

        stage.setOnCloseRequest(e -> DatabaseManager.close());
    }

    private void startGame() {
        // Logique pour démarrer le jeu
        MainMenuController mainMenu = new MainMenuController();
        Scene scene = new Scene(mainMenu.getView(), 1024, 768);
        QuizGameApp.primaryStage.setScene(scene);
        
    }

    public static void main(String[] args) {
        launch(args);
    }
}