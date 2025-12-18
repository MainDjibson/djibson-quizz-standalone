package com.quizgame.ui;

import com.quizgame.QuizGameApp;
import com.quizgame.models.Candidat;
import com.quizgame.services.GameService;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;

public class GameFlowController {
    private final BorderPane view;
    private final GameService gameService;
    private final Candidat candidat;
    private int currentMancheNumber = 1;
    private int[] mancheScores = new int[4]; // Scores par manche

    public GameFlowController(Candidat candidat) {
        this.candidat = candidat;
        this.gameService = new GameService();
        this.gameService.startNewGame(candidat);
        this.view = new BorderPane();
        startManche1();
    }

    private void startManche1() {
        currentMancheNumber = 1;
        Manche1Controller manche1 = new Manche1Controller(gameService, this);
        view.setCenter(manche1.getView());
    }

    public void onManche1Complete(int score) {
        mancheScores[0] = score;
        showMancheRecap(1, score, "Manche 1 terminée !", score >= getManche1Target());
    }

    private int getManche1Target() {
        try {
            return gameService.getPointsManche1Cible();
        } catch (Exception e) {
            return 9;
        }
    }

    public void onManche2Complete(int score, int bestSerie) {
        mancheScores[1] = score;
        boolean success = bestSerie >= 3; // Série minimale
        showMancheRecap(2, score, "Manche 2 terminée !", success);
    }

    public void onManche3Complete(int score) {
        mancheScores[2] = score;
        boolean success = score >= 15;
        showMancheRecap(3, score, "Manche 3 terminée !", success);
    }

    public void onFinaleComplete(int score) {
        mancheScores[3] = score;
        boolean success = score >= 6;
        showFinalRecap(success);
    }

    private void showMancheRecap(int mancheNum, int score, String title, boolean success) {
        VBox recap = new VBox(20);
        recap.setAlignment(Pos.CENTER);
        recap.setPadding(new Insets(50));
        recap.setStyle("-fx-background-color: linear-gradient(to bottom, #1e3c72, #2a5298);");

        Label titleLabel = new Label(title);
        titleLabel.setFont(Font.font("Arial", FontWeight.BOLD, 36));
        titleLabel.setStyle("-fx-text-fill: white;");

        Label statusLabel = new Label(success ? "✓ QUALIFIÉ !" : "✗ NON QUALIFIÉ");
        statusLabel.setFont(Font.font("Arial", FontWeight.BOLD, 28));
        statusLabel.setStyle(success ? "-fx-text-fill: #4CAF50;" : "-fx-text-fill: #f44336;");

        Label scoreLabel = new Label("Score de la manche : " + score + " points");
        scoreLabel.setFont(Font.font("Arial", FontWeight.NORMAL, 24));
        scoreLabel.setStyle("-fx-text-fill: #ffcc00;");

        int totalScore = 0;
        for (int s : mancheScores) {
            totalScore += s;
        }
        Label totalLabel = new Label("Score total : " + totalScore + " points");
        totalLabel.setFont(Font.font("Arial", FontWeight.NORMAL, 20));
        totalLabel.setStyle("-fx-text-fill: white;");

        Button btnNext;
        if (success && mancheNum < 4) {
            btnNext = new Button("Passer à la manche " + (mancheNum + 1));
            btnNext.setOnAction(e -> startNextManche(mancheNum + 1));
        } else if (!success) {
            btnNext = new Button("Retour au menu");
            btnNext.setOnAction(e -> returnToMenu());
        } else {
            btnNext = new Button("Retour au menu");
            btnNext.setOnAction(e -> returnToMenu());
        }

        styleButton(btnNext, "#ffcc00", "#1e3c72");

        recap.getChildren().addAll(titleLabel, statusLabel, scoreLabel, totalLabel, btnNext);
        view.setCenter(recap);
    }

    private void showFinalRecap(boolean victory) {
        VBox recap = new VBox(20);
        recap.setAlignment(Pos.CENTER);
        recap.setPadding(new Insets(50));
        recap.setStyle("-fx-background-color: linear-gradient(to bottom, #1e3c72, #2a5298);");

        Label titleLabel = new Label(victory ? "🏆 VICTOIRE !" : "Partie terminée");
        titleLabel.setFont(Font.font("Arial", FontWeight.BOLD, 48));
        titleLabel.setStyle(victory ? "-fx-text-fill: #ffd700;" : "-fx-text-fill: white;");

        Label congratsLabel = new Label(victory ? 
            "Félicitations " + candidat.getPrenom() + " !" :
            "Merci d'avoir participé " + candidat.getPrenom() + " !");
        congratsLabel.setFont(Font.font("Arial", FontWeight.NORMAL, 24));
        congratsLabel.setStyle("-fx-text-fill: white;");

        VBox scoresBox = new VBox(10);
        scoresBox.setAlignment(Pos.CENTER);
        String[] mancheNames = {"9 points gagnants", "4 à la suite", "Duo / Carré / Cash", "Finale"};
        for (int i = 0; i < 4; i++) {
            Label mancheScore = new Label("Manche " + (i+1) + " (" + mancheNames[i] + ") : " + mancheScores[i] + " pts");
            mancheScore.setFont(Font.font("Arial", FontWeight.NORMAL, 18));
            mancheScore.setStyle("-fx-text-fill: #ffcc00;");
            scoresBox.getChildren().add(mancheScore);
        }

        int totalScore = 0;
        for (int s : mancheScores) {
            totalScore += s;
        }
        Label totalLabel = new Label("Score total : " + totalScore + " points");
        totalLabel.setFont(Font.font("Arial", FontWeight.BOLD, 28));
        totalLabel.setStyle("-fx-text-fill: white;");

        Button btnMenu = new Button("Retour au menu");
        styleButton(btnMenu, "#ffcc00", "#1e3c72");
        btnMenu.setOnAction(e -> returnToMenu());

        recap.getChildren().addAll(titleLabel, congratsLabel, scoresBox, totalLabel, btnMenu);
        view.setCenter(recap);
    }

    private void startNextManche(int mancheNum) {
        currentMancheNumber = mancheNum;
        switch (mancheNum) {
            case 2:
                Manche2Controller manche2 = new Manche2Controller(gameService, this);
                view.setCenter(manche2.getView());
                break;
            case 3:
                Manche3Controller manche3 = new Manche3Controller(gameService, this);
                view.setCenter(manche3.getView());
                break;
            case 4:
                Manche4Controller manche4 = new Manche4Controller(gameService, this);
                view.setCenter(manche4.getView());
                break;
        }
    }

    private void returnToMenu() {
        MainMenuController mainMenu = new MainMenuController();
        Scene scene = new Scene(mainMenu.getView(), 1024, 768);
        QuizGameApp.primaryStage.setScene(scene);
    }

    private void styleButton(Button btn, String bgColor, String textColor) {
        btn.setPrefWidth(250);
        btn.setPrefHeight(50);
        btn.setFont(Font.font("Arial", FontWeight.BOLD, 16));
        btn.setStyle(
            "-fx-background-color: " + bgColor + "; " +
            "-fx-text-fill: " + textColor + "; " +
            "-fx-background-radius: 10; " +
            "-fx-cursor: hand;"
        );
    }

    public BorderPane getView() {
        return view;
    }
}
