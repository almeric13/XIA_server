CREATE TABLE `arborescence` (
  `arborescence_id` int(11) NOT NULL AUTO_INCREMENT,
  `local_amont_id` int(11) DEFAULT NULL,
  `local_aval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`arborescence_id`),
  KEY `fk1_arob_localisation_id` (`local_amont_id`),
  KEY `fk2_arob_localisation_id` (`local_aval_id`),
  CONSTRAINT `fk1_arob_localisation_id` FOREIGN KEY (`local_amont_id`) REFERENCES `localisations` (`localisation_id`),
  CONSTRAINT `fk2_arob_localisation_id` FOREIGN KEY (`local_aval_id`) REFERENCES `localisations` (`localisation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `famille` (
  `famille_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `initial` varchar(10) DEFAULT NULL,
  `logo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`famille_id`),
  UNIQUE KEY `famille_unique` (`nom`),
  KEY `fk_famille_image_id` (`logo_id`),
  CONSTRAINT `fk_famille_image_id` FOREIGN KEY (`logo_id`) REFERENCES `images` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `chemin` varchar(100) DEFAULT NULL,
  `SHA1` varchar(100) DEFAULT NULL,
  `xia_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `fk_image_xia_id` (`xia_id`),
  CONSTRAINT `fk_image_xia_id` FOREIGN KEY (`xia_id`) REFERENCES `xia` (`xia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `lien_listes_produits` (
  `liste_id` int(11) DEFAULT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  KEY `fk_lien_listes_id` (`liste_id`),
  KEY `fk_lien_produit_id` (`produit_id`),
  CONSTRAINT `fk_lien_listes_id` FOREIGN KEY (`liste_id`) REFERENCES `listes` (`liste_id`),
  CONSTRAINT `fk_lien_produit_id` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`produit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `listes` (
  `liste_id` int(11) NOT NULL AUTO_INCREMENT,
  `famille_id` int(11) DEFAULT NULL,
  `dernier_utilisateur_id` int(11) DEFAULT NULL,
  `date_update` date DEFAULT NULL,
  PRIMARY KEY (`liste_id`),
  KEY `fk_listes_famille_id` (`famille_id`),
  KEY `fk_listes_utilisateur_id` (`dernier_utilisateur_id`),
  CONSTRAINT `fk_listes_famille_id` FOREIGN KEY (`famille_id`) REFERENCES `famille` (`famille_id`),
  CONSTRAINT `fk_listes_utilisateur_id` FOREIGN KEY (`dernier_utilisateur_id`) REFERENCES `utilisateurs` (`utilisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `localisations` (
  `localisation_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `xia_id` int(11) DEFAULT NULL,
  `famille_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`localisation_id`),
  KEY `fk_localisation_image_id` (`image_id`),
  KEY `fk_localisation_xia_id` (`xia_id`),
  KEY `fk_localisation_famille_id` (`famille_id`),
  CONSTRAINT `fk_localisation_famille_id` FOREIGN KEY (`famille_id`) REFERENCES `famille` (`famille_id`),
  CONSTRAINT `fk_localisation_image_id` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`),
  CONSTRAINT `fk_localisation_xia_id` FOREIGN KEY (`xia_id`) REFERENCES `xia` (`xia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `produits` (
  `produit_id` int(11) NOT NULL AUTO_INCREMENT,
  `Produit_nom` varchar(100) DEFAULT NULL,
  `Produit_Description` varchar(100) DEFAULT NULL,
  `localisation_id` int(11) DEFAULT NULL,
  `produit_quantite_default` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `xia_id` int(11) DEFAULT NULL,
  `produit_unite_mesure` varchar(100) DEFAULT NULL,
  `famille_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`produit_id`),
  UNIQUE KEY `produit_unique` (`Produit_nom`,`famille_id`),
  KEY `fk_produit_localisation_id` (`localisation_id`),
  KEY `fk_produit_image_id` (`image_id`),
  KEY `fk_produit_famille_id` (`famille_id`),
  KEY `fk_produit_xia_id` (`xia_id`),
  CONSTRAINT `fk_produit_famille_id` FOREIGN KEY (`famille_id`) REFERENCES `famille` (`famille_id`),
  CONSTRAINT `fk_produit_image_id` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`),
  CONSTRAINT `fk_produit_localisation_id` FOREIGN KEY (`localisation_id`) REFERENCES `localisations` (`localisation_id`),
  CONSTRAINT `fk_produit_xia_id` FOREIGN KEY (`xia_id`) REFERENCES `xia` (`xia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `utilisateurs` (
  `utilisateur_id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `login` varchar(12) DEFAULT NULL,
  `mdp` varchar(12) DEFAULT NULL,
  `famille_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`utilisateur_id`),
  UNIQUE KEY `personne_unique` (`nom`,`prenom`),
  KEY `fk_famille_id` (`famille_id`),
  KEY `fk_utilisateurs_localisation_id` (`position_id`),
  CONSTRAINT `fk_famille_id` FOREIGN KEY (`famille_id`) REFERENCES `famille` (`famille_id`),
  CONSTRAINT `fk_utilisateurs_localisation_id` FOREIGN KEY (`position_id`) REFERENCES `localisations` (`localisation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `xia` (
  `xia_id` int(11) NOT NULL AUTO_INCREMENT,
  `vers` varchar(100) DEFAULT NULL,
  `commentaire` varchar(100) DEFAULT NULL,
  `logo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`xia_id`),
  KEY `fk_xia_image_id` (`logo_id`),
  CONSTRAINT `fk_xia_image_id` FOREIGN KEY (`logo_id`) REFERENCES `images` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
