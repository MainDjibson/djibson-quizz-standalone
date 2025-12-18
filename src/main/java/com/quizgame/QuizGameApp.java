package com.quizgame;

import com.quizgame.dao.DatabaseManager;
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
        var root = new MainMenuView().getView();
        var scene = new Scene(root, 1000, 700);
        scene.getStylesheets().add(getClass().getResource("/com/djibson/quizz/app.css").toExternalForm());

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
                    // en dev, on quitte proprement
                    Platform.exit();
                    System.exit(1);
                });
            }
        }, "db-init");
        t.setDaemon(true);
        t.start();

        stage.setScene(scene);
        stage.show();

        stage.setOnCloseRequest(e -> DatabaseManager.close());
    }

    public static void main(String[] args) {
        launch(args);
    }
}
