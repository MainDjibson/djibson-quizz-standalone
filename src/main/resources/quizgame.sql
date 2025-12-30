-- ===================================
-- BASE DE DONNÉES QUIZ CHAMPION
-- 4 Manches + 300 Questions + Réponses
-- ===================================

-- Création des tables 
CREATE TABLE IF NOT EXISTS MANCHE (
    id INT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS QUESTION (
    id INT PRIMARY KEY,
    libelle TEXT NOT NULL,
    id_manche INT NOT NULL,
    points INT DEFAULT 1,
    difficulte VARCHAR(50),
    temps_limite_secondes INT,
    FOREIGN KEY (id_manche) REFERENCES MANCHE(id)
);

CREATE TABLE IF NOT EXISTS REPONSE (
    id INT PRIMARY KEY,
    libelle VARCHAR(500) NOT NULL,
    juste BOOLEAN DEFAULT FALSE,
    id_question INT NOT NULL,
    FOREIGN KEY (id_question) REFERENCES QUESTION(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS CANDIDAT (
    id INT PRIMARY KEY,
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
INSERT INTO MANCHE (id, nom) VALUES (1, '9 points gagnants');
INSERT INTO MANCHE (id, nom) VALUES (2, '4 à la suite');
INSERT INTO MANCHE (id, nom) VALUES (3, 'Duo / Carré / Cash');
INSERT INTO MANCHE (id, nom) VALUES (4, 'Finale');

-- ===================================
-- MANCHE 1 : 150 QUESTIONS (EXTRAIT)
-- ===================================

-- Q1
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (1, 'Quelle est la capitale de la France ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1, 'Paris', TRUE, 1);

-- Q2
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (2, 'Combien de continents y a-t-il sur Terre ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (2, '7', TRUE, 2);

-- Q3
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (3, 'Quel est le plus grand océan du monde ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (3, 'Pacifique', TRUE, 3);

-- Q4
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (4, 'Qui a peint La Joconde ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (4, 'Léonard de Vinci', TRUE, 4);

-- Q5
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (5, 'Quel est le symbole chimique de l''or ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (5, 'Au', TRUE, 5);

-- Q6
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (6, 'En quelle année l''homme a-t-il marché sur la Lune pour la première fois ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (6, '1969', TRUE, 6);

-- Q7
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (7, 'Quel est le plus long fleuve du monde ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (7, 'Amazone', TRUE, 7);

-- Q8
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (8, 'Qui a écrit Les Misérables ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (8, 'Victor Hugo', TRUE, 8);

-- Q9
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (9, 'Quelle est la vitesse de la lumière dans le vide (en km/s) ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (9, '300000', TRUE, 9);

-- Q10
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (10, 'Quel pays a remporté la Coupe du Monde de football en 2018 ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (10, 'France', TRUE, 10);

-- Q11
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (11, 'Combien d''os possède le corps humain adulte ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (11, '206', TRUE, 11);

-- Q12
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (12, 'Quelle est la planète la plus proche du Soleil ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (12, 'Mercure', TRUE, 12);

-- Q13
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (13, 'Qui a composé La Symphonie n°9 ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (13, 'Beethoven', TRUE, 13);

-- Q14
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (14, 'Quel est le plus petit pays du monde ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (14, 'Vatican', TRUE, 14);

-- Q15
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (15, 'En quelle année est tombé le mur de Berlin ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (15, '1989', TRUE, 15);

-- Q16
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (16, 'Qui est le dieu grec de la foudre et du ciel ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (16, 'Zeus', TRUE, 16);

-- Q17
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (17, 'Dans quel sport utilise-t-on un "birdie" ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (17, 'Golf', TRUE, 17);

-- Q18
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (18, 'Quel mouvement artistique a été fondé par Claude Monet ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (18, 'Impressionnisme', TRUE, 18);

-- Q19
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (19, 'Quel est l''instrument principal de Miles Davis ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (19, 'Trompette', TRUE, 19);

-- Q20
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (20, 'Quelle est la formule chimique du sel de table ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (20, 'NaCl', TRUE, 20);

-- Q21
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (21, 'Qui a écrit l''épopée "L''Odyssée" ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (21, 'Homère', TRUE, 21);

-- Q22
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (22, 'Combien d''anneaux compte le drapeau olympique ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (22, '5', TRUE, 22);

-- Q23
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (23, 'Quel sculpteur a réalisé "Le Penseur" ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (23, 'Auguste Rodin', TRUE, 23);

-- Q24
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (24, 'Quel est le nom du chien à trois têtes gardant les Enfers ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (24, 'Cerbère', TRUE, 24);

-- Q25
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (25, 'Quelle est la monnaie utilisée au Royaume-Uni ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (25, 'Livre Sterling', TRUE, 25);

-- Q26
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (26, 'Quelle équipe de basket joue au Madison Square Garden ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (26, 'New York Knicks', TRUE, 26);

-- Q27
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (27, 'Quel physicien a découvert la radioactivité du polonium ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (27, 'Marie Curie', TRUE, 27);

-- Q28
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (28, 'De quel groupe de rock Freddie Mercury était-il le chanteur ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (28, 'Queen', TRUE, 28);

-- Q29
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (29, 'Quel est le dieu romain équivalent à Poséidon ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (29, 'Neptune', TRUE, 29);

-- Q30
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (30, 'Dans quel musée se trouve la Vénus de Milo ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (30, 'Le Louvre', TRUE, 30);

-- Q31
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (31, 'Combien de minutes dure un match de football (hors arrêts de jeu) ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (31, '90', TRUE, 31);

-- Q32
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (32, 'Quel métal est le meilleur conducteur d''électricité ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (32, 'Argent', TRUE, 32);

-- Q33
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (33, 'Quel peintre a coupé son oreille gauche ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (33, 'Vincent van Gogh', TRUE, 33);

-- Q34
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (34, 'Qui est le dieu de l''Amour dans la mythologie romaine ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (34, 'Cupidon', TRUE, 34);

-- Q35
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (35, 'Quelle est la distance d''un marathon en kilomètres ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (35, '42.195', TRUE, 35);

-- Q36
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (36, 'Quel est le nom de la galaxie dans laquelle nous vivons ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (36, 'Voie Lactée', TRUE, 36);

-- Q37
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (37, 'Quel pays est célèbre pour le Taj Mahal ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (37, 'Inde', TRUE, 37);

-- Q38
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (38, 'Quel instrument possède 47 cordes et 7 pédales ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (38, 'Harpe', TRUE, 38);

-- Q39
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (39, 'Qui a tué le Minotaure dans le labyrinthe ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (39, 'Thésée', TRUE, 39);

-- Q40
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (40, 'Quel est l''organe le plus lourd du corps humain ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (40, 'La peau', TRUE, 40);

-- Q41
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (41, 'Dans quel pays se déroule le tournoi de tennis de Roland-Garros ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (41, 'France', TRUE, 41);

-- Q42
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (42, 'Quel compositeur est devenu sourd à la fin de sa vie ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (42, 'Beethoven', TRUE, 42);

-- Q43
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (43, 'Quel est le nom du célèbre détective créé par Arthur Conan Doyle ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (43, 'Sherlock Holmes', TRUE, 43);

-- Q44
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (44, 'Quel gaz les plantes absorbent-elles pour la photosynthèse ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (44, 'Dioxyde de carbone', TRUE, 44);

-- Q45
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (45, 'Quel héros grec avait pour seul point faible son talon ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (45, 'Achille', TRUE, 45);

-- Q46
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (46, 'Quelle est la couleur principale d''une émeraude ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (46, 'Vert', TRUE, 46);

-- Q47
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (47, 'Quel pilote détient le record de 7 titres mondiaux en F1 avec Schumacher ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (47, 'Lewis Hamilton', TRUE, 47);

-- Q48
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (48, 'Quel est le plus grand volcan du système solaire ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (48, 'Olympus Mons', TRUE, 48);

-- Q49
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (49, 'Comment s''appelle l''épée du Roi Arthur ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (49, 'Excalibur', TRUE, 49);

-- Q50
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (50, 'Dans quel pays peut-on voir le Machu Picchu ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (50, 'Pérou', TRUE, 50);

-- Q51
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (51, 'Quel écrivain a créé le personnage de Gargantua ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (51, 'François Rabelais', TRUE, 51);

-- Q52
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (52, 'Quelle est la capitale de l''Allemagne ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (52, 'Berlin', TRUE, 52);

-- Q53
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (53, 'Quel instrument de musique a été inventé par Bartolomeo Cristofori ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (53, 'Piano', TRUE, 53);

-- Q54
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (54, 'Quel est l''élément le plus abondant dans l''univers ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (54, 'Hydrogène', TRUE, 54);

-- Q55
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (55, 'Qui est le dieu de la guerre dans la mythologie grecque ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (55, 'Arès', TRUE, 55);

-- Q56
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (56, 'Quel pays a remporté le plus de Coupes du Monde de football ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (56, 'Brésil', TRUE, 56);

-- Q57
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (57, 'Quelle est la valeur de la constante de gravitation "g" sur Terre (m/s²) ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (57, '9.81', TRUE, 57);

-- Q58
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (58, 'Quel célèbre monument se trouve à New York ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (58, 'Statue de la Liberté', TRUE, 58);

-- Q59
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (59, 'Dans quel opéra trouve-t-on le personnage de Figaro ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (59, 'Le Barbier de Séville', TRUE, 59);

-- Q60
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (60, 'Quel titan porte la voûte céleste sur ses épaules ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (60, 'Atlas', TRUE, 60);

-- Q61
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (61, 'Quel est le nom du plus grand os de la jambe ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (61, 'Fémur', TRUE, 61);

-- Q62
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (62, 'Qui a peint "Le Cri" ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (62, 'Edvard Munch', TRUE, 62);

-- Q63
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (63, 'Comment appelle-t-on le point le plus éloigné de la Terre sur l''orbite d''un satellite ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (63, 'Apogée', TRUE, 63);

-- Q64
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (64, 'Quel animal est le symbole de la sagesse dans la mythologie grecque ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (64, 'Chouette', TRUE, 64);

-- Q65
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (65, 'Dans quelle ville se trouvent les jardins suspendus de Sémiramis ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (65, 'Babylone', TRUE, 65);

-- Q66
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (66, 'Quel est le nom de la particule élémentaire responsable de la masse (le "Boson de...") ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (66, 'Higgs', TRUE, 66);

-- Q67
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (67, 'Quel est le sport pratiqué par Rafael Nadal ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (67, 'Tennis', TRUE, 67);

-- Q68
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (68, 'Qui est le dieu de la forge et du feu dans la mythologie grecque ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (68, 'Héphaïstos', TRUE, 68);

-- Q69
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (69, 'Quel est le titre du premier film de l''histoire du cinéma (1895) ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (69, 'La Sortie de l''usine Lumière à Lyon', TRUE, 69);

-- Q70
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (70, 'Quel est l''instrument à vent le plus petit de l''orchestre symphonique ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (70, 'Piccolo', TRUE, 70);

-- Q71
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (71, 'Quelle est la capitale de l''Australie ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (71, 'Canberra', TRUE, 71);

-- Q72
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (72, 'En chimie, que signifie le pH ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (72, 'Potentiel Hydrogène', TRUE, 72);

-- Q73
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (73, 'Quel célèbre paquebot a coulé en 1912 ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (73, 'Titanic', TRUE, 73);

-- Q74
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (74, 'Quel roi de France était surnommé le Roi-Soleil ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (74, 'Louis XIV', TRUE, 74);

-- Q75
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (75, 'Qui est la déesse de la discorde dans la mythologie grecque ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (75, 'Eris', TRUE, 75);

-- Q76
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (76, 'Quelle est la principale source d''énergie de la Terre ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (76, 'Le Soleil', TRUE, 76);

-- Q77
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (77, 'Quel écrivain est l''auteur de "1984" ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (77, 'George Orwell', TRUE, 77);

-- Q78
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (78, 'Quel compositeur a écrit les "Quatre Saisons" ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (78, 'Vivaldi', TRUE, 78);

-- Q79
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (79, 'Combien de joueurs y a-t-il dans une équipe de basket sur le terrain ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (79, '5', TRUE, 79);

-- Q80
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (80, 'Quelle est la plus grande planète du système solaire ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (80, 'Jupiter', TRUE, 80);

-- Q81
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (81, 'Quel navire a ramené Napoléon de l''île d''Elbe ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (81, 'L''Inconstant', TRUE, 81);

-- Q82
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (82, 'Dans quelle ville se trouve la Tour Eiffel ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (82, 'Paris', TRUE, 82);

-- Q83
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (83, 'Quel gaz constitue environ 78% de l''air que nous respirons ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (83, 'Azote', TRUE, 83);

-- Q84
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (84, 'Qui a inventé le vaccin contre la rage ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (84, 'Louis Pasteur', TRUE, 84);

-- Q85
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (85, 'Quel est le nom du célèbre sorcier à lunettes créé par J.K. Rowling ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (85, 'Harry Potter', TRUE, 85);

-- Q86
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (86, 'Qui est le dieu messager dans la mythologie romaine ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (86, 'Mercure', TRUE, 86);

-- Q87
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (87, 'Quel prix Nobel a été refusé par Jean-Paul Sartre ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (87, 'Littérature', TRUE, 87);

-- Q88
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (88, 'Quel pays est la patrie du Flamenco ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (88, 'Espagne', TRUE, 88);

-- Q89
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (89, 'Quel est le nom du pigment vert dans les feuilles ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (89, 'Chlorophylle', TRUE, 89);

-- Q90
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (90, 'Quelle bataille de 1815 a marqué la fin de Napoléon Ier ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (90, 'Waterloo', TRUE, 90);

-- Q91
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (91, 'Comment s''appelle le satellite naturel de la Terre ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (91, 'La Lune', TRUE, 91);

-- Q92
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (92, 'Quel est le nom du tableau le plus célèbre de Léonard de Vinci ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (92, 'La Joconde', TRUE, 92);

-- Q93
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (93, 'Quel organe humain contient les îlots de Langerhans ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (93, 'Pancréas', TRUE, 93);

-- Q94
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (94, 'Quel est le nom de la montagne la plus haute du monde ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (94, 'Everest', TRUE, 94);

-- Q95
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (95, 'Qui a écrit la pièce de théâtre "Hamlet" ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (95, 'William Shakespeare', TRUE, 95);

-- Q96
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (96, 'Quelle est la durée exacte d''une année sidérale (en jours) ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (96, '365.25', TRUE, 96);

-- Q97
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (97, 'Quelle langue est la plus parlée au Brésil ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (97, 'Portugais', TRUE, 97);

-- Q98
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (98, 'Qui était le dieu de la mort dans l''Égypte ancienne ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (98, 'Anubis', TRUE, 98);

-- Q99
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (99, 'Quel est le nom du premier satellite artificiel lancé dans l''espace ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (99, 'Spoutnik 1', TRUE, 99);

-- Q100
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (100, 'Quel est l''animal le plus rapide au monde ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (100, 'Guépard', TRUE, 100);

-- Q101
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (101, 'Dans quel pays se trouve le volcan Vésuve ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (101, 'Italie', TRUE, 101);

-- Q102
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (102, 'Qui a découvert la loi de la gravitation universelle ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (102, 'Isaac Newton', TRUE, 102);

-- Q103
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (103, 'Quel est le plus grand mammifère marin ?', 1, 1, 'Facile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (103, 'Baleine bleue', TRUE, 103);

-- Q104
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (104, 'Quel sculpteur a réalisé la statue de la Liberté ?', 1, 2, 'Moyen', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (104, 'Auguste Bartholdi', TRUE, 104);

-- Q105
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES (105, 'Quelle est la température du zéro absolu en degrés Celsius ?', 1, 3, 'Difficile', 15);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (105, '-273.15', TRUE, 105);

-- ===================================
-- MANCHE 2 : 150 QUESTIONS
-- ===================================
-- Q106
INSERT INTO QUESTION VALUES (106,'Quelle est la capitale de l''Italie ?',2,1,'Facile',NULL);
INSERT INTO REPONSE VALUES (106,'Rome',TRUE,106);

-- Q107
INSERT INTO QUESTION VALUES (107,'Combien de joueurs y a-t-il dans une équipe de football ?',2,1,'Facile',NULL);
INSERT INTO REPONSE VALUES (107,'11',TRUE,107);

-- Q108
INSERT INTO QUESTION VALUES (108,'Quel animal est le roi de la jungle ?',2,1,'Facile',NULL);
INSERT INTO REPONSE VALUES (108,'Lion',TRUE,108);

-- Q109
INSERT INTO QUESTION VALUES (109,'Quelle couleur obtient-on en mélangeant du bleu et du jaune ?',2,1,'Facile',NULL);
INSERT INTO REPONSE VALUES (109,'Vert',TRUE,109);

-- Q110
INSERT INTO QUESTION VALUES (110,'Quel est le plus grand mammifère du monde ?',2,1,'Facile',NULL);
INSERT INTO REPONSE VALUES (110,'Baleine bleue',TRUE,110);

-- Q111
INSERT INTO QUESTION VALUES (111,'Dans quel pays se trouve la tour Eiffel ?',2,1,'Facile',NULL);
INSERT INTO REPONSE VALUES (111,'France',TRUE,111);

-- Q112
INSERT INTO QUESTION VALUES (112,'Combien de côtés a un hexagone ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (112,'6',TRUE,112);

-- Q113
INSERT INTO QUESTION VALUES (113,'Quel est le métal le plus précieux ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (113,'Rhodium',TRUE,113);

-- Q114
INSERT INTO QUESTION VALUES (114,'Qui a découvert l''Amérique en 1492 ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (114,'Christophe Colomb',TRUE,114);

-- Q115
INSERT INTO QUESTION VALUES (115,'Quelle est la langue la plus parlée au monde ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (115,'Chinois',TRUE,115);

-- Q116
INSERT INTO QUESTION VALUES (116,'Quel organe du corps humain pompe le sang ?',2,1,'Facile',NULL);
INSERT INTO REPONSE VALUES (116,'Coeur',TRUE,116);

-- Q117
INSERT INTO QUESTION VALUES (117,'Combien de dents a un adulte normalement ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (117,'32',TRUE,117);

-- Q118
INSERT INTO QUESTION VALUES (118,'Quelle est la monnaie du Japon ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (118,'Yen',TRUE,118);

-- Q119
INSERT INTO QUESTION VALUES (119,'Quel gaz respirons-nous principalement ?',2,1,'Facile',NULL);
INSERT INTO REPONSE VALUES (119,'Azote',TRUE,119);

-- Q120
INSERT INTO QUESTION VALUES (120,'Combien de secondes y a-t-il dans une heure ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (120,'3600',TRUE,120);

-- Q121
INSERT INTO QUESTION VALUES (121,'Quel est le nom scientifique de l''étude de la classification des espèces ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (121,'Systématique',TRUE,121);

-- Q122
INSERT INTO QUESTION VALUES (122,'Quelle planète possède le jour le plus court du système solaire ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (122,'Jupiter',TRUE,122);

-- Q123
INSERT INTO QUESTION VALUES (123,'Comment appelle-t-on la photosynthèse réalisée sans lumière par certaines bactéries ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (123,'Chimiosynthèse',TRUE,123);

-- Q124
INSERT INTO QUESTION VALUES (124,'Quelle vitamine est principalement synthétisée par l''exposition au soleil ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (124,'Vitamine D',TRUE,124);

-- Q125
INSERT INTO QUESTION VALUES (125,'Dans quelle constellation se trouve l''étoile polaire ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (125,'Petite Ourse',TRUE,125);

-- Q126
INSERT INTO QUESTION VALUES (126,'Quel est l''ancêtre sauvage du maïs cultivé ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (126,'Téosinte',TRUE,126);

-- Q127
INSERT INTO QUESTION VALUES (127,'Quel minéral est essentiel à la production d''hormones thyroïdiennes ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (127,'Iode',TRUE,127);

-- Q128
INSERT INTO QUESTION VALUES (128,'Comment appelle-t-on le regroupement de 12 signes du zodiaque en astrologie ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (128,'Zodiaque',TRUE,128);

-- Q129
INSERT INTO QUESTION VALUES (129,'Quelle partie de la cellule est responsable de la respiration cellulaire ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (129,'Mitochondrie',TRUE,129);

-- Q130
INSERT INTO QUESTION VALUES (130,'Quel est le nom de la galaxie la plus proche de la Voie Lactée ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (130,'Andromède',TRUE,130);

-- Q131
INSERT INTO QUESTION VALUES (131,'Quelle est la plus grande glande du corps humain ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (131,'Foie',TRUE,131);

-- Q132
INSERT INTO QUESTION VALUES (132,'Comment appelle-t-on l''alignement de trois corps célestes ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (132,'Syzygie',TRUE,132);

-- Q133
INSERT INTO QUESTION VALUES (133,'Quel pigment donne leur couleur rouge aux tomates ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (133,'Lycopène',TRUE,133);

-- Q134
INSERT INTO QUESTION VALUES (134,'En botanique, comment appelle-t-on une plante qui vit deux ans ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (134,'Bisannuelle',TRUE,134);

-- Q135
INSERT INTO QUESTION VALUES (135,'Quelle unité mesure la valeur énergétique des aliments ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (135,'Kilocalorie',TRUE,135);

-- Q136
INSERT INTO QUESTION VALUES (136,'Quel physicien a formulé les trois lois du mouvement des planètes ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (136,'Johannes Kepler',TRUE,136);

-- Q137
INSERT INTO QUESTION VALUES (137,'Quel est le nom de la science qui étudie les champignons ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (137,'Mycologie',TRUE,137);

-- Q138
INSERT INTO QUESTION VALUES (138,'Comment s''appelle l''explosion d''une étoile en fin de vie ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (138,'Supernova',TRUE,138);

-- Q139
INSERT INTO QUESTION VALUES (139,'Quel acide est principalement présent dans le suc gastrique ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (139,'Acide chlorhydrique',TRUE,139);

-- Q140
INSERT INTO QUESTION VALUES (140,'Quelle planète est surnommée la planète rouge ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (140,'Mars',TRUE,140);

-- Q141
INSERT INTO QUESTION VALUES (141,'Quel est le nom de l''appareil reproducteur mâle d''une fleur ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (141,'Étamine',TRUE,141);

-- Q142
INSERT INTO QUESTION VALUES (142,'Comment appelle-t-on le sucre présent dans le lait ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (142,'Lactose',TRUE,142);

-- Q143
INSERT INTO QUESTION VALUES (143,'Quelle est la vitesse approximative de la lumière en km par seconde ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (143,'300000',TRUE,143);

-- Q144
INSERT INTO QUESTION VALUES (144,'Quel arbre produit les glands ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (144,'Chêne',TRUE,144);

-- Q145
INSERT INTO QUESTION VALUES (145,'Quelle est la plus petite planète du système solaire ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (145,'Mercure',TRUE,145);

-- Q146
INSERT INTO QUESTION VALUES (146,'Comment appelle-t-on l''étude de l''influence supposée des astres sur les humains ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (146,'Astrologie',TRUE,146);

-- Q147
INSERT INTO QUESTION VALUES (147,'Quel est le nom du processus de division cellulaire chez les eucaryotes ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (147,'Mitose',TRUE,147);

-- Q148
INSERT INTO QUESTION VALUES (148,'Quel gaz noble est le plus abondant dans l''atmosphère terrestre ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (148,'Argon',TRUE,148);

-- Q149
INSERT INTO QUESTION VALUES (149,'Quelle est la fonction principale des globules rouges ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (149,'Transporter l''oxygène',TRUE,149);

-- Q150
INSERT INTO QUESTION VALUES (150,'Comment appelle-t-on une plante qui perd ses feuilles chaque année ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (150,'Caduque',TRUE,150);

-- Q151
INSERT INTO QUESTION VALUES (151,'Quel est le nom du premier homme dans l''espace ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (151,'Youri Gagarine',TRUE,151);

-- Q152
INSERT INTO QUESTION VALUES (152,'Quel est le composant principal du Soleil ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (152,'Hydrogène',TRUE,152);

-- Q153
INSERT INTO QUESTION VALUES (153,'Quel est l''organe de l''équilibre chez l''humain ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (153,'Oreille interne',TRUE,153);

-- Q154
INSERT INTO QUESTION VALUES (154,'Quel est le terme médical pour une pression artérielle trop élevée ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (154,'Hypertension',TRUE,154);

-- Q155
INSERT INTO QUESTION VALUES (155,'Quelle famille de plantes comprend les pois et les haricots ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (155,'Fabacées',TRUE,155);

-- Q156
INSERT INTO QUESTION VALUES (156,'Comment appelle-t-on le passage direct de l''état solide à l''état gazeux ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (156,'Sublimation',TRUE,156);

-- Q157
INSERT INTO QUESTION VALUES (157,'Quelle planète est célèbre pour ses grands anneaux ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (157,'Saturne',TRUE,157);

-- Q158
INSERT INTO QUESTION VALUES (158,'Quel est le sucre circulant dans le sang ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (158,'Glucose',TRUE,158);

-- Q159
INSERT INTO QUESTION VALUES (159,'Quelle est l''unité de mesure de la force ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (159,'Newton',TRUE,159);

-- Q160
INSERT INTO QUESTION VALUES (160,'Quelle est la science qui étudie les poissons ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (160,'Ichtyologie',TRUE,160);

-- Q161
INSERT INTO QUESTION VALUES (161,'Quel est le nom du nuage de débris entourant le système solaire ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (161,'Nuage d''Oort',TRUE,161);

-- Q162
INSERT INTO QUESTION VALUES (162,'Quelle vitamine aide à la coagulation du sang ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (162,'Vitamine K',TRUE,162);

-- Q163
INSERT INTO QUESTION VALUES (163,'Quel botaniste suédois a créé la nomenclature binominale ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (163,'Carl von Linné',TRUE,163);

-- Q164
INSERT INTO QUESTION VALUES (164,'Quel est le nom de la lune de Pluton la plus imposante ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (164,'Charon',TRUE,164);

-- Q165
INSERT INTO QUESTION VALUES (165,'Comment appelle-t-on les plantes qui croissent sur d''autres plantes sans être parasites ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (165,'Épiphytes',TRUE,165);

-- Q166
INSERT INTO QUESTION VALUES (166,'Quel acide gras de la famille des Oméga-3 est essentiel au cerveau ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (166,'DHA',TRUE,166);

-- Q167
INSERT INTO QUESTION VALUES (167,'Quelle est l''étoile la plus brillante de la constellation du Lion ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (167,'Régulus',TRUE,167);

-- Q168
INSERT INTO QUESTION VALUES (168,'Quel est le nom du processus de fabrication du glucose par les plantes ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (168,'Photosynthèse',TRUE,168);

-- Q169
INSERT INTO QUESTION VALUES (169,'En systématique, quel rang se trouve directement au-dessous de la Famille ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (169,'Genre',TRUE,169);

-- Q170
INSERT INTO QUESTION VALUES (170,'Quel oligo-élément est indispensable à la fixation du fer dans l''organisme ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (170,'Cuivre',TRUE,170);

-- Q171
INSERT INTO QUESTION VALUES (171,'Quelle est la température de surface approximative de Vénus en degrés Celsius ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (171,'460',TRUE,171);

-- Q172
INSERT INTO QUESTION VALUES (172,'Comment appelle-t-on un arbre dont le tronc est gonflé pour stocker l''eau ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (172,'Caudiciforme',TRUE,172);

-- Q173
INSERT INTO QUESTION VALUES (173,'Quel est le nom de la zone de l''espace où la gravité est si forte que rien ne s''échappe ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (173,'Trou noir',TRUE,173);

-- Q174
INSERT INTO QUESTION VALUES (174,'Quel est le constituant principal de la paroi des cellules végétales ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (174,'Cellulose',TRUE,174);

-- Q175
INSERT INTO QUESTION VALUES (175,'Quelle vitamine est également appelée acide ascorbique ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (175,'Vitamine C',TRUE,175);

-- Q176
INSERT INTO QUESTION VALUES (176,'Quel est le nom de la plus grande lune de Saturne ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (176,'Titan',TRUE,176);

-- Q177
INSERT INTO QUESTION VALUES (177,'Quelle hormone régule le taux de sucre dans le sang ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (177,'Insuline',TRUE,177);

-- Q178
INSERT INTO QUESTION VALUES (178,'Quelle est la planète la plus dense du système solaire ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (178,'Terre',TRUE,178);

-- Q179
INSERT INTO QUESTION VALUES (179,'Quel nutriment fournit 9 calories par gramme ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (179,'Lipide',TRUE,179);

-- Q180
INSERT INTO QUESTION VALUES (180,'Quel est le nom de la limite au-delà de laquelle rien ne peut sortir d''un trou noir ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (180,'Horizon des événements',TRUE,180);

-- Q181
INSERT INTO QUESTION VALUES (181,'Dans quelle partie de la plante se déroule principalement la photosynthèse ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (181,'Feuille',TRUE,181);

-- Q182
INSERT INTO QUESTION VALUES (182,'Quel est le nom de la constellation en forme de W ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (182,'Cassiopée',TRUE,182);

-- Q183
INSERT INTO QUESTION VALUES (183,'Quelle science étudie les relations entre les êtres vivants et leur milieu ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (183,'Écologie',TRUE,183);

-- Q184
INSERT INTO QUESTION VALUES (184,'Comment appelle-t-on le sommeil hivernal profond de certains animaux ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (184,'Hibernation',TRUE,184);

-- Q185
INSERT INTO QUESTION VALUES (185,'Quel est le plus petit composant vivant d''un organisme ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (185,'Cellule',TRUE,185);

-- Q186
INSERT INTO QUESTION VALUES (186,'Quelle lune de Jupiter est couverte d''une épaisse couche de glace ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (186,'Europe',TRUE,186);

-- Q187
INSERT INTO QUESTION VALUES (187,'Quel métal est le constituant central de la chlorophylle ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (187,'Magnésium',TRUE,187);

-- Q188
INSERT INTO QUESTION VALUES (188,'Quel nutriment est composé de chaînes d''acides aminés ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (188,'Protéine',TRUE,188);

-- Q189
INSERT INTO QUESTION VALUES (189,'Quel est le nom de la trajectoire d''une planète autour du Soleil ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (189,'Orbite',TRUE,189);

-- Q190
INSERT INTO QUESTION VALUES (190,'Comment appelle-t-on le croisement de deux individus d''espèces différentes ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (190,'Hybride',TRUE,190);

-- Q191
INSERT INTO QUESTION VALUES (191,'Quel est le nom scientifique du tournesol ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (191,'Helianthus',TRUE,191);

-- Q192
INSERT INTO QUESTION VALUES (192,'Quel minéral durcit l''émail des dents ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (192,'Fluor',TRUE,192);

-- Q193
INSERT INTO QUESTION VALUES (193,'Quelle étoile de la constellation d''Orion est une supergéante rouge ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (193,'Bételgeuse',TRUE,193);

-- Q194
INSERT INTO QUESTION VALUES (194,'Comment appelle-t-on la science qui étudie les fossiles ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (194,'Paléontologie',TRUE,194);

-- Q195
INSERT INTO QUESTION VALUES (195,'Quelle planète possède la plus grande montagne du système solaire ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (195,'Mars',TRUE,195);

-- Q196
INSERT INTO QUESTION VALUES (196,'Quel terme désigne l''ensemble des gènes d''un individu ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (196,'Génotype',TRUE,196);

-- Q197
INSERT INTO QUESTION VALUES (197,'Quelle est la plus petite unité d''un élément chimique ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (197,'Atome',TRUE,197);

-- Q198
INSERT INTO QUESTION VALUES (198,'Comment appelle-t-on les plantes qui vivent plusieurs années ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (198,'Vivaces',TRUE,198);

-- Q199
INSERT INTO QUESTION VALUES (199,'Quel est l''instrument de mesure de la pression atmosphérique ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (199,'Baromètre',TRUE,199);

-- Q200
INSERT INTO QUESTION VALUES (200,'Quel scientifique a proposé la théorie de la dérive des continents ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (200,'Alfred Wegener',TRUE,200);

-- Q201
INSERT INTO QUESTION VALUES (201,'Quel gaz est rejeté par les plantes lors de la photosynthèse ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (201,'Oxygène',TRUE,201);

-- Q202
INSERT INTO QUESTION VALUES (202,'Combien de planètes telluriques compte notre système solaire ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (202,'4',TRUE,202);

-- Q203
INSERT INTO QUESTION VALUES (203,'Quelle est la distance moyenne Terre-Soleil en millions de kilomètres ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (203,'150',TRUE,203);

-- Q204
INSERT INTO QUESTION VALUES (204,'Quelle vitamine est nécessaire pour une bonne vision nocturne ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (204,'Vitamine A',TRUE,204);

-- Q205
INSERT INTO QUESTION VALUES (205,'Quel est le nom du pigment respiratoire qui donne sa couleur rouge au sang ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (205,'Hémoglobine',TRUE,205);

-- Q206
INSERT INTO QUESTION VALUES (206,'Comment appelle-t-on la branche de la botanique étudiant les algues ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (206,'Phycologie',TRUE,206);

-- Q207
INSERT INTO QUESTION VALUES (207,'Quel est le plus gros satellite de la planète Neptune ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (207,'Triton',TRUE,207);

-- Q208
INSERT INTO QUESTION VALUES (208,'Quel oligo-élément est essentiel au métabolisme du glucose via l''insuline ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (208,'Chrome',TRUE,208);

-- Q209
INSERT INTO QUESTION VALUES (209,'Quel est le nom du point de l''orbite d''une planète le plus proche du Soleil ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (209,'Périhélie',TRUE,209);

-- Q210
INSERT INTO QUESTION VALUES (210,'Quelle partie de la fleur se transforme en fruit après fécondation ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (210,'Ovaire',TRUE,210);

-- Q211
INSERT INTO QUESTION VALUES (211,'Quel est le constituant majeur du gaz naturel ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (211,'Méthane',TRUE,211);

-- Q212
INSERT INTO QUESTION VALUES (212,'Comment appelle-t-on le mouvement de rotation d''une plante vers la lumière ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (212,'Phototropisme',TRUE,212);

-- Q213
INSERT INTO QUESTION VALUES (213,'Quelle planète du système solaire a la vitesse de rotation la plus lente ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (213,'Vénus',TRUE,213);

-- Q214
INSERT INTO QUESTION VALUES (214,'Quel minéral compose principalement les os et les dents ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (214,'Calcium',TRUE,214);

-- Q215
INSERT INTO QUESTION VALUES (215,'Quelle science étudie la distribution géographique des êtres vivants ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (215,'Biogéographie',TRUE,215);

-- Q216
INSERT INTO QUESTION VALUES (216,'Quel est l''astre le plus brillant du ciel nocturne après la Lune ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (216,'Vénus',TRUE,216);

-- Q217
INSERT INTO QUESTION VALUES (217,'Comment appelle-t-on le tissu conducteur de la sève élaborée dans une plante ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (217,'Phloème',TRUE,217);

-- Q218
INSERT INTO QUESTION VALUES (218,'Quel est le nom de l''état de manque total d''oxygène dans un tissu ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (218,'Anoxie',TRUE,218);

-- Q219
INSERT INTO QUESTION VALUES (219,'Quelle est la plus grande planète gazeuse du système solaire ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (219,'Jupiter',TRUE,219);

-- Q220
INSERT INTO QUESTION VALUES (220,'Quelle vitamine aide à la synthèse du collagène ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (220,'Vitamine C',TRUE,220);

-- Q221
INSERT INTO QUESTION VALUES (221,'Quel est le nom de la science traitant des lois de l''hérédité ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (221,'Génétique',TRUE,221);

-- Q222
INSERT INTO QUESTION VALUES (222,'Quel astronome a été condamné pour avoir soutenu l''héliocentrisme ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (222,'Galilée',TRUE,222);

-- Q223
INSERT INTO QUESTION VALUES (223,'Quel type de sucre trouve-t-on en abondance dans les fruits ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (223,'Fructose',TRUE,223);

-- Q224
INSERT INTO QUESTION VALUES (224,'Quel est le nom de la partie mâle de la graine de pollen ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (224,'Gamétophyte',TRUE,224);

-- Q225
INSERT INTO QUESTION VALUES (225,'Quelle force maintient les planètes en orbite autour du Soleil ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (225,'Gravitation',TRUE,225);

-- Q226
INSERT INTO QUESTION VALUES (226,'Quelle science étudie les climats passés ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (226,'Paléoclimatologie',TRUE,226);

-- Q227
INSERT INTO QUESTION VALUES (227,'Comment appelle-t-on un régime alimentaire sans aucun produit animal ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (227,'Végétalisme',TRUE,227);

-- Q228
INSERT INTO QUESTION VALUES (228,'Quelle est la période de révolution de la Terre en jours ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (228,'365.25',TRUE,228);

-- Q229
INSERT INTO QUESTION VALUES (229,'Quel est l''organe principal de la photosynthèse chez les cactus ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (229,'Tige',TRUE,229);

-- Q230
INSERT INTO QUESTION VALUES (230,'Comment appelle-t-on le mouvement apparent des planètes vers l''arrière dans le ciel ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (230,'Rétrogradation',TRUE,230);

-- Q231
INSERT INTO QUESTION VALUES (231,'Quel est le nom de la zone de l''atmosphère où nous vivons ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (231,'Troposphère',TRUE,231);

-- Q232
INSERT INTO QUESTION VALUES (232,'Quel type de lipides est solide à température ambiante ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (232,'Graisses saturées',TRUE,232);

-- Q233
INSERT INTO QUESTION VALUES (233,'Quelle science étudie la structure et l''évolution de l''Univers ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (233,'Cosmologie',TRUE,233);

-- Q234
INSERT INTO QUESTION VALUES (234,'Comment appelle-t-on le fruit sec du chêne ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (234,'Gland',TRUE,234);

-- Q235
INSERT INTO QUESTION VALUES (235,'Quel est l''élément le plus léger du tableau périodique ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (235,'Hydrogène',TRUE,235);

-- Q236
INSERT INTO QUESTION VALUES (236,'Quel est le nom de la science qui étudie le tissu nerveux ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (236,'Neurologie',TRUE,236);

-- Q237
INSERT INTO QUESTION VALUES (237,'Quelle planète possède un système d''anneaux composé principalement de glace ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (237,'Saturne',TRUE,237);

-- Q238
INSERT INTO QUESTION VALUES (238,'Quel nutriment est indispensable au transport de l''oxygène dans le sang ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (238,'Fer',TRUE,238);

-- Q239
INSERT INTO QUESTION VALUES (239,'Comment s''appelle l''ouverture d''une fleur permettant les échanges gazeux ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (239,'Stomate',TRUE,239);

-- Q240
INSERT INTO QUESTION VALUES (240,'Quel type de rayonnement est bloqué par la couche d''ozone ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (240,'Ultraviolet',TRUE,240);

-- Q241
INSERT INTO QUESTION VALUES (241,'Quel est le nom de la lune de la Terre ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (241,'Lune',TRUE,241);

-- Q242
INSERT INTO QUESTION VALUES (242,'Quel minéral est nécessaire à la contraction musculaire ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (242,'Magnésium',TRUE,242);

-- Q243
INSERT INTO QUESTION VALUES (243,'Qui a formulé la théorie de la relativité générale ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (243,'Albert Einstein',TRUE,243);

-- Q244
INSERT INTO QUESTION VALUES (244,'Quelle science étudie les arbres et les arbustes ?',2,1,'Difficile',NULL);
INSERT INTO REPONSE VALUES (244,'Dendrologie',TRUE,244);

-- Q245
INSERT INTO QUESTION VALUES (245,'Quel est le nom de la phase de la lune où elle est invisible de la Terre ?',2,1,'Moyen',NULL);
INSERT INTO REPONSE VALUES (245,'Nouvelle lune',TRUE,245);

-- ===================================
-- MANCHE 3 : 15 QUESTIONS QCM (4 choix chacune)
-- ===================================
-- Q246
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (246,'Quelle est la capitale de l''Italie ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (246,'Rome',TRUE,246);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (247,'Milan',FALSE,246);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (248,'Naples',FALSE,246);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (249,'Turin',FALSE,246);

-- Q247
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (247,'Combien de joueurs y a-t-il dans une équipe de football ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (250,'11',TRUE,247);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (251,'10',FALSE,247);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (252,'9',FALSE,247);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (253,'12',FALSE,247);

-- Q248
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (248,'Quel animal est le roi de la jungle ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (254,'Lion',TRUE,248);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (255,'Tigre',FALSE,248);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (256,'Panthère',FALSE,248);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (257,'Éléphant',FALSE,248);

-- Q249
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (249,'Quelle couleur obtient-on en mélangeant du bleu et du jaune ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (258,'Vert',TRUE,249);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (259,'Violet',FALSE,249);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (260,'Orange',FALSE,249);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (261,'Marron',FALSE,249);

-- Q250
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (250,'Quel est le plus grand mammifère du monde ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (262,'Baleine bleue',TRUE,250);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (263,'Éléphant africain',FALSE,250);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (264,'Rhinocéros',FALSE,250);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (265,'Cachalot',FALSE,250);

-- Q251
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (251,'Dans quel pays se trouve la tour Eiffel ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (266,'France',TRUE,251);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (267,'Italie',FALSE,251);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (268,'Espagne',FALSE,251);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (269,'Belgique',FALSE,251);

-- Q252
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (252,'Combien de côtés a un hexagone ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (270,'6',TRUE,252);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (271,'5',FALSE,252);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (272,'7',FALSE,252);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (273,'8',FALSE,252);

-- Q253
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (253,'Quel est le métal le plus précieux ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (274,'Rhodium',TRUE,253);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (275,'Or',FALSE,253);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (276,'Platine',FALSE,253);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (277,'Argent',FALSE,253);

-- Q254
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (254,'Qui a découvert l''Amérique en 1492 ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (278,'Christophe Colomb',TRUE,254);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (279,'Vasco de Gama',FALSE,254);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (280,'Fernand de Magellan',FALSE,254);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (281,'Marco Polo',FALSE,254);

-- Q255
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (255,'Quelle est la langue la plus parlée au monde ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (282,'Chinois',TRUE,255);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (283,'Anglais',FALSE,255);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (284,'Espagnol',FALSE,255);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (285,'Hindi',FALSE,255);

-- Q256
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (256,'Quelle planète est la plus proche du Soleil ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (286,'Mercure',TRUE,256);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (287,'Vénus',FALSE,256);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (288,'La Terre',FALSE,256);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (289,'Mars',FALSE,256);

-- Q257
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (257,'Combien y a-t-il de continents sur Terre ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (290,'7',TRUE,257);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (291,'5',FALSE,257);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (292,'6',FALSE,257);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (293,'8',FALSE,257);

-- Q258
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (258,'Quel organe permet de filtrer le sang ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (294,'Les reins',TRUE,258);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (295,'Le foie',FALSE,258);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (296,'Le cœur',FALSE,258);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (297,'Les poumons',FALSE,258);

-- Q259
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (259,'Quelle est la capitale du Japon ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (298,'Tokyo',TRUE,259);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (299,'Kyoto',FALSE,259);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (300,'Osaka',FALSE,259);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (301,'Nagoya',FALSE,259);

-- Q260
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (260,'Quelle unité mesure l’intensité du courant électrique ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (302,'Ampère',TRUE,260);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (303,'Volt',FALSE,260);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (304,'Watt',FALSE,260);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (305,'Ohm',FALSE,260);

-- Q261
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (261,'Quel est le plus grand océan du monde ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (306,'Océan Pacifique',TRUE,261);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (307,'Océan Atlantique',FALSE,261);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (308,'Océan Indien',FALSE,261);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (309,'Océan Arctique',FALSE,261);

-- Q262
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (262,'Combien de minutes y a-t-il dans une heure ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (310,'60',TRUE,262);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (311,'30',FALSE,262);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (312,'90',FALSE,262);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (313,'100',FALSE,262);

-- Q263
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (263,'Quel est le gaz indispensable à la respiration humaine ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (314,'Oxygène',TRUE,263);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (315,'Azote',FALSE,263);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (316,'Dioxyde de carbone',FALSE,263);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (317,'Hydrogène',FALSE,263);

-- Q264
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (264,'Quel pays a pour capitale Berlin ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (318,'Allemagne',TRUE,264);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (319,'Autriche',FALSE,264);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (320,'Suisse',FALSE,264);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (321,'Pays-Bas',FALSE,264);

-- Q265
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (265,'Quel instrument sert à mesurer la température ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (322,'Thermomètre',TRUE,265);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (323,'Baromètre',FALSE,265);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (324,'Anémomètre',FALSE,265);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (325,'Hygromètre',FALSE,265);

-- Q266
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (266,'Quel est l’animal emblématique de l’Australie ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (326,'Kangourou',TRUE,266);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (327,'Koala',FALSE,266);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (328,'Dingo',FALSE,266);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (329,'Émeu',FALSE,266);

-- Q267
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (267,'Combien de jours compte une année bissextile ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (330,'366',TRUE,267);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (331,'365',FALSE,267);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (332,'364',FALSE,267);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (333,'360',FALSE,267);

-- Q268
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (268,'Quel est l’organe principal de la digestion ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (334,'L’estomac',TRUE,268);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (335,'Le foie',FALSE,268);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (336,'Le pancréas',FALSE,268);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (337,'La rate',FALSE,268);

-- Q269
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (269,'Quelle est la capitale de l’Italie ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (338,'Rome',TRUE,269);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (339,'Milan',FALSE,269);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (340,'Venise',FALSE,269);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (341,'Naples',FALSE,269);

-- Q270
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (270,'Quel est le plus petit nombre premier ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (342,'2',TRUE,270);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (343,'1',FALSE,270);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (344,'3',FALSE,270);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (345,'5',FALSE,270);

-- Q271
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (271,'Quel est le plus grand désert chaud du monde ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (346,'Le Sahara',TRUE,271);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (347,'Le désert de Gobi',FALSE,271);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (348,'Le désert d’Atacama',FALSE,271);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (349,'Le désert du Kalahari',FALSE,271);

-- Q272
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (272,'Quelle planète est surnommée la planète rouge ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (350,'Mars',TRUE,272);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (351,'Jupiter',FALSE,272);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (352,'Vénus',FALSE,272);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (353,'Mercure',FALSE,272);

-- Q273
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (273,'Combien de dents possède un adulte en général ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (354,'32',TRUE,273);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (355,'28',FALSE,273);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (356,'30',FALSE,273);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (357,'36',FALSE,273);

-- Q274
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (274,'Quel organe humain produit l’insuline ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (358,'Le pancréas',TRUE,274);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (359,'Le foie',FALSE,274);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (360,'La rate',FALSE,274);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (361,'L’estomac',FALSE,274);

-- Q275
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (275,'Quel est le symbole chimique de l’or ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (362,'Au',TRUE,275);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (363,'Ag',FALSE,275);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (364,'Fe',FALSE,275);
INSERT

-- Q276
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (276,'Quelle est la capitale du Canada ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (366,'Ottawa',TRUE,276);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (367,'Toronto',FALSE,276);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (368,'Montréal',FALSE,276);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (369,'Vancouver',FALSE,276);

-- Q277
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (277,'Quel est l’organe principal de la circulation sanguine ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (370,'Le cœur',TRUE,277);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (371,'Le cerveau',FALSE,277);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (372,'Les poumons',FALSE,277);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (373,'Le foie',FALSE,277);

-- Q278
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (278,'Combien de côtés possède un octogone ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (374,'8',TRUE,278);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (375,'6',FALSE,278);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (376,'7',FALSE,278);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (377,'9',FALSE,278);

-- Q279
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (279,'Quelle planète est la plus grande du système solaire ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (378,'Jupiter',TRUE,279);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (379,'Saturne',FALSE,279);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (380,'Neptune',FALSE,279);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (381,'Uranus',FALSE,279);

-- Q280
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (280,'Quel est le principal constituant de l’air ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (382,'L’azote',TRUE,280);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (383,'L’oxygène',FALSE,280);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (384,'Le dioxyde de carbone',FALSE,280);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (385,'L’argon',FALSE,280);

-- Q281
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (281,'Quel est le plus grand continent du monde ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (386,'Asie',TRUE,281);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (387,'Afrique',FALSE,281);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (388,'Europe',FALSE,281);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (389,'Amérique',FALSE,281);

-- Q282
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (282,'Quel est l’os le plus long du corps humain ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (390,'Le fémur',TRUE,282);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (391,'Le tibia',FALSE,282);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (392,'L’humérus',FALSE,282);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (393,'Le radius',FALSE,282);

-- Q283
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (283,'Quelle est la capitale de l’Espagne ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (394,'Madrid',TRUE,283);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (395,'Barcelone',FALSE,283);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (396,'Valence',FALSE,283);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (397,'Séville',FALSE,283);

-- Q284
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (284,'Quel organe permet de respirer ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (398,'Les poumons',TRUE,284);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (399,'Le cœur',FALSE,284);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (400,'Le foie',FALSE,284);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (401,'Les reins',FALSE,284);

-- Q285
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (285,'Quel est le symbole chimique de l’oxygène ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (402,'O',TRUE,285);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (403,'Ox',FALSE,285);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (404,'Og',FALSE,285);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (405,'Oy',FALSE,285);

-- Q286
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (286,'Quelle est la planète surnommée la planète bleue ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (406,'La Terre',TRUE,286);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (407,'Neptune',FALSE,286);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (408,'Uranus',FALSE,286);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (409,'Vénus',FALSE,286);

-- Q287
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (287,'Combien de planètes compte le système solaire ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (410,'8',TRUE,287);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (411,'7',FALSE,287);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (412,'9',FALSE,287);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (413,'10',FALSE,287);

-- Q288
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (288,'Quel est l’organe qui permet de voir ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (414,'Les yeux',TRUE,288);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (415,'Les oreilles',FALSE,288);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (416,'Le nez',FALSE,288);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (417,'La bouche',FALSE,288);

-- Q289
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (289,'Quelle est la capitale du Royaume-Uni ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (418,'Londres',TRUE,289);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (419,'Manchester',FALSE,289);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (420,'Liverpool',FALSE,289);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (421,'Birmingham',FALSE,289);

-- Q290
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (290,'Quel est le plus grand mammifère du monde ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (422,'La baleine bleue',TRUE,290);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (423,'L’éléphant',FALSE,290);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (424,'La girafe',FALSE,290);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (425,'L’hippopotame',FALSE,290);

-- Q291
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (291,'Quel est le plus grand fleuve du monde en volume ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (426,'L’Amazone',TRUE,291);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (427,'Le Nil',FALSE,291);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (428,'Le Yangtsé',FALSE,291);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (429,'Le Mississippi',FALSE,291);

-- Q292
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (292,'Quel est le gaz le plus abondant dans l’air ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (430,'L’azote',TRUE,292);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (431,'L’oxygène',FALSE,292);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (432,'Le dioxyde de carbone',FALSE,292);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (433,'L’argon',FALSE,292);

-- Q293
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (293,'Combien de couleurs comporte l’arc-en-ciel ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (434,'7',TRUE,293);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (435,'5',FALSE,293);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (436,'6',FALSE,293);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (437,'8',FALSE,293);

-- Q294
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (294,'Quel organe permet d’entendre ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (438,'Les oreilles',TRUE,294);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (439,'Les yeux',FALSE,294);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (440,'Le nez',FALSE,294);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (441,'La bouche',FALSE,294);

-- Q295
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (295,'Quelle est la capitale de l’Allemagne ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (442,'Berlin',TRUE,295);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (443,'Munich',FALSE,295);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (444,'Francfort',FALSE,295);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (445,'Hambourg',FALSE,295);

-- Q296
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (296,'Quel est l’organe qui pompe le sang dans le corps humain ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (446,'Le cœur',TRUE,296);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (447,'Le cerveau',FALSE,296);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (448,'Les poumons',FALSE,296);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (449,'Le foie',FALSE,296);

-- Q297
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (297,'Quelle est la capitale de la Suisse ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (450,'Berne',TRUE,297);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (451,'Genève',FALSE,297);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (452,'Zurich',FALSE,297);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (453,'Lausanne',FALSE,297);

-- Q298
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (298,'Combien de côtés possède un triangle ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (454,'3',TRUE,298);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (455,'4',FALSE,298);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (456,'5',FALSE,298);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (457,'6',FALSE,298);

-- Q299
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (299,'Quelle planète possède des anneaux visibles ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (458,'Saturne',TRUE,299);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (459,'Mars',FALSE,299);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (460,'Vénus',FALSE,299);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (461,'Mercure',FALSE,299);

-- Q300
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (300,'Quelle est la plus grande planète du système solaire ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (462,'Jupiter',TRUE,300);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (463,'Saturne',FALSE,300);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (464,'Neptune',FALSE,300);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (465,'Uranus',FALSE,300);

-- Q301
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (301,'Quel est l’état de l’eau à 0 degré Celsius ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (466,'Solide',TRUE,301);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (467,'Liquide',FALSE,301);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (468,'Gazeux',FALSE,301);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (469,'Plasma',FALSE,301);

-- Q302
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (302,'Quelle est la capitale du Portugal ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (470,'Lisbonne',TRUE,302);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (471,'Porto',FALSE,302);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (472,'Braga',FALSE,302);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (473,'Coimbra',FALSE,302);

-- Q303
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (303,'Quel est l’astre au centre du système solaire ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (474,'Le Soleil',TRUE,303);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (475,'La Terre',FALSE,303);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (476,'La Lune',FALSE,303);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (477,'Mars',FALSE,303);

-- Q304
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (304,'Quel est le plus grand pays du monde en superficie ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (478,'La Russie',TRUE,304);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (479,'Le Canada',FALSE,304);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (480,'La Chine',FALSE,304);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (481,'Les États-Unis',FALSE,304);

-- Q305
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (305,'Quel organe permet de goûter les aliments ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (482,'La langue',TRUE,305);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (483,'Le nez',FALSE,305);
INSERT INTO REPONSE (id, libelle, juste, id_question_

-- Q306
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (306,'Quel est le plus grand animal terrestre ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (486,'L’éléphant d’Afrique',TRUE,306);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (487,'La girafe',FALSE,306);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (488,'Le rhinocéros',FALSE,306);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (489,'L’hippopotame',FALSE,306);

-- Q307
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (307,'Quel est le satellite naturel de la Terre ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (490,'La Lune',TRUE,307);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (491,'Mars',FALSE,307);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (492,'Vénus',FALSE,307);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (493,'Le Soleil',FALSE,307);

-- Q308
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (308,'Combien de mètres compte un kilomètre ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (494,'1000',TRUE,308);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (495,'100',FALSE,308);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (496,'10 000',FALSE,308);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (497,'500',FALSE,308);

-- Q309
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (309,'Quelle est la capitale de la Belgique ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (498,'Bruxelles',TRUE,309);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (499,'Anvers',FALSE,309);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (500,'Liège',FALSE,309);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (501,'Gand',FALSE,309);

-- Q310
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (310,'Quel est le gaz utilisé par les plantes pour la photosynthèse ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (502,'Le dioxyde de carbone',TRUE,310);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (503,'L’oxygène',FALSE,310);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (504,'L’azote',FALSE,310);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (505,'L’hydrogène',FALSE,310);

-- Q311
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (311,'Quelle est la capitale des États-Unis ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (506,'Washington D.C.',TRUE,311);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (507,'New York',FALSE,311);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (508,'Los Angeles',FALSE,311);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (509,'Chicago',FALSE,311);

-- Q312
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (312,'Quel organe du corps humain filtre le sang ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (510,'Les reins',TRUE,312);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (511,'Le foie',FALSE,312);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (512,'Le cœur',FALSE,312);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (513,'Les poumons',FALSE,312);

-- Q313
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (313,'Combien de secondes y a-t-il dans une minute ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (514,'60',TRUE,313);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (515,'30',FALSE,313);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (516,'90',FALSE,313);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (517,'100',FALSE,313);

-- Q314
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (314,'Quelle planète est la plus éloignée du Soleil ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (518,'Neptune',TRUE,314);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (519,'Uranus',FALSE,314);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (520,'Saturne',FALSE,314);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (521,'Pluton',FALSE,314);

-- Q315
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (315,'Quel est l’organe principal du système nerveux ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (522,'Le cerveau',TRUE,315);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (523,'La moelle épinière',FALSE,315);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (524,'Les nerfs',FALSE,315);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (525,'Le cœur',FALSE,315);

-- Q316
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (316,'Quelle est la capitale de l’Italie ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (526,'Rome',TRUE,316);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (527,'Milan',FALSE,316);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (528,'Naples',FALSE,316);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (529,'Turin',FALSE,316);

-- Q317
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (317,'Quel est le plus grand océan de la planète ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (530,'Océan Pacifique',TRUE,317);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (531,'Océan Atlantique',FALSE,317);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (532,'Océan Indien',FALSE,317);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (533,'Océan Arctique',FALSE,317);

-- Q318
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (318,'Quel est l’organe qui permet de respirer ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (534,'Les poumons',TRUE,318);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (535,'Le cœur',FALSE,318);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (536,'Le foie',FALSE,318);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (537,'Les reins',FALSE,318);

-- Q319
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (319,'Combien de jours compte une semaine ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (538,'7',TRUE,319);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (539,'5',FALSE,319);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (540,'6',FALSE,319);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (541,'8',FALSE,319);

-- Q320
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (320,'Quel est le métal le plus abondant dans la croûte terrestre ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (542,'Aluminium',TRUE,320);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (543,'Fer',FALSE,320);_

-- Q321
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (321,'Quelle est la capitale de l’Autriche ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (546,'Vienne',TRUE,321);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (547,'Graz',FALSE,321);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (548,'Salzbourg',FALSE,321);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (549,'Innsbruck',FALSE,321);

-- Q322
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (322,'Quel est l’organe qui permet de filtrer l’air inspiré ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (550,'Le nez',TRUE,322);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (551,'Les poumons',FALSE,322);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (552,'La trachée',FALSE,322);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (553,'Le diaphragme',FALSE,322);

-- Q323
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (323,'Combien de continents compte la Terre ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (554,'7',TRUE,323);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (555,'5',FALSE,323);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (556,'6',FALSE,323);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (557,'8',FALSE,323);

-- Q324
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (324,'Quelle planète est connue pour ses anneaux ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (558,'Saturne',TRUE,324);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (559,'Jupiter',FALSE,324);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (560,'Uranus',FALSE,324);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (561,'Neptune',FALSE,324);

-- Q325
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (325,'Quel est le principal organe de la vision ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (562,'L’œil',TRUE,325);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (563,'Le cerveau',FALSE,325);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (564,'Le nerf optique',FALSE,325);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (565,'La rétine',FALSE,325);

-- Q326
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (326,'Quelle est la capitale de la Norvège ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (566,'Oslo',TRUE,326);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (567,'Bergen',FALSE,326);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (568,'Trondheim',FALSE,326);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (569,'Stavanger',FALSE,326);

-- Q327
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (327,'Quel est l’organe qui permet de pomper le sang ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (570,'Le cœur',TRUE,327);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (571,'Les poumons',FALSE,327);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (572,'Le foie',FALSE,327);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (573,'Le cerveau',FALSE,327);

-- Q328
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (328,'Combien de mois compte une année ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (574,'12',TRUE,328);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (575,'10',FALSE,328);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (576,'11',FALSE,328);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (577,'13',FALSE,328);

-- Q329
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (329,'Quelle planète est la plus proche du Soleil ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (578,'Mercure',TRUE,329);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (579,'Vénus',FALSE,329);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (580,'La Terre',FALSE,329);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (581,'Mars',FALSE,329);

-- Q330
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (330,'Quel est le plus grand organe du corps humain ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (582,'La peau',TRUE,330);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (583,'Le foie',FALSE,330);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (584,'Les poumons',FALSE,330);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (585,'Le cerveau',FALSE,330);

-- Q331
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (331,'Quelle est la capitale de la Suède ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (586,'Stockholm',TRUE,331);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (587,'Göteborg',FALSE,331);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (588,'Malmö',FALSE,331);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (589,'Uppsala',FALSE,331);

-- Q332
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (332,'Quel organe permet de digérer les aliments ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (590,'L’estomac',TRUE,332);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (591,'Le cœur',FALSE,332);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (592,'Les poumons',FALSE,332);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (593,'Les reins',FALSE,332);

-- Q333
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (333,'Combien de côtés possède un hexagone ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (594,'6',TRUE,333);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (595,'5',FALSE,333);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (596,'7',FALSE,333);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (597,'8',FALSE,333);

-- Q334
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (334,'Quelle planète est surnommée la planète rouge ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (598,'Mars',TRUE,334);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (599,'Vénus',FALSE,334);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (600,'Jupiter',FALSE,334);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (601,'Mercure',FALSE,334);

-- Q335
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (335,'Quel est le liquide vital pour l’organisme humain ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (602,'L’eau',TRUE,335);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (603,'Le sang',FALSE,335);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (604,'La salive',FALSE,335);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (605,'La lymphe',FALSE,335);

-- Q336
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (336,'Quelle est la capitale du Danemark ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (606,'Copenhague',TRUE,336);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (607,'Aarhus',FALSE,336);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (608,'Odense',FALSE,336);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (609,'Aalborg',FALSE,336);

-- Q337
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (337,'Quel organe permet de respirer chez l’être humain ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (610,'Les poumons',TRUE,337);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (611,'Le cœur',FALSE,337);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (612,'Le foie',FALSE,337);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (613,'Les reins',FALSE,337);

-- Q338
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (338,'Combien de lettres compte l’alphabet français ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (614,'26',TRUE,338);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (615,'24',FALSE,338);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (616,'28',FALSE,338);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (617,'25',FALSE,338);

-- Q339
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (339,'Quelle planète possède la plus forte gravité ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (618,'Jupiter',TRUE,339);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (619,'Saturne',FALSE,339);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (620,'Neptune',FALSE,339);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (621,'La Terre',FALSE,339);

-- Q340
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (340,'Quel est le principal constituant du corps humain ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (622,'L’eau',TRUE,340);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (623,'Le calcium',FALSE,340);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (624,'Le fer',FALSE,340);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (625,'Les protéines',FALSE,340);

-- Q341
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (341,'Quelle est la capitale de la Finlande ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (626,'Helsinki',TRUE,341);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (627,'Turku',FALSE,341);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (628,'Tampere',FALSE,341);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (629,'Oulu',FALSE,341);

-- Q342
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (342,'Quel organe humain permet de respirer ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (630,'Les poumons',TRUE,342);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (631,'Le cœur',FALSE,342);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (632,'Le foie',FALSE,342);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (633,'Les reins',FALSE,342);

-- Q343
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (343,'Combien de secondes compte une heure ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (634,'3600',TRUE,343);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (635,'60',FALSE,343);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (636,'600',FALSE,343);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (637,'3000',FALSE,343);

-- Q344
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (344,'Quelle planète est la plus chaude du système solaire ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (638,'Vénus',TRUE,344);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (639,'Mercure',FALSE,344);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (640,'Mars',FALSE,344);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (641,'Jupiter',FALSE,344);

-- Q345
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (345,'Quel est l’organe principal de l’audition ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (642,'L’oreille',TRUE,345);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (643,'L’œil',FALSE,345);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (644,'Le cerveau',FALSE,345);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (645,'Le nez',FALSE,345);

-- Q346
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (346,'Quelle est la capitale de l’Irlande ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (646,'Dublin',TRUE,346);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (647,'Cork',FALSE,346);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (648,'Galway',FALSE,346);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (649,'Limerick',FALSE,346);

-- Q347
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (347,'Quel organe permet de voir ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (650,'Les yeux',TRUE,347);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (651,'Les oreilles',FALSE,347);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (652,'Le nez',FALSE,347);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (653,'La bouche',FALSE,347);

-- Q348
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (348,'Combien de grammes y a-t-il dans un kilogramme ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (654,'1000',TRUE,348);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (655,'100',FALSE,348);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (656,'10 000',FALSE,348);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (657,'500',FALSE,348);

-- Q349
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (349,'Quelle planète est surnommée la géante gazeuse ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (658,'Jupiter',TRUE,349);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (659,'Saturne',FALSE,349);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (660,'Neptune',FALSE,349);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (661,'Uranus',FALSE,349);

-- Q350
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (350,'Quel est le liquide circulant dans les vaisseaux sanguins ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (662,'Le sang',TRUE,350);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (663,'La lymphe',FALSE,350);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (664,'L’eau',FALSE,350);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (665,'La salive',FALSE,350);

-- Q351
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (351,'Quelle est la capitale de la Grèce ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (666,'Athènes',TRUE,351);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (667,'Thessalonique',FALSE,351);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (668,'Patras',FALSE,351);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (669,'Héraklion',FALSE,351);

-- Q352
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (352,'Quel organe permet de sentir les odeurs ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (670,'Le nez',TRUE,352);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (671,'La langue',FALSE,352);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (672,'Les yeux',FALSE,352);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (673,'Les oreilles',FALSE,352);

-- Q353
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (353,'Combien de minutes compte une heure ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (674,'60',TRUE,353);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (675,'30',FALSE,353);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (676,'90',FALSE,353);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (677,'100',FALSE,353);

-- Q354
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (354,'Quelle planète possède le plus grand nombre de lunes ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (678,'Saturne',TRUE,354);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (679,'Jupiter',FALSE,354);
INSERT INTO REPONSE (idponse (id, libelle, juste, id_question) VALUES (680,'Uranus',FALSE,354);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (681,'Neptune',FALSE,354);

-- Q355
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (355,'Quel est l’organe principal du goût ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (682,'La langue',TRUE,355);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (683,'Le nez',FALSE,355);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (684,'Les dents',FALSE,355);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (685,'Le palais',FALSE,355);

-- Q356
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (356,'Quelle est la capitale des Pays-Bas ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (686,'Amsterdam',TRUE,356);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (687,'Rotterdam',FALSE,356);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (688,'La Haye',FALSE,356);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (689,'Utrecht',FALSE,356);

-- Q357
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (357,'Quel organe humain permet de respirer ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (690,'Les poumons',TRUE,357);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (691,'Le cœur',FALSE,357);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (692,'Le foie',FALSE,357);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (693,'Les reins',FALSE,357);

-- Q358
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (358,'Combien de jours compte une année bissextile ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (694,'366',TRUE,358);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (695,'365',FALSE,358);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (696,'364',FALSE,358);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (697,'360',FALSE,358);

-- Q359
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (359,'Quelle planète est la plus proche du Soleil ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (698,'Mercure',TRUE,359);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (699,'Vénus',FALSE,359);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (700,'La Terre',FALSE,359);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (701,'Mars',FALSE,359);

-- Q360
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (360,'Quel est l’organe principal de la circulation sanguine ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (702,'Le cœur',TRUE,360);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (703,'Les poumons',FALSE,360);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (704,'Le cerveau',FALSE,360);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (705,'Le foie',FALSE,360);

-- Q361
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (361,'Quel est le plus grand océan du monde ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (706,'Océan Pacifique',TRUE,361);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (707,'Océan Atlantique',FALSE,361);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (708,'Océan Indien',FALSE,361);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (709,'Océan Arctique',FALSE,361);

-- Q362
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (362,'Quel gaz est indispensable à la respiration humaine ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (710,'Oxygène',TRUE,362);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (711,'Azote',FALSE,362);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (712,'Hydrogène',FALSE,362);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (713,'Hélium',FALSE,362);

-- Q363
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (363,'Combien de continents existe-t-il sur Terre ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (714,'7',TRUE,363);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (715,'5',FALSE,363);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (716,'6',FALSE,363);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (717,'8',FALSE,363);

-- Q364
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (364,'Quel instrument sert à mesurer la température ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (718,'Thermomètre',TRUE,364);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (719,'Baromètre',FALSE,364);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (720,'Hygromètre',FALSE,364);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (721,'Anémomètre',FALSE,364);

-- Q365
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (365,'Quel est l’état de l’eau à 0°C ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (722,'Solide',TRUE,365);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (723,'Liquide',FALSE,365);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (724,'Gazeux',FALSE,365);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (725,'Plasma',FALSE,365);

-- Q366
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (366,'Quel est l’astre au centre du système solaire ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (726,'Le Soleil',TRUE,366);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (727,'La Terre',FALSE,366);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (728,'La Lune',FALSE,366);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (729,'Mars',FALSE,366);

-- Q367
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (367,'Quel est le plus grand mammifère marin ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (730,'La baleine bleue',TRUE,367);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (731,'Le requin blanc',FALSE,367);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (732,'L’orque',FALSE,367);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (733,'Le cachalot',FALSE,367);

-- Q368
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (368,'Quelle partie de la plante réalise la photosynthèse ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (734,'La feuille',TRUE,368);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (735,'La racine',FALSE,368);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (736,'La tige',FALSE,368);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (737,'La fleur',FALSE,368);

-- Q369
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (369,'Quelle unité mesure la longueur ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (738,'Le mètre',TRUE,369);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (739,'Le kilogramme',FALSE,369);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (740,'La seconde',FALSE,369);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (741,'Le litre',FALSE,369);

-- Q370
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (370,'Quel animal est connu comme le roi de la jungle ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (742,'Le lion',TRUE,370);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (743,'Le tigre',FALSE,370);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (744,'L’éléphant',FALSE,370);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (745,'Le léopard',FALSE,370);

-- Q371
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (371,'Quel est le plus petit continent du monde ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (746,'Océanie',TRUE,371);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (747,'Europe',FALSE,371);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (748,'Antarctique',FALSE,371);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (749,'Amérique du Sud',FALSE,371);

-- Q372
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (372,'Quel organe filtre le sang dans le corps humain ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (750,'Les reins',TRUE,372);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (751,'Le foie',FALSE,372);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (752,'Les poumons',FALSE,372);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (753,'L’estomac',FALSE,372);

-- Q373
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (373,'Quelle planète est surnommée la planète rouge ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (754,'Mars',TRUE,373);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (755,'Jupiter',FALSE,373);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (756,'Vénus',FALSE,373);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (757,'Mercure',FALSE,373);

-- Q374
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (374,'Quelle est la forme de la Terre ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (758,'Géoïde',TRUE,374);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (759,'Plate',FALSE,374);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (760,'Cubique',FALSE,374);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (761,'Cylindrique',FALSE,374);

-- Q375
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (375,'Quel est l’état naturel du fer à température ambiante ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (762,'Solide',TRUE,375);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (763,'Liquide',FALSE,375);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (764,'Gazeux',FALSE,375);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (765,'Plasma',FALSE,375);

-- Q376
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (376,'Quel est le plus grand désert chaud du monde ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (766,'Le Sahara',TRUE,376);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (767,'Le désert de Gobi',FALSE,376);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (768,'Le désert d’Atacama',FALSE,376);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (769,'Le désert du Kalahari',FALSE,376);

-- Q377
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (377,'Quel est le métal le plus abondant dans la croûte terrestre ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (770,'L’aluminium',TRUE,377);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (771,'Le fer',FALSE,377);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (772,'Le cuivre',FALSE,377);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (773,'Le zinc',FALSE,377);

-- Q378
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (378,'Quel est l’organe principal du système nerveux ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (774,'Le cerveau',TRUE,378);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (775,'Le cœur',FALSE,378);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (776,'Les poumons',FALSE,378);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (777,'Le foie',FALSE,378);

-- Q379
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (379,'Quelle est la planète la plus grande du système solaire ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (778,'Jupiter',TRUE,379);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (779,'Saturne',FALSE,379);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (780,'Neptune',FALSE,379);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (781,'Uranus',FALSE,379);

-- Q380
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (380,'Quel liquide est indispensable à la vie ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (782,'L’eau',TRUE,380);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (783,'Le pétrole',FALSE,380);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (784,'L’alcool',FALSE,380);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (785,'Le mercure',FALSE,380);

-- Q381
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (381,'Quel est l’organe principal de la vision ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (786,'L’œil',TRUE,381);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (787,'Le cerveau',FALSE,381);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (788,'L’oreille',FALSE,381);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (789,'Le nerf optique',FALSE,381);

-- Q382
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (382,'Quelle est la principale source de chaleur de la Terre ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (790,'Le Soleil',TRUE,382);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (791,'Le noyau terrestre',FALSE,382);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (792,'La Lune',FALSE,382);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (793,'Les volcans',FALSE,382);

-- Q383
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (383,'Quel animal vit principalement dans les océans ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (794,'Le dauphin',TRUE,383);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (795,'Le lion',FALSE,383);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (796,'Le cheval',FALSE,383);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (797,'Le loup',FALSE,383);

-- Q384
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (384,'Quelle unité est utilisée pour mesurer le poids ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (798,'Le kilogramme',TRUE,384);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (799,'Le mètre',FALSE,384);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (800,'Le litre',FALSE,384);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (801,'La seconde',FALSE,384);

-- Q385
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (385,'Quel est l’état de l’air à température ambiante ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (802,'Gazeux',TRUE,385);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (803,'Solide',FALSE,385);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (804,'Liquide',FALSE,385);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (805,'Plasma',FALSE,385);

-- Q386
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (386,'Quel organe est responsable de l’audition ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (806,'L’oreille',TRUE,386);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (807,'L’œil',FALSE,386);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (808,'Le nez',FALSE,386);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (809,'La bouche',FALSE,386);

-- Q387
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (387,'Quel est le principal constituant de l’air ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (810,'L’azote',TRUE,387);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (811,'L’oxygène',FALSE,387);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (812,'Le dioxyde de carbone',FALSE,387);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (813,'L’hydrogène',FALSE,387);

-- Q388
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (388,'Quel est l’animal terrestre le plus rapide ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (814,'Le guépard',TRUE,388);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (815,'Le lion',FALSE,388);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (816,'Le cheval',FALSE,388);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (817,'L’antilope',FALSE,388);

-- Q389
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (389,'Quelle est la planète la plus éloignée du Soleil ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (818,'Neptune',TRUE,389);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (819,'Uranus',FALSE,389);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (820,'Saturne',FALSE,389);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (821,'Jupiter',FALSE,389);

-- Q390
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (390,'Quel est l’organe principal de la digestion ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (822,'L’estomac',TRUE,390);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (823,'Le cœur',FALSE,390);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (824,'Les poumons',FALSE,390);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (825,'Le cerveau',FALSE,390);

-- Q391
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (391,'Quel organe permet de pomper le sang dans le corps humain ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (826,'Le cœur',TRUE,391);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (827,'Les poumons',FALSE,391);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (828,'Le foie',FALSE,391);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (829,'Le cerveau',FALSE,391);

-- Q392
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (392,'Quel est le satellite naturel de la Terre ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (830,'La Lune',TRUE,392);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (831,'Mars',FALSE,392);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (832,'Vénus',FALSE,392);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (833,'Le Soleil',FALSE,392);

-- Q393
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (393,'Quelle substance donne la couleur verte aux plantes ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (834,'La chlorophylle',TRUE,393);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (835,'La mélanine',FALSE,393);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (836,'L’hémoglobine',FALSE,393);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (837,'Le carotène',FALSE,393);

-- Q394
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (394,'Quel est le plus grand animal terrestre ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (838,'L’éléphant d’Afrique',TRUE,394);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (839,'La girafe',FALSE,394);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (840,'L’hippopotame',FALSE,394);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (841,'Le rhinocéros',FALSE,394);

-- Q395
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (395,'Quel gaz est rejeté lors de l’expiration ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (842,'Le dioxyde de carbone',TRUE,395);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (843,'L’oxygène',FALSE,395);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (844,'L’azote',FALSE,395);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (845,'L’hélium',FALSE,395);

-- Q396
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (396,'Quelle est la principale fonction des reins ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (846,'Filtrer le sang',TRUE,396);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (847,'Digérer les aliments',FALSE,396);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (848,'Produire des hormones',FALSE,396);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (849,'Pomper le sang',FALSE,396);

-- Q397
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (397,'Quelle planète possède des anneaux visibles ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (850,'Saturne',TRUE,397);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (851,'Mars',FALSE,397);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (852,'Vénus',FALSE,397);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (853,'Mercure',FALSE,397);

-- Q398
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (398,'Quel sens permet de percevoir les saveurs ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (854,'Le goût',TRUE,398);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (855,'L’odorat',FALSE,398);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (856,'La vue',FALSE,398);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (857,'Le toucher',FALSE,398);

-- Q399
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (399,'Quel est l’état de l’eau à 100°C ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (858,'Gazeux',TRUE,399);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (859,'Liquide',FALSE,399);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (860,'Solide',FALSE,399);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (861,'Plasma',FALSE,399);

-- Q400
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (400,'Quel organe permet de penser ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (862,'Le cerveau',TRUE,400);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (863,'Le cœur',FALSE,400);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (864,'Les poumons',FALSE,400);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (865,'L’estomac',FALSE,400);

-- Q401
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (401,'Quel est l’organe principal de l’odorat ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (866,'Le nez',TRUE,401);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (867,'La langue',FALSE,401);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (868,'L’oreille',FALSE,401);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (869,'L’œil',FALSE,401);

-- Q402
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (402,'Quel est le plus grand organe du corps humain ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (870,'La peau',TRUE,402);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (871,'Le foie',FALSE,402);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (872,'Le cœur',FALSE,402);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (873,'Les poumons',FALSE,402);

-- Q403
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (403,'Quelle planète est connue pour ses anneaux ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (874,'Saturne',TRUE,403);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (875,'Mars',FALSE,403);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (876,'Mercure',FALSE,403);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (877,'Vénus',FALSE,403);

-- Q404
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (404,'Quel est le principal rôle des globules rouges ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (878,'Transporter l’oxygène',TRUE,404);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (879,'Défendre l’organisme',FALSE,404);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (880,'Coaguler le sang',FALSE,404);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (881,'Digérer les nutriments',FALSE,404);

-- Q405
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (405,'Quelle est la planète sur laquelle nous vivons ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (882,'La Terre',TRUE,405);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (883,'Mars',FALSE,405);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (884,'Vénus',FALSE,405);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (885,'Jupiter',FALSE,405);

-- Q406
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (406,'Quel est l’organe principal du toucher ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (886,'La peau',TRUE,406);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (887,'Le cerveau',FALSE,406);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (888,'Les muscles',FALSE,406);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (889,'Les os',FALSE,406);

-- Q407
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (407,'Quel est le gaz le plus abondant dans l’air ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (890,'L’azote',TRUE,407);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (891,'L’oxygène',FALSE,407);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (892,'Le dioxyde de carbone',FALSE,407);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (893,'L’argon',FALSE,407);

-- Q408
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (408,'Quel est le plus long fleuve du monde ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (894,'Le Nil',TRUE,408);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (895,'L’Amazone',FALSE,408);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (896,'Le Yangtsé',FALSE,408);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (897,'Le Mississippi',FALSE,408);

-- Q409
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (409,'Quelle est la planète la plus chaude du système solaire ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (898,'Vénus',TRUE,409);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (899,'Mercure',FALSE,409);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (900,'Mars',FALSE,409);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (901,'Jupiter',FALSE,409);

-- Q410
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (410,'Quel est l’organe qui produit l’insuline ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (902,'Le pancréas',TRUE,410);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (903,'Le foie',FALSE,410);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (904,'L’estomac',FALSE,410);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (905,'Les reins',FALSE,410);

-- Q411
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (411,'Quel est l’organe principal du système respiratoire ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (906,'Les poumons',TRUE,411);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (907,'Le cœur',FALSE,411);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (908,'Le foie',FALSE,411);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (909,'Les reins',FALSE,411);

-- Q412
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (412,'Quel est l’état naturel du dioxyde de carbone ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (910,'Gazeux',TRUE,412);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (911,'Solide',FALSE,412);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (912,'Liquide',FALSE,412);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (913,'Plasma',FALSE,412);

-- Q413
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (413,'Quelle est la planète surnommée la géante gazeuse ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (914,'Jupiter',TRUE,413);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (915,'Mars',FALSE,413);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (916,'Vénus',FALSE,413);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (917,'Mercure',FALSE,413);

-- Q414
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (414,'Quel est le rôle principal du squelette ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (918,'Soutenir le corps',TRUE,414);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (919,'Digérer les aliments',FALSE,414);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (920,'Produire l’énergie',FALSE,414);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (921,'Filtrer le sang',FALSE,414);

-- Q415
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (415,'Quel est le principal constituant de l’eau ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (922,'Hydrogène et oxygène',TRUE,415);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (923,'Hydrogène et azote',FALSE,415);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (924,'Oxygène et carbone',FALSE,415);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (925,'Azote et carbone',FALSE,415);

-- Q416
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (416,'Quel organe est responsable de l’équilibre ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (926,'L’oreille interne',TRUE,416);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (927,'Le cerveau',FALSE,416);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (928,'Les yeux',FALSE,416);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (929,'Les muscles',FALSE,416);

-- Q417
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (417,'Quelle planète est connue comme la planète bleue ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (930,'La Terre',TRUE,417);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (931,'Neptune',FALSE,417);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (932,'Uranus',FALSE,417);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (933,'Vénus',FALSE,417);

-- Q418
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (418,'Quel est le principal organe du système digestif ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (934,'L’estomac',TRUE,418);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (935,'Le cœur',FALSE,418);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (936,'Les poumons',FALSE,418);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (937,'Les reins',FALSE,418);

-- Q419
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (419,'Quel est le métal utilisé dans les fils électriques ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (938,'Le cuivre',TRUE,419);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (939,'Le fer',FALSE,419);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (940,'L’aluminium',FALSE,419);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (941,'Le plomb',FALSE,419);

-- Q420
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (420,'Quel phénomène est responsable des saisons ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (942,'L’inclinaison de l’axe terrestre',TRUE,420);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (943,'La distance au Soleil',FALSE,420);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (944,'La rotation de la Lune',FALSE,420);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (945,'La gravité',FALSE,420);

-- Q421
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (421,'Quel organe permet la filtration de l’air inspiré ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (946,'Le nez',TRUE,421);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (947,'La trachée',FALSE,421);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (948,'Les poumons',FALSE,421);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (949,'La bouche',FALSE,421);

-- Q422
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (422,'Quelle planète possède le plus de satellites naturels ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (950,'Saturne',TRUE,422);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (951,'Jupiter',FALSE,422);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (952,'Uranus',FALSE,422);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (953,'Neptune',FALSE,422);

-- Q423
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (423,'Quel est l’organe principal du système circulatoire ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (954,'Le cœur',TRUE,423);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (955,'Les poumons',FALSE,423);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (956,'Le foie',FALSE,423);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (957,'Les reins',FALSE,423);

-- Q424
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (424,'Quel gaz est utilisé par les plantes pour la photosynthèse ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (958,'Le dioxyde de carbone',TRUE,424);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (959,'L’oxygène',FALSE,424);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (960,'L’azote',FALSE,424);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (961,'L’hydrogène',FALSE,424);

-- Q425
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (425,'Quel est le plus grand os du corps humain ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (962,'Le fémur',TRUE,425);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (963,'Le tibia',FALSE,425);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (964,'L’humérus',FALSE,425);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (965,'Le bassin',FALSE,425);

-- Q426
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (426,'Quelle partie du corps humain contient le plus d’os ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (966,'La main',TRUE,426);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (967,'Le pied',FALSE,426);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (968,'La colonne vertébrale',FALSE,426);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (969,'Le crâne',FALSE,426);

-- Q427
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (427,'Quel organe est responsable de la production de la bile ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (970,'Le foie',TRUE,427);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (971,'La vésicule biliaire',FALSE,427);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (972,'Le pancréas',FALSE,427);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (973,'L’estomac',FALSE,427);

-- Q428
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (428,'Quel est l’état de l’eau à 0°C ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (974,'Solide',TRUE,428);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (975,'Liquide',FALSE,428);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (976,'Gazeux',FALSE,428);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (977,'Plasma',FALSE,428);

-- Q429
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (429,'Quelle planète possède la plus grande gravité ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (978,'Jupiter',TRUE,429);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (979,'La Terre',FALSE,429);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (980,'Saturne',FALSE,429);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (981,'Mars',FALSE,429);

-- Q430
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (430,'Quel est l’organe principal de l’excrétion ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (982,'Les reins',TRUE,430);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (983,'Le foie',FALSE,430);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (984,'Les poumons',FALSE,430);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (985,'La peau',FALSE,430);

-- Q431
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (431,'Quel organe permet la détoxification du sang ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (986,'Le foie',TRUE,431);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (987,'Les reins',FALSE,431);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (988,'Les poumons',FALSE,431);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (989,'Le cœur',FALSE,431);

-- Q432
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (432,'Quelle planète possède le jour le plus long ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (990,'Vénus',TRUE,432);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (991,'Mercure',FALSE,432);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (992,'La Terre',FALSE,432);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (993,'Mars',FALSE,432);

-- Q433
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (433,'Quel organe est responsable de la production des globules rouges ?',2,1,'Difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (994,'La moelle osseuse',TRUE,433);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (995,'La rate',FALSE,433);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (996,'Le foie',FALSE,433);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (997,'Les reins',FALSE,433);

-- Q434
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (434,'Quel est le gaz indispensable à la respiration humaine ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (998,'L’oxygène',TRUE,434);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (999,'L’azote',FALSE,434);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1000,'Le dioxyde de carbone',FALSE,434);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1001,'L’hélium',FALSE,434);

-- Q435
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (435,'Quel phénomène transforme l’eau liquide en vapeur ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1002,'L’évaporation',TRUE,435);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1003,'La fusion',FALSE,435);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1004,'La condensation',FALSE,435);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1005,'La solidification',FALSE,435);

-- Q436
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (436,'Quel organe permet l’échange des gaz respiratoires ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1006,'Les alvéoles pulmonaires',TRUE,436);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1007,'La trachée',FALSE,436);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1008,'Le diaphragme',FALSE,436);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1009,'Les bronches',FALSE,436);

-- Q437
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (437,'Quelle planète possède le plus grand nombre d’anneaux ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1010,'Saturne',TRUE,437);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1011,'Jupiter',FALSE,437);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1012,'Uranus',FALSE,437);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1013,'Neptune',FALSE,437);

-- Q438
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (438,'Quel est le rôle principal des globules blancs ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1014,'Défendre l’organisme',TRUE,438);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1015,'Transporter l’oxygène',FALSE,438);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1016,'Coaguler le sang',FALSE,438);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1017,'Produire des hormones',FALSE,438);

-- Q439
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (439,'Quelle est la source principale d’énergie pour la Terre ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1018,'Le Soleil',TRUE,439);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1019,'La Lune',FALSE,439);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1020,'Le noyau terrestre',FALSE,439);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1021,'Les océans',FALSE,439);

-- Q440
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (440,'Quel organe permet la production de la voix ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1022,'Le larynx',TRUE,440);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1023,'La trachée',FALSE,440);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1024,'Les poumons',FALSE,440);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1025,'La langue',FALSE,440);

-- Q441
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (441,'Quel organe est responsable de la vision ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1026,'L’œil',TRUE,441);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1027,'Le cerveau',FALSE,441);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1028,'Le nerf optique',FALSE,441);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1029,'La rétine',FALSE,441);

-- Q442
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (442,'Quelle planète est la plus proche du Soleil ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1030,'Mercure',TRUE,442);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1031,'Vénus',FALSE,442);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1032,'La Terre',FALSE,442);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1033,'Mars',FALSE,442);

-- Q443
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (443,'Quel est le principal constituant des os ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1034,'Le calcium',TRUE,443);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1035,'Le fer',FALSE,443);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1036,'Le sodium',FALSE,443);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1037,'Le potassium',FALSE,443);

-- Q444
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (444,'Quel est le rôle principal du cerveau ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1038,'Commander les fonctions du corps',TRUE,444);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1039,'Pomper le sang',FALSE,444);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1040,'Filtrer le sang',FALSE,444);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1041,'Digérer les aliments',FALSE,444);

-- Q445
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (445,'Quel phénomène permet à l’eau de passer de solide à liquide ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1042,'La fusion',TRUE,445);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1043,'L’évaporation',FALSE,445);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1044,'La condensation',FALSE,445);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1045,'La sublimation',FALSE,445);

-- Q441
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (441,'Quel organe est responsable de la vision ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1026,'L’œil',TRUE,441);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1027,'Le cerveau',FALSE,441);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1028,'Le nerf optique',FALSE,441);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1029,'La rétine',FALSE,441);

-- Q442
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (442,'Quelle planète est la plus proche du Soleil ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1030,'Mercure',TRUE,442);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1031,'Vénus',FALSE,442);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1032,'La Terre',FALSE,442);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1033,'Mars',FALSE,442);

-- Q443
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (443,'Quel est le principal constituant des os ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1034,'Le calcium',TRUE,443);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1035,'Le fer',FALSE,443);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1036,'Le sodium',FALSE,443);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1037,'Le potassium',FALSE,443);

-- Q444
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (444,'Quel est le rôle principal du cerveau ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1038,'Commander les fonctions du corps',TRUE,444);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1039,'Pomper le sang',FALSE,444);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1040,'Filtrer le sang',FALSE,444);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1041,'Digérer les aliments',FALSE,444);

-- Q445
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (445,'Quel phénomène permet à l’eau de passer de solide à liquide ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1042,'La fusion',TRUE,445);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1043,'L’évaporation',FALSE,445);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1044,'La condensation',FALSE,445);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1045,'La sublimation',FALSE,445);

-- Q446
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (446,'Quel organe est responsable de la digestion chimique ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1046,'L’estomac',TRUE,446);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1047,'L’intestin grêle',FALSE,446);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1048,'Le foie',FALSE,446);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1049,'Le pancréas',FALSE,446);

-- Q447
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (447,'Quelle planète est la plus froide du système solaire ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1050,'Uranus',TRUE,447);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1051,'Neptune',FALSE,447);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1052,'Saturne',FALSE,447);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1053,'Mars',FALSE,447);

-- Q448
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (448,'Quel est le principal rôle des poumons ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1054,'Permettre la respiration',TRUE,448);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1055,'Pomper le sang',FALSE,448);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1056,'Digérer les aliments',FALSE,448);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1057,'Produire des hormones',FALSE,448);

-- Q449
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (449,'Quel est l’organe principal du système urinaire ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1058,'Les reins',TRUE,449);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1059,'La vessie',FALSE,449);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1060,'L’uretère',FALSE,449);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1061,'L’urètre',FALSE,449);

-- Q450
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (450,'Quelle est la principale fonction du sang ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1062,'Transporter les substances',TRUE,450);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1063,'Digérer les aliments',FALSE,450);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1064,'Produire de l’énergie',FALSE,450);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1065,'Stocker l’oxygène',FALSE,450);

-- Q451
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (451,'Quel organe permet la circulation du sang ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1066,'Le cœur',TRUE,451);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1067,'Les poumons',FALSE,451);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1068,'Le foie',FALSE,451);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1069,'Les reins',FALSE,451);

-- Q452
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (452,'Quelle planète est connue pour ses tempêtes géantes ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1070,'Jupiter',TRUE,452);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1071,'Mars',FALSE,452);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1072,'Vénus',FALSE,452);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1073,'Mercure',FALSE,452);

-- Q453
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (453,'Quel est le rôle principal de l’intestin grêle ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1074,'Absorber les nutriments',TRUE,453);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1075,'Produire la bile',FALSE,453);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1076,'Filtrer le sang',FALSE,453);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1077,'Stocker les déchets',FALSE,453);

-- Q454
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (454,'Quel gaz est majoritaire dans l’atmosphère terrestre ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1078,'L’azote',TRUE,454);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1079,'L’oxygène',FALSE,454);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1080,'Le dioxyde de carbone',FALSE,454);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1081,'L’argon',FALSE,454);

-- Q455
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (455,'Quel organe permet l’élimination de l’urine ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1082,'La vessie',TRUE,455);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1083,'Les reins',FALSE,455);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1084,'L’uretère',FALSE,455);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1085,'L’urètre',FALSE,455);

-- Q456
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (456,'Quel organe est responsable de la production de la bile ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1086,'Le foie',TRUE,456);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1087,'La vésicule biliaire',FALSE,456);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1088,'Le pancréas',FALSE,456);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1089,'L’estomac',FALSE,456);

-- Q457
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (457,'Quelle planète possède le plus grand nombre de lunes ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1090,'Saturne',TRUE,457);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1091,'Jupiter',FALSE,457);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1092,'Uranus',FALSE,457);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1093,'Neptune',FALSE,457);

-- Q458
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (458,'Quel est le rôle principal des globules rouges ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1094,'Transporter l’oxygène',TRUE,458);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1095,'Défendre l’organisme',FALSE,458);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1096,'Coaguler le sang',FALSE,458);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1097,'Produire des hormones',FALSE,458);

-- Q459
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (459,'Quel est l’organe principal du système nerveux ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1098,'Le cerveau',TRUE,459);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1099,'La moelle épinière',FALSE,459);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1100,'Les nerfs',FALSE,459);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1101,'Le cœur',FALSE,459);

-- Q460
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (460,'Quel phénomène permet à l’eau de passer de liquide à solide ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1102,'La solidification',TRUE,460);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1103,'L’évaporation',FALSE,460);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1104,'La condensation',FALSE,460);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1105,'La fusion',FALSE,460);

-- Q461
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (461,'Quel organe permet l’absorption de l’oxygène ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1106,'Les poumons',TRUE,461);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1107,'Le cœur',FALSE,461);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1108,'Le foie',FALSE,461);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1109,'Les reins',FALSE,461);

-- Q462
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (462,'Quelle planète est la plus massive du système solaire ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1110,'Jupiter',TRUE,462);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1111,'Saturne',FALSE,462);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1112,'Neptune',FALSE,462);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1113,'Uranus',FALSE,462);

-- Q463
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (463,'Quel est le rôle principal de la peau ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1114,'Protéger le corps',TRUE,463);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1115,'Produire des hormones',FALSE,463);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1116,'Transporter l’oxygène',FALSE,463);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1117,'Filtrer le sang',FALSE,463);

-- Q464
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (464,'Quel gaz est indispensable à la photosynthèse ?',2,1,'Moyen',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1118,'Le dioxyde de carbone',TRUE,464);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1119,'L’oxygène',FALSE,464);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1120,'L’azote',FALSE,464);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1121,'L’hydrogène',FALSE,464);

-- Q465
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (465,'Quel organe permet l’élimination des déchets liquides ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1122,'Les reins',TRUE,465);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1123,'La vessie',FALSE,465);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1124,'Le foie',FALSE,465);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1125,'Les poumons',FALSE,465);

-- Q466
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (466,'Quel est l’organe principal de la circulation sanguine ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1126,'Le cœur',TRUE,466);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1127,'Les poumons',FALSE,466);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1128,'Le foie',FALSE,466);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1129,'Les reins',FALSE,466);

-- Q467
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (467,'Quelle planète est surnommée la planète rouge ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1130,'Mars',TRUE,467);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1131,'Vénus',FALSE,467);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1132,'Jupiter',FALSE,467);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1133,'Mercure',FALSE,467);

-- Q468
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (468,'Quel est l’état de l’eau à 0°C ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1134,'Solide',TRUE,468);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1135,'Liquide',FALSE,468);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1136,'Gazeux',FALSE,468);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1137,'Plasma',FALSE,468);

-- Q469
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (469,'Quel organe est responsable de la vision ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1138,'Les yeux',TRUE,469);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1139,'Le cerveau',FALSE,469);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1140,'Les nerfs',FALSE,469);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1141,'Les muscles',FALSE,469);

-- Q470
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (470,'Quelle est la source principale de lumière pour la Terre ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1142,'Le Soleil',TRUE,470);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1143,'La Lune',FALSE,470);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1144,'Les étoiles',FALSE,470);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1145,'Le feu',FALSE,470);

-- Q471
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (471,'Quel organe permet l’audition ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1146,'L’oreille',TRUE,471);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1147,'L’œil',FALSE,471);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1148,'Le nez',FALSE,471);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1149,'La bouche',FALSE,471);

-- Q472
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (472,'Quelle planète est la plus proche du Soleil ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1150,'Mercure',TRUE,472);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1151,'Vénus',FALSE,472);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1152,'La Terre',FALSE,472);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1153,'Mars',FALSE,472);

-- Q473
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (473,'Quel est l’état de l’eau à 100°C ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1154,'Gazeux',TRUE,473);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1155,'Liquide',FALSE,473);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1156,'Solide',FALSE,473);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1157,'Plasma',FALSE,473);

-- Q474
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (474,'Quel organe est responsable du goût ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1158,'La langue',TRUE,474);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1159,'Le nez',FALSE,474);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1160,'Les dents',FALSE,474);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1161,'La gorge',FALSE,474);

-- Q475
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (475,'Quelle est la planète sur laquelle nous vivons ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1162,'La Terre',TRUE,475);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1163,'Mars',FALSE,475);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1164,'Vénus',FALSE,475);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1165,'Jupiter',FALSE,475);

-- Q476
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (476,'Quel organe permet la respiration ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1166,'Les poumons',TRUE,476);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1167,'Le cœur',FALSE,476);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1168,'Le foie',FALSE,476);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1169,'Les reins',FALSE,476);

-- Q477
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (477,'Quelle planète est connue pour ses anneaux ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1170,'Saturne',TRUE,477);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1171,'Jupiter',FALSE,477);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1172,'Uranus',FALSE,477);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1173,'Neptune',FALSE,477);

-- Q478
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (478,'Quel est l’état de l’eau à température ambiante ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1174,'Liquide',TRUE,478);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1175,'Solide',FALSE,478);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1176,'Gazeux',FALSE,478);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1177,'Plasma',FALSE,478);

-- Q479
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (479,'Quel organe est responsable de l’odorat ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1178,'Le nez',TRUE,479);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1179,'La langue',FALSE,479);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1180,'Les oreilles',FALSE,479);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1181,'Les yeux',FALSE,479);

-- Q480
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (480,'Quelle est la source principale de chaleur pour la Terre ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1182,'Le Soleil',TRUE,480);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1183,'Le noyau terrestre',FALSE,480);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1184,'Les volcans',FALSE,480);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1185,'La Lune',FALSE,480);

-- Q481
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (481,'Quel organe permet la digestion des aliments ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1186,'L’estomac',TRUE,481);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1187,'Le cœur',FALSE,481);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1188,'Les poumons',FALSE,481);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1189,'Les reins',FALSE,481);

-- Q482
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (482,'Quelle planète est la plus grande du système solaire ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1190,'Jupiter',TRUE,482);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1191,'Saturne',FALSE,482);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1192,'Neptune',FALSE,482);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1193,'La Terre',FALSE,482);

-- Q483
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (483,'Quel est l’état de l’eau à -10°C ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1194,'Solide',TRUE,483);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1195,'Liquide',FALSE,483);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1196,'Gazeux',FALSE,483);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1197,'Plasma',FALSE,483);

-- Q484
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (484,'Quel organe est responsable du toucher ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1198,'La peau',TRUE,484);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1199,'Les muscles',FALSE,484);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1200,'Les os',FALSE,484);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1201,'Les nerfs',FALSE,484);

-- Q485
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (485,'Quelle est la planète la plus éloignée du Soleil ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1202,'Neptune',TRUE,485);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1203,'Uranus',FALSE,485);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1204,'Saturne',FALSE,485);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1205,'Jupiter',FALSE,485);

-- Q486
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (486,'Quel organe permet la filtration du sang ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1206,'Les reins',TRUE,486);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1207,'Le cœur',FALSE,486);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1208,'Les poumons',FALSE,486);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1209,'L’estomac',FALSE,486);

-- Q487
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (487,'Quelle planète est connue pour sa Grande Tache Rouge ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1210,'Jupiter',TRUE,487);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1211,'Mars',FALSE,487);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1212,'Saturne',FALSE,487);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1213,'Neptune',FALSE,487);

-- Q488
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (488,'Quel est l’état de l’eau au-dessous de 0°C ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1214,'Solide',TRUE,488);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1215,'Liquide',FALSE,488);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1216,'Gazeux',FALSE,488);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1217,'Plasma',FALSE,488);

-- Q489
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (489,'Quel organe permet la circulation du sang ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1218,'Le cœur',TRUE,489);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1219,'Les poumons',FALSE,489);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1220,'Le foie',FALSE,489);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1221,'Les reins',FALSE,489);

-- Q490
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (490,'Quelle est la planète la plus chaude du système solaire ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1222,'Vénus',TRUE,490);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1223,'Mercure',FALSE,490);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1224,'Mars',FALSE,490);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1225,'Jupiter',FALSE,490);

-- Q491
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (491,'Quel organe permet la pensée et le raisonnement ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1226,'Le cerveau',TRUE,491);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1227,'Le cœur',FALSE,491);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1228,'Les poumons',FALSE,491);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1229,'Le foie',FALSE,491);

-- Q492
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (492,'Quelle planète est surnommée l’étoile du berger ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1230,'Vénus',TRUE,492);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1231,'Mars',FALSE,492);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1232,'Jupiter',FALSE,492);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1233,'Mercure',FALSE,492);

-- Q493
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (493,'Quel est l’état de l’eau dans les nuages ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1234,'Gazeux',TRUE,493);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1235,'Liquide',FALSE,493);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1236,'Solide',FALSE,493);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1237,'Plasma',FALSE,493);

-- Q494
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (494,'Quel organe permet le mouvement du corps ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1238,'Les muscles',TRUE,494);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1239,'Les os',FALSE,494);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1240,'Les nerfs',FALSE,494);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1241,'La peau',FALSE,494);

-- Q495
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (495,'Quelle planète est la troisième à partir du Soleil ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1242,'La Terre',TRUE,495);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1243,'Vénus',FALSE,495);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1244,'Mars',FALSE,495);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1245,'Jupiter',FALSE,495);

-- Q491
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (491,'Quel organe permet la pensée et le raisonnement ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1226,'Le cerveau',TRUE,491);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1227,'Le cœur',FALSE,491);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1228,'Les poumons',FALSE,491);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1229,'Le foie',FALSE,491);

-- Q492
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (492,'Quelle planète est surnommée l’étoile du berger ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1230,'Vénus',TRUE,492);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1231,'Mars',FALSE,492);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1232,'Jupiter',FALSE,492);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1233,'Mercure',FALSE,492);

-- Q493
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (493,'Quel est l’état de l’eau dans les nuages ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1234,'Gazeux',TRUE,493);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1235,'Liquide',FALSE,493);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1236,'Solide',FALSE,493);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1237,'Plasma',FALSE,493);

-- Q494
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (494,'Quel organe permet le mouvement du corps ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1238,'Les muscles',TRUE,494);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1239,'Les os',FALSE,494);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1240,'Les nerfs',FALSE,494);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1241,'La peau',FALSE,494);

-- Q495
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (495,'Quelle planète est la troisième à partir du Soleil ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1242,'La Terre',TRUE,495);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1243,'Vénus',FALSE,495);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1244,'Mars',FALSE,495);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1245,'Jupiter',FALSE,495);

-- Q496
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (496,'Quel organe permet la protection du cerveau ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1246,'Le crâne',TRUE,496);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1247,'La peau',FALSE,496);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1248,'Les muscles',FALSE,496);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1249,'Les nerfs',FALSE,496);

-- Q497
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (497,'Quelle planète est connue pour être la plus froide ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1250,'Uranus',TRUE,497);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1251,'Neptune',FALSE,497);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1252,'Saturne',FALSE,497);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1253,'Mars',FALSE,497);

-- Q498
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (498,'Quel est l’état de l’eau dans la glace ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1254,'Solide',TRUE,498);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1255,'Liquide',FALSE,498);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1256,'Gazeux',FALSE,498);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1257,'Plasma',FALSE,498);

-- Q499
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (499,'Quel organe permet la circulation de l’oxygène dans le sang ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1258,'Les globules rouges',TRUE,499);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1259,'Les poumons',FALSE,499);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1260,'Le cœur',FALSE,499);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1261,'Les reins',FALSE,499);

-- Q500
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (500,'Quelle est la planète sur laquelle la vie est connue ?',2,1,'Facile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1262,'La Terre',TRUE,500);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1263,'Mars',FALSE,500);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1264,'Vénus',FALSE,500);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1265,'Jupiter',FALSE,500);

 
-- ===================================
-- MANCHE 4 : 15 QUESTIONS (ÉNIGMES)
-- ===================================
-- Q501
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (501,'Je suis toujours devant vous mais vous ne pouvez jamais me voir. Qui suis-je ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1266,'Avenir',TRUE,501);

-- Q502
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (502,'Plus on m''enlève, plus je deviens grand. Que suis-je ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1267,'Trou',TRUE,502);

-- Q503
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (503,'Quel nombre, multiplié par n''importe quel autre nombre, donnera toujours le même résultat ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1268,'0',TRUE,503);

-- Q504
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (504,'Quelle ville française est surnommée ''la ville rose'' ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1269,'Toulouse',TRUE,504);

-- Q505
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (505,'Quel philosophe grec a été le professeur d''Alexandre le Grand ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1270,'Aristote',TRUE,505);

-- Q506
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (506,'Combien de fois peut-on soustraire 10 de 100 ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1271,'1',TRUE,506);

-- Q507
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (507,'Quel est le seul mammifère capable de voler ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1272,'Chauve-souris',TRUE,507);

-- Q508
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (508,'Dans la mythologie grecque, qui est le dieu du vin ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1273,'Dionysos',TRUE,508);

-- Q509
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (509,'Combien de fois le mot ''et'' apparaît dans cette phrase : ''Le chat et le chien se promènent et jouent ensemble'' ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1274,'2',TRUE,509);

-- Q510
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (510,'Quel écrivain français a écrit ''À la recherche du temps perdu'' ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1275,'Marcel Proust',TRUE,510);

-- Q511
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (511,'Je parle sans bouche et j''entends sans oreilles. Je n''ai pas de corps mais je prends vie avec le vent. Qui suis-je ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1276,'Écho',TRUE,511);

-- Q512
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (512,'Quelle est la racine carrée de 144 ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1277,'12',TRUE,512);

-- Q513
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (513,'Quel est le plus petit nombre premier ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1278,'2',TRUE,513);

-- Q514
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (514,'Dans quelle ville se déroule l''action du roman ''Notre-Dame de Paris'' ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1279,'Paris',TRUE,514);

-- Q515
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (515,'Un père a 32 ans et son fils 5 ans. Dans combien d''années le père aura-t-il le double de l''âge de son fils ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1280,'22',TRUE,515);

-- Q516
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (516,'Si vous m''avez, vous voulez me partager. Si vous me partagez, vous ne m''avez plus. Que suis-je ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1281,'Un secret',TRUE,516);

-- Q517
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (517,'Qu''est-ce qui appartient à l''utilisateur, mais que les autres utilisent beaucoup plus que lui ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1282,'Son nom',TRUE,517);

-- Q518
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (518,'Qu''est-ce qui peut faire le tour du monde tout en restant dans son coin ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1283,'Un timbre',TRUE,518);

-- Q519
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (519,'Qu''est-ce qui a des dents mais ne peut pas mordre ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1284,'Un peigne',TRUE,519);

-- Q520
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (520,'Plus il y en a, moins on voit. Que suis-je ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1285,'L''obscurité',TRUE,520);

-- Q521
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (521,'Je ne respire jamais mais j''ai besoin d''air. Je n''ai pas de vie mais je peux mourir. Que suis-je ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1286,'Un feu',TRUE,521);

-- Q522
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (522,'Je suis si fragile que si vous prononcez mon nom, vous me brisez. Qui suis-je ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1287,'Le silence',TRUE,522);

-- Q523
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (523,'Qu''est-ce qui monte et qui descend, mais ne bouge jamais ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1288,'Un escalier',TRUE,523);

-- Q524
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (524,'Quelle invention permet de regarder à travers les murs ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1289,'Une fenêtre',TRUE,524);

-- Q525
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (525,'Je ne suis pas vivant, mais j''ai cinq doigts. Que suis-je ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1290,'Un gant',TRUE,525);

-- Q526
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (526,'Qu''est-ce qui a des racines que personne ne voit, est plus grand que les arbres, mais ne pousse jamais ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1291,'Une montagne',TRUE,526);

-- Q527
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (527,'Qu''est-ce qui peut être brisé sans jamais être touché ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1292,'Une promesse',TRUE,527);

-- Q528
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (528,'Lequel de ces mots est le plus long : une seconde, une minute, une heure ou un jour ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1293,'Une seconde',TRUE,528);

-- Q529
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (529,'Je commence la nuit et je finis le matin. Qui suis-je ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1294,'La lettre N',TRUE,529);

-- Q530
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (530,'Qu''est-ce qui a un œil mais ne peut pas voir ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1295,'Une aiguille',TRUE,530);

-- Q531
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (531,'Quel est le seul État au monde qui ne possède pas d''armée ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1296,'Le Costa Rica',TRUE,531);

-- Q532
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (532,'Comment appelle-t-on le point de l''espace où la gravité est si forte que même la lumière ne peut s''échapper ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1297,'L''horizon des événements',TRUE,532);

-- Q533
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (533,'Quel est l''élément chimique le plus rare sur la croûte terrestre ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1298,'L''astate',TRUE,533);

-- Q534
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (534,'Qui a peint "Le Jardin des délices" au XVe siècle ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1299,'Jérôme Bosch',TRUE,534);

-- Q535
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (535,'Dans quel pays peut-on trouver la région historique de la Transylvanie ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1300,'Roumanie',TRUE,535);

-- Q536
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (536,'Quel empereur romain a légalisé le christianisme par l''édit de Milan ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1301,'Constantin Ier',TRUE,536);

-- Q537
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (537,'Quelle est la monnaie officielle de l''Afrique du Sud ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1302,'Le Rand',TRUE,537);

-- Q538
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (538,'En quelle année a eu lieu la chute du mur de Berlin ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1303,'1989',TRUE,538);

-- Q539
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (539,'Quel pays possède le plus grand nombre de pyramides au monde ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1304,'Le Soudan',TRUE,539);

-- Q540
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (540,'Quel est le nom de l''algorithme de consensus utilisé par le Bitcoin ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1305,'Proof of Work',TRUE,540);

-- Q541
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (541,'Quel est le nom de la particule élémentaire associée au champ qui donne une masse aux autres particules ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1306,'Boson de Higgs',TRUE,541);

-- Q542
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (542,'Dans la Divine Comédie de Dante, qui guide le poète à travers l''Enfer ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1307,'Virgile',TRUE,542);

-- Q543
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (543,'Quel est l''instrument de musique préféré du détective Sherlock Holmes ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1308,'Le violon',TRUE,543);

-- Q544
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (544,'Quel pays d''Asie centrale a pour capitale Achgabat ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1309,'Le Turkménistan',TRUE,544);

-- Q545
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (545,'Quel est le nom du plus profond canyon sous-marin au monde ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1310,'Le canyon de Zhemchug',TRUE,545);

-- Q546
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (546,'Combien de côtés possède un ennéagone ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1311,'9',TRUE,546);

-- Q547
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (547,'Si 3 chats attrapent 3 souris en 3 minutes, combien de chats faut-il pour attraper 100 souris en 100 minutes ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1312,'3',TRUE,547);

-- Q548
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (548,'Quel est le prochain nombre dans cette suite : 2, 3, 5, 7, 11, 13, ... ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1313,'17',TRUE,548);

-- Q549
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (549,'Dans une famille, il y a deux parents et six filles. Chaque fille a un frère. Combien de personnes compte la famille ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1314,'9',TRUE,549);

-- Q550
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (550,'Quel est le résultat de 10 puissance 0 ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1315,'1',TRUE,550);

-- Q551
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (551,'Un nénuphar double de taille chaque jour. S''il met 48 jours pour couvrir tout un lac, combien de jours lui faut-il pour couvrir la moitié ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1316,'47',TRUE,551);

-- Q552
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (552,'Quelle est la valeur approximative du nombre d''or (Phi) ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1317,'1,618',TRUE,552);

-- Q553
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (553,'Comment s''appelle un polygone à 12 côtés ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1318,'Dodécagone',TRUE,553);

-- Q554
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (554,'Si vous multipliez tous les chiffres d''un clavier de téléphone entre eux, quel est le résultat ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1319,'0',TRUE,554);

-- Q555
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (555,'Dans un tournoi de tennis à élimination directe, s''il y a 64 participants, combien de matchs seront joués au total pour désigner le vainqueur ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1320,'63',TRUE,555);

-- Q556
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (556,'Quel est le nom du système de numération utilisant uniquement les chiffres 0 et 1 ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1321,'Binaire',TRUE,556);

-- Q557
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (557,'Quelle est la somme des angles d''un triangle ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1322,'180 degrés',TRUE,557);

-- Q558
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (558,'Combien y a-t-il de secondes dans une heure ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1323,'3600',TRUE,558);

-- Q559
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (559,'Quel paradoxe affirme qu''un coureur ne pourra jamais rattraper une tortue s''il lui donne de l''avance ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1324,'Le paradoxe de Zénon',TRUE,559);

-- Q560
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (560,'Un bâton et une balle coûtent 1,10€ au total. Le bâton coûte 1€ de plus que la balle. Combien coûte la balle ?',4,1,'Très difficile',NULL);

INSERT INTO REPONSE (id, libelle, juste, id_question)
VALUES (1325,'0,05€',TRUE,560);

-- Q561
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (561,'Qu''est-ce qui a deux aiguilles mais ne pique pas ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1326,'Une montre',TRUE,561);

-- Q562
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (562,'Qu''est-ce qui court mais n''a pas de jambes ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1327,'L''eau',TRUE,562);

-- Q563
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (563,'Je suis le commencement de l''éternité et la fin de l''espace. Qui suis-je ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1328,'La lettre E',TRUE,563);

-- Q564
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (564,'Qu''est-ce qui a un cou, mais pas de tête ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1329,'Une bouteille',TRUE,564);

-- Q565
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (565,'Plus on en fait, plus on en laisse derrière soi. Que suis-je ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1330,'Des pas',TRUE,565);

-- Q566
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (566,'Quelle est la question à laquelle on ne peut jamais répondre "Oui" sans mentir ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1331,'Dors-tu ?',TRUE,566);

-- Q567
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (567,'Qu''est-ce qui peut remplir une pièce entière sans prendre de place ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1332,'La lumière',TRUE,567);

-- Q568
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (568,'Qu''est-ce qui est noir quand on l''achète, rouge quand on l''utilise et gris quand on le jette ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1333,'Le charbon',TRUE,568);

-- Q569
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (569,'Quelle chose vous appartient mais est utilisée par tout le monde sauf vous ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1334,'Votre nom',TRUE,569);

-- Q570
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (570,'Qu''est-ce qui a des villes mais pas de maisons, des montagnes mais pas d''arbres et de l''eau mais pas de poissons ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1335,'Une carte',TRUE,570);

-- Q571
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (571,'Quel est le nom du traité qui a mis fin à la Première Guerre mondiale ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1336,'Traité de Versailles',TRUE,571);

-- Q572
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (572,'Quel gaz noble est le plus abondant dans l''atmosphère terrestre ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1337,'Argon',TRUE,572);

-- Q573
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (573,'Dans quelle ville italienne se trouve la Galerie des Offices ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1338,'Florence',TRUE,573);

-- Q574
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (574,'Quelle est la capitale du Kazakhstan depuis 2022 ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1339,'Astana',TRUE,574);

-- Q575
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (575,'Qui a découvert la structure en double hélice de l''ADN avec Crick ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1340,'James Watson',TRUE,575);

-- Q576
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (576,'Quel pays est le plus grand producteur de café au monde ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1341,'Brésil',TRUE,576);

-- Q577
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (577,'Quelle est la plus grande lune de Saturne ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1342,'Titan',TRUE,577);

-- Q578
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (578,'En quelle année l''homme a-t-il marché sur la Lune pour la première fois ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1343,'1969',TRUE,578);

-- Q579
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (579,'Quel est l''animal qui a le plus gros cerveau proportionnellement à sa taille ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1344,'La fourmi',TRUE,579);

-- Q580
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (580,'Quelle est la vitesse du son dans l''air (environ) ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1345,'340 m/s',TRUE,580);

-- Q581
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (581,'Combien d''arêtes possède un cube ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1346,'12',TRUE,581);

-- Q582
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (582,'Quelle est la somme des 100 premiers nombres entiers ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1347,'5050',TRUE,582);

-- Q583
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (583,'Un avion s''écrase exactement sur la frontière entre la France et l''Espagne. Où enterre-t-on les survivants ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1348,'Nulle part',TRUE,583);

-- Q584
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (584,'Si un médecin vous donne 3 pilules à prendre toutes les demi-heures, combien de temps durera le traitement ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1349,'1 heure',TRUE,584);

-- Q585
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (585,'Certains mois ont 31 jours, d''autres 30. Combien en ont 28 ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1350,'12',TRUE,585);

-- Q586
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (586,'Quelle est la moitié de 2 + 2 ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1351,'3',TRUE,586);

-- Q587
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (587,'Si vous participez à une course et que vous doublez le deuxième, à quelle place êtes-vous ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1352,'Deuxième',TRUE,587);

-- Q588
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (588,'Combien de paires de chaque animal Moïse a-t-il emmenées dans l''arche ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1353,'0',TRUE,588);

-- Q589
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (589,'Le père de Marie a cinq filles : Nana, Néné, Nini, Nono. Quel est le nom de la cinquième ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1354,'Marie',TRUE,589);

-- Q590
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (590,'Qu''est-ce qui est plus léger qu''une plume mais que même l''homme le plus fort du monde ne peut tenir plus de quelques minutes ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1355,'Le souffle',TRUE,590);

-- Q591
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (591,'Comment appelle-t-on le cri de la cigogne ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1356,'Craquètement',TRUE,591);

-- Q592
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (592,'Quelle est la couleur de la boîte noire des avions ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1357,'Orange',TRUE,592);

-- Q593
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (593,'Combien de fuseaux horaires existe-t-il en Russie ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1358,'11',TRUE,593);

-- Q594
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (594,'Quel est le pays le plus visité au monde ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1359,'France',TRUE,594);

-- Q595
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (595,'Quelle est la capitale de l''Australie ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1360,'Canberra',TRUE,595);

-- Q596
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (596,'Qui a inventé le vaccin contre la rage ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1361,'Louis Pasteur',TRUE,596);

-- Q597
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (597,'Combien de touches compte un piano standard ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1362,'88',TRUE,597);

-- Q598
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (598,'Quel est le nom du plus petit os du corps humain ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1363,'L''étrier',TRUE,598);

-- Q599
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (599,'Quel est le seul fruit dont les graines sont à l''extérieur ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1364,'La fraise',TRUE,599);

-- Q600
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (600,'Quel métal a le point de fusion le plus élevé ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1365,'Tungstène',TRUE,600);

-- Q601
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (601,'Quel pays partage la plus longue frontière terrestre avec la France ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1366,'Brésil',TRUE,601);

-- Q602
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (602,'Quelle est la langue la plus parlée au monde (en langue maternelle) ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1367,'Mandarin',TRUE,602);

-- Q603
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (603,'Combien d''états compte l''Union Européenne en 2024 ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1368,'27',TRUE,603);

-- Q604
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (604,'Quelle est la capitale de l''Islande ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1369,'Reykjavik',TRUE,604);

-- Q605
INSERT INTO QUESTION (id, libelle, id_manche, points, difficulte, temps_limite_secondes)
VALUES (605,'Quel est le dernier mot de ce quiz ?',4,1,'Très difficile',NULL);
INSERT INTO REPONSE (id, libelle, juste, id_question) VALUES (1370,'Fin',TRUE,605);

-- ===================================
-- PARAMÈTRES DU JEU
-- ===================================
INSERT INTO PARAMETRE_JEU (id, cle, valeur) VALUES (1,  'sons_actives', 'true');
INSERT INTO PARAMETRE_JEU (id, cle, valeur) VALUES (2,  'points_manche1_cible', '9');
INSERT INTO PARAMETRE_JEU (id, cle, valeur) VALUES (3,  'nb_questions_manche1', '10');
INSERT INTO PARAMETRE_JEU (id, cle, valeur) VALUES (4,  'temps_manche1_par_question', '15');
INSERT INTO PARAMETRE_JEU (id, cle, valeur) VALUES (5,  'nb_questions_manche2', '12');
INSERT INTO PARAMETRE_JEU (id, cle, valeur) VALUES (6,  'chrono_manche2_secondes', '120');
INSERT INTO PARAMETRE_JEU (id, cle, valeur) VALUES (7,  'serie_requise_manche2', '4');
INSERT INTO PARAMETRE_JEU (id, cle, valeur) VALUES (8,  'serie_minimale_manche2', '3');
INSERT INTO PARAMETRE_JEU (id, cle, valeur) VALUES (9,  'nb_questions_manche3', '10');
INSERT INTO PARAMETRE_JEU (id, cle, valeur) VALUES (10, 'score_requis_manche3', '15');
INSERT INTO PARAMETRE_JEU (id, cle, valeur) VALUES (11, 'nb_questions_finale', '10');
INSERT INTO PARAMETRE_JEU (id, cle, valeur) VALUES (12, 'score_requis_finale', '6');


-- ===================================
-- FIN DU FICHIER  
-- Total: 4 manches, 604 questions, 2100 reponses
-- ===================================
