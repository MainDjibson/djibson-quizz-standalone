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

public class Manche2Controller {
    private final VBox view;
    private final GameService gameService;
    private final GameFlowController gameFlow;
    
    private List<Question> questions;
    private int currentQuestionIndex = 0;
    private int currentSerie = 0;
    private int bestSerie = 0;
    private int totalCorrect = 0;
    
    private Label questionLabel;
    private TextField answerField;
    private Label timerLabel;
    private Label feedbackLabel;
    private Label serieLabel;
    private Label bestSerieLabel;
    private Button validateButton;
    
    private Timeline globalTimer;
    private int globalTimeRemaining;

    public Manche2Controller(GameService gameService, GameFlowController gameFlow) {
        this.gameService = gameService;
        this.gameFlow = gameFlow;
        this.view = createView();
        loadQuestions();
        startGlobalTimer();
        displayQuestion();
    }

    private VBox createView() {
        VBox root = new VBox(20);
        root.setAlignment(Pos.TOP_CENTER);
        root.setPadding(new Insets(30));
        root.setStyle("-fx-background-color: linear-gradient(to bottom, #1e3c72, #2a5298);");

        // Titre
        Label titleLabel = new Label("Manche 2 : 4 à la Suite");
        titleLabel.setFont(Font.font("Arial", FontWeight.BOLD, 32));
        titleLabel.setStyle("-fx-text-fill: white;");

        // Timer global
        timerLabel = new Label("Temps restant : 120s");
        timerLabel.setFont(Font.font("Arial", FontWeight.BOLD, 24));
        timerLabel.setStyle("-fx-text-fill: #ffcc00;");

        // Informations série
        HBox serieBox = new HBox(30);
        serieBox.setAlignment(Pos.CENTER);
        
        serieLabel = new Label("Série actuelle : 0");
        serieLabel.setFont(Font.font("Arial", FontWeight.BOLD, 20));
        serieLabel.setStyle("-fx-text-fill: #4CAF50;");
        
        bestSerieLabel = new Label("Meilleure série : 0");
        bestSerieLabel.setFont(Font.font("Arial", FontWeight.BOLD, 20));
        bestSerieLabel.setStyle("-fx-text-fill: white;");
        
        serieBox.getChildren().addAll(serieLabel, bestSerieLabel);

        // Question
        questionLabel = new Label("");
        questionLabel.setFont(Font.font("Arial", FontWeight.BOLD, 26));
        questionLabel.setStyle("-fx-text-fill: white;");
        questionLabel.setWrapText(true);
        questionLabel.setMaxWidth(800);

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
            "-fx-background-color: #4CAF50; " +
            "-fx-text-fill: white; " +
            "-fx-background-radius: 10; " +
            "-fx-cursor: hand;"
        );
        validateButton.setOnAction(e -> validateAnswer());

        // Feedback
        feedbackLabel = new Label("");
        feedbackLabel.setFont(Font.font("Arial", FontWeight.BOLD, 18));
        feedbackLabel.setWrapText(true);
        feedbackLabel.setMaxWidth(800);

        root.getChildren().addAll(titleLabel, timerLabel, serieBox, questionLabel, answerField, validateButton, feedbackLabel);
        return root;
    }

    private void loadQuestions() {
        try {
            questions = gameService.getQuestionsForManche(2);
            int maxQuestions = gameService.getNbQuestionsManche2();
            if (questions.size() > maxQuestions) {
                questions = questions.subList(0, maxQuestions);
            }
        } catch (SQLException e) {
            feedbackLabel.setText("Erreur : " + e.getMessage());
            feedbackLabel.setStyle("-fx-text-fill: red;");
        }
    }

    private void startGlobalTimer() {
        try {
            globalTimeRemaining = gameService.getChronoManche2Secondes();
        } catch (SQLException e) {
            globalTimeRemaining = 120;
        }

        globalTimer = new Timeline(new KeyFrame(Duration.seconds(1), e -> {
            globalTimeRemaining--;
            timerLabel.setText("Temps restant : " + globalTimeRemaining + "s");
            
            if (globalTimeRemaining <= 30) {
                timerLabel.setStyle("-fx-text-fill: #f44336; -fx-font-weight: bold;");
            }
            
            if (globalTimeRemaining <= 0) {
                globalTimer.stop();
                endManche();
            }
        }));
        globalTimer.setCycleCount(Timeline.INDEFINITE);
        globalTimer.play();
    }

    private void displayQuestion() {
        if (currentQuestionIndex >= questions.size()) {
            // Recommencer les questions si nécessaire
            currentQuestionIndex = 0;
        }

        Question q = questions.get(currentQuestionIndex);
        questionLabel.setText("Question " + (currentQuestionIndex + 1) + " : " + q.getLibelle());
        answerField.clear();
        answerField.setDisable(false);
        validateButton.setDisable(false);
        feedbackLabel.setText("");
        
        Platform.runLater(() -> answerField.requestFocus());
    }

    private void validateAnswer() {
        if (answerField.isDisabled() || globalTimeRemaining <= 0) return;
        
        answerField.setDisable(true);
        validateButton.setDisable(true);

        Question q = questions.get(currentQuestionIndex);
        String userAnswer = answerField.getText().trim();

        try {
            Reponse correctAnswer = gameService.getCorrectAnswer(q.getId());
            if (correctAnswer != null && FuzzyMatchService.isAnswerCorrect(userAnswer, correctAnswer.getLibelle())) {
                // Bonne réponse
                currentSerie++;
                totalCorrect++;
                if (currentSerie > bestSerie) {
                    bestSerie = currentSerie;
                }
                
                feedbackLabel.setText("✓ Bonne réponse !");
                feedbackLabel.setStyle("-fx-text-fill: #4CAF50;");
                
                // Vérifier si on a atteint la série requise
                try {
                    int serieRequise = gameService.getSerieRequiseManche2();
                    if (currentSerie >= serieRequise) {
                        globalTimer.stop();
                        feedbackLabel.setText("🎉 Série de " + serieRequise + " atteinte ! Manche réussie !");
                        Timeline delay = new Timeline(new KeyFrame(Duration.seconds(2), e -> endManche()));
                        delay.play();
                        return;
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                
            } else {
                // Mauvaise réponse
                currentSerie = 0;
                feedbackLabel.setText("✗ Mauvaise réponse. La réponse était : " + 
                    (correctAnswer != null ? correctAnswer.getLibelle() : "N/A") + " - Série remise à zéro !");
                feedbackLabel.setStyle("-fx-text-fill: #f44336;");
            }
            
            updateSerieLabels();
        } catch (SQLException e) {
            feedbackLabel.setText("Erreur : " + e.getMessage());
            feedbackLabel.setStyle("-fx-text-fill: red;");
        }

        // Passer à la question suivante après 1.5 secondes
        Timeline delay = new Timeline(new KeyFrame(Duration.seconds(1.5), e -> {
            currentQuestionIndex++;
            displayQuestion();
        }));
        delay.play();
    }

    private void updateSerieLabels() {
        serieLabel.setText("Série actuelle : " + currentSerie);
        bestSerieLabel.setText("Meilleure série : " + bestSerie);
    }

    private void endManche() {
        if (globalTimer != null) {
            globalTimer.stop();
        }
        gameFlow.onManche2Complete(totalCorrect, bestSerie);
    }

    public VBox getView() {
        return view;
    }
}
