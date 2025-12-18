package com.quizgame.models;

public class Question {
    private int id;
    private String libelle;
    private int idManche;
    private int points;
    private String difficulte;
    private Integer tempsLimiteSecondes;

    public Question() {}

    public Question(int id, String libelle, int idManche, int points, String difficulte, Integer tempsLimiteSecondes) {
        this.id = id;
        this.libelle = libelle;
        this.idManche = idManche;
        this.points = points;
        this.difficulte = difficulte;
        this.tempsLimiteSecondes = tempsLimiteSecondes;
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

    public int getIdManche() {
        return idManche;
    }

    public void setIdManche(int idManche) {
        this.idManche = idManche;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public String getDifficulte() {
        return difficulte;
    }

    public void setDifficulte(String difficulte) {
        this.difficulte = difficulte;
    }

    public Integer getTempsLimiteSecondes() {
        return tempsLimiteSecondes;
    }

    public void setTempsLimiteSecondes(Integer tempsLimiteSecondes) {
        this.tempsLimiteSecondes = tempsLimiteSecondes;
    }
}