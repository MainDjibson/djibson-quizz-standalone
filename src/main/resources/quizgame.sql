-- ===================================
-- BASE DE DONNÉES QUIZ CHAMPION
-- 4 Manches + 60 Questions + Réponses
-- ===================================

-- Création des tables
CREATE TABLE IF NOT EXISTS MANCHE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS QUESTION (
    id INT PRIMARY KEY AUTO_INCREMENT,
    libelle TEXT NOT NULL,
    id_manche INT NOT NULL,
    points INT DEFAULT 1,
    difficulte VARCHAR(50),
    temps_limite_secondes INT,
    FOREIGN KEY (id_manche) REFERENCES MANCHE(id)
);

CREATE TABLE IF NOT EXISTS REPONSE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    libelle VARCHAR(500) NOT NULL,
    juste BOOLEAN DEFAULT FALSE,
    id_question INT NOT NULL,
    FOREIGN KEY (id_question) REFERENCES QUESTION(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS CANDIDAT (
    id INT PRIMARY KEY AUTO_INCREMENT,
    prenom VARCHAR(100) NOT NULL,
    nom VARCHAR(100) NOT NULL,
    date_naissance DATE
);

CREATE TABLE IF NOT EXISTS PARAMETRE_JEU (
    cle VARCHAR(100) PRIMARY KEY,
    valeur VARCHAR(500)
);

-- ===================================
-- INSERTION DES 4 MANCHES
-- ===================================
INSERT INTO MANCHE (nom) VALUES ('9 points gagnants');
INSERT INTO MANCHE (nom) VALUES ('4 à la suite');
INSERT INTO MANCHE (nom) VALUES ('Duo / Carré / Cash');
INSERT INTO MANCHE (nom) VALUES ('Finale');

-- ===================================
-- MANCHE 1 : 15 QUESTIONS
-- ===================================
INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quelle est la capitale de la France ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Paris', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Combien de continents y a-t-il sur Terre ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('7', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel est le plus grand océan du monde ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Pacifique', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Qui a peint La Joconde ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Léonard de Vinci', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel est le symbole chimique de l''or ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Au', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('En quelle année l''homme a-t-il marché sur la Lune pour la première fois ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('1969', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel est le plus long fleuve du monde ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Amazone', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Qui a écrit Les Misérables ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Victor Hugo', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quelle est la vitesse de la lumière dans le vide (en km/s) ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('300000', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel pays a remporté la Coupe du Monde de football en 2018 ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('France', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Combien d''os possède le corps humain adulte ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('206', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quelle est la planète la plus proche du Soleil ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Mercure', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Qui a composé La Symphonie n°9 ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Beethoven', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel est le plus petit pays du monde ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Vatican', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('En quelle année est tombé le mur de Berlin ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('1989', TRUE, (SELECT MAX(id) FROM QUESTION));

-- ===================================
-- MANCHE 2 : 15 QUESTIONS
-- ===================================
INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quelle est la capitale de l''Italie ?', 2, 1, 'Facile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Rome', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Combien de joueurs y a-t-il dans une équipe de football ?', 2, 1, 'Facile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('11', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel animal est le roi de la jungle ?', 2, 1, 'Facile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Lion', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quelle couleur obtient-on en mélangeant du bleu et du jaune ?', 2, 1, 'Facile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Vert', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel est le plus grand mammifère du monde ?', 2, 1, 'Facile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Baleine bleue', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Dans quel pays se trouve la tour Eiffel ?', 2, 1, 'Facile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('France', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Combien de côtés a un hexagone ?', 2, 1, 'Moyen', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('6', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel est le métal le plus précieux ?', 2, 1, 'Moyen', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Rhodium', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Qui a découvert l''Amérique en 1492 ?', 2, 1, 'Moyen', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Christophe Colomb', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quelle est la langue la plus parlée au monde ?', 2, 1, 'Moyen', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Chinois', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel organe du corps humain pompe le sang ?', 2, 1, 'Facile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Coeur', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Combien de dents a un adulte normalement ?', 2, 1, 'Moyen', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('32', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quelle est la monnaie du Japon ?', 2, 1, 'Moyen', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Yen', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel gaz respirons-nous principalement ?', 2, 1, 'Facile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Azote', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Combien de secondes y a-t-il dans une heure ?', 2, 1, 'Moyen', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('3600', TRUE, (SELECT MAX(id) FROM QUESTION));

-- ===================================
-- MANCHE 3 : 15 QUESTIONS QCM (4 choix chacune)
-- ===================================
INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quelle est la capitale de l''Espagne ?', 3, 1, 'Difficile', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Madrid', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Barcelone', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Séville', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Valence', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Qui a écrit ''1984'' ?', 3, 1, 'Difficile', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('George Orwell', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Aldous Huxley', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Ray Bradbury', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Ernest Hemingway', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel est le plus haut sommet du monde ?', 3, 1, 'Moyen', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Mont Everest', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('K2', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Kangchenjunga', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Lhotse', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('En quelle année a débuté la Première Guerre mondiale ?', 3, 1, 'Moyen', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('1914', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('1912', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('1916', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('1918', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel est l''élément chimique dont le symbole est ''Fe'' ?', 3, 1, 'Moyen', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Fer', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Fluor', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Francium', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Fermium', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Qui a peint ''La Nuit étoilée'' ?', 3, 1, 'Difficile', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Vincent van Gogh', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Claude Monet', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Pablo Picasso', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Paul Cézanne', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quelle est la vitesse du son dans l''air (environ) ?', 3, 1, 'Difficile', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('340 m/s', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('300 m/s', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('400 m/s', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('500 m/s', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel pays a inventé le papier ?', 3, 1, 'Moyen', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Chine', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Égypte', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Grèce', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Inde', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Combien de touches a un piano standard ?', 3, 1, 'Difficile', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('88', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('76', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('92', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('100', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel est le plus grand désert chaud du monde ?', 3, 1, 'Moyen', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Sahara', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Gobi', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Kalahari', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Atacama', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Qui a inventé l''ampoule électrique ?', 3, 1, 'Moyen', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Thomas Edison', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Nikola Tesla', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Alexander Graham Bell', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Benjamin Franklin', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quelle est la durée de la révolution de la Terre autour du Soleil ?', 3, 1, 'Moyen', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('365,25 jours', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('364 jours', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('366 jours', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('360 jours', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel est l''animal le plus rapide du monde ?', 3, 1, 'Moyen', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Guépard', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Lion', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Antilope', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Léopard', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Dans quel pays se trouve le Taj Mahal ?', 3, 1, 'Facile', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Inde', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Pakistan', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Bangladesh', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Népal', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quelle est la formule chimique de l''eau ?', 3, 1, 'Facile', NULL);

INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('H2O', TRUE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('H2O2', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('HO2', FALSE, (SELECT MAX(id) FROM QUESTION));
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('H3O', FALSE, (SELECT MAX(id) FROM QUESTION));

-- ===================================
-- MANCHE 4 : 15 QUESTIONS (ÉNIGMES)
-- ===================================
INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Je suis toujours devant vous mais vous ne pouvez jamais me voir. Qui suis-je ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Avenir', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Plus on m''enlève, plus je deviens grand. Que suis-je ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Trou', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel nombre, multiplié par n''importe quel autre nombre, donnera toujours le même résultat ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('0', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quelle ville française est surnommée ''la ville rose'' ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Toulouse', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel philosophe grec a été le professeur d''Alexandre le Grand ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Aristote', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Combien de fois peut-on soustraire 10 de 100 ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('1', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel est le seul mammifère capable de voler ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Chauve-souris', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Dans la mythologie grecque, qui est le dieu du vin ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Dionysos', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Combien de fois le mot ''et'' apparaît dans cette phrase : ''Le chat et le chien se promènent et jouent ensemble'' ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('2', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel écrivain français a écrit ''À la recherche du temps perdu'' ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Marcel Proust', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Je parle sans bouche et j''entends sans oreilles. Je n''ai pas de corps mais je prends vie avec le vent. Qui suis-je ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Écho', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quelle est la racine carrée de 144 ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('12', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel est le plus petit nombre premier ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('2', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Dans quelle ville se déroule l''action du roman ''Notre-Dame de Paris'' ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('Paris', TRUE, (SELECT MAX(id) FROM QUESTION));

INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Un père a 32 ans et son fils 5 ans. Dans combien d''années le père aura-t-il le double de l''âge de son fils ?', 4, 1, 'Très difficile', NULL);
INSERT INTO REPONSE (libelle, juste, id_question) VALUES ('22', TRUE, (SELECT MAX(id) FROM QUESTION));

-- ===================================
-- PARAMÈTRES DU JEU
-- ===================================
MERGE INTO PARAMETRE_JEU (cle, valeur) VALUES ('sons_actives', 'true'   );
MERGE INTO PARAMETRE_JEU (cle, valeur) VALUES ('points_manche1_cible', '9');
MERGE INTO PARAMETRE_JEU (cle, valeur) VALUES ('nb_questions_manche1', '10');
MERGE INTO PARAMETRE_JEU (cle, valeur) VALUES ('temps_manche1_par_question', '15');
MERGE INTO PARAMETRE_JEU (cle, valeur) VALUES ('nb_questions_manche2', '12');
MERGE INTO PARAMETRE_JEU (cle, valeur) VALUES ('chrono_manche2_secondes', '120');
MERGE INTO PARAMETRE_JEU (cle, valeur) VALUES ('serie_requise_manche2', '4');
MERGE INTO PARAMETRE_JEU (cle, valeur) VALUES ('serie_minimale_manche2', '3');
MERGE INTO PARAMETRE_JEU (cle, valeur) VALUES ('nb_questions_manche3', '10');
MERGE INTO PARAMETRE_JEU (cle, valeur) VALUES ('score_requis_manche3', '15');
MERGE INTO PARAMETRE_JEU (cle, valeur) VALUES ('nb_questions_finale', '10');
MERGE INTO PARAMETRE_JEU (cle, valeur) VALUES ('score_requis_finale', '6');

-- ===================================
-- FIN DU FICHIER  
-- Total: 4 manches, 60 questions, ~105 réponses
-- ===================================
