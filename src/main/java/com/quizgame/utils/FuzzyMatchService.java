package com.quizgame.utils;

import org.apache.commons.text.similarity.LevenshteinDistance;

import java.text.Normalizer;

public class FuzzyMatchService {
    private static final LevenshteinDistance levenshtein = new LevenshteinDistance();

    /**
     * Vérifie si la réponse utilisateur correspond à la réponse correcte
     * avec une tolérance pour les accents, la casse et les petites fautes de frappe.
     */
    public static boolean isAnswerCorrect(String userInput, String correctAnswer) {
        if (userInput == null || correctAnswer == null) {
            return false;
        }

        // Normalisation des chaînes
        String normalizedUser = normalize(userInput);
        String normalizedCorrect = normalize(correctAnswer);

        // Correspondance exacte après normalisation
        if (normalizedUser.equals(normalizedCorrect)) {
            return true;
        }

        // Calcul de la distance de Levenshtein
        int distance = levenshtein.apply(normalizedUser, normalizedCorrect);
        
        // Tolérance basée sur la longueur
        int maxDistance = calculateMaxDistance(normalizedCorrect.length());
        
        if (distance <= maxDistance) {
            return true;
        }

        // Calcul de similarité en pourcentage
        double similarity = calculateSimilarity(normalizedUser, normalizedCorrect);
        
        // Accepter si similarité >= 85%
        return similarity >= 0.85;
    }

    /**
     * Normalise une chaîne : minuscules, sans accents, sans ponctuation/espaces multiples
     */
    private static String normalize(String input) {
        if (input == null) {
            return "";
        }
        
        // Minuscules
        String result = input.toLowerCase().trim();
        
        // Suppression des accents
        result = Normalizer.normalize(result, Normalizer.Form.NFD);
        result = result.replaceAll("[\\p{InCombiningDiacriticalMarks}]", "");
        
        // Suppression de la ponctuation et caractères spéciaux
        result = result.replaceAll("[^a-z0-9\\s]", "");
        
        // Suppression des espaces multiples
        result = result.replaceAll("\\s+", " ").trim();
        
        return result;
    }

    /**
     * Calcule la distance maximale tolérée selon la longueur du mot
     */
    private static int calculateMaxDistance(int length) {
        if (length <= 5) {
            return 1;  // 1 faute pour mots courts
        } else if (length <= 10) {
            return 2;  // 2 fautes pour mots moyens
        } else {
            return 3;  // 3 fautes pour mots longs
        }
    }

    /**
     * Calcule le pourcentage de similarité entre deux chaînes
     */
    private static double calculateSimilarity(String s1, String s2) {
        int distance = levenshtein.apply(s1, s2);
        int maxLength = Math.max(s1.length(), s2.length());
        
        if (maxLength == 0) {
            return 1.0;
        }
        
        return 1.0 - ((double) distance / maxLength);
    }
}