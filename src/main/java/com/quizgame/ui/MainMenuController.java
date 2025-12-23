package com.quizgame.ui;

import com.quizgame.QuizGameApp;
import com.quizgame.dao.CandidatDAO;
import com.quizgame.models.Candidat;
import javafx.application.Platform;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;

import java.util.List;
import java.util.Optional;

public class MainMenuController {
    private final VBox view;
    private final CandidatDAO candidatDAO;

    public MainMenuController() {
        this.candidatDAO = new CandidatDAO();
        this.view = createView();
    }

    private VBox createView() {
        VBox root = new VBox(20);
        root.setAlignment(Pos.CENTER);
        root.setPadding(new Insets(50));
        root.setStyle("-fx-background-color: linear-gradient(to bottom, #1e3c72, #2a5298);");

        // Titre principal
        Label title = new Label("Quiz Champion");
        title.setFont(Font.font("Arial", FontWeight.BOLD, 48));
        title.setStyle("-fx-text-fill: white;");

        Label subtitle = new Label("Questions pour un Champion");
        subtitle.setFont(Font.font("Arial", FontWeight.NORMAL, 24));
        subtitle.setStyle("-fx-text-fill: #ffcc00;");

        // Menu buttons
        Button btnNewGame = createMenuButton("Jouer une nouvelle partie");
        Button btnManageCandidats = createMenuButton("Gestion des candidats");
        Button btnQuestions = createMenuButton("Questions / Réponses");
        Button btnSettings = createMenuButton("Paramètres / Options");
        Button btnRules = createMenuButton("Aide / Règles du jeu");
        Button btnQuit = createMenuButton("Quitter");

        // Actions
        btnNewGame.setOnAction(e -> startNewGame());
        btnManageCandidats.setOnAction(e -> openCandidatManagement());
        btnQuestions.setOnAction(e -> openQuestionsManagement());
        btnSettings.setOnAction(e -> openSettings());
        btnRules.setOnAction(e -> showRules());
        btnQuit.setOnAction(e -> Platform.exit());

        VBox buttonBox = new VBox(15);
        buttonBox.setAlignment(Pos.CENTER);
        buttonBox.getChildren().addAll(
            btnNewGame, btnManageCandidats, btnQuestions, 
            btnSettings, btnRules, btnQuit
        );

        root.getChildren().addAll(title, subtitle, buttonBox);
        return root;
    }

    private Button createMenuButton(String text) {
        Button btn = new Button(text);
        btn.setPrefWidth(300);
        btn.setPrefHeight(50);
        btn.setFont(Font.font("Arial", FontWeight.BOLD, 16));
        btn.setStyle(
            "-fx-background-color: #ffcc00; " +
            "-fx-text-fill: #1e3c72; " +
            "-fx-background-radius: 10; " +
            "-fx-cursor: hand;"
        );
        btn.setOnMouseEntered(e -> btn.setStyle(
            "-fx-background-color: #ffd700; " +
            "-fx-text-fill: #1e3c72; " +
            "-fx-background-radius: 10; " +
            "-fx-cursor: hand; " +
            "-fx-scale-x: 1.05; -fx-scale-y: 1.05;"
        ));
        btn.setOnMouseExited(e -> btn.setStyle(
            "-fx-background-color: #ffcc00; " +
            "-fx-text-fill: #1e3c72; " +
            "-fx-background-radius: 10; " +
            "-fx-cursor: hand;"
        ));
        return btn;
    }

    private void startNewGame() {
        // Sélectionner ou créer un candidat
        Candidat candidat = selectOrCreateCandidat();
        if (candidat != null) {
            // Lancer le jeu avec les 4 manches
            GameFlowController gameFlow = new GameFlowController(candidat);
            Scene scene = new Scene(gameFlow.getView(), 1024, 768);
            QuizGameApp.primaryStage.setScene(scene);
        }
    }

