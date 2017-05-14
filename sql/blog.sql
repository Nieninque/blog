-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Dim 14 Mai 2017 à 18:07
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Phasellus'),
(2, 'gravida'),
(3, 'ipsum'),
(4, 'massa.'),
(5, 'nunc,'),
(6, 'nonummy'),
(7, 'risus'),
(8, 'aliquam'),
(9, 'nostra'),
(10, 'vel');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(11) NOT NULL,
  `content` varchar(256) NOT NULL,
  `author_id` bigint(11) NOT NULL,
  `post_id` bigint(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `comments`
--

INSERT INTO `comments` (`id`, `content`, `author_id`, `post_id`, `date`) VALUES
(1, 'nec, diam.', 1, 4, '2017-10-29 05:30:58'),
(2, 'dui. Suspendisse', 9, 7, '2016-07-18 15:50:11'),
(3, 'sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia', 6, 5, '2017-03-30 18:27:52'),
(4, 'pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis,', 2, 1, '2017-11-28 04:23:53'),
(5, 'Sed et', 6, 10, '2016-10-14 07:12:04'),
(6, 'eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis', 3, 7, '2017-10-29 06:55:35'),
(7, 'cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet', 1, 9, '2017-10-29 04:42:02'),
(8, 'est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia', 5, 6, '2016-06-28 00:00:36'),
(9, 'ultrices.', 5, 1, '2016-09-16 10:52:16'),
(10, 'Mauris nulla. Integer urna. Vivamus', 9, 9, '2017-08-03 20:04:50'),
(11, 'aaaaaaaaahhhhhhhhhhhhhhhhhhhhh', 1, 2, '2017-05-14 15:27:12'),
(12, 'aaaaaaaaahhhhhhhhhhhhhhhhhhhhh', 1, 2, '2017-05-14 15:32:27'),
(13, 'Ceci est un test', 1, 2, '2017-05-14 15:45:44'),
(14, 'Ceci est un test', 1, 2, '2017-05-14 15:45:52'),
(15, 'Ceci est un test', 1, 2, '2017-05-14 15:48:57'),
(16, 'test ou pas test', 1, 2, '2017-05-14 15:49:30'),
(17, 'test', 1, 2, '2017-05-14 15:50:44'),
(18, 'test 2', 1, 2, '2017-05-14 15:51:05'),
(19, 'Ceci est un test', 1, 5, '2017-05-14 15:52:54'),
(20, 'Ceci est un test', 1, 5, '2017-05-14 15:52:59');

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(11) NOT NULL,
  `author_id` bigint(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `date`, `category_id`) VALUES
(1, 6, 'Article premier', 'Pour la mise en oeuvre des dispositions du présent code, les effectifs de l\'entreprise sont calculés conformément aux dispositions suivantes :\r\n\r\n1° Les salariés titulaires d\'un contrat de travail à durée indéterminée à temps plein et les travailleurs à domicile sont pris intégralement en compte dans l\'effectif de l\'entreprise ;\r\n\r\n2° Les salariés titulaires d\'un contrat de travail à durée déterminée, les salariés titulaires d\'un contrat de travail intermittent, les salariés mis à la disposition de l\'entreprise par une entreprise extérieure qui sont présents dans les locaux de l\'entreprise utilisatrice et y travaillent depuis au moins un an, ainsi que les salariés temporaires, sont pris en compte dans l\'effectif de l\'entreprise à due proportion de leur temps de présence au cours des douze mois précédents. Toutefois, les salariés titulaires d\'un contrat de travail à durée déterminée et les salariés mis à disposition par une entreprise extérieure, y compris les salariés temporaires, sont exclus du décompte des effectifs lorsqu\'ils remplacent un salarié absent ou dont le contrat de travail est suspendu, notamment du fait d\'un congé de maternité, d\'un congé d\'adoption ou d\'un congé parental d\'éducation ;\r\n\r\n3° Les salariés à temps partiel, quelle que soit la nature de leur contrat de travail, sont pris en compte en divisant la somme totale des horaires inscrits dans leurs contrats de travail par la durée légale ou la durée conventionnelle du travail.', '2017-05-14 17:30:45', 1),
(2, 3, 'article 2', 'Lorsque survient un litige en raison d\'une méconnaissance des dispositions du chapitre II, le candidat à un emploi, à un stage ou à une période de formation en entreprise ou le salarié présente des éléments de fait laissant supposer l\'existence d\'une discrimination directe ou indirecte, telle que définie à l\'article 1er de la loi n° 2008-496 du 27 mai 2008 portant diverses dispositions d\'adaptation au droit communautaire dans le domaine de la lutte contre les discriminations.\r\n\r\nAu vu de ces éléments, il incombe à la partie défenderesse de prouver que sa décision est justifiée par des éléments objectifs étrangers à toute discrimination.\r\n\r\nLe juge forme sa conviction après avoir ordonné, en cas de besoin, toutes les mesures d\'instruction qu\'il estime utiles.', '2017-05-14 17:30:45', 5),
(3, 6, 'article 3', 'Les organisations syndicales représentatives au niveau national, au niveau départemental ou de la collectivité dans les départements d\'outre-mer, à Saint-Barthélemy et à Saint-Martin, ou dans l\'entreprise peuvent exercer en justice toutes les actions résultant de l\'application des dispositions du chapitre II.\r\n\r\nElles peuvent exercer ces actions en faveur d\'un candidat à un emploi, à un stage ou une période de formation en entreprise, ou d\'un salarié, dans les conditions prévues par l\'article L. 1134-1.\r\n\r\nL\'organisation syndicale n\'a pas à justifier d\'un mandat de l\'intéressé. Il suffit que celui-ci ait été averti par écrit de cette action et ne s\'y soit pas opposé dans un délai de quinze jours à compter de la date à laquelle l\'organisation syndicale lui a notifié son intention d\'agir.\r\n\r\nL\'intéressé peut toujours intervenir à l\'instance engagée par le syndicat.\r\n\r\n', '2017-05-14 17:30:45', 4),
(4, 8, 'article 4', 'Les associations régulièrement constituées depuis cinq ans au moins pour la lutte contre les discriminations ou oeuvrant dans le domaine du handicap peuvent exercer en justice toutes actions résultant de l\'application des dispositions du chapitre II.\r\n\r\nElles peuvent exercer ces actions en faveur d\'un candidat à un emploi, à un stage ou une période de formation en entreprise ou d\'un salarié dans les conditions prévues à l\'article L. 1134-1, sous réserve de justifier d\'un accord écrit de l\'intéressé.\r\n\r\nL\'intéressé peut toujours intervenir à l\'instance engagée par l\'association et y mettre un terme à tout moment.', '2017-05-14 17:30:45', 3),
(5, 8, 'article 5', 'Est nul et de nul effet le licenciement d\'un salarié faisant suite à une action en justice engagée par ce salarié ou en sa faveur, sur le fondement des dispositions du chapitre II, lorsqu\'il est établi que le licenciement n\'a pas de cause réelle et sérieuse et constitue en réalité une mesure prise par l\'employeur en raison de cette action en justice. Dans ce cas, la réintégration est de droit et le salarié est regardé comme n\'ayant jamais cessé d\'occuper son emploi.\r\n\r\nLorsque le salarié refuse de poursuivre l\'exécution du contrat de travail, le conseil de prud\'hommes lui alloue :\r\n\r\n1° Une indemnité ne pouvant être inférieure aux salaires des six derniers mois ;\r\n\r\n2° Une indemnité correspondant à l\'indemnité de licenciement prévue par l\'article L. 1234-9 ou par la convention ou l\'accord collectif applicable ou le contrat de travail.', '2017-05-14 17:30:45', 1),
(6, 7, 'article 6', 'Sans préjudice de l\'application, s\'il y a lieu, des dispositions du présent code protégeant les travailleurs à domicile, le télétravail désigne toute forme d\'organisation du travail dans laquelle un travail qui aurait également pu être exécuté dans les locaux de l\'employeur est effectué par un salarié hors de ces locaux de façon régulière et volontaire en utilisant les technologies de l\'information et de la communication dans le cadre d\'un contrat de travail ou d\'un avenant à celui-ci.\r\n\r\nLe télétravailleur désigne toute personne salariée de l\'entreprise qui effectue, soit dès l\'embauche, soit ultérieurement, du télétravail tel que défini au premier alinéa. \r\n\r\nLe refus d\'accepter un poste de télétravailleur n\'est pas un motif de rupture du contrat de travail. \r\n\r\nLe contrat de travail ou son avenant précise les conditions de passage en télétravail et les conditions de retour à une exécution du contrat de travail sans télétravail. \r\n\r\nA défaut d\'accord collectif applicable, le contrat de travail ou son avenant précise les modalités de contrôle du temps de travail.', '2017-05-14 17:30:45', 1),
(7, 1, 'article 7', 'Outre ses obligations de droit commun vis-à-vis de ses salariés, l\'employeur est tenu à l\'égard du salarié en télétravail : \r\n\r\n1° De prendre en charge tous les coûts découlant directement de l\'exercice du télétravail, notamment le coût des matériels, logiciels, abonnements, communications et outils ainsi que de la maintenance de ceux-ci ; \r\n\r\n2° D\'informer le salarié de toute restriction à l\'usage d\'équipements ou outils informatiques ou de services de communication électronique et des sanctions en cas de non-respect de telles restrictions ; \r\n\r\n3° De lui donner priorité pour occuper ou reprendre un poste sans télétravail qui correspond à ses qualifications et compétences professionnelles et de porter à sa connaissance la disponibilité de tout poste de cette nature ; \r\n\r\n4° D\'organiser chaque année un entretien qui porte notamment sur les conditions d\'activité du salarié et sa charge de travail ; \r\n\r\n5° De fixer, en concertation avec lui, les plages horaires durant lesquelles il peut habituellement le contacter.', '2017-05-14 17:30:45', 8),
(8, 7, 'article 8', 'Le salarié dont l\'enfant à charge au sens de l\'article L. 513-1 du code de la sécurité sociale et remplissant l\'une des conditions prévues par l\'article L. 512-3 du même code est atteint d\'une maladie, d\'un handicap ou victime d\'un accident d\'une particulière gravité rendant indispensables une présence soutenue et des soins contraignants bénéficie, pour une période déterminée par décret, d\'un congé de présence parentale.\r\n\r\nLe nombre de jours de congés dont peut bénéficier le salarié au titre du congé de présence parentale est au maximum de trois cent dix jours ouvrés. Aucun de ces jours ne peut être fractionné.\r\n\r\nLa durée initiale du congé est celle définie dans le certificat médical mentionné à l\'article L. 544-2 du code de la sécurité sociale. Cette durée fait l\'objet d\'un nouvel examen selon une périodicité définie par décret.\r\n\r\nAu-delà de la période déterminée au premier alinéa, le salarié peut à nouveau bénéficier d\'un congé de présence parentale, en cas de rechute ou de récidive de la pathologie de l\'enfant au titre de laquelle un premier congé a été accordé, dans le respect des dispositions du présent article et des articles L. 1225-63 à L. 1225-65.', '2017-05-14 17:30:45', 3),
(9, 6, 'article 9', 'Dès le 14 mars 1896, le député socialiste Arthur Groussier dépose une proposition de loi sur la codification des lois ouvrières. Différentes propositions de lois et de résolutions sur ce domaine se succèdent mais n\'entrent en résonance qu\'en 1906 avec le ministère de Viviani qui envisage la codification en quatre livres des lois ouvrières3.\r\n\r\nAlors que la grève générale est proclamée par la CGT pour le 1er mai 1906, année agitée marquée par plus de 1 300 grèves d\'une durée moyenne de 19 jours, le président du Conseil Georges Clemenceau crée pour la première fois le 25 octobre 1906 un ministère du Travail et de la Prévoyance sociale (avant la Direction du Travail était au ministère du commerce) confié à René Viviani. Ce ministère appuie le travail parlementaire, aiguillé par les socialistes (Jules Guesde, Jaurès) et les catholiques sociaux, pour voter notamment la loi du libre salaire de la femme le 13 juillet 1907 qui autorise les femmes à disposer elles-mêmes de leur salaire et la loi du 5 avril 1910 qui instaure les retraites paysannes et ouvrières4.', '2017-05-14 17:30:45', 1),
(10, 9, 'article 10', 'Le premier livre du code du travail, intitulé Code du travail et de la prévoyance sociale, est adopté par la loi du 28 décembre 1910 qui porte sur les conventions relatives au travail (contrat d’apprentissage, contrat de travail, salaire et placement)5. Sa préparation prend toutefois du retard : compilant des lois qui existaient déjà (loi relative à la création des syndicats professionnels, loi de 1892 limitant à 11 heures par jour le temps de travail des femmes et des enfants, loi sur l\'indemnisation des accidents du travail), il n\'est achevé que le 25 février 1927 avec l’adoption du livre III sur les groupements professionnels et entre-temps on a renoncé à inclure la partie relative à la « prévoyance sociale »6.\r\n\r\nLes conventions collectives, reconnues par une première loi du 25 mars 1919 qui affirment leur suprématie sur le contrat de travail individuel, viennent compléter les dispositions du Code du travail pour chaque branche de métier et pour chaque profession7.', '2017-05-14 17:30:45', 2);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(11) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `nickname`, `password`) VALUES
(1, 'Jared', 'f71dbe52628a3f83a77ab494817525c6'),
(2, 'Jaden', 'FBQ74OVG3RQ'),
(3, 'Griffin', 'OBU91NAH4MS'),
(4, 'Noelani', 'WJG36AHJ4AR'),
(5, 'Clayton', 'XNO59IGV4YL'),
(6, 'Adara', 'IXQ43HUF5QG'),
(7, 'Paul', 'FPP82CUM8JJ'),
(8, 'Benjamin', 'HNW08OKR6GU'),
(9, 'April', 'CAP53RQB6IC'),
(10, 'Kato', 'LIJ38IJY8WG'),
(16, 'Murlock', 'f71dbe52628a3f83a77ab494817525c6');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_author_id` (`author_id`),
  ADD KEY `fk_post_id` (`post_id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_author_id` (`author_id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_author_id_comments` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_author_id` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
