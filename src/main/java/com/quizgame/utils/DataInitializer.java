package com.quizgame.utils;

import com.quizgame.dao.*;
import com.quizgame.models.*;

public class DataInitializer {
    
    private final MancheDAO mancheDAO;
    private final QuestionDAO questionDAO;
    private final ReponseDAO reponseDAO;
    private final ParametreJeuDAO parametreDAO;

    public DataInitializer() {
        this.mancheDAO = new MancheDAO();
        this.questionDAO = new QuestionDAO();
        this.reponseDAO = new ReponseDAO();
        this.parametreDAO = new ParametreJeuDAO();
    }

    public void initializeData() throws Exception {
        // Vérifier si les données existent déjà
        if (mancheDAO.count() > 0) {
            System.out.println("Données déjà initialisées.");
            return;
        }

        System.out.println("Initialisation des données...");

        // Créer les 4 manches
        Manche manche1 = new Manche(0, "9 points gagnants");
        mancheDAO.insert(manche1);
        
        Manche manche2 = new Manche(0, "4 à la suite");
        mancheDAO.insert(manche2);
        
        Manche manche3 = new Manche(0, "Duo / Carré / Cash");
        mancheDAO.insert(manche3);
        
        Manche manche4 = new Manche(0, "Finale");
        mancheDAO.insert(manche4);

        // Initialiser les questions pour chaque manche
        initManche1Questions(manche1.getId());
        initManche2Questions(manche2.getId());
        initManche3Questions(manche3.getId());
        initManche4Questions(manche4.getId());

        // Initialiser les paramètres par défaut
        initParametres();

        System.out.println("Initialisation terminée avec succès !");
    }

    private void initManche1Questions(int mancheId) throws Exception {
        // Manche 1: 15 questions de culture générale avec difficulté progressive
        
        addQuestionWithTextAnswer(mancheId, "Quelle est la capitale de la France ?", 1, "Facile", 15, "Paris");
        addQuestionWithTextAnswer(mancheId, "Combien de continents y a-t-il sur Terre ?", 1, "Facile", 15, "7");
        addQuestionWithTextAnswer(mancheId, "Quel est le plus grand océan du monde ?", 1, "Facile", 15, "Pacifique");
        addQuestionWithTextAnswer(mancheId, "Qui a peint La Joconde ?", 2, "Moyen", 15, "Léonard de Vinci");
        addQuestionWithTextAnswer(mancheId, "Quel est le symbole chimique de l'or ?", 2, "Moyen", 15, "Au");
        addQuestionWithTextAnswer(mancheId, "En quelle année l'homme a-t-il marché sur la Lune pour la première fois ?", 2, "Moyen", 15, "1969");
        addQuestionWithTextAnswer(mancheId, "Quel est le plus long fleuve du monde ?", 2, "Moyen", 15, "Amazone");
        addQuestionWithTextAnswer(mancheId, "Qui a écrit Les Misérables ?", 3, "Difficile", 15, "Victor Hugo");
        addQuestionWithTextAnswer(mancheId, "Quelle est la vitesse de la lumière dans le vide (en km/s) ?", 3, "Difficile", 15, "300000");
        addQuestionWithTextAnswer(mancheId, "Quel pays a remporté la Coupe du Monde de football en 2018 ?", 1, "Facile", 15, "France");
        addQuestionWithTextAnswer(mancheId, "Combien d'os possède le corps humain adulte ?", 2, "Moyen", 15, "206");
        addQuestionWithTextAnswer(mancheId, "Quelle est la planète la plus proche du Soleil ?", 1, "Facile", 15, "Mercure");
        addQuestionWithTextAnswer(mancheId, "Qui a composé La Symphonie n°9 ?", 3, "Difficile", 15, "Beethoven");
        addQuestionWithTextAnswer(mancheId, "Quel est le plus petit pays du monde ?", 2, "Moyen", 15, "Vatican");
        addQuestionWithTextAnswer(mancheId, "En quelle année est tombé le mur de Berlin ?", 2, "Moyen", 15, "1989");
    }

