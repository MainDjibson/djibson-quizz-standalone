-- ===================================
-- BASE DE DONNÉES QUIZ CHAMPION
-- 4 Manches + 300 Questions + Réponses
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
-- MANCHE 1 : 150 QUESTIONS
-- ===================================
MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la capitale de la France ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Paris', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de continents y a-t-il sur Terre ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('7', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le plus grand océan du monde ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Pacifique', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a peint La Joconde ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Léonard de Vinci', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le symbole chimique de l''or ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Au', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('En quelle année l''homme a-t-il marché sur la Lune pour la première fois ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1969', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le plus long fleuve du monde ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Amazone', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a écrit Les Misérables ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Victor Hugo', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la vitesse de la lumière dans le vide (en km/s) ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('300000', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pays a remporté la Coupe du Monde de football en 2018 ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('France', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien d''os possède le corps humain adulte ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('206', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la planète la plus proche du Soleil ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mercure', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a composé La Symphonie n°9 ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Beethoven', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le plus petit pays du monde ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vatican', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('En quelle année est tombé le mur de Berlin ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1989', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui est le dieu grec de la foudre et du ciel ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Zeus', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quel sport utilise-t-on un "birdie" ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Golf', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel mouvement artistique a été fondé par Claude Monet ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Impressionnisme', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''instrument principal de Miles Davis ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Trompette', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la formule chimique du sel de table ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('NaCl', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a écrit l''épopée "L''Odyssée" ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Homère', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien d''anneaux compte le drapeau olympique ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('5', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel sculpteur a réalisé "Le Penseur" ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Auguste Rodin', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du chien à trois têtes gardant les Enfers ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Cerbère', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la monnaie utilisée au Royaume-Uni ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Livre Sterling', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle équipe de basket joue au Madison Square Garden ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('New York Knicks', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel physicien a découvert la radioactivité du polonium ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Marie Curie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('De quel groupe de rock Freddie Mercury était-il le chanteur ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Queen', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le dieu romain équivalent à Poséidon ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Neptune', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quel musée se trouve la Vénus de Milo ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Louvre', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de minutes dure un match de football (hors arrêts de jeu) ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('90', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel métal est le meilleur conducteur d''électricité ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Argent', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel peintre a coupé son oreille gauche ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vincent van Gogh', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui est le dieu de l''Amour dans la mythologie romaine ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Cupidon', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la distance d''un marathon en kilomètres ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('42.195', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la galaxie dans laquelle nous vivons ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Voie Lactée', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pays est célèbre pour le Taj Mahal ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Inde', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel instrument possède 47 cordes et 7 pédales ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Harpe', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a tué le Minotaure dans le labyrinthe ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Thésée', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''organe le plus lourd du corps humain ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La peau', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quel pays se déroule le tournoi de tennis de Roland-Garros ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('France', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel compositeur est devenu sourd à la fin de sa vie ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Beethoven', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du célèbre détective créé par Arthur Conan Doyle ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Sherlock Holmes', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel gaz les plantes absorbent-elles pour la photosynthèse ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Dioxyde de carbone', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel héros grec avait pour seul point faible son talon ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Achille', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la couleur principale d''une émeraude ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vert', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pilote détient le record de 7 titres mondiaux en F1 avec Schumacher ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Lewis Hamilton', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le plus grand volcan du système solaire ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Olympus Mons', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment s''appelle l''épée du Roi Arthur ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Excalibur', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quel pays peut-on voir le Machu Picchu ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Pérou', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel écrivain a créé le personnage de Gargantua ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('François Rabelais', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la capitale de l''Allemagne ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Berlin', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel instrument de musique a été inventé par Bartolomeo Cristofori ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Piano', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''élément le plus abondant dans l''univers ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hydrogène', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui est le dieu de la guerre dans la mythologie grecque ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Arès', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pays a remporté le plus de Coupes du Monde de football ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Brésil', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la valeur de la constante de gravitation "g" sur Terre (m/s²) ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('9.81', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel célèbre monument se trouve à New York ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Statue de la Liberté', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quel opéra trouve-t-on le personnage de Figaro ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Barbier de Séville', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel titan porte la voûte céleste sur ses épaules ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Atlas', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du plus grand os de la jambe ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Fémur', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a peint "Le Cri" ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Edvard Munch', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le point le plus éloigné de la Terre sur l''orbite d''un satellite ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Apogée', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel animal est le symbole de la sagesse dans la mythologie grecque ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Chouette', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quelle ville se trouvent les jardins suspendus de Sémiramis ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Babylone', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la particule élémentaire responsable de la masse (le "Boson de...") ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Higgs', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le sport pratiqué par Rafael Nadal ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Tennis', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui est le dieu de la forge et du feu dans la mythologie grecque ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Héphaïstos', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le titre du premier film de l''histoire du cinéma (1895) ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La Sortie de l''usine Lumière à Lyon', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''instrument à vent le plus petit de l''orchestre symphonique ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Piccolo', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la capitale de l''Australie ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Canberra', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('En chimie, que signifie le pH ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Potentiel Hydrogène', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel célèbre paquebot a coulé en 1912 ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Titanic', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel roi de France était surnommé le Roi-Soleil ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Louis XIV', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui est la déesse de la discorde dans la mythologie grecque ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Eris', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la principale source d''énergie de la Terre ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Soleil', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel écrivain est l''auteur de "1984" ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('George Orwell', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel compositeur a écrit les "Quatre Saisons" ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vivaldi', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de joueurs y a-t-il dans une équipe de basket sur le terrain ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('5', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la plus grande planète du système solaire ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Jupiter', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel navire a ramené Napoléon de l''île d''Elbe ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''Inconstant', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quelle ville se trouve la Tour Eiffel ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Paris', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel gaz constitue environ 78% de l''air que nous respirons ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Azote', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a inventé le vaccin contre la rage ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Louis Pasteur', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du célèbre sorcier à lunettes créé par J.K. Rowling ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Harry Potter', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui est le dieu messager dans la mythologie romaine ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mercure', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel prix Nobel a été refusé par Jean-Paul Sartre ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Littérature', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pays est la patrie du Flamenco ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Espagne', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du pigment vert dans les feuilles ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Chlorophylle', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle bataille de 1815 a marqué la fin de Napoléon Ier ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Waterloo', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment s''appelle le satellite naturel de la Terre ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La Lune', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du tableau le plus célèbre de Léonard de Vinci ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La Joconde', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel organe humain contient les îlots de Langerhans ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Pancréas', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la montagne la plus haute du monde ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Everest', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a écrit la pièce de théâtre "Hamlet" ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('William Shakespeare', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la durée exacte d''une année sidérale (en jours) ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('365.25', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle langue est la plus parlée au Brésil ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Portugais', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui était le dieu de la mort dans l''Égypte ancienne ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Anubis', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du premier satellite artificiel lancé dans l''espace ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Spoutnik 1', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''animal le plus rapide au monde ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Guépard', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quel pays se trouve le volcan Vésuve ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Italie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a découvert la loi de la gravitation universelle ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Isaac Newton', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le plus grand mammifère marin ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Baleine bleue', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel sculpteur a réalisé la statue de la Liberté ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Auguste Bartholdi', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la température du zéro absolu en degrés Celsius ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('-273.15', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la capitale de l''Italie ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Rome', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a peint les plafonds de la Chapelle Sixtine ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Michel-Ange', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''élément chimique dont le symbole est Fe ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Fer', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans la mythologie nordique, qui est le père de Thor ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Odin', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pays a inventé les Jeux Olympiques ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Grèce', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel écrivain français a écrit "Le Petit Prince" ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Antoine de Saint-Exupéry', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel instrument de musique est souvent associé au dieu Pan ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Flûte', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la monnaie officielle du Japon ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Yen', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est l''étoile la plus proche de la Terre après le Soleil ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Proxima Centauri', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment s''appelle la peur des araignées ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Arachnophobie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quelle ville se trouve le Colisée ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Rome', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a découvert la structure en double hélice de l''ADN ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Watson et Crick', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel super-héros est surnommé "l''homme-araignée" ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Spider-Man', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du détroit séparant l''Espagne du Maroc ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Gibraltar', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a peint "La Naissance de Vénus" ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Sandro Botticelli', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la couleur de la boîte noire des avions ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Orange', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui est le dieu égyptien du soleil ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Râ', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le plus grand désert chaud du monde ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Sahara', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le fruit préféré des singes selon la légende ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Banane', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du fleuve qui traverse Londres ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Tamise', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel philosophe grec a été le précepteur d''Alexandre le Grand ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Aristote', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien y a-t-il de secondes dans une minute ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('60', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pays est surnommé le "Pays du Soleil Levant" ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Japon', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on un polygone à sept côtés ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Heptagone', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du plus petit continent ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Océanie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a écrit le roman "Le Comte de Monte-Cristo" ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Alexandre Dumas', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la couche de gaz qui protège la Terre des rayons UV ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Ozone', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''aliment de base du panda géant ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Bambou', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel compositeur a créé le "Boléro" ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Maurice Ravel', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel navigateur a été le premier à faire le tour du monde ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Magellan', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la capitale de l''Espagne ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Madrid', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel dieu est souvent représenté avec des ailes aux pieds ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hermès', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel gaz noble est utilisé dans les enseignes lumineuses rouges ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Néon', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''océan qui borde la côte Est des États-Unis ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Atlantique', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de cordes possède une guitare classique standard ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('6', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('En quelle année a eu lieu la Révolution française ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1789', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''oiseau qui ne vole pas mais court très vite ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Autruche', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a sculpté le "David" de marbre à Florence ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Michel-Ange', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom scientifique du sel de table ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Chlorure de sodium', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel organe sert à respirer chez les poissons ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Branchies', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui était le dieu romain du vin ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Bacchus', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la plus petite unité de matière ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Atome', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la capitale de l''Italie ?', 1, 1, 'Facile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Rome', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quel pays se trouve la pyramide de Khéops ?', 1, 2, 'Moyen', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Égypte', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le point d''ébullition de l''eau au sommet de l''Everest (environ) ?', 1, 3, 'Difficile', 15);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('72°C', TRUE, (SELECT MAX(id) FROM QUESTION));

-- ===================================
-- MANCHE 2 : 150 QUESTIONS
-- ===================================
MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la capitale de l''Italie ?', 2, 1, 'Facile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Rome', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de joueurs y a-t-il dans une équipe de football ?', 2, 1, 'Facile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('11', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel animal est le roi de la jungle ?', 2, 1, 'Facile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Lion', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle couleur obtient-on en mélangeant du bleu et du jaune ?', 2, 1, 'Facile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vert', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le plus grand mammifère du monde ?', 2, 1, 'Facile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Baleine bleue', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quel pays se trouve la tour Eiffel ?', 2, 1, 'Facile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('France', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de côtés a un hexagone ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('6', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le métal le plus précieux ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Rhodium', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a découvert l''Amérique en 1492 ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Christophe Colomb', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la langue la plus parlée au monde ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Chinois', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel organe du corps humain pompe le sang ?', 2, 1, 'Facile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Coeur', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de dents a un adulte normalement ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('32', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la monnaie du Japon ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Yen', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel gaz respirons-nous principalement ?', 2, 1, 'Facile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Azote', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de secondes y a-t-il dans une heure ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('3600', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom scientifique de l''étude de la classification des espèces ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Systématique', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle planète possède le jour le plus court du système solaire ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Jupiter', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on la photosynthèse réalisée sans lumière par certaines bactéries ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Chimiosynthèse', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle vitamine est principalement synthétisée par l''exposition au soleil ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine D', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quelle constellation se trouve l''étoile polaire ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Petite Ourse', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''ancêtre sauvage du maïs cultivé ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Téosinte', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel minéral est essentiel à la production d''hormones thyroïdiennes ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Iode', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le regroupement de 12 signes du zodiaque en astrologie ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Zodiaque', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle partie de la cellule est responsable de la respiration cellulaire ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mitochondrie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la galaxie la plus proche de la Voie Lactée ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Andromède', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de l''étude des mousses et des hépatiques ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Bryologie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la plus grande glande du corps humain ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Foie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on l''alignement de trois corps célestes ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Syzygie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pigment donne leur couleur rouge aux tomates ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Lycopène', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('En botanique, comment appelle-t-on une plante qui vit deux ans ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Bisannuelle', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle unité mesure la valeur énergétique des aliments ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Kilocalorie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel physicien a formulé les trois lois du mouvement des planètes ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Johannes Kepler', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la science qui étudie les champignons ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mycologie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment s''appelle l''explosion d''une étoile en fin de vie ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Supernova', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel acide est principalement présent dans le suc gastrique ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Acide chlorhydrique', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle planète est surnommée la "planète rouge" ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mars', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de l''appareil reproducteur mâle d''une fleur ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Étamine', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le sucre présent dans le lait ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Lactose', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la vitesse approximative de la lumière (en km/s) ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('300000', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel arbre produit les glands ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Chêne', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la plus petite planète du système solaire ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mercure', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on l''étude de l''influence supposée des astres sur les humains ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Astrologie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du processus de division cellulaire chez les eucaryotes ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mitose', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel gaz noble est le plus abondant dans l''atmosphère terrestre ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Argon', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la fonction principale des globules rouges ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Transporter l''oxygène', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on une plante qui perd ses feuilles chaque année ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Caduque', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du premier homme dans l''espace ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Youri Gagarine', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le composant principal du Soleil ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hydrogène', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''organe de l''équilibre chez l''humain ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Oreille interne', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le terme médical pour une pression artérielle trop élevée ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hypertension', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle famille de plantes comprend les pois et les haricots ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Fabacées', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le passage direct de l''état solide à l''état gazeux ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Sublimation', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle planète est célèbre pour ses grands anneaux ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Saturne', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le sucre circulant dans le sang ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Glucose', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est l''unité de mesure de la force ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Newton', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la science qui étudie les poissons ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Ichtyologie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du nuage de débris entourant le système solaire ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Nuage d''Oort', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle vitamine aide à la coagulation du sang ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine K', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel botaniste suédois a créé la nomenclature binominale ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Carl von Linné', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la lune de Pluton la plus imposante ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Charon', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la galaxie spirale la plus proche de la nôtre ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Andromède', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on les plantes qui croissent sur d''autres plantes sans être parasites ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Épiphytes', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel acide gras de la famille des Oméga-3 est essentiel au cerveau ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('DHA', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est l''étoile la plus brillante de la constellation du Lion ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Régulus', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du processus de fabrication du glucose par les plantes ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Photosynthèse', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('En systématique, quel rang se trouve directement au-dessous de la Famille ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Genre', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel oligo-élément est indispensable à la fixation du fer dans l''organisme ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Cuivre', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la température de surface approximative de Vénus (en °C) ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('460', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on un arbre dont le tronc est gonflé pour stocker l''eau ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Caudiciforme', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la zone de l''espace où la gravité est si forte que rien ne s''échappe ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Trou noir', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le constituant principal de la paroi des cellules végétales ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Cellulose', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle vitamine est également appelée acide ascorbique ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine C', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on l''étude du mouvement des astres pour prédire l''avenir ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Astrologie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la plus grande lune de Saturne ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Titan', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle hormone régule le taux de sucre dans le sang ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Insuline', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel botaniste a classé les plantes selon leurs organes sexuels ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Linné', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la planète la plus dense du système solaire ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Terre', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel nutriment fournit 9 calories par gramme ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Lipide', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on une fleur qui possède à la fois des organes mâles et femelles ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hermaphrodite', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la limite au-delà de laquelle rien ne peut sortir d''un trou noir ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Horizon des événements', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel sucre est le principal carburant des cellules humaines ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Glucose', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quelle partie de la plante se déroule principalement la photosynthèse ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Feuille', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la constellation en forme de W ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Cassiopée', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle science étudie les relations entre les êtres vivants et leur milieu ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Écologie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''élément chimique prédominant dans la composition du Soleil ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hydrogène', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le sommeil hivernal profond de certains animaux ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hibernation', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le plus petit composant vivant d''un organisme ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Cellule', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle lune de Jupiter est couverte d''une épaisse couche de glace ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Europe', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel métal est le constituant central de la chlorophylle ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Magnésium', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel nutriment est composé de chaînes d''acides aminés ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Protéine', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la trajectoire d''une planète autour du Soleil ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Orbite', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le croisement de deux individus d''espèces différentes ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hybride', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom scientifique du tournesol ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Helianthus', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel minéral durcit l''émail des dents ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Fluor', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle étoile de la constellation d''Orion est une supergéante rouge ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Bételgeuse', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on la science qui étudie les fossiles ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Paléontologie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel organe humain produit la bile ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Foie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle planète possède la plus grande montagne du système solaire ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mars', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel terme désigne l''ensemble des gènes d''un individu ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Génotype', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la plus petite unité d''un élément chimique ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Atome', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on les plantes qui vivent plusieurs années ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vivaces', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''instrument de mesure de la pression atmosphérique ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Baromètre', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel scientifique a proposé la théorie de la dérive des continents ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Alfred Wegener', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel gaz est rejeté par les plantes lors de la photosynthèse ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Oxygène', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de planètes telluriques compte notre système solaire ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('4', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la distance moyenne Terre-Soleil (en millions de km) ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('150', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment s''appelle l''étude scientifique de la structure des plantes ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Anatomie végétale', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle vitamine est nécessaire pour une bonne vision nocturne ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine A', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la galaxie qui entrera en collision avec la nôtre dans 4 milliards d''années ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Andromède', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du pigment respiratoire qui donne sa couleur rouge au sang ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hémoglobine', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on la branche de la botanique étudiant les algues ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Phycologie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le plus gros satellite de la planète Neptune ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Triton', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel oligo-élément est essentiel au métabolisme du glucose via l''insuline ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Chrome', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du point de l''orbite d''une planète le plus proche du Soleil ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Périhélie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle partie de la fleur se transforme en fruit après fécondation ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Ovaire', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le constituant majeur du gaz naturel ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Méthane', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le mouvement de rotation d''une plante vers la lumière ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Phototropisme', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle planète du système solaire a la vitesse de rotation la plus lente ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vénus', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel minéral compose principalement les os et les dents ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Calcium', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle science étudie la distribution géographique des êtres vivants ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Biogéographie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''astre le plus brillant du ciel nocturne (après la Lune) ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vénus', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le tissu conducteur de la sève élaborée dans une plante ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Phloème', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de l''état de manque total d''oxygène dans un tissu ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Anoxie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la plus grande planète gazeuse du système solaire ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Jupiter', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle vitamine aide à la synthèse du collagène ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine C', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la science traitant des lois de l''hérédité ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Génétique', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel astronome a été condamné pour avoir soutenu l''héliocentrisme ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Galilée', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel type de sucre trouve-t-on en abondance dans les fruits ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Fructose', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la partie mâle de la graine de pollen ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Gamétophyte', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle force maintient les planètes en orbite autour du Soleil ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Gravitation', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle science étudie les climats passés ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Paléoclimatologie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on un régime alimentaire sans aucun produit animal ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Végétalisme', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la période de révolution de la Terre (en jours) ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('365.25', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''organe principal de la photosynthèse chez les cactus ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Tige', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le mouvement apparent des planètes vers l''arrière dans le ciel ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Rétrogradation', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la zone de l''atmosphère où nous vivons ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Troposphère', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel type de lipides est solide à température ambiante ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Graisses saturées', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle science étudie la structure et l''évolution de l''Univers ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Cosmologie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le fruit sec du chêne ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Gland', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''élément le plus léger du tableau périodique ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hydrogène', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la science qui étudie le tissu nerveux ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Neurologie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle planète possède un système d''anneaux composé principalement de glace ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Saturne', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel nutriment est indispensable au transport de l''oxygène dans le sang ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Fer', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment s''appelle l''ouverture d''une fleur permettant les échanges gazeux ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Stomate', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel type de rayonnement est bloqué par la couche d''ozone ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Ultraviolet', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la lune de la Terre ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Lune', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel minéral est nécessaire à la contraction musculaire ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Magnésium', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a formulé la théorie de la relativité générale ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Albert Einstein', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle science étudie les arbres et les arbustes ?', 2, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Dendrologie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la phase de la lune où elle est invisible de la Terre ?', 2, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Nouvelle lune', TRUE, (SELECT MAX(id) FROM QUESTION));

-- ===================================
-- MANCHE 3 : 15 QUESTIONS QCM (4 choix chacune)
-- ===================================
MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la capitale de l''Espagne ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Madrid', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Barcelone', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Séville', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Valence', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a écrit ''1984'' ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('George Orwell', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Aldous Huxley', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Ray Bradbury', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Ernest Hemingway', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le plus haut sommet du monde ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mont Everest', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('K2', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Kangchenjunga', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Lhotse', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('En quelle année a débuté la Première Guerre mondiale ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1914', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1912', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1916', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1918', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''élément chimique dont le symbole est ''Fe'' ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Fer', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Fluor', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Francium', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Fermium', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a peint ''La Nuit étoilée'' ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vincent van Gogh', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Claude Monet', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Pablo Picasso', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Paul Cézanne', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la vitesse du son dans l''air (environ) ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('340 m/s', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('300 m/s', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('400 m/s', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('500 m/s', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pays a inventé le papier ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Chine', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Égypte', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Grèce', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Inde', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de touches a un piano standard ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('88', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('76', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('92', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('100', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le plus grand désert chaud du monde ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Sahara', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Gobi', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Kalahari', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Atacama', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a inventé l''ampoule électrique ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Thomas Edison', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Nikola Tesla', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Alexander Graham Bell', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Benjamin Franklin', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la durée de la révolution de la Terre autour du Soleil ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('365,25 jours', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('364 jours', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('366 jours', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('360 jours', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''animal le plus rapide du monde ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Guépard', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Lion', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Antilope', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Léopard', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quel pays se trouve le Taj Mahal ?', 3, 1, 'Facile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Inde', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Pakistan', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Bangladesh', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Népal', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la formule chimique de l''eau ?', 3, 1, 'Facile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('H2O', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('H2O2', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('HO2', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('H3O', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du plus grand volcan du système solaire, situé sur Mars ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Olympus Mons', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mauna Kea', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Tharsis Montes', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Arsia Mons', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la protéine qui transporte le fer dans le plasma sanguin ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Transferrine', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Ferritine', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hémoglobine', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Albumine', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('En botanique, comment appelle-t-on une plante qui vit sur le sable ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Psammophile', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Halophile', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Xérophile', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Lithophile', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la distance approximative d''une unité astronomique (UA) ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('150 millions de km', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('380 000 km', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1 milliard de km', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('9,46 billions de km', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom scientifique du processus de transpiration chez les plantes ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Évapotranspiration', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Sublimation', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Osmose', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Capillarité', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le constituant principal de la soie d''araignée ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Fibroïne', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Kératine', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Chitine', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Collagène', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle vitamine est connue sous le nom de Riboflavine ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine B2', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine B12', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine B6', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine B1', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel astronome a découvert la planète Uranus en 1781 ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('William Herschel', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Edwin Hubble', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Johannes Kepler', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Clyde Tombaugh', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on l''étude de la classification des sols ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Pédologie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Géomorphologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Limnologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Orographie', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le métal le plus abondant dans la croûte terrestre ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Aluminium', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Fer', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Cuivre', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Magnésium', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la température du "zéro absolu" en degrés Celsius ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('-273,15 °C', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('-250,50 °C', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('-300,00 °C', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('0 °C', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel organe humain est composé de lobes appelés "segments de Couinaud" ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le foie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le cerveau', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Les poumons', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le pancréas', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la galaxie satellite de la Voie Lactée visible depuis l''hémisphère Sud ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Nuage de Magellan', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Andromède', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Galaxie du Sombrero', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Messier 81', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle plante est la base de la fabrication de la tequila ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Agave bleu', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Aloe Vera', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Yucca', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Sisal', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('En diététique, quel acide aminé est considéré comme précurseur de la sérotonine ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Tryptophane', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Leucine', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Lysine', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Méthionine', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la durée de vie moyenne d''un globule rouge dans le corps humain ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('120 jours', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('10 jours', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('365 jours', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('30 jours', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la couche supérieure de la forêt tropicale concentrant la biodiversité ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La canopée', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le sous-bois', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''humus', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La strate arbustive', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est l''étoile la plus brillante de la constellation de la Vierge ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Spica', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Sirius', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Aldébaran', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Antarès', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quelle ville se trouve le siège de l''OMS ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Genève', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('New York', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Paris', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Bruxelles', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''élément chimique le plus abondant dans l''Univers ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hydrogène', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hélium', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Oxygène', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Carbone', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment nomme-t-on la zone océanique entre 200 et 1000m de profondeur ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Zone mésopélagique', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Zone bathypélagique', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Zone abyssopélagique', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Zone épipélagique', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel aliment est la source la plus riche en vitamine B12 ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le foie de bœuf', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''épinard', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La pomme', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le riz', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle particule subatomique a été découverte par James Chadwick ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le neutron', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''électron', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le proton', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le positron', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel domaine regroupe les organismes à cellules complexes avec noyau ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Eucaryotes', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Procaryotes', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Archées', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Bactéries', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle mission spatiale a déposé le robot Philae sur une comète ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Rosetta', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Voyager 2', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Cassini', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('New Horizons', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel fruit contient de la bromélaïne facilitant la digestion ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Ananas', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Papaye', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Kiwi', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mangue', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui est l''auteur de "L''Origine des espèces" ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Charles Darwin', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Gregor Mendel', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Jean-Baptiste de Lamarck', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Alfred Wallace', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle fleur géante est célèbre pour son odeur de cadavre ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Rafflesia arnoldii', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Titan Arum', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Victoria amazonica', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Puya raimondii', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la durée de rotation sidérale de la Lune ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('27,3 jours', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('24 heures', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('29,5 jours', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('31 jours', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle hormone est produite en réponse immédiate au stress ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Cortisol', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mélatonine', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Thyroxine', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Insuline', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle science étudie le climat passé via les cernes des arbres ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Dendroclimatologie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Palynologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Phénologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Xylologie', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la planète la plus chaude du système solaire ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vénus', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mercure', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mars', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Jupiter', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pigment est responsable de la couleur de la peau humaine ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mélanine', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Kératine', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Carotène', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hémoglobine', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel botaniste français a fondé le Jardin des Plantes à Paris ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Guy de La Brosse', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Buffon', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Lamarck', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Jussieu', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel aliment est particulièrement riche en magnésium ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Chocolat noir', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Lait entier', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Viande rouge', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Pomme de terre', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel équilibre maintient les planètes en orbite stable ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Gravitation et inertie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Magnétisme et vide', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Effet Doppler', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Pression de radiation', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Où trouve-t-on l''ADN mitochondrial dans la cellule ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Dans la mitochondrie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Dans le noyau', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Dans le ribosome', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Dans l''appareil de Golgi', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on un fruit qui ne s''ouvre pas à maturité ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Indéhiscent', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Déhiscent', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Charnu', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Parthénocarpique', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel minéral est le composant principal du calcaire ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Carbonate de calcium', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Silice', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Feldspath', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Gypse', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la plus grande lune de la planète Jupiter ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Ganymède', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Europe', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Titan', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Callisto', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la fonction principale des lipoprotéines LDL ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Transporter le cholestérol aux cellules', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Évacuer le gras des artères', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Produire de l''ATP', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Synthétiser le fer', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel chimiste a énoncé : "Rien ne se perd, tout se transforme" ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Antoine Lavoisier', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Dimitri Mendeleïev', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Louis Pasteur', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Robert Boyle', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle plante produit le safran ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Crocus sativus', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Iris germanica', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Colchicum autumnale', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Lilium candidum', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de cœurs possède une pieuvre ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('3', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('2', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('9', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du plus grand canyon du système solaire ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Valles Marineris', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Grand Canyon', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Chasma Boreale', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hellis Vallis', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la force qui s''oppose au mouvement d''un objet dans un fluide ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La traînée', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La portance', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''inertie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La poussée', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la plus petite unité structurelle et fonctionnelle d''un rein ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le néphron', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le neurone', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''alvéole', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''ostéocyte', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quelle constellation peut-on observer l''étoile géante rouge Antarès ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Scorpion', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Sagittaire', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Orion', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Taureau', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de l''hormone végétale responsable de la maturation des fruits ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''éthylène', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''auxine', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La gibbérelline', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La cytokinine', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel minéral est indispensable à la formation de l''hémoglobine ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le fer', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le zinc', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le cuivre', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le sélénium', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la vitesse de libération nécessaire pour quitter l''attraction terrestre ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('11,2 km/s', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('7,9 km/s', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('29,8 km/s', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('42,1 km/s', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on les plantes qui préfèrent les sols acides ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Acidophiles', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Basophiles', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Calciphiles', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Halophiles', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle vitamine est principalement contenue dans les huiles végétales et les noix ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine E', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine B1', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine C', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine D', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la galaxie spirale la plus proche de la Voie Lactée ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Andromède', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La galaxie du Triangle', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La galaxie du Tourbillon', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La galaxie du Cocon', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('En systématique, quel est le nom du règne regroupant les champignons ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Fungi', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Plantae', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Protista', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Monera', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du pigment bleu trouvé dans certaines algues et cyanobactéries ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La phycocyanine', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La chlorophylle b', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La lutéine', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''anthocyane', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle planète possède la lune nommée Triton ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Neptune', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Uranus', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Saturne', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Jupiter', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la fonction principale des mitochondries ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La production d''énergie (ATP)', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La synthèse des protéines', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le stockage de l''eau', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La digestion cellulaire', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on l''étude de la structure interne des cellules ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La cytologie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''histologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La physiologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''anatomie', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel gaz est le plus présent dans l''atmosphère de Vénus ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Dioxyde de carbone', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Azote', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Méthane', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Soufre', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de l''échelle mesurant la dureté des minéraux ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Échelle de Mohs', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Échelle de Richter', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Échelle de Scoville', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Échelle de Beaufort', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('En botanique, quel terme désigne un ensemble de pétales ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La corolle', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le calice', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le réceptacle', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le périanthe', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle lune de Saturne possède une atmosphère dense et des lacs de méthane ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Titan', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Encelade', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Phébé', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mimas', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''apport calorique moyen d''un gramme d''éthanol (alcool) ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('7 kcal', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('4 kcal', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('9 kcal', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('5 kcal', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le point le plus éloigné du Soleil sur l''orbite d''une planète ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''aphélie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le périhélie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''apogée', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le périgée', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel savant a découvert la circulation sanguine complète en 1628 ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('William Harvey', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Ambroise Paré', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Andreas Vésale', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Galien', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la fleur nationale du Japon ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le chrysanthème', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le cerisier (Sakura)', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le lotus', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le camélia', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la galaxie qui contient notre système solaire ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La Voie Lactée', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''Oeil de Chat', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La galaxie d''Andromède', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La Nébuleuse d''Orion', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle famille de plantes comprend les oignons, l''ail et les poireaux ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Amaryllidacées', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Liliacées', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Astéracées', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Brassicacées', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le pourcentage approximatif d''oxygène dans l''air terrestre ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('21 %', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('78 %', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('15 %', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('5 %', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la zone de l''atmosphère où orbitent les navettes spatiales ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La thermosphère', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La stratosphère', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La mésosphère', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La troposphère', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle hormone favorise le stockage du glucose sous forme de glycogène ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''insuline', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le glucagon', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''adrénaline', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La dopamine', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on les plantes vivant en milieu très sec ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Xérophytes', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Hydrophytes', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Héliophytes', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Épiphytes', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel élément chimique a le numéro atomique 1 ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''hydrogène', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''hélium', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le carbone', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''oxygène', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la plus grande structure connue de l''Univers ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Grand Mur d''Hercule-Couronne Boréale', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Grand Mur de Sloan', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le superamas de Laniakea', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le vide de Bootes', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pigment vert permet aux plantes de capter l''énergie lumineuse ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La chlorophylle', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le carotène', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le lycopène', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La mélanine', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel physicien a donné son nom à l''unité de mesure de la pression ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Blaise Pascal', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Isaac Newton', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('James Watt', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Alessandro Volta', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom scientifique de l''étoile Polaire ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Alpha Ursae Minoris', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Alpha Centauri', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Polaris Borealis', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Sirius A', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on l''étude scientifique des fruits ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La pomologie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''oenologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La carpologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''ampélographie', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle vitamine est essentielle pour prévenir le scorbut ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine C', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine A', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine D', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vitamine K', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle planète est surnommée "La Géante de Glace" avec Uranus ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Neptune', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Saturne', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Jupiter', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Pluton', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le constituant principal des membranes cellulaires ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Les phospholipides', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Les triglycérides', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le glycogène', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''amylopectine', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de l''étude des mousses et hépatiques ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La bryologie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La mycologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La lichénologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La phycologie', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la durée approximative du cycle de Saros (éclipses) ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('18 ans et 11 jours', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('11 ans', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('76 ans', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('28 jours', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel organe humain contient les îlots de Langerhans ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le pancréas', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La rate', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le rein', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le foie', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la fleur la plus chère du monde à cause de sa récolte manuelle ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Crocus à safran', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''Orchidée noire', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La Rose de Damas', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Lys de la vallée', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la température du coeur du Soleil (environ) ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('15 millions de °C', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('5500 °C', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1 million de °C', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('100 millions de °C', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel minéral est l''ingrédient principal du verre ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La silice (quartz)', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le mica', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le feldspath', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le talc', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la science qui étudie les relations entre le climat et les êtres vivants ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La bioclimatologie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''écologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La météorologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''éthologie', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle planète possède le système d''anneaux le plus complexe ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Saturne', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Uranus', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Jupiter', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Neptune', FALSE, (SELECT MAX(id) FROM QUESTION));

-- 91 à 105
MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la couche de gaz qui entoure une étoile ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La photosphère', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La lithosphère', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''asténosphère', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''exosphère', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le principal sucre présent dans le nectar des fleurs ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le saccharose', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le lactose', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le maltose', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''amidon', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel organe est responsable de la production de la bile ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le foie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La vésicule biliaire', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le pancréas', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''estomac', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on une étoile en fin de vie qui explose ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Une supernova', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Une naine blanche', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Un pulsar', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Un quasar', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la fleur symbole de la royauté française ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le lys', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La rose', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''oeillet', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La tulipe', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''élément le plus lourd présent naturellement sur Terre ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''uranium', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le plomb', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''or', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le plutonium', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la partie colorée de l''œil ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''iris', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La pupille', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La cornée', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La rétine', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment s''appelle l''étude des fossiles ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La paléontologie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''archéologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La géologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''anthropologie', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle planète a été déclassée en "planète naine" en 2006 ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Pluton', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Cérès', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Éris', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Makémaké', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la membrane qui entoure les poumons ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La plèvre', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le péricarde', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le péritoine', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le périoste', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle plante est utilisée pour produire le lin ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le lin cultivé', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le chanvre', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le jute', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le coton', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est l''unité de mesure de la fréquence ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Hertz', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Joule', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Watt', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''Ampère', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du pigment rouge des tomates ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le lycopène', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''anthocyane', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La zéaxanthine', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La curcumine', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la plus petite planète du système solaire ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mercure', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mars', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vénus', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La Terre', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel acide est produit par l''estomac pour la digestion ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''acide chlorhydrique', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''acide sulfurique', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''acide nitrique', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''acide acétique', FALSE, (SELECT MAX(id) FROM QUESTION));

-- 106 à 120
MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le passage de l''état solide à l''état gazeux ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La sublimation', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La condensation', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La fusion', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''évaporation', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de l''os de la cuisse ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le fémur', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le tibia', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''humérus', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le péroné', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel scientifique a formulé les lois du mouvement et de la gravitation universelle ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Isaac Newton', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Albert Einstein', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Galilée', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Marie Curie', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel arbre produit les glands ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le chêne', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le hêtre', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le sapin', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''érable', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la principale source d''énergie pour la Terre ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Soleil', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La Lune', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le vent', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le noyau terrestre', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le groupement d''étoiles formant une figure ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Une constellation', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Une galaxie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Une nébuleuse', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Un amas', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''organe du corps humain qui consomme le plus d''énergie ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le cerveau', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le cœur', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Les muscles', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le foie', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel minéral est le composant principal du sel de table ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le chlorure de sodium', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le carbonate de calcium', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le sulfate de magnésium', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le phosphate de potassium', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment s''appelle le phénomène de réflexion du son ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''écho', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La réfraction', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La diffraction', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La résonance', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la plus grande forêt du monde ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''Amazonie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La Taïga', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La Forêt Noire', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La forêt du Congo', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la galaxie où nous vivons ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La Voie Lactée', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Andromède', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Sombrero', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Tourbillon', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien d''os compte le corps humain à l''âge adulte ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('206', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('186', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('226', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('300', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la température d''ébullition de l''eau à pression normale ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('100 °C', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('80 °C', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('120 °C', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('50 °C', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''oiseau qui possède les plus grands yeux de tous les animaux terrestres ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''autruche', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le hibou', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''aigle', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le condor', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on les animaux qui mangent de tout ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Omnivores', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Herbivores', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Carnivores', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Frugivores', FALSE, (SELECT MAX(id) FROM QUESTION));

-- 121 à 135
MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le plus grand mammifère terrestre ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''éléphant d''Afrique', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le rhinocéros', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La girafe', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''hippopotame', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la couleur du sang des insectes ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Incolore ou jaunâtre', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Rouge', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Bleu', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Vert', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la principale fonction des globules blancs ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Défendre l''organisme', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Transporter l''oxygène', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Cicatriser les plaies', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Digérer les graisses', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la vitesse de la lumière (environ) ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('300 000 km/s', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('340 m/s', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1 000 000 km/h', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('30 000 km/s', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le gaz que nous expirons majoritairement ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''azote', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le dioxyde de carbone', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''oxygène', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''argon', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle planète a les vents les plus rapides du système solaire ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Neptune', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Jupiter', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Saturne', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mars', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel métal est liquide à température ambiante ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le mercure', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le plomb', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''étain', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le sodium', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la plus grande glande du corps humain ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le foie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le pancréas', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La thyroïde', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''hypophyse', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on la science qui étudie le temps qu''il fait ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La météorologie', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La climatologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''hydrologie', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''astronomie', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le point d''ébullition de l''or ?', 3, 1, 'Difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('2856 °C', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1064 °C', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1538 °C', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('5000 °C', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du muscle principal de la respiration ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le diaphragme', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''intercostal', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le pectoral', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''abdominale', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle planète possède une "Grande Tache Rouge" ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Jupiter', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mars', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Saturne', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Neptune', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel type d''énergie est stocké dans une pile ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''énergie chimique', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''énergie nucléaire', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''énergie thermique', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''énergie cinétique', FALSE, (SELECT MAX(id) FROM QUESTION));

INSERT INSERT INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) VALUES ('Quel est l''animal le plus rapide du monde en plongée ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le faucon pèlerin', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le guépard', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''espadon', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le martinet', FALSE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le pH d''une solution neutre ?', 3, 1, 'Moyen', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('7', TRUE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('0', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('14', FALSE, (SELECT MAX(id) FROM QUESTION));
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1', FALSE, (SELECT MAX(id) FROM QUESTION));

-- ===================================
-- MANCHE 4 : 15 QUESTIONS (ÉNIGMES)
-- ===================================
MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Je suis toujours devant vous mais vous ne pouvez jamais me voir. Qui suis-je ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Avenir', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Plus on m''enlève, plus je deviens grand. Que suis-je ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Trou', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel nombre, multiplié par n''importe quel autre nombre, donnera toujours le même résultat ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('0', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle ville française est surnommée ''la ville rose'' ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Toulouse', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel philosophe grec a été le professeur d''Alexandre le Grand ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Aristote', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de fois peut-on soustraire 10 de 100 ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le seul mammifère capable de voler ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Chauve-souris', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans la mythologie grecque, qui est le dieu du vin ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Dionysos', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de fois le mot ''et'' apparaît dans cette phrase : ''Le chat et le chien se promènent et jouent ensemble'' ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('2', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel écrivain français a écrit ''À la recherche du temps perdu'' ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Marcel Proust', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Je parle sans bouche et j''entends sans oreilles. Je n''ai pas de corps mais je prends vie avec le vent. Qui suis-je ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Écho', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la racine carrée de 144 ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('12', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le plus petit nombre premier ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('2', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quelle ville se déroule l''action du roman ''Notre-Dame de Paris'' ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Paris', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Un père a 32 ans et son fils 5 ans. Dans combien d''années le père aura-t-il le double de l''âge de son fils ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('22', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Si vous m''avez, vous voulez me partager. Si vous me partagez, vous ne m''avez plus. Que suis-je ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Un secret', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui appartient à l''utilisateur, mais que les autres utilisent beaucoup plus que lui ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Son nom', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui peut faire le tour du monde tout en restant dans son coin ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Un timbre', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui a des dents mais ne peut pas mordre ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Un peigne', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Plus il y en a, moins on voit. Que suis-je ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''obscurité', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Je ne respire jamais mais j''ai besoin d''air. Je n''ai pas de vie mais je peux mourir. Que suis-je ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Un feu', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Je suis si fragile que si vous prononcez mon nom, vous me brisez. Qui suis-je ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le silence', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui monte et qui descend, mais ne bouge jamais ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Un escalier', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle invention permet de regarder à travers les murs ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Une fenêtre', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Je ne suis pas vivant, mais j''ai cinq doigts. Que suis-je ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Un gant', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui a des racines que personne ne voit, est plus grand que les arbres, mais ne pousse jamais ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Une montagne', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui peut être brisé sans jamais être touché ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Une promesse', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Lequel de ces mots est le plus long : une seconde, une minute, une heure ou un jour ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Une seconde', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Je commence la nuit et je finis le matin. Qui suis-je ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La lettre N', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui a un œil mais ne peut pas voir ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Une aiguille', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le seul État au monde qui ne possède pas d''armée ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Costa Rica', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le point de l''espace où la gravité est si forte que même la lumière ne peut s''échapper ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''horizon des événements', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''élément chimique le plus rare sur la croûte terrestre ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''astate', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a peint "Le Jardin des délices" au XVe siècle ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Jérôme Bosch', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quel pays peut-on trouver la région historique de la Transylvanie ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Roumanie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel empereur romain a légalisé le christianisme par l''édit de Milan ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Constantin Ier', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la monnaie officielle de l''Afrique du Sud ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Rand', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('En quelle année a eu lieu la chute du mur de Berlin ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1989', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pays possède le plus grand nombre de pyramides au monde ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Soudan', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de l''algorithme de consensus utilisé par le Bitcoin ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Proof of Work', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom de la particule élémentaire associée au champ qui donne une masse aux autres particules ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Boson de Higgs', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans la Divine Comédie de Dante, qui guide le poète à travers l''Enfer ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Virgile', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''instrument de musique préféré du détective Sherlock Holmes ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le violon', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pays d''Asie centrale a pour capitale Achgabat ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le Turkménistan', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du plus profond canyon sous-marin au monde ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le canyon de Zhemchug', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de côtés possède un ennéagone ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('9', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Si 3 chats attrapent 3 souris en 3 minutes, combien de chats faut-il pour attraper 100 souris en 100 minutes ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('3', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le prochain nombre dans cette suite : 2, 3, 5, 7, 11, 13, ... ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('17', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans une famille, il y a deux parents et six filles. Chaque fille a un frère. Combien de personnes compte la famille ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('9', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le résultat de 10 puissance 0 ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Un nénuphar double de taille chaque jour. S''il met 48 jours pour couvrir tout un lac, combien de jours lui faut-il pour couvrir la moitié ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('47', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la valeur approximative du nombre d''or (Phi) ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1,618', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment s''appelle un polygone à 12 côtés ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Dodécagone', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Si vous multipliez tous les chiffres d''un clavier de téléphone entre eux, quel est le résultat ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('0', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans un tournoi de tennis à élimination directe, s''il y a 64 participants, combien de matchs seront joués au total pour désigner le vainqueur ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('63', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du système de numération utilisant uniquement les chiffres 0 et 1 ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Binaire', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la somme des angles d''un triangle ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('180 degrés', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien y a-t-il de secondes dans une heure ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('3600', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel paradoxe affirme qu''un coureur ne pourra jamais rattraper une tortue s''il lui donne de l''avance ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le paradoxe de Zénon', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Un bâton et une balle coûtent 1,10€ au total. Le bâton coûte 1€ de plus que la balle. Combien coûte la balle ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('0,05€', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui a deux aiguilles mais ne pique pas ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Une montre', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui court mais n''a pas de jambes ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''eau', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Je suis le commencement de l''éternité et la fin de l''espace. Qui suis-je ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La lettre E', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui a un cou, mais pas de tête ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Une bouteille', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Plus on en fait, plus on en laisse derrière soi. Que suis-je ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Des pas', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la question à laquelle on ne peut jamais répondre "Oui" sans mentir ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Dors-tu ?', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui peut remplir une pièce entière sans prendre de place ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La lumière', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui est noir quand on l''achète, rouge quand on l''utilise et gris quand on le jette ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le charbon', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle chose vous appartient mais est utilisée par tout le monde sauf vous ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Votre nom', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui a des villes mais pas de maisons, des montagnes mais pas d''arbres et de l''eau mais pas de poissons ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Une carte', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du traité qui a mis fin à la Première Guerre mondiale ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Traité de Versailles', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel gaz noble est le plus abondant dans l''atmosphère terrestre ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Argon', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Dans quelle ville italienne se trouve la Galerie des Offices ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Florence', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la capitale du Kazakhstan depuis 2022 ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Astana', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a découvert la structure en double hélice de l''ADN avec Crick ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('James Watson', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pays est le plus grand producteur de café au monde ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Brésil', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la plus grande lune de Saturne ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Titan', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('En quelle année l''homme a-t-il marché sur la Lune pour la première fois ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1969', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est l''animal qui a le plus gros cerveau proportionnellement à sa taille ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La fourmi', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la vitesse du son dans l''air (environ) ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('340 m/s', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien d''arêtes possède un cube ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('12', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la somme des 100 premiers nombres entiers ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('5050', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Un avion s''écrase exactement sur la frontière entre la France et l''Espagne. Où enterre-t-on les survivants ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Nulle part', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Si un médecin vous donne 3 pilules à prendre toutes les demi-heures, combien de temps durera le traitement ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('1 heure', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Certains mois ont 31 jours, d''autres 30. Combien en ont 28 ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('12', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la moitié de 2 + 2 ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('3', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Si vous participez à une course et que vous doublez le deuxième, à quelle place êtes-vous ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Deuxième', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de paires de chaque animal Moïse a-t-il emmenées dans l''arche ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('0', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Le père de Marie a cinq filles : Nana, Néné, Nini, Nono. Quel est le nom de la cinquième ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Marie', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qu''est-ce qui est plus léger qu''une plume mais que même l''homme le plus fort du monde ne peut tenir plus de quelques minutes ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Le souffle', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Comment appelle-t-on le cri de la cigogne ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Craquètement', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la couleur de la boîte noire des avions ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Orange', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de fuseaux horaires existe-t-il en Russie ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('11', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le pays le plus visité au monde ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('France', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la capitale de l''Australie ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Canberra', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Qui a inventé le vaccin contre la rage ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Louis Pasteur', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien de touches compte un piano standard ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('88', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le nom du plus petit os du corps humain ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('L''étrier', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le seul fruit dont les graines sont à l''extérieur ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('La fraise', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel métal a le point de fusion le plus élevé ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Tungstène', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel pays partage la plus longue frontière terrestre avec la France ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Brésil', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la langue la plus parlée au monde (en langue maternelle) ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Mandarin', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Combien d''états compte l''Union Européenne en 2024 ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('27', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quelle est la capitale de l''Islande ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Reykjavik', TRUE, (SELECT MAX(id) FROM QUESTION));

MERGE INTO QUESTION (libelle, id_manche, points, difficulte, temps_limite_secondes) KEY(libelle) VALUES ('Quel est le dernier mot de ce quiz ?', 4, 1, 'Très difficile', NULL);
MERGE INTO REPONSE (libelle, juste, id_question) KEY(libelle) VALUES ('Fin', TRUE, (SELECT MAX(id) FROM QUESTION));

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
-- Total: 4 manches, 554 questions, 2100 reponses
-- ===================================
