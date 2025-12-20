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
    private int serieRequise = 4; // Par défaut pour le "4 à la suite"
    
    private Label questionLabel;
    private TextField answerField;
    private Label timerLabel;
    private Label feedbackLabel;
    private Label bestSerieLabel;
    private VBox scoreBarsBox; // Le conteneur de barres copié de la Manche 1
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

        // Meilleure série (affichée en haut)
        bestSerieLabel = new Label("Meilleure série : 0");
        bestSerieLabel.setFont(Font.font("Arial", FontWeight.BOLD, 20));
        bestSerieLabel.setStyle("-fx-text-fill: white;");

        // --- ZONE DE JEU (Question à gauche, Barres à droite) ---
        HBox gameArea = new HBox(50);
        gameArea.setAlignment(Pos.CENTER);

        // Zone Question (Gauche)
        VBox questionArea = new VBox(20);
        questionArea.setAlignment(Pos.CENTER);
        questionArea.setPrefWidth(700);

        questionLabel = new Label("");
        questionLabel.setFont(Font.font("Arial", FontWeight.BOLD, 26));
        questionLabel.setStyle("-fx-text-fill: white;");
        questionLabel.setWrapText(true);
        questionLabel.setMinHeight(100);
        questionLabel.setAlignment(Pos.CENTER);

        answerField = new TextField();
        answerField.setPromptText("Votre réponse");
        answerField.setFont(Font.font("Arial", 20));
        answerField.setMaxWidth(500);
        answerField.setOnAction(e -> validateAnswer());

        validateButton = new Button("Valider");
        validateButton.setPrefWidth(200);
        validateButton.setPrefHeight(50);
        validateButton.setFont(Font.font("Arial", FontWeight.BOLD, 18));
        validateButton.setStyle("-fx-background-color: #4CAF50; -fx-text-fill: white; -fx-background-radius: 10; -fx-cursor: hand;");
        validateButton.setOnAction(e -> validateAnswer());

        feedbackLabel = new Label("");
        feedbackLabel.setFont(Font.font("Arial", FontWeight.BOLD, 18));
        feedbackLabel.setWrapText(true);

        questionArea.getChildren().addAll(questionLabel, answerField, validateButton, feedbackLabel);

        // Zone Barres de Score (Droite - Logique copiée de Manche 1)
        scoreBarsBox = new VBox(10);
        scoreBarsBox.setAlignment(Pos.BOTTOM_CENTER);
        scoreBarsBox.setPadding(new Insets(10));
        scoreBarsBox.setStyle("-fx-background-color: rgba(0,0,0,0.2); -fx-background-radius: 15;");

        gameArea.getChildren().addAll(questionArea, scoreBarsBox);
        // -------------------------------------------------------

        root.getChildren().addAll(titleLabel, timerLabel, bestSerieLabel, gameArea);
        return root;
    }

    private void loadQuestions() {
        try {
            questions = gameService.getQuestionsForManche(2);
            serieRequise = gameService.getSerieRequiseManche2();
            
            int maxQuestions = gameService.getNbQuestionsManche2();
            if (questions.size() > maxQuestions) {
                questions = questions.subList(0, maxQuestions);
            }
            updateScoreBars(); // Initialisation des barres
        } catch (Exception e) {
            feedbackLabel.setText("Erreur : " + e.getMessage());
            feedbackLabel.setStyle("-fx-text-fill: red;");
        }
    }

    private void startGlobalTimer() {
        try {
            globalTimeRemaining = gameService.getChronoManche2Secondes();
        } catch (Exception e) {
            globalTimeRemaining = 120;
        }

        globalTimer = new Timeline(new KeyFrame(Duration.seconds(1), e -> {
            globalTimeRemaining--;
            timerLabel.setText("Temps restant : " + globalTimeRemaining + "s");
            if (globalTimeRemaining <= 30) timerLabel.setStyle("-fx-text-fill: #f44336; -fx-font-weight: bold;");
            if (globalTimeRemaining <= 0) {
                globalTimer.stop();
                endManche();
            }
        }));
        globalTimer.setCycleCount(Timeline.INDEFINITE);
        globalTimer.play();
    }

    private void displayQuestion() {
        if (currentQuestionIndex >= questions.size()) currentQuestionIndex = 0;

        Question q = questions.get(currentQuestionIndex);
        questionLabel.setText(q.getLibelle());
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
                currentSerie++;
                totalCorrect++;
                if (currentSerie > bestSerie) bestSerie = currentSerie;
                
                feedbackLabel.setText("✓ Bonne réponse !");
                feedbackLabel.setStyle("-fx-text-fill: #4CAF50;");
                
                updateScoreBars();

                if (currentSerie >= serieRequise) {
                    globalTimer.stop();
                    feedbackLabel.setText("🎉 " + serieRequise + " À LA SUITE !");
                    Timeline delay = new Timeline(new KeyFrame(Duration.seconds(2), e -> endManche()));
                    delay.play();
                    return;
                }
            } else {
                currentSerie = 0; // RESET de la série
                feedbackLabel.setText("✗ " + (correctAnswer != null ? correctAnswer.getLibelle() : "N/A"));
                feedbackLabel.setStyle("-fx-text-fill: #f44336;");
                updateScoreBars();
            }
            updateBestSerieLabel();
        } catch (Exception e) {
            e.printStackTrace();
        }

        Timeline delay = new Timeline(new KeyFrame(Duration.seconds(1.2), e -> {
            currentQuestionIndex++;
            displayQuestion();
        }));
        delay.play();
    }

    // Méthode adaptée de la Manche 1 pour afficher la progression de la série
    private void updateScoreBars() {
        scoreBarsBox.getChildren().clear();
        
        Label serieTitle = new Label("SÉRIE");
        serieTitle.setFont(Font.font("Arial", FontWeight.BOLD, 16));
        serieTitle.setStyle("-fx-text-fill: white;");
        scoreBarsBox.getChildren().add(serieTitle);
        
        // On affiche les barres de bas en haut (de 1 à serieRequise)
        for (int i = serieRequise; i >= 1; i--) {
            HBox bar = new HBox();
            bar.setPrefWidth(100);
            bar.setPrefHeight(25);
            
            // Si la série actuelle est >= i, la barre s'allume en vert
            String color = (currentSerie >= i) ? "#4CAF50" : "#555555";
            bar.setStyle(
                "-fx-background-color: " + color + "; " +
                "-fx-border-color: white; " +
                "-fx-border-width: 2; " +
                "-fx-background-radius: 5; " +
                "-fx-border-radius: 5;"
            );
            
            Label numLabel = new Label(String.valueOf(i));
            numLabel.setStyle("-fx-text-fill: white; -fx-font-weight: bold;");
            numLabel.setPrefWidth(20);
            
            HBox barContainer = new HBox(10);
            barContainer.setAlignment(Pos.CENTER_LEFT);
            barContainer.getChildren().addAll(numLabel, bar);
            
            scoreBarsBox.getChildren().add(barContainer);
        }
    }

    private void updateBestSerieLabel() {
        bestSerieLabel.setText("Meilleure série : " + bestSerie);
    }

    private void endManche() {
        if (globalTimer != null) globalTimer.stop();
        gameFlow.onManche2Complete(totalCorrect, bestSerie);
    }

    public VBox getView() {
        return view;
    }
}