    private void initManche2Questions(int mancheId) throws Exception {
        // Manche 2: 15 questions pour série de 4 à la suite
        
        addQuestionWithTextAnswer(mancheId, "Quelle est la capitale de l'Italie ?", 1, "Facile", null, "Rome");
        addQuestionWithTextAnswer(mancheId, "Combien de joueurs y a-t-il dans une équipe de football ?", 1, "Facile", null, "11");
        addQuestionWithTextAnswer(mancheId, "Quel animal est le roi de la jungle ?", 1, "Facile", null, "Lion");
        addQuestionWithTextAnswer(mancheId, "Quelle couleur obtient-on en mélangeant du bleu et du jaune ?", 1, "Facile", null, "Vert");
        addQuestionWithTextAnswer(mancheId, "Quel est le plus grand mammifère du monde ?", 1, "Facile", null, "Baleine bleue");
        addQuestionWithTextAnswer(mancheId, "Dans quel pays se trouve la tour Eiffel ?", 1, "Facile", null, "France");
        addQuestionWithTextAnswer(mancheId, "Combien de côtés a un hexagone ?", 1, "Moyen", null, "6");
        addQuestionWithTextAnswer(mancheId, "Quel est le métal le plus précieux ?", 1, "Moyen", null, "Rhodium");
        addQuestionWithTextAnswer(mancheId, "Qui a découvert l'Amérique en 1492 ?", 1, "Moyen", null, "Christophe Colomb");
        addQuestionWithTextAnswer(mancheId, "Quelle est la langue la plus parlée au monde ?", 1, "Moyen", null, "Chinois");
        addQuestionWithTextAnswer(mancheId, "Quel organe du corps humain pompe le sang ?", 1, "Facile", null, "Coeur");
        addQuestionWithTextAnswer(mancheId, "Combien de dents a un adulte normalement ?", 1, "Moyen", null, "32");
        addQuestionWithTextAnswer(mancheId, "Quelle est la monnaie du Japon ?", 1, "Moyen", null, "Yen");
        addQuestionWithTextAnswer(mancheId, "Quel gaz respirons-nous principalement ?", 1, "Facile", null, "Azote");
        addQuestionWithTextAnswer(mancheId, "Combien de secondes y a-t-il dans une heure ?", 1, "Moyen", null, "3600");
    }

    private void initManche3Questions(int mancheId) throws Exception {
        // Manche 3: 15 questions QCM avec exactement 4 réponses (1 vraie, 3 fausses plausibles)
        
        addMCQQuestion(mancheId, "Quelle est la capitale de l'Espagne ?", 1, "Difficile",
            "Madrid", "Barcelone", "Séville", "Valence");
        
        addMCQQuestion(mancheId, "Qui a écrit '1984' ?", 1, "Difficile",
            "George Orwell", "Aldous Huxley", "Ray Bradbury", "Ernest Hemingway");
        
        addMCQQuestion(mancheId, "Quel est le plus haut sommet du monde ?", 1, "Moyen",
            "Mont Everest", "K2", "Kangchenjunga", "Lhotse");
        
        addMCQQuestion(mancheId, "En quelle année a débuté la Première Guerre mondiale ?", 1, "Moyen",
            "1914", "1912", "1916", "1918");
        
        addMCQQuestion(mancheId, "Quel est l'élément chimique dont le symbole est 'Fe' ?", 1, "Moyen",
            "Fer", "Fluor", "Francium", "Fermium");
        
        addMCQQuestion(mancheId, "Qui a peint 'La Nuit étoilée' ?", 1, "Difficile",
            "Vincent van Gogh", "Claude Monet", "Pablo Picasso", "Paul Cézanne");
        
        addMCQQuestion(mancheId, "Quelle est la vitesse du son dans l'air (environ) ?", 1, "Difficile",
            "340 m/s", "300 m/s", "400 m/s", "500 m/s");
        
        addMCQQuestion(mancheId, "Quel pays a inventé le papier ?", 1, "Moyen",
            "Chine", "Égypte", "Grèce", "Inde");
        
        addMCQQuestion(mancheId, "Combien de touches a un piano standard ?", 1, "Difficile",
            "88", "76", "92", "100");
        
        addMCQQuestion(mancheId, "Quel est le plus grand désert chaud du monde ?", 1, "Moyen",
            "Sahara", "Gobi", "Kalahari", "Atacama");
        
        addMCQQuestion(mancheId, "Qui a inventé l'ampoule électrique ?", 1, "Moyen",
            "Thomas Edison", "Nikola Tesla", "Alexander Graham Bell", "Benjamin Franklin");
        
        addMCQQuestion(mancheId, "Quelle est la durée de la révolution de la Terre autour du Soleil ?", 1, "Moyen",
            "365,25 jours", "364 jours", "366 jours", "360 jours");
        
        addMCQQuestion(mancheId, "Quel est l'animal le plus rapide du monde ?", 1, "Moyen",
            "Guépard", "Lion", "Antilope", "Léopard");
        
        addMCQQuestion(mancheId, "Dans quel pays se trouve le Taj Mahal ?", 1, "Facile",
            "Inde", "Pakistan", "Bangladesh", "Népal");
        
        addMCQQuestion(mancheId, "Quelle est la formule chimique de l'eau ?", 1, "Facile",
            "H2O", "H2O2", "HO2", "H3O");
    }

