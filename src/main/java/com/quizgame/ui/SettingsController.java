package com.quizgame.ui;

import com.quizgame.QuizGameApp;
import com.quizgame.dao.ParametreJeuDAO;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;

import java.sql.SQLException;

public class SettingsController {
    private final BorderPane view;
    private final ParametreJeuDAO parametreDAO;

    public SettingsController() {
        this.parametreDAO = new ParametreJeuDAO();
        this.view = createView();
    }

    private BorderPane createView() {
        BorderPane root = new BorderPane();
        root.setStyle("-fx-background-color: #f5f5f5;");

        // Header
        VBox header = new VBox(10);
        header.setPadding(new Insets(20));
        header.setAlignment(Pos.CENTER);
        header.setStyle("-fx-background-color: #1e3c72;");

        Label title = new Label("Paramètres du Jeu");
        title.setFont(Font.font("Arial", FontWeight.BOLD, 32));
        title.setStyle("-fx-text-fill: white;");
        header.getChildren().add(title);

        // Form
        GridPane form = new GridPane();
        form.setHgap(10);
        form.setVgap(15);
        form.setPadding(new Insets(30));
        form.setAlignment(Pos.CENTER);

        int row = 0;

        // Sons
        CheckBox sonsCheckbox = new CheckBox();
        try {
            sonsCheckbox.setSelected(parametreDAO.getValeurBoolean("sons_actives", true));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        addRow(form, row++, "Sons activés :", sonsCheckbox);

        // Manche 1
        addSectionTitle(form, row++, "Manche 1 - 9 points gagnants");
        
        TextField pointsCible1 = new TextField();
        pointsCible1.setText(getParam("points_manche1_cible", "9"));
        addRow(form, row++, "Points cible :", pointsCible1);

        TextField nbQuestions1 = new TextField();
        nbQuestions1.setText(getParam("nb_questions_manche1", "10"));
        addRow(form, row++, "Nombre de questions :", nbQuestions1);

        TextField temps1 = new TextField();
        temps1.setText(getParam("temps_manche1_par_question", "15"));
        addRow(form, row++, "Temps par question (sec) :", temps1);

        // Manche 2
        addSectionTitle(form, row++, "Manche 2 - 4 à la suite");
        
        TextField nbQuestions2 = new TextField();
        nbQuestions2.setText(getParam("nb_questions_manche2", "12"));
        addRow(form, row++, "Nombre de questions :", nbQuestions2);

        TextField chrono2 = new TextField();
        chrono2.setText(getParam("chrono_manche2_secondes", "120"));
        addRow(form, row++, "Chrono global (sec) :", chrono2);

        TextField serieRequise2 = new TextField();
        serieRequise2.setText(getParam("serie_requise_manche2", "4"));
        addRow(form, row++, "Série requise :", serieRequise2);

        TextField serieMin2 = new TextField();
        serieMin2.setText(getParam("serie_minimale_manche2", "3"));
        addRow(form, row++, "Série minimale pour passage :", serieMin2);

        // Manche 3
        addSectionTitle(form, row++, "Manche 3 - Duo / Carré / Cash");
        
        TextField nbQuestions3 = new TextField();
        nbQuestions3.setText(getParam("nb_questions_manche3", "10"));
        addRow(form, row++, "Nombre de questions :", nbQuestions3);

        TextField scoreRequis3 = new TextField();
        scoreRequis3.setText(getParam("score_requis_manche3", "15"));
        addRow(form, row++, "Score requis :", scoreRequis3);

        // Finale
        addSectionTitle(form, row++, "Finale");
        
        TextField nbQuestionsFinale = new TextField();
        nbQuestionsFinale.setText(getParam("nb_questions_finale", "10"));
        addRow(form, row++, "Nombre de questions :", nbQuestionsFinale);

        TextField scoreRequisFinale = new TextField();
        scoreRequisFinale.setText(getParam("score_requis_finale", "6"));
        addRow(form, row++, "Score requis :", scoreRequisFinale);

        ScrollPane scrollPane = new ScrollPane(form);
        scrollPane.setFitToWidth(true);

        // Buttons
        HBox buttonBox = new HBox(10);
        buttonBox.setPadding(new Insets(20));
        buttonBox.setAlignment(Pos.CENTER);

        Button btnSave = new Button("Enregistrer");
        Button btnCancel = new Button("Annuler");

        styleButton(btnSave, "#4CAF50");
        styleButton(btnCancel, "#9E9E9E");

        btnSave.setOnAction(e -> {
            try {
                parametreDAO.upsert("sons_actives", String.valueOf(sonsCheckbox.isSelected()));
                parametreDAO.upsert("points_manche1_cible", pointsCible1.getText());
                parametreDAO.upsert("nb_questions_manche1", nbQuestions1.getText());
                parametreDAO.upsert("temps_manche1_par_question", temps1.getText());
                parametreDAO.upsert("nb_questions_manche2", nbQuestions2.getText());
                parametreDAO.upsert("chrono_manche2_secondes", chrono2.getText());
                parametreDAO.upsert("serie_requise_manche2", serieRequise2.getText());
                parametreDAO.upsert("serie_minimale_manche2", serieMin2.getText());
                parametreDAO.upsert("nb_questions_manche3", nbQuestions3.getText());
                parametreDAO.upsert("score_requis_manche3", scoreRequis3.getText());
                parametreDAO.upsert("nb_questions_finale", nbQuestionsFinale.getText());
                parametreDAO.upsert("score_requis_finale", scoreRequisFinale.getText());

                showInfo("Succès", "Paramètres enregistrés avec succès !");
                goBack();
            } catch (SQLException ex) {
                showError("Erreur", "Impossible de sauvegarder les paramètres : " + ex.getMessage());
            }
        });

        btnCancel.setOnAction(e -> goBack());

        buttonBox.getChildren().addAll(btnSave, btnCancel);

        root.setTop(header);
        root.setCenter(scrollPane);
        root.setBottom(buttonBox);

        return root;
    }

    private String getParam(String cle, String defaut) {
        try {
            return parametreDAO.getValeur(cle, defaut);
        } catch (SQLException e) {
            return defaut;
        }
    }

    private void addRow(GridPane grid, int row, String label, Control control) {
        Label lbl = new Label(label);
        lbl.setFont(Font.font("Arial", FontWeight.NORMAL, 14));
        grid.add(lbl, 0, row);
        grid.add(control, 1, row);
    }

    private void addSectionTitle(GridPane grid, int row, String title) {
        Label lbl = new Label(title);
        lbl.setFont(Font.font("Arial", FontWeight.BOLD, 16));
        lbl.setStyle("-fx-text-fill: #1e3c72;");
        grid.add(lbl, 0, row, 2, 1);
    }

    private void styleButton(Button btn, String color) {
        btn.setPrefWidth(150);
        btn.setPrefHeight(40);
        btn.setStyle(
            "-fx-background-color: " + color + "; " +
            "-fx-text-fill: white; " +
            "-fx-font-size: 14px; " +
            "-fx-font-weight: bold; " +
            "-fx-background-radius: 5; " +
            "-fx-cursor: hand;"
        );
    }

    private void goBack() {
        MainMenuController mainMenu = new MainMenuController();
        Scene scene = new Scene(mainMenu.getView(), 1024, 768);
        QuizGameApp.primaryStage.setScene(scene);
    }

    private void showError(String title, String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

    private void showInfo(String title, String message) {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

    public BorderPane getView() {
        return view;
    }
}
