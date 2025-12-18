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
import javafx.scene.layout.*;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.util.Duration;

import java.sql.SQLException;
import java.util.List;

public class Manche1Controller {
    private final VBox view;
    private final GameService gameService;
    private final GameFlowController gameFlow;
    
    private List<Question> questions;
    private int currentQuestionIndex = 0;
    private int score = 0;
    private int targetScore = 9;
    
    private Label questionLabel;
    private TextField answerField;
    private Label timerLabel;
    private Label feedbackLabel;
    private VBox scoreBarsBox;
    private Button validateButton;
    
    private Timeline timer;
    private int timeRemaining;

    public Manche1Controller(GameService gameService, GameFlowController gameFlow) {
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
        Label titleLabel = new Label("Manche 1 : 9 Points Gagnants");
        titleLabel.setFont(Font.font("Arial", FontWeight.BOLD, 32));
        titleLabel.setStyle("-fx-text-fill: white;");

        // Timer
        timerLabel = new Label("Temps : 15s");
        timerLabel.setFont(Font.font("Arial", FontWeight.BOLD, 24));
        timerLabel.setStyle("-fx-text-fill: #ffcc00;");

        // Question
        questionLabel = new Label("");
        questionLabel.setFont(Font.font("Arial", FontWeight.BOLD, 28));
        questionLabel.setStyle("-fx-text-fill: white;");
        questionLabel.setWrapText(true);
        questionLabel.setMaxWidth(800);

        // Champ de réponse
        answerField = new TextField();
        answerField.setPromptText("Votre réponse");
        answerField.setFont(Font.font("Arial", 20));
        answerField.setMaxWidth(600);
        answerField.setStyle("-fx-font-size: 20px;");
        
        // Validation par Entrée
        answerField.setOnAction(e -> validateAnswer());

        // Bouton valider
        validateButton = new Button("Valider");
        validateButton.setPrefWidth(200);
        validateButton.setPrefHeight(50);
        validateButton.setFont(Font.font("Arial", FontWeight.BOLD, 18));
        validateButton.setStyle(
            "-fx-background-color: #4CAF50; " +
            "-fx-text-fill: white; " +
            "-fx-background-radius: 10; " +
            "-fx-cursor: hand;"
        );
        validateButton.setOnAction(e -> validateAnswer());

        // Feedback
        feedbackLabel = new Label("");
        feedbackLabel.setFont(Font.font("Arial", FontWeight.BOLD, 20));
        feedbackLabel.setWrapText(true);
        feedbackLabel.setMaxWidth(800);

        // Barres de score verticales
        scoreBarsBox = new VBox(5);
        scoreBarsBox.setAlignment(Pos.BOTTOM_CENTER);
        scoreBarsBox.setPrefHeight(200);
        
        HBox gameArea = new HBox(30);
        gameArea.setAlignment(Pos.CENTER);
        
        VBox questionArea = new VBox(15);
        questionArea.setAlignment(Pos.CENTER);
        questionArea.getChildren().addAll(questionLabel, answerField, validateButton, feedbackLabel);
        
        gameArea.getChildren().addAll(questionArea, scoreBarsBox);

        root.getChildren().addAll(titleLabel, timerLabel, gameArea);
        return root;
    }

    private void loadQuestions() {
        try {
            questions = gameService.getQuestionsForManche(1);
            targetScore = gameService.getPointsManche1Cible();
            
            // Limiter au nombre configuré
            int maxQuestions = gameService.getNbQuestionsManche1();
            if (questions.size() > maxQuestions) {
                questions = questions.subList(0, maxQuestions);
            }
            
            updateScoreBars();
        } catch (SQLException e) {
            feedbackLabel.setText("Erreur : " + e.getMessage());
            feedbackLabel.setStyle("-fx-text-fill: red;");
        }
    }

    private void displayQuestion() {
        if (currentQuestionIndex >= questions.size() || score >= targetScore) {
            endManche();
            return;
        }

        Question q = questions.get(currentQuestionIndex);
        questionLabel.setText("Question " + (currentQuestionIndex + 1) + " (" + q.getPoints() + " pt) : " + q.getLibelle());
        answerField.clear();
        answerField.setDisable(false);
        validateButton.setDisable(false);
        feedbackLabel.setText("");
        
        // Focus automatique sur le champ de réponse
        Platform.runLater(() -> answerField.requestFocus());

        // Démarrer le timer
        try {
            timeRemaining = gameService.getTempsManche1ParQuestion();
        } catch (SQLException e) {
            timeRemaining = 15;
        }
        startTimer();
    }

