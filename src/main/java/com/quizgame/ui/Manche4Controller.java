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
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.util.Duration;

import java.util.List;

public class Manche4Controller {
    private final VBox view;
    private final GameService gameService;
    private final GameFlowController gameFlow;
    
    private List<Question> questions;
    private int currentQuestionIndex = 0;
    private int score = 0;
    
    private Label questionLabel;
    private TextField answerField;
    private Label feedbackLabel;
    private Label scoreLabel;
    private Button validateButton;

    public Manche4Controller(GameService gameService, GameFlowController gameFlow) {
        this.gameService = gameService;
        this.gameFlow = gameFlow;
        this.view = createView();
        loadQuestions();
        displayQuestion();
    }

    private VBox createView() {
        VBox root = new VBox(25);
        root.setAlignment(Pos.TOP_CENTER);
        root.setPadding(new Insets(30));
        root.setStyle("-fx-background-color: linear-gradient(to bottom, #1e3c72, #2a5298);");

        // Titre
        Label titleLabel = new Label("🏆 FINALE 🏆");
        titleLabel.setFont(Font.font("Arial", FontWeight.BOLD, 40));
        titleLabel.setStyle("-fx-text-fill: #ffd700;");

        Label subtitleLabel = new Label("Énigmes très difficiles");
        subtitleLabel.setFont(Font.font("Arial", FontWeight.BOLD, 24));
        subtitleLabel.setStyle("-fx-text-fill: white;");

        // Score
        scoreLabel = new Label("Bonnes réponses : 0 / 10");
        scoreLabel.setFont(Font.font("Arial", FontWeight.BOLD, 22));
        scoreLabel.setStyle("-fx-text-fill: #ffcc00;");

        // Question
        questionLabel = new Label("");
        questionLabel.setFont(Font.font("Arial", FontWeight.BOLD, 24));
        questionLabel.setStyle("-fx-text-fill: white;");
        questionLabel.setWrapText(true);
        questionLabel.setMaxWidth(800);
        questionLabel.setAlignment(Pos.CENTER);

        // Champ de réponse
        answerField = new TextField();
        answerField.setPromptText("Votre réponse");
        answerField.setFont(Font.font("Arial", 20));
        answerField.setMaxWidth(600);
        answerField.setOnAction(e -> validateAnswer());

        // Bouton valider
        validateButton = new Button("Valider");
        validateButton.setPrefWidth(200);
        validateButton.setPrefHeight(50);
        validateButton.setFont(Font.font("Arial", FontWeight.BOLD, 18));
        validateButton.setStyle(
            "-fx-background-color: #ffd700; " +
            "-fx-text-fill: #1e3c72; " +
            "-fx-background-radius: 10; " +
            "-fx-cursor: hand;"
        );
        validateButton.setOnAction(e -> validateAnswer());

        // Feedback
        feedbackLabel = new Label("");
        feedbackLabel.setFont(Font.font("Arial", FontWeight.BOLD, 20));
        feedbackLabel.setWrapText(true);
        feedbackLabel.setMaxWidth(800);

        root.getChildren().addAll(titleLabel, subtitleLabel, scoreLabel, questionLabel, answerField, validateButton, feedbackLabel);
        return root;
    }

    private void loadQuestions() {
        try {
            questions = gameService.getQuestionsForManche(4);
            int maxQuestions = gameService.getNbQuestionsFinale();
            if (questions.size() > maxQuestions) {
                questions = questions.subList(0, maxQuestions);
            }
        } catch (Exception e) {
            feedbackLabel.setText("Erreur : " + e.getMessage());
            feedbackLabel.setStyle("-fx-text-fill: red;");
        }
    }

    private void displayQuestion() {
        if (currentQuestionIndex >= questions.size()) {
            endManche();
            return;
        }

        Question q = questions.get(currentQuestionIndex);
        questionLabel.setText("Énigme " + (currentQuestionIndex + 1) + " :\n" + q.getLibelle());
        answerField.clear();
        answerField.setDisable(false);
        validateButton.setDisable(false);
        feedbackLabel.setText("");
        
        try {
            int scoreRequis = gameService.getScoreRequisFinale();
            scoreLabel.setText("Bonnes réponses : " + score + " / " + questions.size() + " (minimum : " + scoreRequis + ")");
        } catch (Exception e) {
            scoreLabel.setText("Bonnes réponses : " + score + " / " + questions.size());
        }
        
        Platform.runLater(() -> answerField.requestFocus());
    }

    private void validateAnswer() {
        if (answerField.isDisabled()) return;
        
        answerField.setDisable(true);
        validateButton.setDisable(true);

        Question q = questions.get(currentQuestionIndex);
        String userAnswer = answerField.getText().trim();

        try {
            Reponse correctAnswer = gameService.getCorrectAnswer(q.getId());
            if (correctAnswer != null && FuzzyMatchService.isAnswerCorrect(userAnswer, correctAnswer.getLibelle())) {
                // Bonne réponse
                score++;
                feedbackLabel.setText("✓ Excellente réponse !");
                feedbackLabel.setStyle("-fx-text-fill: #4CAF50; -fx-font-size: 22px;");
            } else {
                // Mauvaise réponse
                feedbackLabel.setText("✗ Incorrect. La réponse était : " + 
                    (correctAnswer != null ? correctAnswer.getLibelle() : "N/A"));
                feedbackLabel.setStyle("-fx-text-fill: #f44336; -fx-font-size: 18px;");
            }
        } catch (Exception e) {
            feedbackLabel.setText("Erreur : " + e.getMessage());
            feedbackLabel.setStyle("-fx-text-fill: red;");
        }

        // Passer à la question suivante après 2.5 secondes
        Timeline delay = new Timeline(new KeyFrame(Duration.seconds(2.5), e -> {
            currentQuestionIndex++;
            displayQuestion();
        }));
        delay.play();
    }

    private void endManche() {
        gameFlow.onFinaleComplete(score);
    }

    public VBox getView() {
        return view;
    }
}
