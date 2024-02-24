-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 13 jan. 2024 à 18:04
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `art`
--

-- --------------------------------------------------------

--
-- Structure de la table `achat`
--

CREATE TABLE `achat` (
  `id_achat` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `sexe` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_admin`, `email`, `nom`, `password`, `photo`, `prenom`, `sexe`, `telephone`) VALUES
(1, 'ousmatotoure98@gmail.com', 'Ousmato', '12345@Ab', 'artImage/2994ac02-7965-41de-9bab-d83658e31653.png', 'Toure', 'Homme', '73855156');

-- --------------------------------------------------------

--
-- Structure de la table `artisans`
--

CREATE TABLE `artisans` (
  `active` bit(1) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_artisans` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `entreprise` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `sexe` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `artisans`
--

INSERT INTO `artisans` (`active`, `id_admin`, `id_artisans`, `description`, `email`, `entreprise`, `nom`, `password`, `photo`, `prenom`, `region`, `sexe`, `telephone`) VALUES
(b'0', 0, 1, 'Une Entreprise qui evolue dans le dommaine du Textile Ave 2 annees d\'experience', 'adamakonake@gmail.com', 'ShapShap', 'Adama', '12345@Ak', 'artImage/adama.jpg', 'KonaKe', 'Bamako', 'Homme', '76554433'),
(b'1', 0, 2, 'une Entreprise qui evolue dans le dommaine de Teinture', 'moh@gmail.com', 'BAMA-COL', 'Mohomed', '12345@Md', 'artImage/Med.jpg', 'Diarra', 'Bamako', 'Homme', '76889900');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `efface_category` bit(1) DEFAULT NULL,
  `id_categorie` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`efface_category`, `id_categorie`, `nom`) VALUES
(b'0', 1, 'Teinture'),
(b'0', 2, 'Tissage'),
(b'0', 3, 'Bijouterie'),
(b'0', 4, 'Munuiserie'),
(b'0', 5, 'Maroqunerie');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id_commande` int(11) NOT NULL,
  `id_couleur` int(11) NOT NULL,
  `id_panier` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_taille` int(11) NOT NULL,
  `quantite` double NOT NULL,
  `date` varchar(255) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id_commande`, `id_couleur`, `id_panier`, `id_produit`, `id_taille`, `quantite`, `date`, `id_users`) VALUES
(33, 2, 3, 1, 1, 1, '2023/12/05 10:17', 1),
(34, 2, 3, 1, 1, 2, '2023/12/05 10:19', 1);

-- --------------------------------------------------------

--
-- Structure de la table `couleurs`
--

CREATE TABLE `couleurs` (
  `id_couleur` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `couleurs`
--

INSERT INTO `couleurs` (`id_couleur`, `libelle`) VALUES
(1, '#f73131'),
(2, '#8e7272'),
(3, '#ffffff');

-- --------------------------------------------------------

--
-- Structure de la table `cultures`
--

CREATE TABLE `cultures` (
  `id_admin` int(11) NOT NULL,
  `id_culture` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `ethnie` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `region_culturel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `element_culture`
--

CREATE TABLE `element_culture` (
  `id_culture` int(11) NOT NULL,
  `id_element_culture` int(11) NOT NULL,
  `description_element` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `id_artisan` int(11) NOT NULL,
  `id_commande` int(11) DEFAULT NULL,
  `id_notification` int(11) NOT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `date` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`id_artisan`, `id_commande`, `id_notification`, `id_produit`, `date`, `description`) VALUES