    private void startTimer() {
        if (timer != null) {
            timer.stop();
        }

        timer = new Timeline(new KeyFrame(Duration.seconds(1), e -> {
            timeRemaining--;
            timerLabel.setText("Temps : " + timeRemaining + "s");
            
            if (timeRemaining <= 5) {
                timerLabel.setStyle("-fx-text-fill: #f44336; -fx-font-weight: bold;");
            }
            
            if (timeRemaining <= 0) {
                timer.stop();
                onTimeOut();
            }
        }));
        timer.setCycleCount(Timeline.INDEFINITE);
        timer.play();
    }

    private void validateAnswer() {
        if (answerField.isDisabled()) return;
        
        timer.stop();
        answerField.setDisable(true);
        validateButton.setDisable(true);

        Question q = questions.get(currentQuestionIndex);
        String userAnswer = answerField.getText().trim();

        try {
            Reponse correctAnswer = gameService.getCorrectAnswer(q.getId());
            if (correctAnswer != null && FuzzyMatchService.isAnswerCorrect(userAnswer, correctAnswer.getLibelle())) {
                // Bonne réponse
                score += q.getPoints();
                feedbackLabel.setText("✓ Bonne réponse ! (+" + q.getPoints() + " pt)");
                feedbackLabel.setStyle("-fx-text-fill: #4CAF50;");
                updateScoreBars();
            } else {
                // Mauvaise réponse
                feedbackLabel.setText("✗ Mauvaise réponse. La réponse était : " + 
                    (correctAnswer != null ? correctAnswer.getLibelle() : "N/A"));
                feedbackLabel.setStyle("-fx-text-fill: #f44336;");
            }
        } catch (SQLException e) {
            feedbackLabel.setText("Erreur : " + e.getMessage());
            feedbackLabel.setStyle("-fx-text-fill: red;");
        }

        // Passer à la question suivante après 2 secondes
        Timeline delay = new Timeline(new KeyFrame(Duration.seconds(2), e -> {
            currentQuestionIndex++;
            displayQuestion();
        }));
        delay.play();
    }

    private void onTimeOut() {
        answerField.setDisable(true);
        validateButton.setDisable(true);
        
        feedbackLabel.setText("⏱ Temps écoulé !");
        feedbackLabel.setStyle("-fx-text-fill: #ff9800;");

        Question q = questions.get(currentQuestionIndex);
        try {
            Reponse correctAnswer = gameService.getCorrectAnswer(q.getId());
            if (correctAnswer != null) {
                feedbackLabel.setText(feedbackLabel.getText() + " La réponse était : " + correctAnswer.getLibelle());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Passer à la question suivante après 2 secondes
        Timeline delay = new Timeline(new KeyFrame(Duration.seconds(2), e -> {
            currentQuestionIndex++;
            displayQuestion();
        }));
        delay.play();
    }

    private void updateScoreBars() {
        scoreBarsBox.getChildren().clear();
        
        Label scoreTitle = new Label("Score : " + score + " / " + targetScore);
        scoreTitle.setFont(Font.font("Arial", FontWeight.BOLD, 18));
        scoreTitle.setStyle("-fx-text-fill: white;");
        scoreBarsBox.getChildren().add(scoreTitle);
        
        // Créer 9 barres (ou targetScore)
        for (int i = targetScore; i >= 1; i--) {
            HBox bar = new HBox();
            bar.setPrefWidth(80);
            bar.setPrefHeight(15);
            bar.setStyle(
                "-fx-background-color: " + (score >= i ? "#4CAF50" : "#cccccc") + "; " +
                "-fx-border-color: white; " +
                "-fx-border-width: 2;"
            );
            
            Label pointLabel = new Label(String.valueOf(i));
            pointLabel.setStyle("-fx-text-fill: white;");
            pointLabel.setPrefWidth(30);
            
            HBox barContainer = new HBox(5);
            barContainer.setAlignment(Pos.CENTER_LEFT);
            barContainer.getChildren().addAll(pointLabel, bar);
            
            scoreBarsBox.getChildren().add(barContainer);
        }
    }

    private void endManche() {
        if (timer != null) {
            timer.stop();
        }
        gameFlow.onManche1Complete(score);
    }

    public VBox getView() {
        return view;
    }
}
