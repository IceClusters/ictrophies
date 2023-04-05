CREATE TABLE IF NOT EXISTS `players_trophies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `trophies` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;