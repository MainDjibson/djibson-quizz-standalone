package com.quizgame.models;

public class ParametreJeu {
    private String cle;
    private String valeur;

    public ParametreJeu() {}

    public ParametreJeu(String cle, String valeur) {
        this.cle = cle;
        this.valeur = valeur;
    }

    public String getCle() {
        return cle;
    }

    public void setCle(String cle) {
        this.cle = cle;
    }

    public String getValeur() {
        return valeur;
    }

    public void setValeur(String valeur) {
        this.valeur = valeur;
    }
}