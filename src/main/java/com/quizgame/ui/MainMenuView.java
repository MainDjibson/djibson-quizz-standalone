package com.quizgame.ui;

import javafx.geometry.Insets;
import javafx.scene.Parent;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;

public class MainMenuView {

    public Parent getView() {
        Label title = new Label("DjibsonQuizz");
        title.getStyleClass().add("title");

        Button play = new Button("Jouer");
        Button quit = new Button("Quitter");
        quit.setOnAction(e -> System.exit(0));

        VBox box = new VBox(12, title, play, quit);
        box.setPadding(new Insets(24));
        return box;
    }
}