    private Candidat selectOrCreateCandidat() {
        try {
            List<Candidat> candidats = candidatDAO.findAll();
            
            Dialog<Candidat> dialog = new Dialog<>();
            dialog.setTitle("Sélection du candidat");
            dialog.setHeaderText("Choisissez ou créez un candidat");

            ButtonType selectButtonType = new ButtonType("Sélectionner", ButtonBar.ButtonData.OK_DONE);
            ButtonType createButtonType = new ButtonType("Créer nouveau", ButtonBar.ButtonData.OTHER);
            ButtonType cancelButtonType = new ButtonType("Annuler", ButtonBar.ButtonData.CANCEL_CLOSE);
            dialog.getDialogPane().getButtonTypes().addAll(selectButtonType, createButtonType, cancelButtonType);

            ComboBox<Candidat> comboBox = new ComboBox<>();
            comboBox.getItems().addAll(candidats);
            if (!candidats.isEmpty()) {
                comboBox.getSelectionModel().selectFirst();
            }
            comboBox.setPrefWidth(300);

            VBox content = new VBox(10);
            content.getChildren().addAll(new Label("Candidat :"), comboBox);
            dialog.getDialogPane().setContent(content);

            dialog.setResultConverter(dialogButton -> {
                if (dialogButton == selectButtonType) {
                    return comboBox.getSelectionModel().getSelectedItem();
                } else if (dialogButton == createButtonType) {
                    return createNewCandidat();
                }
                return null;
            });

            Optional<Candidat> result = dialog.showAndWait();
            return result.orElse(null);
            
        } catch (Exception e) {
            showError("Erreur lors de la récupération des candidats", e.getMessage());
            return null;
        }
    }

    private Candidat createNewCandidat() {
        CandidatFormController form = new CandidatFormController(null);
        return form.showDialog();
    }

    private void openCandidatManagement() {
        CandidatManagementController controller = new CandidatManagementController();
        Scene scene = new Scene(controller.getView(), 1024, 768);
        QuizGameApp.primaryStage.setScene(scene);
    }

    private void openQuestionsManagement() {
        // Demander le mot de passe admin
        TextInputDialog passwordDialog = new TextInputDialog();
        passwordDialog.setTitle("Authentification Admin");
        passwordDialog.setHeaderText("Accès protégé - Administration");
        passwordDialog.setContentText("Mot de passe :");
        
        // Masquer le texte du mot de passe
        TextField textField = passwordDialog.getEditor();
        PasswordField passwordField = new PasswordField();
        passwordField.setPromptText(textField.getPromptText());
        passwordDialog.getDialogPane().setContent(new VBox(8, new Label("Mot de passe :"), passwordField));
        
        Optional<String> result = passwordDialog.showAndWait();
        result.ifPresent(password -> {
            if ("DjibsonQuizz2025".equals(passwordField.getText())) {
                // Mot de passe correct, ouvrir la page d'administration
                QuestionManagementController controller = new QuestionManagementController();
                Scene scene = new Scene(controller.getView(), 1200, 800);
                QuizGameApp.primaryStage.setScene(scene);
            } else {
                showError("Accès refusé", "Mot de passe incorrect !");
            }
        });
    }

    private void openSettings() {
        SettingsController controller = new SettingsController();
        Scene scene = new Scene(controller.getView(), 800, 600);
        QuizGameApp.primaryStage.setScene(scene);
    }

    private void showRules() {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Règles du jeu");
        alert.setHeaderText("Comment jouer à Quiz Champion ?");
        alert.setContentText(
            "Le jeu comporte 4 manches :\n\n" +
            "1. 9 POINTS GAGNANTS\n" +
            "   - Répondez à des questions de culture générale\n" +
            "   - Objectif : atteindre 9 points\n" +
            "   - Chaque question vaut 1, 2 ou 3 points\n" +
            "   - Vous avez 15 secondes par question\n\n" +
            "2. 4 À LA SUITE\n" +
            "   - Obtenez 4 bonnes réponses consécutives\n" +
            "   - Durée : 120 secondes\n" +
            "   - Une mauvaise réponse remet le compteur à zéro\n\n" +
            "3. DUO / CARRÉ / CASH\n" +
            "   - Choisissez votre mode pour chaque question\n" +
            "   - DUO : 2 réponses proposées (1 point)\n" +
            "   - CARRÉ : 4 réponses proposées (2 points)\n" +
            "   - CASH : Saisie libre (4 points)\n" +
            "   - Objectif : 15 points minimum\n\n" +
            "4. FINALE\n" +
            "   - 10 énigmes très difficiles\n" +
            "   - Objectif : 6 bonnes réponses minimum\n\n" +
            "Bonne chance !"
        );
        alert.showAndWait();
    }

    private void showError(String title, String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

    public VBox getView() {
        return view;
    }
}