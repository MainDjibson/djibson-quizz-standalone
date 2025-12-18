package com.quizgame.ui;

import com.quizgame.models.Question;
import com.quizgame.models.Reponse;
import com.quizgame.services.GameService;
import com.quizgame.utils.FuzzyMatchService;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.application.Platform;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.util.Duration;

import java.sql.SQLException;
import java.util.List;

public class Manche3Controller {
    private final VBox view;
    private final GameService gameService;
    private final GameFlowController gameFlow;
    
    private List<Question> questions;
    private int currentQuestionIndex = 0;
    private int score = 0;
    
    private Label questionLabel;
    private Label scoreLabel;
    private VBox modeSelectionBox;
    private VBox answerBox;
    private Label feedbackLabel;
    
    private String selectedMode = null; // "DUO", "CARRE", "CASH"

    public Manche3Controller(GameService gameService, GameFlowController gameFlow) {
        this.gameService = gameService;
        this.gameFlow = gameFlow;
        this.view = createView();
        loadQuestions();
        displayQuestion();
    }

    private VBox createView() {
        VBox root = new VBox(20);
        root.setAlignment(Pos.TOP_CENTER);
        root.setPadding(new Insets(30));
        root.setStyle("-fx-background-color: linear-gradient(to bottom, #1e3c72, #2a5298);");

        // Titre
        Label titleLabel = new Label("Manche 3 : DUO / CARRÉ / CASH");
        titleLabel.setFont(Font.font("Arial", FontWeight.BOLD, 32));
        titleLabel.setStyle("-fx-text-fill: white;");

        // Score
        scoreLabel = new Label("Score : 0 / 15");
        scoreLabel.setFont(Font.font("Arial", FontWeight.BOLD, 24));
        scoreLabel.setStyle("-fx-text-fill: #ffcc00;");

        // Question
        questionLabel = new Label("");
        questionLabel.setFont(Font.font("Arial", FontWeight.BOLD, 24));
        questionLabel.setStyle("-fx-text-fill: white;");
        questionLabel.setWrapText(true);
        questionLabel.setMaxWidth(800);

        // Sélection du mode
        modeSelectionBox = new VBox(15);
        modeSelectionBox.setAlignment(Pos.CENTER);

        Label modeTitle = new Label("Choisissez votre mode :");
        modeTitle.setFont(Font.font("Arial", FontWeight.BOLD, 20));
        modeTitle.setStyle("-fx-text-fill: white;");

        Button btnDuo = createModeButton("DUO", "2 réponses - 1 point", "#2196F3");
        Button btnCarre = createModeButton("CARRÉ", "4 réponses - 2 points", "#FF9800");
        Button btnCash = createModeButton("CASH", "Saisie libre - 4 points", "#4CAF50");

        btnDuo.setOnAction(e -> selectMode("DUO"));
        btnCarre.setOnAction(e -> selectMode("CARRE"));
        btnCash.setOnAction(e -> selectMode("CASH"));

        modeSelectionBox.getChildren().addAll(modeTitle, btnDuo, btnCarre, btnCash);

        // Zone de réponse
        answerBox = new VBox(10);
        answerBox.setAlignment(Pos.CENTER);
        answerBox.setVisible(false);

        // Feedback
        feedbackLabel = new Label("");
        feedbackLabel.setFont(Font.font("Arial", FontWeight.BOLD, 18));
        feedbackLabel.setWrapText(true);
        feedbackLabel.setMaxWidth(800);

        root.getChildren().addAll(titleLabel, scoreLabel, questionLabel, modeSelectionBox, answerBox, feedbackLabel);
        return root;
    }

    private Button createModeButton(String mode, String description, String color) {
        Button btn = new Button(mode + "\n" + description);
        btn.setPrefWidth(300);
        btn.setPrefHeight(80);
        btn.setFont(Font.font("Arial", FontWeight.BOLD, 18));
        btn.setStyle(
            "-fx-background-color: " + color + "; " +
            "-fx-text-fill: white; " +
            "-fx-background-radius: 10; " +
            "-fx-cursor: hand;"
        );
        return btn;
    }

