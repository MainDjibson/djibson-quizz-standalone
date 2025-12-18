package com.quizgame.ui;

import com.quizgame.dao.CandidatDAO;
import com.quizgame.models.Candidat;
import javafx.geometry.Insets;
import javafx.scene.control.*;
import javafx.scene.layout.GridPane;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Optional;

public class CandidatFormController {
    private final Candidat candidat;
    private final CandidatDAO candidatDAO;

    public CandidatFormController(Candidat candidat) {
        this.candidat = candidat;
        this.candidatDAO = new CandidatDAO();
    }

    public Candidat showDialog() {
        Dialog<Candidat> dialog = new Dialog<>();
        dialog.setTitle(candidat == null ? "Nouveau candidat" : "Modifier le candidat");
        dialog.setHeaderText("Informations du candidat");

        ButtonType saveButtonType = new ButtonType("Enregistrer", ButtonBar.ButtonData.OK_DONE);
        dialog.getDialogPane().getButtonTypes().addAll(saveButtonType, ButtonType.CANCEL);

        GridPane grid = new GridPane();
        grid.setHgap(10);
        grid.setVgap(10);
        grid.setPadding(new Insets(20, 150, 10, 10));

        TextField prenomField = new TextField();
        prenomField.setPromptText("Prénom");
        TextField nomField = new TextField();
        nomField.setPromptText("Nom");
        DatePicker dateNaissancePicker = new DatePicker();

        if (candidat != null) {
            prenomField.setText(candidat.getPrenom());
            nomField.setText(candidat.getNom());
            if (candidat.getDateNaissance() != null) {
                dateNaissancePicker.setValue(candidat.getDateNaissance());
            }
        }

        grid.add(new Label("Prénom :"), 0, 0);
        grid.add(prenomField, 1, 0);
        grid.add(new Label("Nom :"), 0, 1);
        grid.add(nomField, 1, 1);
        grid.add(new Label("Date de naissance :"), 0, 2);
        grid.add(dateNaissancePicker, 1, 2);

        dialog.getDialogPane().setContent(grid);

        dialog.setResultConverter(dialogButton -> {
            if (dialogButton == saveButtonType) {
                try {
                    Candidat c = candidat != null ? candidat : new Candidat();
                    c.setPrenom(prenomField.getText());
                    c.setNom(nomField.getText());
                    c.setDateNaissance(dateNaissancePicker.getValue());

                    if (candidat == null) {
                        candidatDAO.insert(c);
                    } else {
                        candidatDAO.update(c);
                    }
                    return c;
                } catch (SQLException e) {
                    showError("Erreur", "Impossible de sauvegarder le candidat : " + e.getMessage());
                    return null;
                }
            }
            return null;
        });

        Optional<Candidat> result = dialog.showAndWait();
        return result.orElse(null);
    }

    private void showError(String title, String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }
}