package com.quizgame.ui;

import com.quizgame.QuizGameApp;
import com.quizgame.dao.CandidatDAO;
import com.quizgame.models.Candidat;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.*;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;

import java.sql.SQLException;
import java.time.LocalDate;

public class CandidatManagementController {
    private final BorderPane view;
    private final CandidatDAO candidatDAO;
    private final TableView<Candidat> tableView;
    private final ObservableList<Candidat> candidatList;

    public CandidatManagementController() {
        this.candidatDAO = new CandidatDAO();
        this.candidatList = FXCollections.observableArrayList();
        this.tableView = new TableView<>();
        this.view = createView();
        loadCandidats();
    }

    private BorderPane createView() {
        BorderPane root = new BorderPane();
        root.setStyle("-fx-background-color: #f5f5f5;");

        // Header
        VBox header = new VBox(10);
        header.setPadding(new Insets(20));
        header.setAlignment(Pos.CENTER);
        header.setStyle("-fx-background-color: #1e3c72;");

        Label title = new Label("Gestion des Candidats");
        title.setFont(Font.font("Arial", FontWeight.BOLD, 32));
        title.setStyle("-fx-text-fill: white;");
        header.getChildren().add(title);

        // Table
        TableColumn<Candidat, Integer> idCol = new TableColumn<>("ID");
        idCol.setCellValueFactory(new PropertyValueFactory<>("id"));
        idCol.setPrefWidth(50);

        TableColumn<Candidat, String> prenomCol = new TableColumn<>("Prénom");
        prenomCol.setCellValueFactory(new PropertyValueFactory<>("prenom"));
        prenomCol.setPrefWidth(200);

        TableColumn<Candidat, String> nomCol = new TableColumn<>("Nom");
        nomCol.setCellValueFactory(new PropertyValueFactory<>("nom"));
        nomCol.setPrefWidth(200);

        TableColumn<Candidat, LocalDate> dateCol = new TableColumn<>("Date de naissance");
        dateCol.setCellValueFactory(new PropertyValueFactory<>("dateNaissance"));
        dateCol.setPrefWidth(200);

        tableView.getColumns().addAll(idCol, prenomCol, nomCol, dateCol);
        tableView.setItems(candidatList);

        // Buttons
        HBox buttonBox = new HBox(10);
        buttonBox.setPadding(new Insets(20));
        buttonBox.setAlignment(Pos.CENTER);

        Button btnAdd = new Button("Ajouter");
        Button btnEdit = new Button("Modifier");
        Button btnDelete = new Button("Supprimer");
        Button btnBack = new Button("Retour au menu");

        styleButton(btnAdd, "#4CAF50");
        styleButton(btnEdit, "#2196F3");
        styleButton(btnDelete, "#f44336");
        styleButton(btnBack, "#9E9E9E");

        btnAdd.setOnAction(e -> addCandidat());
        btnEdit.setOnAction(e -> editCandidat());
        btnDelete.setOnAction(e -> deleteCandidat());
        btnBack.setOnAction(e -> goBack());

        buttonBox.getChildren().addAll(btnAdd, btnEdit, btnDelete, btnBack);

        root.setTop(header);
        root.setCenter(tableView);
        root.setBottom(buttonBox);

        return root;
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

    private void loadCandidats() {
        try {
            candidatList.clear();
            candidatList.addAll(candidatDAO.findAll());
        } catch (SQLException e) {
            showError("Erreur", "Impossible de charger les candidats : " + e.getMessage());
        }
    }

    private void addCandidat() {
        CandidatFormController form = new CandidatFormController(null);
        Candidat result = form.showDialog();
        if (result != null) {
            loadCandidats();
        }
    }

    private void editCandidat() {
        Candidat selected = tableView.getSelectionModel().getSelectedItem();
        if (selected == null) {
            showWarning("Aucune sélection", "Veuillez sélectionner un candidat à modifier.");
            return;
        }

        CandidatFormController form = new CandidatFormController(selected);
        Candidat result = form.showDialog();
        if (result != null) {
            loadCandidats();
        }
    }

    private void deleteCandidat() {
        Candidat selected = tableView.getSelectionModel().getSelectedItem();
        if (selected == null) {
            showWarning("Aucune sélection", "Veuillez sélectionner un candidat à supprimer.");
            return;
        }

        Alert confirmation = new Alert(Alert.AlertType.CONFIRMATION);
        confirmation.setTitle("Confirmation");
        confirmation.setHeaderText("Supprimer le candidat ?");
        confirmation.setContentText("Voulez-vous vraiment supprimer " + selected.getNomComplet() + " ?");

        confirmation.showAndWait().ifPresent(response -> {
            if (response == ButtonType.OK) {
                try {
                    candidatDAO.delete(selected.getId());
                    loadCandidats();
                } catch (SQLException e) {
                    showError("Erreur", "Impossible de supprimer le candidat : " + e.getMessage());
                }
            }
        });
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

    private void showWarning(String title, String message) {
        Alert alert = new Alert(Alert.AlertType.WARNING);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

    public BorderPane getView() {
        return view;
    }
}