(1, 34, 8, 1, '2023/12/05 10:19', ' client Cher  Adama\n! Nous avons le plaisir de vous informer qu\'un utilisateur dépuis  Mali a récemment commandé l\'un de vos produits le 2023/12/05 10:19. Votre création continue de séduire notre clientèle. !\n Votre talent est inestimable pour notre communauté.\nContinuez à inspirer avec vos créations \nCordialement,\nL\'équipe d\'ArtEshop'),
(1, NULL, 9, 5, '2023/12/05 10:31', 'L\'artisan AdamaKonaKe a ajouter un produit dans la  categorie Maroqunerie le 2023/12/05 10:31 a sa Catalogue!\nVeillez verifier les informations du produit pour le publier le plutot possible');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `date` date NOT NULL,
  `id_panier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`date`, `id_panier`) VALUES
('2023-12-04', 1),
('2023-12-05', 2),
('2023-12-05', 3),
('2024-01-13', 4);

-- --------------------------------------------------------

--
-- Structure de la table `panier_commandes`
--

CREATE TABLE `panier_commandes` (
  `commandes_id_commande` int(11) NOT NULL,
  `panier_id_panier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `acheter` bit(1) NOT NULL,
  `date` date NOT NULL,
  `effacer_produit` bit(1) NOT NULL,
  `id_artisan` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `prix` double NOT NULL,
  `publier` bit(1) NOT NULL,
  `quantite` double NOT NULL,
  `culture` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`acheter`, `date`, `effacer_produit`, `id_artisan`, `id_categorie`, `id_produit`, `prix`, `publier`, `quantite`, `culture`, `description`, `nom`, `photo`) VALUES
(b'1', '2023-12-05', b'0', 1, 4, 1, 10000, b'1', 10, 'Dogon', 'une faite a base du Bois malien et tissue traditionnelle', 'Chaise', 'artImage/chaise.png'),
(b'0', '2023-12-05', b'0', 1, 3, 2, 3000, b'1', 35, 'sonrhai', 'chaine traditionnelle de bamba', 'Chaine', 'artImage/chain.png'),
(b'0', '2023-12-05', b'0', 1, 1, 3, 10000, b'0', 30, 'Dogon', 'Bogolan de la region de segou disponible sure plusieur couleurs mixe', 'Pagne Bogolan', 'artImage/pagnebogolan.png'),
(b'0', '2023-12-05', b'0', 1, 2, 4, 20000, b'1', 15, '', 'Plover 100% bogolan traditionnrlle', 'plover', 'artImage/plover1.png'),
(b'0', '2023-12-05', b'0', 1, 5, 5, 15000, b'1', 20, 'Kaysien', 'sac fait a base de cuire', 'Sac', 'artImage/sac a dos.png');

-- --------------------------------------------------------

--
-- Structure de la table `produit_color`
--