    private void loadQuestions() {
        try {
            questions = gameService.getQuestionsForManche(3);
            int maxQuestions = gameService.getNbQuestionsManche3();
            if (questions.size() > maxQuestions) {
                questions = questions.subList(0, maxQuestions);
            }
        } catch (SQLException e) {
            feedbackLabel.setText("Erreur : " + e.getMessage());
            feedbackLabel.setStyle("-fx-text-fill: red;");
        }
    }

    private void displayQuestion() {
        if (currentQuestionIndex >= questions.size()) {
            endManche();
            return;
        }

        selectedMode = null;
        Question q = questions.get(currentQuestionIndex);
        questionLabel.setText("Question " + (currentQuestionIndex + 1) + " : " + q.getLibelle());
        
        modeSelectionBox.setVisible(true);
        answerBox.setVisible(false);
        answerBox.getChildren().clear();
        feedbackLabel.setText("");
        
        try {
            int scoreRequis = gameService.getScoreRequisManche3();
            scoreLabel.setText("Score : " + score + " / " + scoreRequis);
        } catch (SQLException e) {
            scoreLabel.setText("Score : " + score);
        }
    }

    private void selectMode(String mode) {
        selectedMode = mode;
        modeSelectionBox.setVisible(false);
        answerBox.setVisible(true);
        answerBox.getChildren().clear();

        Question q = questions.get(currentQuestionIndex);

        try {
            if ("DUO".equals(mode)) {
                showDuoMode(q);
            } else if ("CARRE".equals(mode)) {
                showCarreMode(q);
            } else if ("CASH".equals(mode)) {
                showCashMode(q);
            }
        } catch (SQLException e) {
            feedbackLabel.setText("Erreur : " + e.getMessage());
            feedbackLabel.setStyle("-fx-text-fill: red;");
        }
    }

    private void showDuoMode(Question q) throws SQLException {
        Label modeLabel = new Label("Mode DUO - 2 réponses");
        modeLabel.setFont(Font.font("Arial", FontWeight.BOLD, 18));
        modeLabel.setStyle("-fx-text-fill: #2196F3;");

        List<Reponse> duoReponses = gameService.getDuoReponses(q.getId());
        
        VBox optionsBox = new VBox(10);
        optionsBox.setAlignment(Pos.CENTER);
        
        for (Reponse r : duoReponses) {
            Button btnReponse = new Button(r.getLibelle());
            btnReponse.setPrefWidth(400);
            btnReponse.setPrefHeight(60);
            btnReponse.setFont(Font.font("Arial", FontWeight.NORMAL, 16));
            btnReponse.setStyle(
                "-fx-background-color: white; " +
                "-fx-text-fill: #1e3c72; " +
                "-fx-background-radius: 10; " +
                "-fx-cursor: hand;"
            );
            btnReponse.setOnAction(e -> validateMCQAnswer(r, 1));
            optionsBox.getChildren().add(btnReponse);
        }

        answerBox.getChildren().addAll(modeLabel, optionsBox);
    }

    private void showCarreMode(Question q) throws SQLException {
        Label modeLabel = new Label("Mode CARRÉ - 4 réponses");
        modeLabel.setFont(Font.font("Arial", FontWeight.BOLD, 18));
        modeLabel.setStyle("-fx-text-fill: #FF9800;");

        List<Reponse> reponses = gameService.getReponsesForQuestion(q.getId());
        
        VBox optionsBox = new VBox(10);
        optionsBox.setAlignment(Pos.CENTER);
        
        for (Reponse r : reponses) {
            Button btnReponse = new Button(r.getLibelle());
            btnReponse.setPrefWidth(400);
            btnReponse.setPrefHeight(60);
            btnReponse.setFont(Font.font("Arial", FontWeight.NORMAL, 16));
            btnReponse.setStyle(
                "-fx-background-color: white; " +
                "-fx-text-fill: #1e3c72; " +
                "-fx-background-radius: 10; " +
                "-fx-cursor: hand;"
            );
            btnReponse.setOnAction(e -> validateMCQAnswer(r, 2));
            optionsBox.getChildren().add(btnReponse);
        }

        answerBox.getChildren().addAll(modeLabel, optionsBox);
    }

