package com.quizgame.models;

public class Reponse {
    private int id;
    private String libelle;
    private boolean juste;
    private int idQuestion;

    public Reponse() {}

    public Reponse(int id, String libelle, boolean juste, int idQuestion) {
        this.id = id;
        this.libelle = libelle;
        this.juste = juste;
        this.idQuestion = idQuestion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public boolean isJuste() {
        return juste;
    }

    public void setJuste(boolean juste) {
        this.juste = juste;
    }

    public int getIdQuestion() {
        return idQuestion;
    }

    public void setIdQuestion(int idQuestion) {
        this.idQuestion = idQuestion;
    }
}