CREATE TABLE `produit_color` (
  `id_couleurs` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_produit_color` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit_color`
--

INSERT INTO `produit_color` (`id_couleurs`, `id_produit`, `id_produit_color`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(1, 2, 4),
(2, 2, 5),
(3, 2, 6),
(1, 3, 7),
(2, 3, 8),
(3, 3, 9),
(1, 4, 10),
(2, 4, 11),
(3, 4, 12),
(1, 5, 13),
(2, 5, 14),
(3, 5, 15);

-- --------------------------------------------------------

--
-- Structure de la table `taille`
--

CREATE TABLE `taille` (
  `effacer_taille` bit(1) DEFAULT NULL,
  `id_taille` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `taille`
--

INSERT INTO `taille` (`effacer_taille`, `id_taille`, `libelle`) VALUES
(b'0', 1, 'XL'),
(b'0', 2, 'M'),
(b'0', 3, 'L'),
(b'0', 4, 'XXL');

-- --------------------------------------------------------

--
-- Structure de la table `types`
--

CREATE TABLE `types` (
  `id_produit` int(11) NOT NULL,
  `id_taille` int(11) NOT NULL,
  `id_types` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `types`
--

INSERT INTO `types` (`id_produit`, `id_taille`, `id_types`) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 3),
(2, 3, 4),
(3, 2, 5),
(4, 1, 6),
(4, 3, 7),
(5, 1, 8),
(5, 2, 9);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_panier` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pays` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_panier`, `id_user`, `adresse`, `email`, `nom`, `password`, `pays`, `prenom`) VALUES
(3, 1, 'bko', 'tra@gmail.com', 'Idrissa', '12345@It', 'Mali', 'Traore'),
(4, 2, 'bamako', 'ada@gmail.com', 'ada', '12345', 'mali', 'cook');

-- --------------------------------------------------------

--
-- Structure de la table `user_commandes_list`
--

CREATE TABLE `user_commandes_list` (
  `commandes_list_id_commande` int(11) NOT NULL,
  `user_id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `achat`
--
ALTER TABLE `achat`
  ADD PRIMARY KEY (`id_achat`),
  ADD KEY `FK49mmb2ca51q42komqaiqpnutj` (`id_commande`);

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Index pour la table `artisans`
--
ALTER TABLE `artisans`
  ADD PRIMARY KEY (`id_artisans`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `FK3gt69l94psq2keiaaqcxhc6xy` (`id_panier`),
  ADD KEY `FKbekf0f8ryl1genlommcg2qcga` (`id_produit`),
  ADD KEY `FKasxwxrryako75b3u7j6al5hvo` (`id_users`),
  ADD KEY `UK_lkkxeps2wy7ck96qj7666lrfp` (`id_taille`) USING BTREE,
  ADD KEY `UK_7kb222sk3514s12x43uisysqk` (`id_couleur`) USING BTREE;

--
-- Index pour la table `couleurs`
--
ALTER TABLE `couleurs`
  ADD PRIMARY KEY (`id_couleur`);

--
-- Index pour la table `cultures`
--
ALTER TABLE `cultures`
  ADD PRIMARY KEY (`id_culture`),
  ADD KEY `FKt5o8cg9fj9tc7d5317a2ytk59` (`id_admin`);

--
-- Index pour la table `element_culture`
--
ALTER TABLE `element_culture`
  ADD PRIMARY KEY (`id_element_culture`),
  ADD KEY `FKcwpqn832ht793ls9jvmoiyojn` (`id_culture`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id_notification`),
  ADD KEY `FKfl1vb3b8m7cilh0d1we93yeq` (`id_artisan`),
  ADD KEY `UK_q53eampb7j2erftykodwo0jgq` (`id_produit`) USING BTREE,
  ADD KEY `UK_3q5rg7awfu36kr1mfc4idg14k` (`id_commande`) USING BTREE;

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id_panier`);

--
-- Index pour la table `panier_commandes`
--
ALTER TABLE `panier_commandes`
  ADD UNIQUE KEY `UK_4nl8ermq7bdegtxyuxf0fq4s9` (`commandes_id_commande`),
  ADD KEY `FKca1fqple4jt86mpuxrf7son3p` (`panier_id_panier`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `FKcmlcq3x96ghqnd4rv7oins0x5` (`id_artisan`),
  ADD KEY `FKoxko2iw93mgoixwrkniqq11k6` (`id_categorie`);

--
-- Index pour la table `produit_color`
--
ALTER TABLE `produit_color`
  ADD PRIMARY KEY (`id_produit_color`),
  ADD KEY `FKk2j5w0mkh468h5dwde6fryty5` (`id_couleurs`),
  ADD KEY `FKg5bi5xmic6o68r5rge43q1ns2` (`id_produit`);

--
-- Index pour la table `taille`
--
ALTER TABLE `taille`
  ADD PRIMARY KEY (`id_taille`);

--
-- Index pour la table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id_types`),
  ADD KEY `FKf1tqol825qhy13eevqums3v61` (`id_produit`),
  ADD KEY `FK1bw0t4pdowogol59092ewhah9` (`id_taille`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `UK_50fo4g616u9blkwivc7dft1xy` (`id_panier`);

--
-- Index pour la table `user_commandes_list`
--
ALTER TABLE `user_commandes_list`
  ADD UNIQUE KEY `UK_nw5fwcv84u6ql2pvjfvjn385v` (`commandes_list_id_commande`),
  ADD KEY `FK4pu09rgj81wircq8ai8qtw83b` (`user_id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `achat`
--
ALTER TABLE `achat`
  MODIFY `id_achat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `artisans`
--
ALTER TABLE `artisans`
  MODIFY `id_artisans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `couleurs`
--
ALTER TABLE `couleurs`
  MODIFY `id_couleur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `cultures`
--
ALTER TABLE `cultures`
  MODIFY `id_culture` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `element_culture`
--
ALTER TABLE `element_culture`
  MODIFY `id_element_culture` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `id_notification` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id_panier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `produit_color`
--
ALTER TABLE `produit_color`
  MODIFY `id_produit_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `taille`
--
ALTER TABLE `taille`
  MODIFY `id_taille` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `types`
--
ALTER TABLE `types`
  MODIFY `id_types` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `achat`
--
ALTER TABLE `achat`
  ADD CONSTRAINT `FK49mmb2ca51q42komqaiqpnutj` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`);

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `FK26ptdis2i7u5yayflje8ebtbi` FOREIGN KEY (`id_taille`) REFERENCES `taille` (`id_taille`),
  ADD CONSTRAINT `FK3gt69l94psq2keiaaqcxhc6xy` FOREIGN KEY (`id_panier`) REFERENCES `panier` (`id_panier`),
  ADD CONSTRAINT `FKasxwxrryako75b3u7j6al5hvo` FOREIGN KEY (`id_users`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `FKbekf0f8ryl1genlommcg2qcga` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`),
  ADD CONSTRAINT `FKtiivkp3o2gjt53ud6j0dkuhj7` FOREIGN KEY (`id_couleur`) REFERENCES `couleurs` (`id_couleur`);

--
-- Contraintes pour la table `cultures`
--
ALTER TABLE `cultures`
  ADD CONSTRAINT `FKt5o8cg9fj9tc7d5317a2ytk59` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Contraintes pour la table `element_culture`
--
ALTER TABLE `element_culture`
  ADD CONSTRAINT `FKcwpqn832ht793ls9jvmoiyojn` FOREIGN KEY (`id_culture`) REFERENCES `cultures` (`id_culture`);

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FK1keid1ph9p7fu9el4xfuye8h` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`),
  ADD CONSTRAINT `FK4go1y7uy98bs4a4cstd3s3g0` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`),
  ADD CONSTRAINT `FKfl1vb3b8m7cilh0d1we93yeq` FOREIGN KEY (`id_artisan`) REFERENCES `artisans` (`id_artisans`);

--
-- Contraintes pour la table `panier_commandes`
--
ALTER TABLE `panier_commandes`
  ADD CONSTRAINT `FKca1fqple4jt86mpuxrf7son3p` FOREIGN KEY (`panier_id_panier`) REFERENCES `panier` (`id_panier`),
  ADD CONSTRAINT `FKdf8sri0bqr49r990nbi3lltcd` FOREIGN KEY (`commandes_id_commande`) REFERENCES `commandes` (`id_commande`);

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `FKcmlcq3x96ghqnd4rv7oins0x5` FOREIGN KEY (`id_artisan`) REFERENCES `artisans` (`id_artisans`),
  ADD CONSTRAINT `FKoxko2iw93mgoixwrkniqq11k6` FOREIGN KEY (`id_categorie`) REFERENCES `categories` (`id_categorie`);

--
-- Contraintes pour la table `produit_color`
--
ALTER TABLE `produit_color`
  ADD CONSTRAINT `FKg5bi5xmic6o68r5rge43q1ns2` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`),
  ADD CONSTRAINT `FKk2j5w0mkh468h5dwde6fryty5` FOREIGN KEY (`id_couleurs`) REFERENCES `couleurs` (`id_couleur`);

--
-- Contraintes pour la table `types`
--
ALTER TABLE `types`
  ADD CONSTRAINT `FK1bw0t4pdowogol59092ewhah9` FOREIGN KEY (`id_taille`) REFERENCES `taille` (`id_taille`),
  ADD CONSTRAINT `FKf1tqol825qhy13eevqums3v61` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKmfpxutputcswdqy4g2sslguf6` FOREIGN KEY (`id_panier`) REFERENCES `panier` (`id_panier`);

--
-- Contraintes pour la table `user_commandes_list`
--
ALTER TABLE `user_commandes_list`
  ADD CONSTRAINT `FK4pu09rgj81wircq8ai8qtw83b` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `FK9j38ag16ct1u8bkuo0t8wh0ct` FOREIGN KEY (`commandes_list_id_commande`) REFERENCES `commandes` (`id_commande`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
