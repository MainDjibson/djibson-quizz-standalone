package com.quizgame.services;

import com.quizgame.dao.*;
import com.quizgame.models.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class GameService {
    private final QuestionDAO questionDAO;
    private final ReponseDAO reponseDAO;
    private final MancheDAO mancheDAO;
    private final ParametreJeuDAO parametreDAO;

    private Candidat currentCandidat;
    private int currentMancheIndex = 0;
    private int totalScore = 0;

    public GameService() {
        this.questionDAO = new QuestionDAO();
        this.reponseDAO = new ReponseDAO();
        this.mancheDAO = new MancheDAO();
        this.parametreDAO = new ParametreJeuDAO();
    }

    public void startNewGame(Candidat candidat) {
        this.currentCandidat = candidat;
        this.currentMancheIndex = 0;
        this.totalScore = 0;
    }

    public Candidat getCurrentCandidat() {
        return currentCandidat;
    }

    public int getCurrentMancheIndex() {
        return currentMancheIndex;
    }

    public void nextManche() {
        currentMancheIndex++;
    }

    public int getTotalScore() {
        return totalScore;
    }

    public void addToTotalScore(int points) {
        totalScore += points;
    }

    public List<Question> getQuestionsForManche(int mancheId) throws SQLException {
        return questionDAO.findByManche(mancheId);
    }

    public List<Reponse> getReponsesForQuestion(int questionId) throws SQLException {
        return reponseDAO.findByQuestion(questionId);
    }

    public Reponse getCorrectAnswer(int questionId) throws SQLException {
        return reponseDAO.findCorrectAnswer(questionId);
    }

    /**
     * Pour la manche 3 (DUO mode), retourne 2 réponses dont la bonne
     */
    public List<Reponse> getDuoReponses(int questionId) throws SQLException {
        List<Reponse> allReponses = reponseDAO.findByQuestion(questionId);
        if (allReponses.size() != 4) {
            throw new IllegalStateException("La question doit avoir exactement 4 réponses pour le mode DUO");
        }

        List<Reponse> result = new ArrayList<>();
        Reponse correctAnswer = null;
        List<Reponse> wrongAnswers = new ArrayList<>();

        for (Reponse r : allReponses) {
            if (r.isJuste()) {
                correctAnswer = r;
            } else {
                wrongAnswers.add(r);
            }
        }

        if (correctAnswer == null) {
            throw new IllegalStateException("Aucune réponse correcte trouvée");
        }

        // Ajouter la bonne réponse
        result.add(correctAnswer);
        
        // Ajouter 1 mauvaise réponse aléatoire
        Collections.shuffle(wrongAnswers);
        result.add(wrongAnswers.get(0));
        
        // Mélanger l'ordre
        Collections.shuffle(result);
        
        return result;
    }

    public List<Manche> getAllManches() throws SQLException {
        return mancheDAO.findAll();
    }

    public Manche getMancheById(int id) throws SQLException {
        return mancheDAO.findById(id);
    }

    // Getters pour paramètres
    public int getPointsManche1Cible() throws SQLException {
        return parametreDAO.getValeurInt("points_manche1_cible", 9);
    }

    public int getNbQuestionsManche1() throws SQLException {
        return parametreDAO.getValeurInt("nb_questions_manche1", 10);
    }

    public int getTempsManche1ParQuestion() throws SQLException {
        return parametreDAO.getValeurInt("temps_manche1_par_question", 15);
    }

    public int getNbQuestionsManche2() throws SQLException {
        return parametreDAO.getValeurInt("nb_questions_manche2", 12);
    }

    public int getChronoManche2Secondes() throws SQLException {
        return parametreDAO.getValeurInt("chrono_manche2_secondes", 120);
    }

    public int getSerieRequiseManche2() throws SQLException {
        return parametreDAO.getValeurInt("serie_requise_manche2", 4);
    }

    public int getSerieMinimaleManche2() throws SQLException {
        return parametreDAO.getValeurInt("serie_minimale_manche2", 3);
    }

    public int getNbQuestionsManche3() throws SQLException {
        return parametreDAO.getValeurInt("nb_questions_manche3", 10);
    }

    public int getScoreRequisManche3() throws SQLException {
        return parametreDAO.getValeurInt("score_requis_manche3", 15);
    }

    public int getNbQuestionsFinale() throws SQLException {
        return parametreDAO.getValeurInt("nb_questions_finale", 10);
    }

    public int getScoreRequisFinale() throws SQLException {
        return parametreDAO.getValeurInt("score_requis_finale", 6);
    }

    public boolean getSonsActives() throws SQLException {
        return parametreDAO.getValeurBoolean("sons_actives", true);
    }
}