    private void showCashMode(Question q) {
        Label modeLabel = new Label("Mode CASH - Saisie libre");
        modeLabel.setFont(Font.font("Arial", FontWeight.BOLD, 18));
        modeLabel.setStyle("-fx-text-fill: #4CAF50;");

        TextField answerField = new TextField();
        answerField.setPromptText("Votre réponse");
        answerField.setFont(Font.font("Arial", 18));
        answerField.setMaxWidth(500);

        Button btnValidate = new Button("Valider");
        btnValidate.setPrefWidth(200);
        btnValidate.setPrefHeight(50);
        btnValidate.setFont(Font.font("Arial", FontWeight.BOLD, 16));
        btnValidate.setStyle(
            "-fx-background-color: #4CAF50; " +
            "-fx-text-fill: white; " +
            "-fx-background-radius: 10; " +
            "-fx-cursor: hand;"
        );

        answerField.setOnAction(e -> {
            try {
                validateCashAnswer(answerField.getText(), q);
            } catch (SQLException ex) {
                feedbackLabel.setText("Erreur : " + ex.getMessage());
                feedbackLabel.setStyle("-fx-text-fill: red;");
            }
        });
        btnValidate.setOnAction(e -> {
            try {
                validateCashAnswer(answerField.getText(), q);
            } catch (SQLException ex) {
                feedbackLabel.setText("Erreur : " + ex.getMessage());
                feedbackLabel.setStyle("-fx-text-fill: red;");
            }
        });

        answerBox.getChildren().addAll(modeLabel, answerField, btnValidate);
        Platform.runLater(() -> answerField.requestFocus());
    }

    private void validateMCQAnswer(Reponse selectedReponse, int points) {
        answerBox.setVisible(false);
        
        if (selectedReponse.isJuste()) {
            score += points;
            feedbackLabel.setText("✓ Bonne réponse ! (+" + points + " pts)");
            feedbackLabel.setStyle("-fx-text-fill: #4CAF50;");
        } else {
            feedbackLabel.setText("✗ Mauvaise réponse.");
            feedbackLabel.setStyle("-fx-text-fill: #f44336;");
        }

        proceedToNextQuestion();
    }

    private void validateCashAnswer(String userAnswer, Question q) throws SQLException {
        answerBox.setVisible(false);
        
        Reponse correctAnswer = gameService.getCorrectAnswer(q.getId());
        if (correctAnswer != null && FuzzyMatchService.isAnswerCorrect(userAnswer, correctAnswer.getLibelle())) {
            score += 4;
            feedbackLabel.setText("✓ Bonne réponse ! (+4 pts)");
            feedbackLabel.setStyle("-fx-text-fill: #4CAF50;");
        } else {
            feedbackLabel.setText("✗ Mauvaise réponse. La réponse était : " + 
                (correctAnswer != null ? correctAnswer.getLibelle() : "N/A"));
            feedbackLabel.setStyle("-fx-text-fill: #f44336;");
        }

        proceedToNextQuestion();
    }

    private void proceedToNextQuestion() {
        Timeline delay = new Timeline(new KeyFrame(Duration.seconds(2), e -> {
            currentQuestionIndex++;
            displayQuestion();
        }));
        delay.play();
    }

    private void endManche() {
        gameFlow.onManche3Complete(score);
    }

    public VBox getView() {
        return view;
    }
}