    private void initManche4Questions(int mancheId) throws Exception {
        // Manche 4 (Finale): 15 énigmes TRÈS DIFFICILES
        
        addQuestionWithTextAnswer(mancheId, 
            "Je suis toujours devant vous mais vous ne pouvez jamais me voir. Qui suis-je ?", 
            1, "Très difficile", null, "Avenir");
        
        addQuestionWithTextAnswer(mancheId, 
            "Plus on m'enlève, plus je deviens grand. Que suis-je ?", 
            1, "Très difficile", null, "Trou");
        
        addQuestionWithTextAnswer(mancheId, 
            "Quel nombre, multiplié par n'importe quel autre nombre, donnera toujours le même résultat ?", 
            1, "Très difficile", null, "0");
        
        addQuestionWithTextAnswer(mancheId, 
            "Quelle ville française est surnommée 'la ville rose' ?", 
            1, "Très difficile", null, "Toulouse");
        
        addQuestionWithTextAnswer(mancheId, 
            "Quel philosophe grec a été le professeur d'Alexandre le Grand ?", 
            1, "Très difficile", null, "Aristote");
        
        addQuestionWithTextAnswer(mancheId, 
            "Combien de fois peut-on soustraire 10 de 100 ?", 
            1, "Très difficile", null, "1");
        
        addQuestionWithTextAnswer(mancheId, 
            "Quel est le seul mammifère capable de voler ?", 
            1, "Très difficile", null, "Chauve-souris");
        
        addQuestionWithTextAnswer(mancheId, 
            "Dans la mythologie grecque, qui est le dieu du vin ?", 
            1, "Très difficile", null, "Dionysos");
        
        addQuestionWithTextAnswer(mancheId, 
            "Combien de fois le mot 'et' apparaît dans cette phrase : 'Le chat et le chien se promènent et jouent ensemble' ?", 
            1, "Très difficile", null, "2");
        
        addQuestionWithTextAnswer(mancheId, 
            "Quel écrivain français a écrit 'À la recherche du temps perdu' ?", 
            1, "Très difficile", null, "Marcel Proust");
        
        addQuestionWithTextAnswer(mancheId, 
            "Je parle sans bouche et j'entends sans oreilles. Je n'ai pas de corps mais je prends vie avec le vent. Qui suis-je ?", 
            1, "Très difficile", null, "Écho");
        
        addQuestionWithTextAnswer(mancheId, 
            "Quelle est la racine carrée de 144 ?", 
            1, "Très difficile", null, "12");
        
        addQuestionWithTextAnswer(mancheId, 
            "Quel est le plus petit nombre premier ?", 
            1, "Très difficile", null, "2");
        
        addQuestionWithTextAnswer(mancheId, 
            "Dans quelle ville se déroule l'action du roman 'Notre-Dame de Paris' ?", 
            1, "Très difficile", null, "Paris");
        
        addQuestionWithTextAnswer(mancheId, 
            "Un père a 32 ans et son fils 5 ans. Dans combien d'années le père aura-t-il le double de l'âge de son fils ?", 
            1, "Très difficile", null, "22");
    }

    private void addQuestionWithTextAnswer(int mancheId, String libelle, int points, 
                                          String difficulte, Integer tempsLimite, String reponseCorrecte) throws Exception {
        Question q = new Question(0, libelle, mancheId, points, difficulte, tempsLimite);
        questionDAO.insert(q);
        
        // Pour les réponses textuelles, on stocke quand même la réponse correcte
        Reponse r = new Reponse(0, reponseCorrecte, true, q.getId());
        reponseDAO.insert(r);
    }

    private void addMCQQuestion(int mancheId, String libelle, int points, String difficulte,
                               String reponseCorrecte, String fausse1, String fausse2, String fausse3) throws Exception {
        Question q = new Question(0, libelle, mancheId, points, difficulte, null);
        questionDAO.insert(q);
        
        // Ajouter les 4 réponses (1 vraie, 3 fausses)
        reponseDAO.insert(new Reponse(0, reponseCorrecte, true, q.getId()));
        reponseDAO.insert(new Reponse(0, fausse1, false, q.getId()));
        reponseDAO.insert(new Reponse(0, fausse2, false, q.getId()));
        reponseDAO.insert(new Reponse(0, fausse3, false, q.getId()));
    }

    private void initParametres() throws Exception {
        // Paramètres par défaut pour toutes les manches
        parametreDAO.upsert("sons_actives", "true");
        
        // Manche 1
        parametreDAO.upsert("points_manche1_cible", "9");
        parametreDAO.upsert("nb_questions_manche1", "10");
        parametreDAO.upsert("temps_manche1_par_question", "15");
        
        // Manche 2
        parametreDAO.upsert("nb_questions_manche2", "12");
        parametreDAO.upsert("chrono_manche2_secondes", "120");
        parametreDAO.upsert("serie_requise_manche2", "4");
        parametreDAO.upsert("serie_minimale_manche2", "3");
        
        // Manche 3
        parametreDAO.upsert("nb_questions_manche3", "10");
        parametreDAO.upsert("score_requis_manche3", "15");
        
        // Finale
        parametreDAO.upsert("nb_questions_finale", "10");
        parametreDAO.upsert("score_requis_finale", "6");
    }
}
