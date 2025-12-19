package com.quizgame.ui;

import com.quizgame.QuizGameApp;
import com.quizgame.dao.*;
import com.quizgame.models.*;
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

import java.util.List; 
import java.util.Optional;

public class QuestionManagementController {
    private final BorderPane view;
    private final QuestionDAO questionDAO;
    private final ReponseDAO reponseDAO;
    private final MancheDAO mancheDAO;
    private final TableView<Question> tableView;
    private final ObservableList<Question> questionList;
    private ComboBox<Manche> mancheFilter;

    public QuestionManagementController() {
        this.questionDAO = new QuestionDAO();
        this.reponseDAO = new ReponseDAO();
        this.mancheDAO = new MancheDAO();
        this.questionList = FXCollections.observableArrayList();
        this.tableView = new TableView<>();
        this.view = createView();
        loadQuestions(0); // 0 = toutes les manches
    }

    private BorderPane createView() {
        BorderPane root = new BorderPane();
        root.setStyle("-fx-background-color: #f5f5f5;");

        // Header
        VBox header = new VBox(10);
        header.setPadding(new Insets(20));
        header.setAlignment(Pos.CENTER);
        header.setStyle("-fx-background-color: #1e3c72;");

        Label title = new Label("Gestion des Questions et Réponses");
        title.setFont(Font.font("Arial", FontWeight.BOLD, 32));
        title.setStyle("-fx-text-fill: white;");
        header.getChildren().add(title);

        // Filter bar
        HBox filterBox = new HBox(10);
        filterBox.setPadding(new Insets(10));
        filterBox.setAlignment(Pos.CENTER_LEFT);
        filterBox.setStyle("-fx-background-color: white;");

        Label filterLabel = new Label("Filtrer par manche :");
        mancheFilter = new ComboBox<>();
        mancheFilter.getItems().add(new Manche(0, "Toutes les manches"));
        try {
            mancheFilter.getItems().addAll(mancheDAO.findAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
        mancheFilter.getSelectionModel().selectFirst();
        mancheFilter.setOnAction(e -> {
            Manche selected = mancheFilter.getSelectionModel().getSelectedItem();
            loadQuestions(selected != null ? selected.getId() : 0);
        });

        Button btnRefresh = new Button("Actualiser");
        btnRefresh.setOnAction(e -> {
            Manche selected = mancheFilter.getSelectionModel().getSelectedItem();
            loadQuestions(selected != null ? selected.getId() : 0);
        });

        filterBox.getChildren().addAll(filterLabel, mancheFilter, btnRefresh);

        // Table
        TableColumn<Question, Integer> idCol = new TableColumn<>("ID");
        idCol.setCellValueFactory(new PropertyValueFactory<>("id"));
        idCol.setPrefWidth(50);

        TableColumn<Question, String> libelleCol = new TableColumn<>("Question");
        libelleCol.setCellValueFactory(new PropertyValueFactory<>("libelle"));
        libelleCol.setPrefWidth(400);

        TableColumn<Question, Integer> mancheCol = new TableColumn<>("Manche");
        mancheCol.setCellValueFactory(new PropertyValueFactory<>("idManche"));
        mancheCol.setPrefWidth(80);

        TableColumn<Question, Integer> pointsCol = new TableColumn<>("Points");
        pointsCol.setCellValueFactory(new PropertyValueFactory<>("points"));
        pointsCol.setPrefWidth(70);

        TableColumn<Question, String> difficulteCol = new TableColumn<>("Difficulté");
        difficulteCol.setCellValueFactory(new PropertyValueFactory<>("difficulte"));
        difficulteCol.setPrefWidth(100);

        tableView.getColumns().addAll(idCol, libelleCol, mancheCol, pointsCol, difficulteCol);
        tableView.setItems(questionList);

        // Buttons
        HBox buttonBox = new HBox(10);
        buttonBox.setPadding(new Insets(20));
        buttonBox.setAlignment(Pos.CENTER);

        Button btnAdd = new Button("Ajouter Question");
        Button btnEdit = new Button("Modifier");
        Button btnViewReponses = new Button("Voir Réponses");
        Button btnDelete = new Button("Supprimer");
        Button btnBack = new Button("Retour au menu");

        styleButton(btnAdd, "#4CAF50");
        styleButton(btnEdit, "#2196F3");
        styleButton(btnViewReponses, "#FF9800");
        styleButton(btnDelete, "#f44336");
        styleButton(btnBack, "#9E9E9E");

        btnAdd.setOnAction(e -> addQuestion());
        btnEdit.setOnAction(e -> editQuestion());
        btnViewReponses.setOnAction(e -> viewReponses());
        btnDelete.setOnAction(e -> deleteQuestion());
        btnBack.setOnAction(e -> goBack());

        buttonBox.getChildren().addAll(btnAdd, btnEdit, btnViewReponses, btnDelete, btnBack);

        VBox centerBox = new VBox();
        centerBox.getChildren().addAll(filterBox, tableView);

        root.setTop(header);
        root.setCenter(centerBox);
        root.setBottom(buttonBox);

        return root;
    }

    private void loadQuestions(int mancheId) {
        try {
            questionList.clear();
            if (mancheId == 0) {
                questionList.addAll(questionDAO.findAll());
            } else {
                questionList.addAll(questionDAO.findByManche(mancheId));
            }
        } catch (Exception e) {
            showError("Erreur", "Impossible de charger les questions : " + e.getMessage());
        }
    }

    private void addQuestion() {
        QuestionFormDialog dialog = new QuestionFormDialog(null);
        Optional<Question> result = dialog.showAndWait();
        if (result.isPresent()) {
            Manche selected = mancheFilter.getSelectionModel().getSelectedItem();
            loadQuestions(selected != null ? selected.getId() : 0);
        }
    }

    private void editQuestion() {
        Question selected = tableView.getSelectionModel().getSelectedItem();
        if (selected == null) {
            showWarning("Aucune sélection", "Veuillez sélectionner une question à modifier.");
            return;
        }

        QuestionFormDialog dialog = new QuestionFormDialog(selected);
        Optional<Question> result = dialog.showAndWait();
        if (result.isPresent()) {
            Manche selectedManche = mancheFilter.getSelectionModel().getSelectedItem();
            loadQuestions(selectedManche != null ? selectedManche.getId() : 0);
        }
    }

    private void viewReponses() {
        Question selected = tableView.getSelectionModel().getSelectedItem();
        if (selected == null) {
            showWarning("Aucune sélection", "Veuillez sélectionner une question.");
            return;
        }

        try {
            List<Reponse> reponses = reponseDAO.findByQuestion(selected.getId());
            ReponseManagementDialog dialog = new ReponseManagementDialog(selected, reponses);
            dialog.showAndWait();
        } catch (Exception e) {
            showError("Erreur", "Impossible de charger les réponses : " + e.getMessage());
        }
    }

    private void deleteQuestion() {
        Question selected = tableView.getSelectionModel().getSelectedItem();
        if (selected == null) {
            showWarning("Aucune sélection", "Veuillez sélectionner une question à supprimer.");
            return;
        }

        Alert confirmation = new Alert(Alert.AlertType.CONFIRMATION);
        confirmation.setTitle("Confirmation");
        confirmation.setHeaderText("Supprimer la question ?");
        confirmation.setContentText("Cette action supprimera aussi toutes les réponses associées.");

        confirmation.showAndWait().ifPresent(response -> {
            if (response == ButtonType.OK) {
                try {
                    questionDAO.delete(selected.getId());
                    Manche selectedManche = mancheFilter.getSelectionModel().getSelectedItem();
                    loadQuestions(selectedManche != null ? selectedManche.getId() : 0);
                } catch (Exception e) {
                    showError("Erreur", "Impossible de supprimer la question : " + e.getMessage());
                }
            }
        });
    }

    private void goBack() {
        MainMenuController mainMenu = new MainMenuController();
        Scene scene = new Scene(mainMenu.getView(), 1024, 768);
        QuizGameApp.primaryStage.setScene(scene);
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

    // Dialog interne pour l'édition de questions
    private class QuestionFormDialog extends Dialog<Question> {
        private final Question question;
        private final QuestionDAO qDAO = new QuestionDAO();

        public QuestionFormDialog(Question question) {
            this.question = question;
            setupDialog();
        }

        private void setupDialog() {
            setTitle(question == null ? "Nouvelle question" : "Modifier la question");
            setHeaderText("Informations de la question");

            ButtonType saveButtonType = new ButtonType("Enregistrer", ButtonBar.ButtonData.OK_DONE);
            getDialogPane().getButtonTypes().addAll(saveButtonType, ButtonType.CANCEL);

            GridPane grid = new GridPane();
            grid.setHgap(10);
            grid.setVgap(10);
            grid.setPadding(new Insets(20));

            TextArea libelleArea = new TextArea();
            libelleArea.setPromptText("Libellé de la question");
            libelleArea.setPrefRowCount(3);
            libelleArea.setWrapText(true);

            ComboBox<Manche> mancheCombo = new ComboBox<>();
            try {
                mancheCombo.getItems().addAll(mancheDAO.findAll());
            } catch (Exception e) {
                e.printStackTrace();
            }

            TextField pointsField = new TextField();
            pointsField.setPromptText("Points");

            ComboBox<String> difficulteCombo = new ComboBox<>();
            difficulteCombo.getItems().addAll("Facile", "Moyen", "Difficile", "Très difficile");

            TextField tempsField = new TextField();
            tempsField.setPromptText("Temps limite (secondes)");

            if (question != null) {
                libelleArea.setText(question.getLibelle());
                try {
                    Manche m = mancheDAO.findById(question.getIdManche());
                    mancheCombo.getSelectionModel().select(m);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                pointsField.setText(String.valueOf(question.getPoints()));
                difficulteCombo.getSelectionModel().select(question.getDifficulte());
                if (question.getTempsLimiteSecondes() != null) {
                    tempsField.setText(String.valueOf(question.getTempsLimiteSecondes()));
                }
            } else {
                mancheCombo.getSelectionModel().selectFirst();
                difficulteCombo.getSelectionModel().select("Moyen");
            }

            grid.add(new Label("Libellé :"), 0, 0);
            grid.add(libelleArea, 1, 0);
            grid.add(new Label("Manche :"), 0, 1);
            grid.add(mancheCombo, 1, 1);
            grid.add(new Label("Points :"), 0, 2);
            grid.add(pointsField, 1, 2);
            grid.add(new Label("Difficulté :"), 0, 3);
            grid.add(difficulteCombo, 1, 3);
            grid.add(new Label("Temps limite (sec) :"), 0, 4);
            grid.add(tempsField, 1, 4);

            getDialogPane().setContent(grid);

            setResultConverter(dialogButton -> {
                if (dialogButton == saveButtonType) {
                    try {
                        Question q = question != null ? question : new Question();
                        q.setLibelle(libelleArea.getText());
                        Manche selectedManche = mancheCombo.getSelectionModel().getSelectedItem();
                        q.setIdManche(selectedManche.getId());
                        q.setPoints(Integer.parseInt(pointsField.getText()));
                        q.setDifficulte(difficulteCombo.getSelectionModel().getSelectedItem());
                        if (!tempsField.getText().isEmpty()) {
                            q.setTempsLimiteSecondes(Integer.parseInt(tempsField.getText()));
                        }

                        if (question == null) {
                            qDAO.insert(q);
                        } else {
                            qDAO.update(q);
                        }
                        return q;
                    } catch (Exception e) {
                        showError("Erreur", "Impossible de sauvegarder : " + e.getMessage());
                        return null;
                    }
                }
                return null;
            });
        }
    }

    // Dialog pour gérer les réponses d'une question
    private class ReponseManagementDialog extends Dialog<Void> {
        private final Question question;
        private final ListView<Reponse> listView;
        private final ObservableList<Reponse> reponseList;

        public ReponseManagementDialog(Question question, List<Reponse> reponses) {
            this.question = question;
            this.reponseList = FXCollections.observableArrayList(reponses);
            this.listView = new ListView<>(reponseList);
            setupDialog();
        }

        private void setupDialog() {
            setTitle("Réponses pour la question #" + question.getId());
            setHeaderText(question.getLibelle());

            listView.setCellFactory(param -> new ListCell<Reponse>() {
                @Override
                protected void updateItem(Reponse item, boolean empty) {
                    super.updateItem(item, empty);
                    if (empty || item == null) {
                        setText(null);
                    } else {
                        setText((item.isJuste() ? "✓ " : "✗ ") + item.getLibelle());
                        setStyle(item.isJuste() ? "-fx-background-color: #c8e6c9;" : "");
                    }
                }
            });

            VBox vbox = new VBox(10);
            vbox.setPadding(new Insets(10));

            HBox buttonBox = new HBox(10);
            Button btnAdd = new Button("Ajouter");
            Button btnEdit = new Button("Modifier");
            Button btnDelete = new Button("Supprimer");

            btnAdd.setOnAction(e -> addReponse());
            btnEdit.setOnAction(e -> editReponse());
            btnDelete.setOnAction(e -> deleteReponse());

            buttonBox.getChildren().addAll(btnAdd, btnEdit, btnDelete);
            vbox.getChildren().addAll(listView, buttonBox);

            getDialogPane().setContent(vbox);
            getDialogPane().getButtonTypes().add(ButtonType.CLOSE);
        }

        private void addReponse() {
            ReponseFormDialog dialog = new ReponseFormDialog(null, question.getId());
            Optional<Reponse> result = dialog.showAndWait();
            if (result.isPresent()) {
                reponseList.add(result.get());
            }
        }

        private void editReponse() {
            Reponse selected = listView.getSelectionModel().getSelectedItem();
            if (selected == null) {
                showWarning("Aucune sélection", "Veuillez sélectionner une réponse.");
                return;
            }

            ReponseFormDialog dialog = new ReponseFormDialog(selected, question.getId());
            Optional<Reponse> result = dialog.showAndWait();
            if (result.isPresent()) {
                listView.refresh();
            }
        }

        private void deleteReponse() {
            Reponse selected = listView.getSelectionModel().getSelectedItem();
            if (selected == null) {
                showWarning("Aucune sélection", "Veuillez sélectionner une réponse.");
                return;
            }

            try {
                reponseDAO.delete(selected.getId());
                reponseList.remove(selected);
            } catch (Exception e) {
                showError("Erreur", "Impossible de supprimer : " + e.getMessage());
            }
        }
    }

    // Dialog pour éditer une réponse
    private class ReponseFormDialog extends Dialog<Reponse> {
        private final Reponse reponse;
        private final int questionId;
        private final ReponseDAO rDAO = new ReponseDAO();

        public ReponseFormDialog(Reponse reponse, int questionId) {
            this.reponse = reponse;
            this.questionId = questionId;
            setupDialog();
        }

        private void setupDialog() {
            setTitle(reponse == null ? "Nouvelle réponse" : "Modifier la réponse");

            ButtonType saveButtonType = new ButtonType("Enregistrer", ButtonBar.ButtonData.OK_DONE);
            getDialogPane().getButtonTypes().addAll(saveButtonType, ButtonType.CANCEL);

            GridPane grid = new GridPane();
            grid.setHgap(10);
            grid.setVgap(10);
            grid.setPadding(new Insets(20));

            TextField libelleField = new TextField();
            libelleField.setPromptText("Libellé de la réponse");
            libelleField.setPrefWidth(300);

            CheckBox justeCheckbox = new CheckBox("Réponse correcte");

            if (reponse != null) {
                libelleField.setText(reponse.getLibelle());
                justeCheckbox.setSelected(reponse.isJuste());
            }

            grid.add(new Label("Libellé :"), 0, 0);
            grid.add(libelleField, 1, 0);
            grid.add(justeCheckbox, 1, 1);

            getDialogPane().setContent(grid);

            setResultConverter(dialogButton -> {
                if (dialogButton == saveButtonType) {
                    try {
                        Reponse r = reponse != null ? reponse : new Reponse();
                        r.setLibelle(libelleField.getText());
                        r.setJuste(justeCheckbox.isSelected());
                        r.setIdQuestion(questionId);

                        if (reponse == null) {
                            rDAO.insert(r);
                        } else {
                            rDAO.update(r);
                        }
                        return r;
                    } catch (Exception e) {
                        showError("Erreur", "Impossible de sauvegarder : " + e.getMessage());
                        return null;
                    }
                }
                return null;
            });
        }
    }
}
