# ************************************************************
# Sequel Ace SQL dump
# Version 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 5.7.39)
# Database: craftycoffee
# Generation Time: 2024-02-18 09:01:00 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table craft_addresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_addresses`;

CREATE TABLE `craft_addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_fk_jtgcdbcmigdxclwvmbzhmqaaweldgzjpekob` (`ownerId`),
  CONSTRAINT `craft_fk_fwanwwvguzoipsozxibaqkiblslpbycukxqb` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_jtgcdbcmigdxclwvmbzhmqaaweldgzjpekob` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_announcements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_announcements`;

CREATE TABLE `craft_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_asiqgxswcnmjkxenoevfndehbyekuagikvmz` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `craft_idx_eorotififxroqmkixrwhlnksabkiwzngpdba` (`dateRead`),
  KEY `craft_fk_kfkdmvdgjwfqcaajospovkkoarudnwgxdwrh` (`pluginId`),
  CONSTRAINT `craft_fk_fmiflwhwpmkgkinqbipdxuvdxxghnjliadgu` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_kfkdmvdgjwfqcaajospovkkoarudnwgxdwrh` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetindexdata`;

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_awrnbghbalekydevorsjwgolmevrqvrzngeb` (`sessionId`,`volumeId`),
  KEY `craft_idx_jeayceuvwgnjxtzwaeadgquzlwbyyqjwftvt` (`volumeId`),
  CONSTRAINT `craft_fk_lhqujxwnqjsmioiiijwiicufssfapsnvyrwg` FOREIGN KEY (`sessionId`) REFERENCES `craft_assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_mecktuxccnqkmglehusktpuuexlwgyzqvuvg` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_assetindexingsessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetindexingsessions`;

CREATE TABLE `craft_assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assets`;

CREATE TABLE `craft_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_fzvlrctkbqmwyggfchyiyukhnxsuwwjnqhjy` (`filename`,`folderId`),
  KEY `craft_idx_bofhdrgqgubfyhfhyxjjrcpllzpcrnodmras` (`folderId`),
  KEY `craft_idx_qjwwawvjtjoyrclcyijfruphcizjkxoqrkly` (`volumeId`),
  KEY `craft_fk_mwxhssraguucimvyfzamlfazevpmqkelbffc` (`uploaderId`),
  CONSTRAINT `craft_fk_eaonuwlveiqijgrynvycvrrwgxlodmoybayl` FOREIGN KEY (`folderId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ijgeqxbjppiizidxwkjzjqivxlukbfeqzqvr` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_mwxhssraguucimvyfzamlfazevpmqkelbffc` FOREIGN KEY (`uploaderId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_phindajgulzavcgxvjmztefwzxmcoiikmfbp` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_assets` WRITE;
/*!40000 ALTER TABLE `craft_assets` DISABLE KEYS */;

INSERT INTO `craft_assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `alt`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`)
VALUES
	(14,1,1,1,'espresso-shot.jpg','image',NULL,1200,689,39301,NULL,NULL,NULL,'2023-11-10 16:48:03','2023-07-23 07:54:25','2023-11-10 16:48:03'),
	(17,1,1,1,'iced-coffee.jpg','image',NULL,1200,971,73676,NULL,NULL,NULL,'2023-11-10 16:47:40','2023-07-23 08:13:24','2023-11-10 16:47:40'),
	(37,1,1,1,'iced-coffee_2023-11-10-164736_utyw.jpg','image',NULL,1200,971,73675,NULL,0,0,'2023-11-10 16:47:37','2023-11-10 16:47:37','2023-11-10 16:47:37'),
	(40,1,1,1,'espresso-shot_2023-11-10-164759_njib.jpg','image',NULL,1200,689,41638,NULL,0,0,'2023-11-10 16:48:00','2023-11-10 16:48:00','2023-11-10 16:48:00'),
	(41,1,1,1,'chemex.jpg','image',NULL,3175,2678,408807,NULL,NULL,NULL,'2023-11-10 16:48:11','2023-11-10 16:48:11','2023-11-10 16:48:11');

/*!40000 ALTER TABLE `craft_assets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categories`;

CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_utttqewktdlnsdzxvdoomkjgotgtdvhnxqto` (`groupId`),
  KEY `craft_fk_ggeyhgnagihbdluogsdrtgdojikxqsptgdvf` (`parentId`),
  CONSTRAINT `craft_fk_bocbxwlkcrrfxyywfrbwbnnptwpiukyqirup` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ggeyhgnagihbdluogsdrtgdojikxqsptgdvf` FOREIGN KEY (`parentId`) REFERENCES `craft_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_oillgoeyngiqoyoirhjkculcyiowrahkmajg` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_categories` WRITE;
/*!40000 ALTER TABLE `craft_categories` DISABLE KEYS */;

INSERT INTO `craft_categories` (`id`, `groupId`, `parentId`, `deletedWithGroup`, `dateCreated`, `dateUpdated`)
VALUES
	(326,1,NULL,NULL,'2023-11-13 11:20:33','2023-11-13 11:20:33'),
	(338,1,NULL,NULL,'2023-11-13 14:44:43','2023-11-13 14:44:43'),
	(339,1,NULL,NULL,'2023-11-13 14:45:04','2023-11-13 14:45:04');

/*!40000 ALTER TABLE `craft_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categorygroups`;

CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_hpzrdyinaqirxtifxlzgzcwageweswjqgruh` (`name`),
  KEY `craft_idx_qkqebzbhvvsukfynthbyjkdcuaxjumsmrydw` (`handle`),
  KEY `craft_idx_bctbdfnaarikvvdeuheifeujxnbfkteqjvbw` (`structureId`),
  KEY `craft_idx_flizzebwdxyvthyhubsvhbinoydzwfvvreyl` (`fieldLayoutId`),
  KEY `craft_idx_gytcdwybbypdamvehtajyfwixtbjqitqxxoo` (`dateDeleted`),
  CONSTRAINT `craft_fk_hicvowmspqptbtfwhybjguhukxyxjobrdycf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_xljkmgojbutocxveelidvncxzeagnhoqbzir` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_categorygroups` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups` DISABLE KEYS */;

INSERT INTO `craft_categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `defaultPlacement`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,3,13,'Drink styles','drinkStyles','end','2023-11-13 11:18:51','2023-11-13 11:18:51',NULL,'e682d4a9-435d-4cf8-9892-a3e34f88f406');

/*!40000 ALTER TABLE `craft_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_categorygroups_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categorygroups_sites`;

CREATE TABLE `craft_categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_dpdaekfwyhyatljxhvbhbpqthimayslpjsax` (`groupId`,`siteId`),
  KEY `craft_idx_zjqqbifqkcctpalkdvmxlhayfxcqwsbegwmv` (`siteId`),
  CONSTRAINT `craft_fk_qinyrettorlzxngyasdosaljhtgropytflkg` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_yxiowjsftlxsdwacrwnjhbzchjfxihkjslcd` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups_sites` DISABLE KEYS */;

INSERT INTO `craft_categorygroups_sites` (`id`, `groupId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,'styles/{slug}','styles/_entry.twig','2023-11-13 11:18:51','2023-11-13 11:18:51','94eb9caa-6339-4208-b7ec-559e6df217e6');

/*!40000 ALTER TABLE `craft_categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_changedattributes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_changedattributes`;

CREATE TABLE `craft_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `craft_idx_htqzymvhwgxvvrajeqwrycgsivtfbvaffsnl` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craft_fk_hyitscdovfkqswqpxjdnmzlnwjvibakmwfvk` (`siteId`),
  KEY `craft_fk_bkepvvfqoyhsffbghvcejdepqgxzajfrzshq` (`userId`),
  CONSTRAINT `craft_fk_bkepvvfqoyhsffbghvcejdepqgxzajfrzshq` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_endjgjqsgtfxyrgaynwtoheuufzagpyylopy` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_hyitscdovfkqswqpxjdnmzlnwjvibakmwfvk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_changedattributes` WRITE;
/*!40000 ALTER TABLE `craft_changedattributes` DISABLE KEYS */;

INSERT INTO `craft_changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`)
VALUES
	(1,1,'firstName','2023-06-28 21:16:42',0,1),
	(1,1,'fullName','2023-06-28 21:16:42',0,1),
	(1,1,'lastName','2023-06-28 21:16:42',0,1),
	(2,1,'postDate','2023-06-28 21:20:50',0,1),
	(2,1,'slug','2023-06-28 21:19:57',0,1),
	(2,1,'title','2023-06-28 21:19:57',0,1),
	(2,1,'uri','2023-06-28 21:19:57',0,1),
	(6,1,'postDate','2023-07-08 07:44:13',0,1),
	(6,1,'slug','2023-07-08 07:42:40',0,1),
	(6,1,'title','2023-11-10 17:03:14',0,1),
	(6,1,'uri','2023-07-08 07:42:40',0,1),
	(8,1,'postDate','2023-07-08 07:54:21',0,1),
	(8,1,'slug','2023-07-08 07:53:53',0,1),
	(8,1,'title','2023-07-08 07:53:53',0,1),
	(8,1,'uri','2023-07-08 07:53:53',0,1),
	(10,1,'title','2023-11-10 16:32:17',0,1),
	(18,1,'postDate','2023-07-23 08:14:14',0,1),
	(18,1,'slug','2023-07-23 08:13:41',0,1),
	(18,1,'title','2023-07-23 08:13:41',0,1),
	(18,1,'uri','2023-07-23 08:13:41',0,1),
	(21,1,'postDate','2023-11-10 12:50:17',0,1),
	(21,1,'slug','2023-11-10 12:50:08',0,1),
	(21,1,'title','2023-11-10 12:50:08',0,1),
	(21,1,'uri','2023-11-10 13:38:02',0,1),
	(23,1,'postDate','2023-11-10 12:50:33',0,1),
	(23,1,'slug','2023-11-10 12:50:28',0,1),
	(23,1,'title','2023-11-10 12:50:28',0,1),
	(23,1,'uri','2023-11-10 12:50:28',0,1),
	(25,1,'postDate','2023-11-10 12:50:50',0,1),
	(25,1,'slug','2023-11-10 12:50:45',0,1),
	(25,1,'title','2023-11-10 12:50:45',0,1),
	(25,1,'uri','2023-11-10 13:38:02',0,1),
	(27,1,'postDate','2023-11-10 12:51:24',0,1),
	(27,1,'slug','2023-11-10 12:51:15',0,1),
	(27,1,'title','2023-11-10 12:51:15',0,1),
	(27,1,'uri','2023-11-10 12:51:15',0,1),
	(43,1,'postDate','2023-11-10 16:48:40',0,1),
	(43,1,'slug','2023-11-10 16:48:26',0,1),
	(43,1,'title','2023-11-10 16:48:26',0,1),
	(43,1,'uri','2023-11-10 16:48:26',0,1),
	(45,1,'postDate','2023-11-10 16:54:42',0,1),
	(45,1,'slug','2023-11-10 16:54:20',0,1),
	(45,1,'title','2023-11-10 16:54:20',0,1),
	(45,1,'uri','2023-11-10 16:54:20',0,1),
	(60,1,'postDate','2023-11-13 10:28:39',0,1),
	(60,1,'slug','2023-11-13 10:25:36',0,1),
	(60,1,'title','2023-11-13 10:25:36',0,1),
	(60,1,'uri','2023-11-13 10:32:17',0,1),
	(326,1,'slug','2023-11-13 11:20:37',0,1),
	(326,1,'title','2023-11-13 11:20:37',0,1),
	(326,1,'uri','2023-11-13 11:20:37',0,1),
	(338,1,'slug','2023-11-13 14:44:52',0,1),
	(338,1,'title','2023-11-13 14:44:52',0,1),
	(338,1,'uri','2023-11-13 14:44:52',0,1),
	(339,1,'slug','2023-11-13 14:45:20',0,1),
	(339,1,'title','2023-11-13 14:45:20',0,1),
	(339,1,'uri','2023-11-13 14:45:20',0,1),
	(356,1,'postDate','2023-11-13 14:50:05',0,1),
	(356,1,'slug','2023-11-13 14:49:28',0,1),
	(356,1,'title','2023-11-13 14:49:28',0,1),
	(356,1,'uri','2023-11-13 14:49:28',0,1),
	(358,1,'postDate','2023-11-13 16:17:19',0,1),
	(358,1,'slug','2023-11-13 16:17:12',0,1),
	(358,1,'title','2023-11-13 16:17:12',0,1),
	(358,1,'uri','2023-11-13 16:17:12',0,1),
	(360,1,'postDate','2023-11-13 16:17:35',0,1),
	(360,1,'slug','2023-11-13 16:17:28',0,1),
	(360,1,'title','2023-11-13 16:17:28',0,1),
	(360,1,'uri','2023-11-13 16:17:28',0,1);

/*!40000 ALTER TABLE `craft_changedattributes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_changedfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_changedfields`;

CREATE TABLE `craft_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `craft_idx_xnihuttnebyzerspvutrwqxfewwhhvgwjdlq` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craft_fk_oygalerrvxlxifhahcktcdmfzjctrldirmjh` (`siteId`),
  KEY `craft_fk_udzwsmjzmdgkgvlyzbdtraugzhmvtutpomdx` (`fieldId`),
  KEY `craft_fk_ecsglifnbhyxalfbhytgdkxbjsyxeissroev` (`userId`),
  CONSTRAINT `craft_fk_ecsglifnbhyxalfbhytgdkxbjsyxeissroev` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_oygalerrvxlxifhahcktcdmfzjctrldirmjh` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_pnmijtfrrajtedowjlbdglldlqvbrewnpgzc` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_udzwsmjzmdgkgvlyzbdtraugzhmvtutpomdx` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_changedfields` WRITE;
/*!40000 ALTER TABLE `craft_changedfields` DISABLE KEYS */;

INSERT INTO `craft_changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`)
VALUES
	(6,1,1,'2023-11-10 18:10:27',0,1),
	(6,1,2,'2023-07-08 07:44:13',0,1),
	(6,1,5,'2023-11-10 18:17:50',0,1),
	(6,1,17,'2023-11-13 14:45:38',0,1),
	(6,1,18,'2023-11-13 16:18:13',0,1),
	(8,1,3,'2023-07-08 07:54:08',0,1),
	(8,1,4,'2023-07-08 07:54:20',0,1),
	(10,1,6,'2023-11-10 16:32:17',0,1),
	(18,1,1,'2023-07-23 08:13:54',0,1),
	(18,1,2,'2023-07-23 08:14:05',0,1),
	(18,1,5,'2023-11-10 16:46:18',0,1),
	(18,1,17,'2023-11-13 14:45:35',0,1),
	(18,1,18,'2023-11-13 16:18:26',0,1),
	(21,1,2,'2023-11-13 09:24:50',0,1),
	(21,1,6,'2023-11-10 13:42:58',0,1),
	(21,1,7,'2023-11-10 13:42:58',0,1),
	(25,1,2,'2023-11-13 09:25:58',0,1),
	(25,1,6,'2023-11-13 09:25:58',0,1),
	(25,1,7,'2023-11-13 09:25:58',0,1),
	(43,1,1,'2023-11-10 16:48:35',0,1),
	(43,1,2,'2023-11-10 16:48:35',0,1),
	(43,1,5,'2023-11-10 16:48:39',0,1),
	(43,1,17,'2023-11-13 14:45:29',0,1),
	(43,1,18,'2023-11-13 16:17:53',0,1),
	(45,1,3,'2023-11-10 18:49:44',0,1),
	(45,1,4,'2023-11-10 16:54:42',0,1),
	(60,1,8,'2023-11-13 14:48:33',0,1),
	(60,1,17,'2023-11-13 11:22:39',0,1),
	(309,1,12,'2023-11-13 14:48:32',0,1),
	(317,1,8,'2023-11-13 10:32:17',0,1),
	(326,1,16,'2023-11-13 11:20:50',0,1),
	(338,1,16,'2023-11-13 14:45:00',0,1),
	(339,1,16,'2023-11-13 14:45:20',0,1),
	(356,1,1,'2023-11-13 14:49:54',0,1),
	(356,1,2,'2023-11-13 14:50:01',0,1),
	(356,1,5,'2023-11-13 14:50:04',0,1),
	(356,1,17,'2023-11-13 14:49:38',0,1),
	(356,1,18,'2023-11-13 16:17:42',0,1),
	(358,1,17,'2023-11-13 16:17:16',0,1),
	(360,1,17,'2023-11-13 16:17:33',0,1);

/*!40000 ALTER TABLE `craft_changedfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_content`;

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_introduction_yetqqcwj` text,
  `field_pageCopy_fpawuluh` text,
  `field_excerpt_xuzzitfj` text,
  `field_newsBody_fnteyxpg` text,
  `field_subtitle_nztqoamm` text,
  `field_pageIntro_cemhehvv` text,
  `field_styleDescription_bdexzddb` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_xygnluzupetikccyjmzjsazxxfehetageoib` (`elementId`,`siteId`),
  KEY `craft_idx_onggxnrdmibkdotlawvsvapvywwudhivbgwo` (`siteId`),
  KEY `craft_idx_lgansciwntlebwgroflnejdphcpjdgpoiniu` (`title`),
  CONSTRAINT `craft_fk_btgtgspncjsdoketgugojwkqrdfgzitvebke` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ketwjyhpupanshmporjnharoranocufcwrxv` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;

INSERT INTO `craft_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_introduction_yetqqcwj`, `field_pageCopy_fpawuluh`, `field_excerpt_xuzzitfj`, `field_newsBody_fnteyxpg`, `field_subtitle_nztqoamm`, `field_pageIntro_cemhehvv`, `field_styleDescription_bdexzddb`)
VALUES
	(1,1,1,NULL,'2023-06-23 21:48:48','2023-11-10 16:35:52','6144ea89-1e2f-4b73-8b8c-2327a30c5acb',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,2,1,'Hello world!','2023-06-28 21:19:50','2023-06-28 21:20:50','d11e9fea-4a76-4391-98e1-25efb66a1eaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,3,1,'Hello world!','2023-06-28 21:20:50','2023-06-28 21:20:50','b1caf811-0962-470d-909a-59c9ca533563',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,4,1,NULL,'2023-07-07 22:43:10','2023-07-07 22:43:10','9712a9a1-389a-4ff7-8da9-4e3815cbb516',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(5,5,1,NULL,'2023-07-07 22:44:01','2023-07-07 22:44:01','1f35b75a-53cc-499b-b40c-41d86a1fb966',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(6,6,1,'Perfect Espresso','2023-07-08 07:42:28','2023-11-13 16:18:13','e8a21ddd-0e1d-48bf-b239-e4c7cfd6370d','The best shot you\'ve never had','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(7,7,1,'Espresso','2023-07-08 07:44:13','2023-07-08 07:44:13','02c7b241-d0de-4bd2-b097-4bdd5e4970fe','News article lead or intro','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(8,8,1,'New coffee coming soon','2023-07-08 07:52:29','2023-07-08 07:54:22','dc4dfbe5-3252-48a8-b75a-5dd5edc05775',NULL,NULL,'Check out the new style coming to Crafty Coffee very soon!','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL),
	(9,9,1,'New coffee coming soon','2023-07-08 07:54:22','2023-07-08 07:54:22','49ba331a-684b-487e-b5b4-5d15ae495098',NULL,NULL,'Check out the new style coming to Crafty Coffee very soon!','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL),
	(10,10,1,'Crafty Coffee','2023-07-22 07:33:24','2023-11-10 16:32:17','a18b4fc4-962f-4f26-b1b5-7352ecfcf8ed',NULL,NULL,NULL,NULL,'If we wrote it down, you can make it at home.',NULL,NULL),
	(11,11,1,'Homepage','2023-07-22 07:33:24','2023-07-22 07:33:24','d47564f2-fb61-4096-a702-b6c6a4ae487b',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(12,12,1,'Homepage','2023-07-22 07:33:24','2023-07-22 07:33:24','40c7445b-9fda-4320-bdc6-39f5f5474b7a',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(13,13,1,'Homepage','2023-07-22 07:34:26','2023-07-22 07:34:26','dc157881-d450-4c86-a5d0-6e6e49e6aa1e',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(14,14,1,'Espresso shot','2023-07-23 07:54:25','2023-11-10 16:48:03','e3c7efb1-941b-4806-a7fb-2635fe1d904a',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(16,16,1,'Espresso','2023-07-23 08:05:13','2023-07-23 08:05:13','0ff23f8b-e995-4b7a-a1dd-60c95a82b25c','News article lead or intro','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(17,17,1,'Iced coffee','2023-07-23 08:13:24','2023-11-10 16:47:40','4fe66a89-c596-4a0c-98ae-b1d80b228dca',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(18,18,1,'Iced Coffee','2023-07-23 08:13:30','2023-11-13 16:18:26','c7492c45-7c62-41a3-a0de-0f057e63b224','Intro for Iced Coffee drink','<p>page copy placeholder</p>',NULL,NULL,NULL,NULL,NULL),
	(19,19,1,'Iced Coffee','2023-07-23 08:14:14','2023-07-23 08:14:14','9b1fa263-b0ab-425c-ae51-be8df5e4a25c','Intro for Iced Coffee drink','<p>page copy placeholder</p>',NULL,NULL,NULL,NULL,NULL),
	(20,20,1,'Iced Coffee','2023-07-23 08:14:21','2023-07-23 08:14:21','6bb9dc11-e862-45f6-b31b-c762afd98f8c','Intro for Iced Coffee drink','<p>page copy placeholder</p>',NULL,NULL,NULL,NULL,NULL),
	(21,21,1,'About','2023-11-10 12:50:04','2023-11-13 09:24:50','46b1f606-b215-48a0-af68-cee53afb8efe',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,'This is a subtitle','This is a page intro',NULL),
	(22,22,1,'About','2023-11-10 12:50:17','2023-11-10 13:38:02','2c67ba0d-6ecf-4811-9fd2-99084dc5cc96',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(23,23,1,'Locations','2023-11-10 12:50:24','2023-11-10 13:38:02','00f28023-fc87-479f-98ac-bcf810defcbf',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(24,24,1,'Locations','2023-11-10 12:50:33','2023-11-10 13:38:02','c8098b89-34d2-4a6b-ab5d-ffa3f1f73656',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(25,25,1,'Austin, TX','2023-11-10 12:50:39','2023-11-13 09:25:58','d2cbaf89-e828-4086-9196-2e4c5bdcd668',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,'Test subtitle','A page intro example',NULL),
	(26,26,1,'Austin, TX','2023-11-10 12:50:50','2023-11-10 13:38:02','565fd223-f31d-46e8-a324-9798ea395605',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(27,27,1,'Mission Statement','2023-11-10 12:51:09','2023-11-10 13:38:02','8d2da9e4-3f21-497b-a525-b43343cd86d6',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(28,28,1,'Mission Statement','2023-11-10 12:51:24','2023-11-10 13:38:02','117efbbe-8f4e-4da6-96b2-84114743792c',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(30,30,1,'About','2023-11-10 13:42:58','2023-11-10 13:42:58','17e89ec2-0e6e-4312-b6b5-47d55b6597e6',NULL,'<p>Page copy goes here</p>',NULL,NULL,'This is a subtitle','This is a page intro',NULL),
	(31,31,1,'Homepage','2023-11-10 16:31:42','2023-11-10 16:31:42','bea286ed-8aeb-433e-9a31-98e4abd6cac1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(33,33,1,'Crafty Coffee','2023-11-10 16:32:17','2023-11-10 16:32:17','17312ada-ce06-4975-98cb-44e250a0f7a0',NULL,NULL,NULL,NULL,'If we wrote it down, you can make it at home.',NULL,NULL),
	(35,35,1,'Iced Coffee','2023-11-10 16:46:18','2023-11-10 16:46:18','44272cef-99e1-405a-b810-6a680a85133e','Intro for Iced Coffee drink','<p>page copy placeholder</p>',NULL,NULL,NULL,NULL,NULL),
	(37,37,1,'Iced coffee','2023-11-10 16:47:36','2023-11-10 16:47:36','301768c0-94c0-423c-bd17-4c16b6a63978',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(38,38,1,'Espresso','2023-11-10 16:47:45','2023-11-10 16:47:45','96659d6d-8410-427e-b454-64021317868e','News article lead or intro','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(40,40,1,'Espresso shot','2023-11-10 16:47:59','2023-11-10 16:47:59','2eab60ac-e568-4e95-82a3-97d9240f9e0b',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(41,41,1,'Chemex','2023-11-10 16:48:08','2023-11-10 16:48:08','7ac382ce-fecf-4357-8197-afe0685af405',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(42,42,1,'Espresso','2023-11-10 16:48:19','2023-11-10 16:48:19','8ddd1d07-e23c-48dc-b6fe-0e032cfce793','News article lead or intro','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(43,43,1,'Chemex','2023-11-10 16:48:21','2023-11-13 16:17:53','73c040b8-a7f4-47a3-9f78-9a1a3d9f7d7e','Here is is, le chemex!','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(44,44,1,'Chemex','2023-11-10 16:48:40','2023-11-10 16:48:40','eea716b6-c394-4b52-9b74-39a9d27681e7','Here is is, le chemex!','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(45,45,1,'Another News Story','2023-11-10 16:54:09','2023-11-10 18:49:44','f850e5be-9367-4935-a991-3679d123d19b',NULL,NULL,'Check out the new coffee style coming soon to Crafty Coffee!','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(46,46,1,'Another News Story','2023-11-10 16:54:42','2023-11-10 16:54:42','31aa26d8-6ce7-4e26-8744-14e0cd237559',NULL,NULL,'Blah blah blahdededah abd sine nire isduifs','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(47,47,1,'Perfect Espresso','2023-11-10 17:03:14','2023-11-10 17:03:14','5173b23c-0750-4a80-ab1f-8f3e18ad1d72','News article lead or intro','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(48,48,1,'Perfect Espresso','2023-11-10 17:03:19','2023-11-10 17:03:19','65da7135-6501-4bed-a94c-f66e90c03f07','News article lead or intro','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(50,50,1,'Perfect Espresso','2023-11-10 17:03:42','2023-11-10 17:03:42','edc11cf7-3d01-41b3-9fa4-890fb32990cf','Blach blah tagline etc','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(51,51,1,'Perfect Espresso','2023-11-10 18:10:27','2023-11-10 18:10:27','be7a64b7-81b6-433a-8aad-fad1b717ceed','The best shot you\'ve never had','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(53,53,1,'Perfect Espresso','2023-11-10 18:17:50','2023-11-10 18:17:50','add2470f-ac66-4ed7-82d3-bbbaf9223b79','The best shot you\'ve never had','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(55,55,1,'Another News Story','2023-11-10 18:49:44','2023-11-10 18:49:44','7647eefa-2c54-4758-bdbf-52c1eef21188',NULL,NULL,'Check out the new coffee style coming soon to Crafty Coffee!','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(57,57,1,'About','2023-11-13 09:24:50','2023-11-13 09:24:50','633a581c-d3fa-4309-a7c2-19e2936c9a63',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,'This is a subtitle','This is a page intro',NULL),
	(59,59,1,'Austin, TX','2023-11-13 09:25:58','2023-11-13 09:25:58','0f7dcd15-2677-4b5f-a3b6-593cf78aafb1',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,'Test subtitle','A page intro example',NULL),
	(60,60,1,'Perfect Espresso','2023-11-13 10:25:20','2023-11-13 14:48:32','9d6cdd2a-1949-464e-a606-55d227020e52',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(61,317,1,'Perfect Espresso','2023-11-13 10:28:39','2023-11-13 10:32:17','ec04794e-80e3-49fd-b1a2-905ccd3776a7',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(62,326,1,'Espresso','2023-11-13 11:20:33','2023-11-13 11:20:51','fe30d5bb-b600-40f2-b531-81d933954cdc',NULL,NULL,NULL,NULL,NULL,NULL,'All drinks made with the espresso roasted bean and pressure!'),
	(64,328,1,'Perfect Espresso','2023-11-13 11:22:40','2023-11-13 11:22:40','cd034bae-1654-4d80-b145-138f2d28729a',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(66,338,1,'Drip Coffee','2023-11-13 14:44:43','2023-11-13 14:45:01','a525b3ac-7acd-4a45-9510-ff7846e65cb2',NULL,NULL,NULL,NULL,NULL,NULL,'Traditional drip drip coffee coffee'),
	(67,339,1,'Iced coffee','2023-11-13 14:45:04','2023-11-13 14:45:21','2069e20b-e960-48d3-a6d5-1e2b81436001',NULL,NULL,NULL,NULL,NULL,NULL,'The cold version of coffee drink'),
	(69,341,1,'Chemex','2023-11-13 14:45:29','2023-11-13 14:45:29','367d68f1-638c-4289-add5-78393e92ebd3','Here is is, le chemex!','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(71,343,1,'Iced Coffee','2023-11-13 14:45:35','2023-11-13 14:45:35','a4fdae2e-d337-428d-a7d2-2d985247dfdc','Intro for Iced Coffee drink','<p>page copy placeholder</p>',NULL,NULL,NULL,NULL,NULL),
	(72,344,1,'Perfect Espresso','2023-11-13 14:45:38','2023-11-13 14:45:38','fc86a77a-0c23-4928-96e3-2d8d6f4503fd','The best shot you\'ve never had','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(74,347,1,'Perfect Espresso','2023-11-13 14:48:33','2023-11-13 14:48:33','3e19d08b-70ea-474f-8fa1-6b913ba99942',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(75,356,1,'Iced Amerciano','2023-11-13 14:49:24','2023-11-13 16:18:31','7a4adffe-5117-4b4c-b958-488502594b62','Cold version of the eternally popular classic','<p>Cold as you like, and perky with it</p>',NULL,NULL,NULL,NULL,NULL),
	(76,357,1,'Iced Amerciano','2023-11-13 14:50:05','2023-11-13 14:50:05','032e1957-37e4-40b8-9f78-9fa379abe64b','Cold version of the eternally popular classic','<p>Cold as you like, and perky with it</p>',NULL,NULL,NULL,NULL,NULL),
	(77,358,1,'Iced Coffee recipe','2023-11-13 16:17:04','2023-11-13 16:17:19','32208845-7fa0-4fcc-aa50-cbb2dce5f6a7',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(78,359,1,'Iced Coffee recipe','2023-11-13 16:17:19','2023-11-13 16:17:19','6c8a5402-062a-4a27-b03e-11d9690be133',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(79,360,1,'Chemex','2023-11-13 16:17:23','2023-11-13 16:17:35','6e8f0ac5-900d-47a8-959d-fbc72a7ec6b7',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(80,361,1,'Chemex','2023-11-13 16:17:35','2023-11-13 16:17:35','919dca1d-37a1-4c54-8450-562029fc0b59',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(82,363,1,'Iced Amerciano','2023-11-13 16:17:42','2023-11-13 16:17:42','01e9a1bc-ef7b-4303-9421-f46d3ef335aa','Cold version of the eternally popular classic','<p>Cold as you like, and perky with it</p>',NULL,NULL,NULL,NULL,NULL),
	(84,365,1,'Chemex','2023-11-13 16:17:53','2023-11-13 16:17:53','5d7d2fed-f2e2-4866-ac47-3e909ae5fcf7','Here is is, le chemex!','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(86,367,1,'Perfect Espresso','2023-11-13 16:18:13','2023-11-13 16:18:13','5fb6bff5-3a16-4d98-b8c4-b61478297e98','The best shot you\'ve never had','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL,NULL,NULL,NULL),
	(88,369,1,'Iced Coffee','2023-11-13 16:18:26','2023-11-13 16:18:26','dc869e63-0d3b-46bc-b02d-2be437138fde','Intro for Iced Coffee drink','<p>page copy placeholder</p>',NULL,NULL,NULL,NULL,NULL),
	(89,370,1,'Iced Amerciano','2023-11-13 16:18:31','2023-11-13 16:18:31','e3366d71-118c-4092-84ff-abd36276a7d5','Cold version of the eternally popular classic','<p>Cold as you like, and perky with it</p>',NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_craftidtokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_craftidtokens`;

CREATE TABLE `craft_craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fk_afpsfngxtdlxhwqechxdubtzvgfmatalmisw` (`userId`),
  CONSTRAINT `craft_fk_afpsfngxtdlxhwqechxdubtzvgfmatalmisw` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_deprecationerrors`;

CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_infuspeamheycewuddocsvaryybxxnparqjw` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_drafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_drafts`;

CREATE TABLE `craft_drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `craft_idx_hasyewtxdhcrrxerhhesyzbvabcsqxqfvcmr` (`creatorId`,`provisional`),
  KEY `craft_idx_gidhpjtjkhlszlsgepucpttmxzzrrstdhnwv` (`saved`),
  KEY `craft_fk_zvaolywalnemtixhedlfdxudqzyxqvqxgayj` (`canonicalId`),
  CONSTRAINT `craft_fk_rhpfrwkbfxvofrwkfalzsdmvivawmackatqk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_zvaolywalnemtixhedlfdxudqzyxqvqxgayj` FOREIGN KEY (`canonicalId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_drafts` WRITE;
/*!40000 ALTER TABLE `craft_drafts` DISABLE KEYS */;

INSERT INTO `craft_drafts` (`id`, `canonicalId`, `creatorId`, `provisional`, `name`, `notes`, `trackChanges`, `dateLastMerged`, `saved`)
VALUES
	(1,NULL,1,0,'First draft',NULL,0,NULL,0),
	(2,NULL,1,0,'First draft',NULL,0,NULL,0);

/*!40000 ALTER TABLE `craft_drafts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_elementactivity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elementactivity`;

CREATE TABLE `craft_elementactivity` (
  `elementId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `craft_idx_alzhcgmfmvyeavarjrtecpvtjcxgqunameko` (`elementId`,`timestamp`,`userId`),
  KEY `craft_fk_borwidaizfgnkhzfbewxvvpzssjthvkrnbaz` (`userId`),
  KEY `craft_fk_vuiuzlprbctsgjmmrxindbnvcpvndjentaoq` (`siteId`),
  KEY `craft_fk_jsibyhsqiyxtteldmjvcjxqmhcxvtmckuvpy` (`draftId`),
  CONSTRAINT `craft_fk_borwidaizfgnkhzfbewxvvpzssjthvkrnbaz` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_bppxoehiilpoasflyxnesjhuzfkoegjsjgwu` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_jsibyhsqiyxtteldmjvcjxqmhcxvtmckuvpy` FOREIGN KEY (`draftId`) REFERENCES `craft_drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_vuiuzlprbctsgjmmrxindbnvcpvndjentaoq` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_elementactivity` WRITE;
/*!40000 ALTER TABLE `craft_elementactivity` DISABLE KEYS */;

INSERT INTO `craft_elementactivity` (`elementId`, `userId`, `siteId`, `draftId`, `type`, `timestamp`)
VALUES
	(6,1,1,NULL,'edit','2023-11-13 16:18:10'),
	(6,1,1,NULL,'save','2023-11-13 16:18:13'),
	(6,1,1,NULL,'view','2023-11-13 16:18:01'),
	(10,1,1,NULL,'edit','2023-11-10 16:32:15'),
	(10,1,1,NULL,'save','2023-11-10 16:32:17'),
	(10,1,1,NULL,'view','2023-11-10 16:44:44'),
	(18,1,1,NULL,'edit','2023-11-13 16:18:24'),
	(18,1,1,NULL,'save','2023-11-13 16:18:26'),
	(18,1,1,NULL,'view','2023-11-13 16:18:19'),
	(21,1,1,NULL,'edit','2023-11-13 09:24:46'),
	(21,1,1,NULL,'save','2023-11-13 09:24:50'),
	(21,1,1,NULL,'view','2023-11-13 09:25:12'),
	(23,1,1,NULL,'save','2023-11-10 12:50:33'),
	(23,1,1,NULL,'view','2023-11-10 12:50:26'),
	(25,1,1,NULL,'edit','2023-11-13 09:25:55'),
	(25,1,1,NULL,'save','2023-11-13 09:25:58'),
	(25,1,1,NULL,'view','2023-11-13 09:25:48'),
	(27,1,1,NULL,'save','2023-11-10 12:51:24'),
	(27,1,1,NULL,'view','2023-11-10 12:51:10'),
	(43,1,1,NULL,'edit','2023-11-13 16:17:52'),
	(43,1,1,NULL,'save','2023-11-13 16:17:53'),
	(43,1,1,NULL,'view','2023-11-13 16:17:43'),
	(45,1,1,NULL,'edit','2023-11-10 18:49:39'),
	(45,1,1,NULL,'save','2023-11-10 18:49:44'),
	(45,1,1,NULL,'view','2023-11-13 07:41:15'),
	(60,1,1,NULL,'edit','2023-11-13 14:48:28'),
	(60,1,1,NULL,'save','2023-11-13 14:48:33'),
	(60,1,1,NULL,'view','2023-11-13 14:49:17'),
	(326,1,1,NULL,'save','2023-11-13 11:20:51'),
	(326,1,1,NULL,'view','2023-11-13 15:02:24'),
	(338,1,1,NULL,'save','2023-11-13 14:45:01'),
	(339,1,1,NULL,'save','2023-11-13 14:45:21'),
	(356,1,1,NULL,'edit','2023-11-13 16:17:40'),
	(356,1,1,NULL,'save','2023-11-13 16:18:31'),
	(356,1,1,NULL,'view','2023-11-13 16:23:04'),
	(358,1,1,NULL,'save','2023-11-13 16:17:19'),
	(360,1,1,NULL,'save','2023-11-13 16:17:35');

/*!40000 ALTER TABLE `craft_elementactivity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements`;

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_qeertiaejdryuqgvkqpczmumnhlyxcgfjwwg` (`dateDeleted`),
  KEY `craft_idx_wddspxrwktnfpqekkdlftxrbyhluyrtesjsr` (`fieldLayoutId`),
  KEY `craft_idx_jtywjkxcsroeybrndwndblefkwmbnwedemmb` (`type`),
  KEY `craft_idx_gkgtitzdvibnnpasqaonevczgegeiwcpyfhs` (`enabled`),
  KEY `craft_idx_fywmogbawiilvniclfmsvjobngfykdjopghh` (`canonicalId`),
  KEY `craft_idx_qtlxhjpvshnydievxazvvsqrvdnhxorvtwes` (`archived`,`dateCreated`),
  KEY `craft_idx_yhmcrqmituxjcixruvxjcyvlegfdckpxrcic` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `craft_idx_iqvygxwosopyntnpavsacbkuggdskbfiymap` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `craft_fk_tvdfhhwwayobjxkqdtfpwdnllfmytvauworg` (`draftId`),
  KEY `craft_fk_vcudbdmeyjyyolgapnqvtlispqqtifuyvmhr` (`revisionId`),
  CONSTRAINT `craft_fk_fbbvikevhxvqkmzvbhgyorbarjeirvctpiuo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_ohfzbpwpfelactviygonyugylwabdhurlyzw` FOREIGN KEY (`canonicalId`) REFERENCES `craft_elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_tvdfhhwwayobjxkqdtfpwdnllfmytvauworg` FOREIGN KEY (`draftId`) REFERENCES `craft_drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_vcudbdmeyjyyolgapnqvtlispqqtifuyvmhr` FOREIGN KEY (`revisionId`) REFERENCES `craft_revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;

INSERT INTO `craft_elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-06-23 21:48:48','2023-11-10 16:35:52',NULL,NULL,'44885583-3af6-4071-97f5-c1600566a72b'),
	(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-06-28 21:19:50','2023-06-28 21:20:50',NULL,'2023-06-28 21:26:48','4e0c553f-d964-4953-b730-7ff23ce5b29b'),
	(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2023-06-28 21:20:50','2023-06-28 21:20:50',NULL,NULL,'80d1184e-366f-415e-a74b-7579285b84cf'),
	(4,NULL,1,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 22:43:10','2023-07-07 22:43:10',NULL,NULL,'ff191e6e-5214-4c20-a3bf-950d7c9427b4'),
	(5,NULL,2,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 22:44:01','2023-07-07 22:44:01',NULL,NULL,'6d9bd90b-617c-42e9-b780-6bedb123df2a'),
	(6,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-08 07:42:28','2023-11-13 16:18:13',NULL,NULL,'b1b7e384-9f48-4c0b-aa55-14cea3c6549c'),
	(7,6,NULL,2,2,'craft\\elements\\Entry',1,0,'2023-07-08 07:44:13','2023-07-08 07:44:13',NULL,NULL,'641c59fb-33af-4be7-8fd1-0d64e1826218'),
	(8,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-07-08 07:52:28','2023-07-08 07:54:22',NULL,NULL,'bd9c0908-0e76-4c9f-b03e-eb5d84ab5054'),
	(9,8,NULL,3,3,'craft\\elements\\Entry',1,0,'2023-07-08 07:54:22','2023-07-08 07:54:22',NULL,NULL,'595ac5ef-1787-4d7d-8fe1-9d2381f65692'),
	(10,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2023-07-22 07:33:24','2023-11-10 16:32:17',NULL,NULL,'baa0c600-4391-4bdf-8708-ad100857786f'),
	(11,10,NULL,4,4,'craft\\elements\\Entry',1,0,'2023-07-22 07:33:24','2023-07-22 07:33:24',NULL,NULL,'9007c7cd-e918-4a14-85c9-c4d818756ba0'),
	(12,10,NULL,5,4,'craft\\elements\\Entry',1,0,'2023-07-22 07:33:24','2023-07-22 07:33:24',NULL,NULL,'396ac8e0-e11b-4639-ad3b-1cc6c15d75c3'),
	(13,10,NULL,6,4,'craft\\elements\\Entry',1,0,'2023-07-22 07:34:26','2023-07-22 07:34:26',NULL,NULL,'63829e59-f587-4185-ba4c-1837463392a0'),
	(14,NULL,NULL,NULL,5,'craft\\elements\\Asset',1,0,'2023-07-23 07:54:24','2023-11-10 16:48:03',NULL,NULL,'a03ec994-4acc-42e0-89e1-66ffef51fb5b'),
	(16,6,NULL,7,2,'craft\\elements\\Entry',1,0,'2023-07-23 08:05:13','2023-07-23 08:05:13',NULL,NULL,'e5161f7d-6bb0-4452-a49b-0b43c259310a'),
	(17,NULL,NULL,NULL,5,'craft\\elements\\Asset',1,0,'2023-07-23 08:13:24','2023-11-10 16:47:40',NULL,NULL,'57ef3645-0466-416f-94f5-9e7bbbaa4695'),
	(18,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-23 08:13:30','2023-11-13 16:18:26',NULL,NULL,'48d56591-1301-41da-abec-5f481c9d0d90'),
	(19,18,NULL,8,2,'craft\\elements\\Entry',1,0,'2023-07-23 08:14:14','2023-07-23 08:14:14',NULL,NULL,'142beaf4-6eb3-405c-b4a8-00bda7725852'),
	(20,18,NULL,9,2,'craft\\elements\\Entry',1,0,'2023-07-23 08:14:21','2023-07-23 08:14:21',NULL,NULL,'b2d8f0df-9e5b-43e5-88c6-1341dc132c57'),
	(21,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-11-10 12:50:04','2023-11-13 09:24:50',NULL,NULL,'04ae6268-060f-40d2-883d-14f93365e878'),
	(22,21,NULL,10,6,'craft\\elements\\Entry',1,0,'2023-11-10 12:50:17','2023-11-10 12:50:17',NULL,NULL,'056c89aa-6375-4b89-88b3-e5b55341b1ab'),
	(23,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-11-10 12:50:24','2023-11-10 12:50:33',NULL,NULL,'c9270c94-9dbc-42c1-b99d-8a1aa3aa046e'),
	(24,23,NULL,11,6,'craft\\elements\\Entry',1,0,'2023-11-10 12:50:33','2023-11-10 12:50:33',NULL,NULL,'180c6de7-9861-408d-a442-0e446d3b7a7e'),
	(25,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-11-10 12:50:39','2023-11-13 09:25:58',NULL,NULL,'2fea29ee-0372-4812-a176-156a744077c8'),
	(26,25,NULL,12,6,'craft\\elements\\Entry',1,0,'2023-11-10 12:50:50','2023-11-10 12:50:50',NULL,NULL,'09893b9e-408f-4780-8b9d-c03206ca3d65'),
	(27,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-11-10 12:51:09','2023-11-10 12:51:24',NULL,NULL,'fdddb46b-fb32-4469-8b8b-aacccd422b49'),
	(28,27,NULL,13,6,'craft\\elements\\Entry',1,0,'2023-11-10 12:51:24','2023-11-10 12:51:24',NULL,NULL,'c6f2c5a4-3ceb-4521-b6a0-9316dabb6734'),
	(30,21,NULL,14,6,'craft\\elements\\Entry',1,0,'2023-11-10 13:42:58','2023-11-10 13:42:58',NULL,NULL,'8385212a-449a-46b8-9f19-4be45c0f825d'),
	(31,10,NULL,15,4,'craft\\elements\\Entry',1,0,'2023-11-10 16:31:42','2023-11-10 16:31:42',NULL,NULL,'0a666093-478c-4c78-9e92-b95e9ca4974e'),
	(33,10,NULL,16,4,'craft\\elements\\Entry',1,0,'2023-11-10 16:32:17','2023-11-10 16:32:17',NULL,NULL,'3caf030a-289e-475d-ab03-4a110f8a6ffc'),
	(35,18,NULL,17,2,'craft\\elements\\Entry',1,0,'2023-11-10 16:46:17','2023-11-10 16:46:18',NULL,NULL,'7922b193-2586-4fc3-b369-fc1b172a52e9'),
	(37,NULL,NULL,NULL,5,'craft\\elements\\Asset',1,0,'2023-11-10 16:47:36','2023-11-10 16:47:36',NULL,'2023-11-10 16:47:40','fb3cd842-0f56-4bd7-ab0c-3fae0c055635'),
	(38,6,NULL,18,2,'craft\\elements\\Entry',1,0,'2023-11-10 16:47:45','2023-11-10 16:47:45',NULL,NULL,'7dd70c78-0b6e-4580-aeb6-974a208629d7'),
	(40,NULL,NULL,NULL,5,'craft\\elements\\Asset',1,0,'2023-11-10 16:47:59','2023-11-10 16:47:59',NULL,'2023-11-10 16:48:03','b598b17c-1950-49ce-93d2-bec2366b4c78'),
	(41,NULL,NULL,NULL,5,'craft\\elements\\Asset',1,0,'2023-11-10 16:48:08','2023-11-10 16:48:08',NULL,NULL,'a0f522ba-79bb-4cbd-be4d-549461fa4c68'),
	(42,6,NULL,19,2,'craft\\elements\\Entry',1,0,'2023-11-10 16:48:19','2023-11-10 16:48:19',NULL,NULL,'d9f0a260-27b1-4867-ae63-286b1eb176cb'),
	(43,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-11-10 16:48:21','2023-11-13 16:17:53',NULL,NULL,'217b1074-3475-4d98-a194-8fb10254707d'),
	(44,43,NULL,20,2,'craft\\elements\\Entry',1,0,'2023-11-10 16:48:40','2023-11-10 16:48:40',NULL,NULL,'1e81f432-bcd3-4606-b0c0-ba2bb41b8ab2'),
	(45,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-11-10 16:54:09','2023-11-10 18:49:44',NULL,NULL,'5d2f7ec9-c088-4542-901e-9e293a00282a'),
	(46,45,NULL,21,3,'craft\\elements\\Entry',1,0,'2023-11-10 16:54:42','2023-11-10 16:54:42',NULL,NULL,'46884531-70e2-40e8-b0dd-682b2421a76d'),
	(47,6,NULL,22,2,'craft\\elements\\Entry',1,0,'2023-11-10 17:03:14','2023-11-10 17:03:14',NULL,NULL,'c6d76fa1-591b-40d9-8e89-3f8d14c57993'),
	(48,6,NULL,23,2,'craft\\elements\\Entry',1,0,'2023-11-10 17:03:19','2023-11-10 17:03:19',NULL,NULL,'471a5e9f-afa5-485a-bd03-5113083da2ce'),
	(50,6,NULL,24,2,'craft\\elements\\Entry',1,0,'2023-11-10 17:03:42','2023-11-10 17:03:42',NULL,NULL,'da94ef47-0141-41eb-abc9-3c7d03d117ec'),
	(51,6,NULL,25,2,'craft\\elements\\Entry',1,0,'2023-11-10 18:10:27','2023-11-10 18:10:27',NULL,NULL,'2db679c2-e1a3-4fee-9de7-430667b1d1ad'),
	(53,6,NULL,26,2,'craft\\elements\\Entry',1,0,'2023-11-10 18:17:50','2023-11-10 18:17:50',NULL,NULL,'fd75359b-4108-4697-8238-cc54f70af01f'),
	(55,45,NULL,27,3,'craft\\elements\\Entry',1,0,'2023-11-10 18:49:44','2023-11-10 18:49:44',NULL,NULL,'39103577-abda-4f19-afbb-ec24a72ff0eb'),
	(57,21,NULL,28,6,'craft\\elements\\Entry',1,0,'2023-11-13 09:24:50','2023-11-13 09:24:50',NULL,NULL,'bf60113f-6fc0-42d6-8d54-c1f981d1626b'),
	(59,25,NULL,29,6,'craft\\elements\\Entry',1,0,'2023-11-13 09:25:58','2023-11-13 09:25:58',NULL,NULL,'7cd2d2cf-08f8-428c-a5c0-ee76c0e59175'),
	(60,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2023-11-13 10:25:20','2023-11-13 14:48:32',NULL,NULL,'6faafad6-92ae-4a50-bbba-5a8e55ad13a2'),
	(61,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:25:40','2023-11-13 10:25:40',NULL,'2023-11-13 10:25:49','44af0a06-0e74-44a0-aabe-59a048f52a6e'),
	(62,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:25:49','2023-11-13 10:25:49',NULL,'2023-11-13 10:25:50','640c3b25-ee9e-43d0-9a11-26def6432a57'),
	(63,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:25:50','2023-11-13 10:25:50',NULL,'2023-11-13 10:25:51','a32745bc-923a-4cd6-a6d2-d32e9f20a17c'),
	(64,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:25:51','2023-11-13 10:25:51',NULL,'2023-11-13 10:25:57','e5eedb6a-abbb-4298-a5e6-708a5ea487ca'),
	(65,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:25:51','2023-11-13 10:25:51',NULL,'2023-11-13 10:25:57','46d16290-d70d-4b88-ac31-cc058a35b772'),
	(66,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:25:57','2023-11-13 10:25:57',NULL,'2023-11-13 10:26:01','9561c792-80b3-493c-b980-4fd44bd5bada'),
	(67,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:25:57','2023-11-13 10:25:57',NULL,'2023-11-13 10:26:01','7cde9388-88cc-40ca-ba9c-43cd29d5c909'),
	(68,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:01','2023-11-13 10:26:01',NULL,'2023-11-13 10:26:03','c085db62-0e42-4f40-8377-122aaf509872'),
	(69,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:01','2023-11-13 10:26:01',NULL,'2023-11-13 10:26:03','de6a87eb-fc45-4704-a013-a012043f5bdf'),
	(70,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:03','2023-11-13 10:26:03',NULL,'2023-11-13 10:26:08','a1f6de0c-e199-4c66-97da-b5230171292d'),
	(71,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:03','2023-11-13 10:26:03',NULL,'2023-11-13 10:26:08','d84d707c-38ca-4cec-808a-4fb3c2e7e111'),
	(72,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:08','2023-11-13 10:26:08',NULL,'2023-11-13 10:26:14','580eac96-dccb-45f9-a1b4-41045a599ac9'),
	(73,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:08','2023-11-13 10:26:08',NULL,'2023-11-13 10:26:14','ab9be9d0-7505-4bcf-8416-d9905e0c839d'),
	(74,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:14','2023-11-13 10:26:14',NULL,'2023-11-13 10:26:15','f525dec5-8cce-48f4-b81c-b2ed42de2d92'),
	(75,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:14','2023-11-13 10:26:14',NULL,'2023-11-13 10:26:15','feb2ea2c-acfe-420b-93b9-0279adae1b1c'),
	(76,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:15','2023-11-13 10:26:15',NULL,'2023-11-13 10:26:21','7f5112c4-ea44-4db3-9a30-709d63ec5eb0'),
	(77,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:15','2023-11-13 10:26:15',NULL,'2023-11-13 10:26:21','86915685-403b-4d3c-8443-fb0ffa010d12'),
	(78,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:15','2023-11-13 10:26:15',NULL,'2023-11-13 10:26:21','81c257b4-965d-409a-a4cb-c03fa030dfd7'),
	(79,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:21','2023-11-13 10:26:21',NULL,'2023-11-13 10:26:22','104a136c-b7c3-4c5d-9214-81f5744f8ff7'),
	(80,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:21','2023-11-13 10:26:21',NULL,'2023-11-13 10:26:22','ba4e3b89-952f-46d2-82b9-97eaa5d1551b'),
	(81,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:21','2023-11-13 10:26:21',NULL,'2023-11-13 10:26:22','36686d8a-4452-48be-9ac0-4fbda0801b7a'),
	(82,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:22','2023-11-13 10:26:22',NULL,'2023-11-13 10:26:24','b09a9ae9-e4bc-4a59-a574-c2092ff09cb1'),
	(83,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:22','2023-11-13 10:26:22',NULL,'2023-11-13 10:26:24','262303bc-6a5c-417b-b718-c77c40f32c69'),
	(84,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:22','2023-11-13 10:26:22',NULL,'2023-11-13 10:26:24','4af63240-d1db-4a32-9d04-b9e00caddb8b'),
	(85,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:24','2023-11-13 10:26:24',NULL,'2023-11-13 10:26:31','46bd0f71-7ee1-4962-b311-05520e4a537f'),
	(86,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:24','2023-11-13 10:26:24',NULL,'2023-11-13 10:26:31','2add12f1-4a67-423f-aef2-cdd39c7d8d8f'),
	(87,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:24','2023-11-13 10:26:24',NULL,'2023-11-13 10:26:31','ac10d2b8-25a2-4de2-9275-6434a8affe4e'),
	(88,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:31','2023-11-13 10:26:31',NULL,'2023-11-13 10:26:32','ad9f21f8-d306-4f72-a736-7a8bf5dd7b79'),
	(89,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:31','2023-11-13 10:26:31',NULL,'2023-11-13 10:26:32','1bbeacb2-28f8-4cd1-9a8a-c8a7e58a7edd'),
	(90,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:31','2023-11-13 10:26:31',NULL,'2023-11-13 10:26:32','fa63c508-4ab6-4f81-9d00-ed99ee11e7fe'),
	(91,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:32','2023-11-13 10:26:32',NULL,'2023-11-13 10:26:53','e8bb1443-1032-4960-91f5-b35634d5bb36'),
	(92,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:32','2023-11-13 10:26:32',NULL,'2023-11-13 10:26:53','33eff333-3861-4cff-9a3e-17c71cdcf4c5'),
	(93,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:32','2023-11-13 10:26:32',NULL,'2023-11-13 10:26:53','427469eb-ba41-4093-8d37-6068553052f4'),
	(94,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:53','2023-11-13 10:26:53',NULL,'2023-11-13 10:26:58','2581155f-2a12-4ce8-b11b-df45570ad661'),
	(95,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:53','2023-11-13 10:26:53',NULL,'2023-11-13 10:26:58','a346861c-df3c-4621-9a7f-2ab9f35d72ac'),
	(96,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:53','2023-11-13 10:26:53',NULL,'2023-11-13 10:26:58','c35baff4-59bf-4a4c-a729-be79cd46ab92'),
	(97,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:53','2023-11-13 10:26:53',NULL,'2023-11-13 10:26:58','1e4a47cd-77de-4363-a983-f1ce1f630919'),
	(98,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:58','2023-11-13 10:26:58',NULL,'2023-11-13 10:27:05','139d324d-5d59-407a-a048-040c0d2c483e'),
	(99,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:58','2023-11-13 10:26:58',NULL,'2023-11-13 10:27:05','df794d74-ae3e-4f9f-a11e-8132b24b452b'),
	(100,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:58','2023-11-13 10:26:58',NULL,'2023-11-13 10:27:05','689fe25b-7142-4caa-b52e-8dc27e6ba1aa'),
	(101,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:58','2023-11-13 10:26:58',NULL,'2023-11-13 10:27:05','0cd25535-db40-4854-9e1c-23d8e706d2a7'),
	(102,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:26:58','2023-11-13 10:26:58',NULL,'2023-11-13 10:27:05','40a3ea7b-c4ad-4a68-a6a0-02948ad12711'),
	(103,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:04','2023-11-13 10:27:04',NULL,'2023-11-13 10:27:06','234542d7-e0f3-477c-8def-5170a9a299a8'),
	(104,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:05','2023-11-13 10:27:05',NULL,'2023-11-13 10:27:06','e7b27c98-83e4-4e34-95f5-90475541ad3e'),
	(105,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:05','2023-11-13 10:27:05',NULL,'2023-11-13 10:27:06','eab98c45-abd0-490a-bc32-1f3eebee9a82'),
	(106,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:05','2023-11-13 10:27:05',NULL,'2023-11-13 10:27:06','24955265-58de-4cc7-83c4-89eeb6eb963c'),
	(107,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:05','2023-11-13 10:27:05',NULL,'2023-11-13 10:27:06','c4a5592c-a722-4a80-8bd1-1fe9ad9480d2'),
	(108,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:06','2023-11-13 10:27:06',NULL,'2023-11-13 10:27:13','9e7bfcae-3cd7-48e3-8686-f03c175ae1a6'),
	(109,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:06','2023-11-13 10:27:06',NULL,'2023-11-13 10:27:13','3e2451ec-f1d4-4dd0-82b6-810c04a885d9'),
	(110,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:06','2023-11-13 10:27:06',NULL,'2023-11-13 10:27:13','7ed20fc3-c449-405b-99b9-9c97e55e66b5'),
	(111,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:06','2023-11-13 10:27:06',NULL,'2023-11-13 10:27:13','a891c9d3-bba6-4eb9-81fb-e5c627a44027'),
	(112,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:06','2023-11-13 10:27:06',NULL,'2023-11-13 10:27:13','a9b67442-b589-47ad-a38f-d852b81a119d'),
	(113,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:13','2023-11-13 10:27:13',NULL,'2023-11-13 10:27:16','b40acbe3-6125-4a69-b4ce-5551684db923'),
	(114,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:13','2023-11-13 10:27:13',NULL,'2023-11-13 10:27:16','340fdbae-173b-479b-9334-71457a56e9d4'),
	(115,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:13','2023-11-13 10:27:13',NULL,'2023-11-13 10:27:16','903abc58-3c19-45e2-831d-b4ba1a7acbe6'),
	(116,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:13','2023-11-13 10:27:13',NULL,'2023-11-13 10:27:16','8a99fe62-d439-412a-877b-e75ef373e0d2'),
	(117,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:13','2023-11-13 10:27:13',NULL,'2023-11-13 10:27:16','f0587d26-1e89-4b86-9c07-474c08bd6c47'),
	(118,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:16','2023-11-13 10:27:16',NULL,'2023-11-13 10:27:17','58e3a63d-5ddc-46dd-91d8-eaa73949a901'),
	(119,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:16','2023-11-13 10:27:16',NULL,'2023-11-13 10:27:17','20044eb9-c802-46b7-8c89-18330a3f9da5'),
	(120,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:16','2023-11-13 10:27:16',NULL,'2023-11-13 10:27:17','8a3f8dca-b85e-41a9-b4b1-190844ec077a'),
	(121,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:16','2023-11-13 10:27:16',NULL,'2023-11-13 10:27:17','b5eb6e94-cbf8-44cb-8627-138ea4069742'),
	(122,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:16','2023-11-13 10:27:16',NULL,'2023-11-13 10:27:17','ce14a4d1-eef9-4211-90f0-6d9c7a9a7942'),
	(123,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:17','2023-11-13 10:27:17',NULL,'2023-11-13 10:27:19','d7eeea4b-7396-49bd-9b89-cc7c3db212eb'),
	(124,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:17','2023-11-13 10:27:17',NULL,'2023-11-13 10:27:19','ac122dba-5465-48d7-8ff6-5f4ec6c84c51'),
	(125,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:17','2023-11-13 10:27:17',NULL,'2023-11-13 10:27:19','4aa4eab5-7d7e-4191-9469-c01354582abf'),
	(126,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:17','2023-11-13 10:27:17',NULL,'2023-11-13 10:27:19','533b0774-0e8b-4169-84f5-e38fa12e4627'),
	(127,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:17','2023-11-13 10:27:17',NULL,'2023-11-13 10:27:19','6fbc9ccb-7147-40ae-91e7-bf7c5ee1ad2c'),
	(128,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:18','2023-11-13 10:27:18',NULL,'2023-11-13 10:27:21','a16b9592-aa24-4006-b362-38079df81c70'),
	(129,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:18','2023-11-13 10:27:18',NULL,'2023-11-13 10:27:21','f4872012-4258-4ded-9f67-ef6ef069695e'),
	(130,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:19','2023-11-13 10:27:19',NULL,'2023-11-13 10:27:21','41d1320b-4d8d-4fb1-a7aa-f548af9bc8f4'),
	(131,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:19','2023-11-13 10:27:19',NULL,'2023-11-13 10:27:21','8e1bc271-edea-443f-b05e-5a600909cbf7'),
	(132,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:19','2023-11-13 10:27:19',NULL,'2023-11-13 10:27:21','bff403a0-70b3-49bd-bb25-1ba0c3f859bd'),
	(133,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:21','2023-11-13 10:27:21',NULL,'2023-11-13 10:27:24','e6b47983-da99-4914-899c-0e3b795b5ce9'),
	(134,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:21','2023-11-13 10:27:21',NULL,'2023-11-13 10:27:24','ca99eddc-dc2c-4944-86fc-d5dda5372a47'),
	(135,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:21','2023-11-13 10:27:21',NULL,'2023-11-13 10:27:24','1e95cb1d-41ad-4667-a26e-be970b3feaaa'),
	(136,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:21','2023-11-13 10:27:21',NULL,'2023-11-13 10:27:24','dc4d4e8e-ffde-42d5-b8dc-9dc71bcb7423'),
	(137,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:21','2023-11-13 10:27:21',NULL,'2023-11-13 10:27:24','d2066202-9a10-48ba-a086-8b1b6040d9e3'),
	(138,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:24','2023-11-13 10:27:24',NULL,'2023-11-13 10:27:26','dbbd9a7d-78fb-4d8a-a062-0f9ef142a505'),
	(139,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:24','2023-11-13 10:27:24',NULL,'2023-11-13 10:27:26','75ba89ce-752c-412a-a60f-d294e2ab1364'),
	(140,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:24','2023-11-13 10:27:24',NULL,'2023-11-13 10:27:26','86bc5d7b-81fe-47be-a74a-afb436076607'),
	(141,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:24','2023-11-13 10:27:24',NULL,'2023-11-13 10:27:26','2b55af72-ab38-463c-bdbe-b22cfa9a3437'),
	(142,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:24','2023-11-13 10:27:24',NULL,'2023-11-13 10:27:26','ff3ca49b-2ecc-4ffe-b916-a39c8c99b89a'),
	(143,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:26','2023-11-13 10:27:26',NULL,'2023-11-13 10:27:29','4dd477f4-315c-4c69-a77e-a3372cd90087'),
	(144,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:26','2023-11-13 10:27:26',NULL,'2023-11-13 10:27:29','285a6326-1bad-4478-96d2-91f1b03260a2'),
	(145,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:26','2023-11-13 10:27:26',NULL,'2023-11-13 10:27:29','a8685bbd-d572-49f1-8e32-92334d159670'),
	(146,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:26','2023-11-13 10:27:26',NULL,'2023-11-13 10:27:29','84a50a62-d87d-49be-aebd-658fbe0a5c80'),
	(147,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:26','2023-11-13 10:27:26',NULL,'2023-11-13 10:27:29','0e5f67c7-debe-410f-aa95-f5db0170418c'),
	(148,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:26','2023-11-13 10:27:26',NULL,'2023-11-13 10:27:29','d0600fed-6c08-4a75-9281-9f3e6ea85205'),
	(149,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:29','2023-11-13 10:27:29',NULL,'2023-11-13 10:27:33','8fd4d5b6-5285-49fa-8b43-c5ae73d5d2fd'),
	(150,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:29','2023-11-13 10:27:29',NULL,'2023-11-13 10:27:33','c4ea46c4-59da-472e-86a7-424140e56a94'),
	(151,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:29','2023-11-13 10:27:29',NULL,'2023-11-13 10:27:33','20eb139d-4ce9-43a6-9f6a-7a496374ca60'),
	(152,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:29','2023-11-13 10:27:29',NULL,'2023-11-13 10:27:33','2d27895f-0fe7-49a9-a402-d8e65c49b313'),
	(153,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:29','2023-11-13 10:27:29',NULL,'2023-11-13 10:27:33','5ebbdff4-1930-458e-a3dc-4a924940bcf0'),
	(154,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:29','2023-11-13 10:27:29',NULL,'2023-11-13 10:27:33','f105687e-ba39-4cfd-b24a-7d944d5c96ec'),
	(155,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:29','2023-11-13 10:27:29',NULL,'2023-11-13 10:27:33','0a2c67b3-c3ce-4ced-9a97-b4f23896a869'),
	(156,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:33','2023-11-13 10:27:33',NULL,'2023-11-13 10:27:41','66d4ab35-88b4-4bae-9d7d-4cef048c98b3'),
	(157,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:33','2023-11-13 10:27:33',NULL,'2023-11-13 10:27:41','4b3abb15-e9cd-475c-9b6e-723416c008f3'),
	(158,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:33','2023-11-13 10:27:33',NULL,'2023-11-13 10:27:41','266408b1-1c60-473e-829c-abcebf78309c'),
	(159,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:33','2023-11-13 10:27:33',NULL,'2023-11-13 10:27:41','a0e47743-fa49-4ee4-a83f-78b4c9207e33'),
	(160,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:33','2023-11-13 10:27:33',NULL,'2023-11-13 10:27:41','6c5eb6d5-ce77-4734-87b9-561fbad3d295'),
	(161,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:33','2023-11-13 10:27:33',NULL,'2023-11-13 10:27:42','26ef1397-4b0a-4ef6-8ef3-a3a94dec9abc'),
	(162,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:41','2023-11-13 10:27:41',NULL,'2023-11-13 10:27:44','8b8e2793-b11a-4a9b-980e-059ef6376a2d'),
	(163,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:41','2023-11-13 10:27:41',NULL,'2023-11-13 10:27:44','715fa0e6-8889-4290-8989-e07e4e5e54cc'),
	(164,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:41','2023-11-13 10:27:41',NULL,'2023-11-13 10:27:44','c016a9ee-b352-4489-8331-8b22f215e64f'),
	(165,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:41','2023-11-13 10:27:41',NULL,'2023-11-13 10:27:44','4a385460-00ef-46f7-a170-2b12c854a67a'),
	(166,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:41','2023-11-13 10:27:41',NULL,'2023-11-13 10:27:44','c46f5bf5-6081-40ab-bebc-9330bd4cf86b'),
	(167,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:41','2023-11-13 10:27:41',NULL,'2023-11-13 10:27:44','515e6147-fccf-4e8b-a220-ee2fa67d03ff'),
	(168,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:44','2023-11-13 10:27:44',NULL,'2023-11-13 10:27:45','26db3cec-889c-4808-8669-a8e877973586'),
	(169,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:44','2023-11-13 10:27:44',NULL,'2023-11-13 10:27:45','4c44bab1-ed1a-4de7-9843-2bb6661edda1'),
	(170,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:44','2023-11-13 10:27:44',NULL,'2023-11-13 10:27:45','17c6292e-0599-4949-84c9-866eeccb071f'),
	(171,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:44','2023-11-13 10:27:44',NULL,'2023-11-13 10:27:45','7e0ddfbc-898a-4eb0-9ee2-d8360e5bef0d'),
	(172,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:44','2023-11-13 10:27:44',NULL,'2023-11-13 10:27:45','6dc50218-3f89-4225-8419-9539ef8daee1'),
	(173,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:44','2023-11-13 10:27:44',NULL,'2023-11-13 10:27:45','cdda8ee2-e43f-4d77-973c-97d7ff221905'),
	(174,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:45','2023-11-13 10:27:45',NULL,'2023-11-13 10:27:50','cfae74e6-084b-4071-888a-be2cfaaf1332'),
	(175,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:45','2023-11-13 10:27:45',NULL,'2023-11-13 10:27:50','f362cc88-7355-409a-867c-9c4f8c18ba62'),
	(176,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:45','2023-11-13 10:27:45',NULL,'2023-11-13 10:27:50','ec5e68fc-bdba-48c8-bedd-5c8254bbf61c'),
	(177,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:45','2023-11-13 10:27:45',NULL,'2023-11-13 10:27:50','938d8509-0a4c-4f0b-86a2-df4c90111866'),
	(178,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:45','2023-11-13 10:27:45',NULL,'2023-11-13 10:27:50','937512a8-497d-4966-9f9a-58687e1bec4e'),
	(179,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:45','2023-11-13 10:27:45',NULL,'2023-11-13 10:27:50','f1a71279-68da-4672-b88d-39f7a655d49e'),
	(180,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:50','2023-11-13 10:27:50',NULL,'2023-11-13 10:27:52','473f576d-59fd-411b-8f66-643bdeaee155'),
	(181,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:50','2023-11-13 10:27:50',NULL,'2023-11-13 10:27:52','893cdd8c-acff-44fe-99f7-880f8b8d765e'),
	(182,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:50','2023-11-13 10:27:50',NULL,'2023-11-13 10:27:52','b94b6363-d78b-4910-b1a1-ce8c2aaf5f71'),
	(183,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:50','2023-11-13 10:27:50',NULL,'2023-11-13 10:27:52','c5a3e8c2-2946-4011-8496-48405faffb8d'),
	(184,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:50','2023-11-13 10:27:50',NULL,'2023-11-13 10:27:52','c0a0e0b6-08f8-4e5b-a435-de7c3ce63599'),
	(185,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:50','2023-11-13 10:27:50',NULL,'2023-11-13 10:27:52','3b27373c-d709-45a4-a350-a34d2572b8dd'),
	(186,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:52','2023-11-13 10:27:52',NULL,'2023-11-13 10:27:55','fdd8e0e6-1b4a-4acc-9a53-0b8c8c6ad896'),
	(187,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:52','2023-11-13 10:27:52',NULL,'2023-11-13 10:27:55','19b176e6-144a-43e6-801a-9e985f24faf8'),
	(188,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:52','2023-11-13 10:27:52',NULL,'2023-11-13 10:27:55','f121f524-127a-4ce0-a75b-a1b202d5dc18'),
	(189,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:52','2023-11-13 10:27:52',NULL,'2023-11-13 10:27:55','d2b0dc03-9706-40f5-9aea-14c95ad173e4'),
	(190,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:52','2023-11-13 10:27:52',NULL,'2023-11-13 10:27:55','7ac18109-7d5c-48bd-b860-e3e4b9ee8a9d'),
	(191,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:52','2023-11-13 10:27:52',NULL,'2023-11-13 10:27:55','f80c99cb-4157-434e-94b1-b92f01fbd5d1'),
	(192,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:55','2023-11-13 10:27:55',NULL,'2023-11-13 10:27:56','7da6e1a1-a232-47fc-ae13-583f58f138d7'),
	(193,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:55','2023-11-13 10:27:55',NULL,'2023-11-13 10:27:56','7b0f161c-5142-47ab-88fc-eb67611de2c9'),
	(194,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:55','2023-11-13 10:27:55',NULL,'2023-11-13 10:27:56','ea234ebf-e077-4254-85ab-47fd083c88a3'),
	(195,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:55','2023-11-13 10:27:55',NULL,'2023-11-13 10:27:56','6acad6f2-7664-4ddf-9b48-1c7101d89b11'),
	(196,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:55','2023-11-13 10:27:55',NULL,'2023-11-13 10:27:56','4d6cf433-ecab-47cb-afac-99e08352792d'),
	(197,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:55','2023-11-13 10:27:55',NULL,'2023-11-13 10:27:56','40606192-eb41-4613-8021-1030e90b9799'),
	(198,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:56','2023-11-13 10:27:56',NULL,'2023-11-13 10:27:57','47df23a7-0b94-42d3-8471-00e243c247a6'),
	(199,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:56','2023-11-13 10:27:56',NULL,'2023-11-13 10:27:57','f0c3749b-2561-4dd8-be5f-1ea3c223d85a'),
	(200,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:56','2023-11-13 10:27:56',NULL,'2023-11-13 10:27:57','a00c7c83-3881-419e-b700-6d5791fdd717'),
	(201,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:56','2023-11-13 10:27:56',NULL,'2023-11-13 10:27:57','fdf11791-8c24-4248-8444-13b919308726'),
	(202,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:56','2023-11-13 10:27:56',NULL,'2023-11-13 10:27:57','458508ea-1d54-4e9f-87c4-1bf6d4f51645'),
	(203,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:56','2023-11-13 10:27:56',NULL,'2023-11-13 10:27:57','5234c73c-3f2c-4b87-8ae5-ea502b4a31f7'),
	(204,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:56','2023-11-13 10:27:56',NULL,'2023-11-13 10:27:59','86e8d63a-a1dc-4fae-b142-a888a7b0fa1b'),
	(205,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:56','2023-11-13 10:27:56',NULL,'2023-11-13 10:27:59','f985d2be-cdb4-4abc-b150-d0f3605c9c1f'),
	(206,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:56','2023-11-13 10:27:56',NULL,'2023-11-13 10:27:59','a0f383c1-66ea-4b61-97c5-0c88945e4409'),
	(207,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:56','2023-11-13 10:27:56',NULL,'2023-11-13 10:27:59','182344fc-20e3-43f1-80a1-a8365d90ec26'),
	(208,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:56','2023-11-13 10:27:56',NULL,'2023-11-13 10:27:59','2b669deb-15c9-46aa-88e0-ffc358299280'),
	(209,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:57','2023-11-13 10:27:57',NULL,'2023-11-13 10:27:59','9150d996-cf0a-4bb2-9fcb-50c29ef307b1'),
	(210,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:59','2023-11-13 10:27:59',NULL,'2023-11-13 10:28:00','a630cde2-a244-4839-8b4d-fa7f16259341'),
	(211,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:59','2023-11-13 10:27:59',NULL,'2023-11-13 10:28:00','96691a7a-c12d-481b-a40d-fb83cf59fb64'),
	(212,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:59','2023-11-13 10:27:59',NULL,'2023-11-13 10:28:00','4e3d7fab-6d36-46a8-8237-6096adafc10c'),
	(213,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:59','2023-11-13 10:27:59',NULL,'2023-11-13 10:28:00','6191e99d-72f4-4cfa-b263-990a561af60f'),
	(214,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:59','2023-11-13 10:27:59',NULL,'2023-11-13 10:28:00','7de769ac-dcc1-490f-86c0-f2e316060357'),
	(215,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:27:59','2023-11-13 10:27:59',NULL,'2023-11-13 10:28:00','2a83d4d9-f591-4a4e-b259-0ac9434451dc'),
	(216,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:00','2023-11-13 10:28:00',NULL,'2023-11-13 10:28:05','bc109f52-e255-4890-9f7d-0a7d56aea039'),
	(217,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:00','2023-11-13 10:28:00',NULL,'2023-11-13 10:28:05','e86c421b-43bd-471b-b405-9c307c08cc1b'),
	(218,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:00','2023-11-13 10:28:00',NULL,'2023-11-13 10:28:05','d2630b5d-0b27-4d95-bad5-f50794cf8848'),
	(219,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:00','2023-11-13 10:28:00',NULL,'2023-11-13 10:28:05','65d49f4d-972e-4d57-b6b3-ae6670f74500'),
	(220,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:00','2023-11-13 10:28:00',NULL,'2023-11-13 10:28:05','c699fda4-2f15-49b7-ab86-8d8c1e8d0fb6'),
	(221,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:00','2023-11-13 10:28:00',NULL,'2023-11-13 10:28:05','8ba3f0ad-2c7c-4335-b115-bb006ccfb55b'),
	(222,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:00','2023-11-13 10:28:00',NULL,'2023-11-13 10:28:05','070cf77f-6792-4feb-b52d-25afd9275dd9'),
	(223,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:05','2023-11-13 10:28:05',NULL,'2023-11-13 10:28:13','5bb9dce0-8066-436d-9f3d-232c1c81c8c2'),
	(224,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:05','2023-11-13 10:28:05',NULL,'2023-11-13 10:28:13','eb03af67-5cf9-47e0-a783-5f0a03e4bdb3'),
	(225,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:05','2023-11-13 10:28:05',NULL,'2023-11-13 10:28:13','7195c6a7-5ee8-4e0c-abb5-92995b9d15d0'),
	(226,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:05','2023-11-13 10:28:05',NULL,'2023-11-13 10:28:13','e0f770b8-1ef8-4850-8676-91c74350a78b'),
	(227,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:05','2023-11-13 10:28:05',NULL,'2023-11-13 10:28:13','b1ebdd43-d762-47f3-a59a-716596f0079d'),
	(228,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:05','2023-11-13 10:28:05',NULL,'2023-11-13 10:28:13','77a9f586-f4cb-48c2-8f4a-79a8a9a6a652'),
	(229,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:05','2023-11-13 10:28:05',NULL,'2023-11-13 10:28:13','3557bd26-4d10-455a-a318-548a9a05b757'),
	(230,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:13','2023-11-13 10:28:13',NULL,'2023-11-13 10:28:16','88a1662d-662e-4174-bab9-dce19f324197'),
	(231,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:13','2023-11-13 10:28:13',NULL,'2023-11-13 10:28:16','0a2c027d-b193-4c1b-8656-559d2542affb'),
	(232,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:13','2023-11-13 10:28:13',NULL,'2023-11-13 10:28:16','4b53c074-cff1-40af-be19-31d509a4541b'),
	(233,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:13','2023-11-13 10:28:13',NULL,'2023-11-13 10:28:16','43c745ae-8aab-45c9-a55c-1592815b806f'),
	(234,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:13','2023-11-13 10:28:13',NULL,'2023-11-13 10:28:16','6550a451-853f-42ff-b396-1c9536a74f53'),
	(235,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:13','2023-11-13 10:28:13',NULL,'2023-11-13 10:28:16','cd71a885-8670-44e5-b2da-8596fd493841'),
	(236,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:13','2023-11-13 10:28:13',NULL,'2023-11-13 10:28:16','ef9eb301-bb2d-4296-bd64-e5df33513d6e'),
	(237,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:16','2023-11-13 10:28:16',NULL,'2023-11-13 10:28:19','37bdbc7b-9eba-4abc-87f7-20e2024338e5'),
	(238,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:16','2023-11-13 10:28:16',NULL,'2023-11-13 10:28:19','ca5d049b-7f29-4e85-803e-a13152c77ead'),
	(239,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:16','2023-11-13 10:28:16',NULL,'2023-11-13 10:28:19','26f99b78-3ffd-4534-8818-1866fa8796f6'),
	(240,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:16','2023-11-13 10:28:16',NULL,'2023-11-13 10:28:19','7b5d7b2d-cd93-4b6b-adc6-411a971bb5a3'),
	(241,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:16','2023-11-13 10:28:16',NULL,'2023-11-13 10:28:19','f57c92e6-8a79-4ad6-9139-e037042ebc4f'),
	(242,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:16','2023-11-13 10:28:16',NULL,'2023-11-13 10:28:19','7095f022-c11b-4e7c-94e8-39623174bfe5'),
	(243,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:16','2023-11-13 10:28:16',NULL,'2023-11-13 10:28:19','e7e65de1-2814-4f5c-a7ee-e57f07432049'),
	(244,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:16','2023-11-13 10:28:16',NULL,'2023-11-13 10:28:19','c42c31ef-8f0e-4cd9-859e-06f4fa633c90'),
	(245,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:19','2023-11-13 10:28:19',NULL,'2023-11-13 10:28:22','2b58ab67-1a6a-4103-b01a-ccdb30866f34'),
	(246,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:19','2023-11-13 10:28:19',NULL,'2023-11-13 10:28:22','1bff3f76-8607-4edb-9a6e-3b8a2c5fdc00'),
	(247,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:19','2023-11-13 10:28:19',NULL,'2023-11-13 10:28:22','06e15759-5393-4dd0-9605-ff3de3210880'),
	(248,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:19','2023-11-13 10:28:19',NULL,'2023-11-13 10:28:22','f57dfe4c-ca35-4fb2-85e4-52c5fc853a6f'),
	(249,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:19','2023-11-13 10:28:19',NULL,'2023-11-13 10:28:22','35cdb2c0-43b8-4240-ac49-49db4f8b7b4e'),
	(250,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:19','2023-11-13 10:28:19',NULL,'2023-11-13 10:28:22','85b8c4d6-5fab-438b-8788-16ab54f485d7'),
	(251,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:19','2023-11-13 10:28:19',NULL,'2023-11-13 10:28:22','f0d89872-19fc-473a-b4f9-52ba902d2a85'),
	(252,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:19','2023-11-13 10:28:19',NULL,'2023-11-13 10:28:22','4fe27d83-ecc7-46ff-a71d-c47658e44c13'),
	(253,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:22','2023-11-13 10:28:22',NULL,'2023-11-13 10:28:24','3335d2a5-279f-4b4c-8a99-3c0a49e64851'),
	(254,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:22','2023-11-13 10:28:22',NULL,'2023-11-13 10:28:24','daf99a5c-08e4-46ab-bf21-b9cc30fe7183'),
	(255,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:22','2023-11-13 10:28:22',NULL,'2023-11-13 10:28:24','b29dcb39-2e12-40f9-9253-c67027c1e1de'),
	(256,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:22','2023-11-13 10:28:22',NULL,'2023-11-13 10:28:24','aa810811-a2cb-46b6-b189-e9b046a0e16a'),
	(257,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:22','2023-11-13 10:28:22',NULL,'2023-11-13 10:28:24','8121e63a-3994-4df3-8e2e-acef59985fa9'),
	(258,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:22','2023-11-13 10:28:22',NULL,'2023-11-13 10:28:24','527c3b77-ece3-47fb-a502-5834240b1364'),
	(259,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:22','2023-11-13 10:28:22',NULL,'2023-11-13 10:28:24','cb23968e-64c1-497c-b21e-4b58694942d4'),
	(260,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:22','2023-11-13 10:28:22',NULL,'2023-11-13 10:28:24','aca9ce83-8f44-4e99-ba9e-22a70740c23a'),
	(261,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:24','2023-11-13 10:28:24',NULL,'2023-11-13 10:28:26','7c9bedac-c3df-4781-a492-12cfce43d6be'),
	(262,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:24','2023-11-13 10:28:24',NULL,'2023-11-13 10:28:26','be0649e2-d392-48ff-89da-433dc440cdf8'),
	(263,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:24','2023-11-13 10:28:24',NULL,'2023-11-13 10:28:26','b2955691-db2c-40af-a6ad-ee95062030c1'),
	(264,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:24','2023-11-13 10:28:24',NULL,'2023-11-13 10:28:26','26722e3a-1b6b-4c66-b022-f4920ad65901'),
	(265,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:24','2023-11-13 10:28:24',NULL,'2023-11-13 10:28:26','5046b3f6-0737-4456-93dd-7b7832a31c90'),
	(266,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:24','2023-11-13 10:28:24',NULL,'2023-11-13 10:28:26','683674c2-3188-48f5-8550-8160f0cf23a3'),
	(267,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:24','2023-11-13 10:28:24',NULL,'2023-11-13 10:28:26','68e83327-7c06-46c1-bb60-bb84782614da'),
	(268,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:24','2023-11-13 10:28:24',NULL,'2023-11-13 10:28:26','c853c16c-47bc-442a-9136-5302907f3ea3'),
	(269,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:26','2023-11-13 10:28:26',NULL,'2023-11-13 10:28:29','64b0c67e-13dd-48aa-8313-2dcf43fff391'),
	(270,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:26','2023-11-13 10:28:26',NULL,'2023-11-13 10:28:29','e6d65134-36c3-4d69-b484-4641fdeea801'),
	(271,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:26','2023-11-13 10:28:26',NULL,'2023-11-13 10:28:29','743d6043-536f-4f5d-a4a9-b191cf3e7fe1'),
	(272,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:26','2023-11-13 10:28:26',NULL,'2023-11-13 10:28:29','4c43992c-421b-4fe4-81c1-6ed82fe05d3b'),
	(273,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:26','2023-11-13 10:28:26',NULL,'2023-11-13 10:28:29','ae6d9cf8-0fab-4bda-a188-9125070d6c98'),
	(274,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:26','2023-11-13 10:28:26',NULL,'2023-11-13 10:28:29','7b67eacf-53e2-4bee-a998-18d03a9cd029'),
	(275,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:26','2023-11-13 10:28:26',NULL,'2023-11-13 10:28:29','4907d7ea-4470-437c-80de-ed67cbef2781'),
	(276,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:26','2023-11-13 10:28:26',NULL,'2023-11-13 10:28:29','6b056a15-a447-463c-b35a-2d7f9ccced9a'),
	(277,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:29','2023-11-13 10:28:29',NULL,'2023-11-13 10:28:32','a7d7f134-1294-47dc-ab41-2499e495b580'),
	(278,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:29','2023-11-13 10:28:29',NULL,'2023-11-13 10:28:32','920aece7-2fa4-47cb-a151-9eb8c065dc65'),
	(279,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:29','2023-11-13 10:28:29',NULL,'2023-11-13 10:28:32','7ad849c8-bff5-4bf7-b4d9-2b25eb92d9b0'),
	(280,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:29','2023-11-13 10:28:29',NULL,'2023-11-13 10:28:32','347a32e0-ca4c-4ef9-89ec-f45ac9970819'),
	(281,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:29','2023-11-13 10:28:29',NULL,'2023-11-13 10:28:32','34cc18ed-334e-41ca-a678-f679d098e444'),
	(282,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:29','2023-11-13 10:28:29',NULL,'2023-11-13 10:28:32','32930259-f113-411b-a3fe-6288412fe403'),
	(283,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:29','2023-11-13 10:28:29',NULL,'2023-11-13 10:28:32','6b2cd12c-4b69-4d23-b197-f3763e30c8df'),
	(284,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:29','2023-11-13 10:28:29',NULL,'2023-11-13 10:28:32','376baee9-4c84-4f6c-a111-492f6c2e45b6'),
	(285,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:32','2023-11-13 10:28:32',NULL,'2023-11-13 10:28:33','d064147c-5bbc-4d56-9ab3-5c98e02f8fda'),
	(286,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:32','2023-11-13 10:28:32',NULL,'2023-11-13 10:28:33','0a96b568-20ff-4398-8827-8b6429ae195f'),
	(287,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:32','2023-11-13 10:28:32',NULL,'2023-11-13 10:28:33','53887d45-5171-47af-a37a-c860575cf49c'),
	(288,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:32','2023-11-13 10:28:32',NULL,'2023-11-13 10:28:33','7172dfed-3321-4fdb-bf3c-62d9416fb4f6'),
	(289,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:32','2023-11-13 10:28:32',NULL,'2023-11-13 10:28:33','61af5818-b49e-4035-8b59-539da1751a2a'),
	(290,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:32','2023-11-13 10:28:32',NULL,'2023-11-13 10:28:33','08e6e356-9a15-4f4a-9dc1-76bf8c7a3191'),
	(291,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:32','2023-11-13 10:28:32',NULL,'2023-11-13 10:28:33','9f5b20e5-1093-4212-aadc-6b93ce6eaa33'),
	(292,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:32','2023-11-13 10:28:32',NULL,'2023-11-13 10:28:33','511e6276-3738-43b8-84d6-cefa11b3b62c'),
	(293,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:33','2023-11-13 10:28:33',NULL,'2023-11-13 10:28:34','f7baee5d-930d-4be5-a461-811b51f8e204'),
	(294,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:33','2023-11-13 10:28:33',NULL,'2023-11-13 10:28:34','19a22575-815d-477c-8806-3da71a9a31a0'),
	(295,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:33','2023-11-13 10:28:33',NULL,'2023-11-13 10:28:34','ce03bb5b-c8c0-4452-a2f3-23e2770e0f79'),
	(296,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:33','2023-11-13 10:28:33',NULL,'2023-11-13 10:28:34','268bbf49-f588-459e-8652-7ed90daf6f02'),
	(297,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:33','2023-11-13 10:28:33',NULL,'2023-11-13 10:28:34','663fcad0-a6e4-4bb1-9060-9bafaecabf95'),
	(298,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:33','2023-11-13 10:28:33',NULL,'2023-11-13 10:28:34','c130ad7a-3d8b-4c89-ab18-2a3eac59219d'),
	(299,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:33','2023-11-13 10:28:33',NULL,'2023-11-13 10:28:34','b7e3354a-4990-4f9c-a929-2898fb1ec658'),
	(300,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:33','2023-11-13 10:28:33',NULL,'2023-11-13 10:28:34','65365337-b2d0-4820-bf2f-20f26ce587b1'),
	(301,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:34','2023-11-13 10:28:34',NULL,'2023-11-13 10:28:37','54f5464f-6608-4f2e-a12b-c3732e1437a8'),
	(302,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:34','2023-11-13 10:28:34',NULL,'2023-11-13 10:28:37','c85fa3c5-dcc6-4232-8bd8-ac156a1aaf07'),
	(303,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:34','2023-11-13 10:28:34',NULL,'2023-11-13 10:28:37','7f3ffa0d-49d7-4893-a357-dd4532aeba39'),
	(304,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:34','2023-11-13 10:28:34',NULL,'2023-11-13 10:28:37','fc3ba528-9f69-417f-86c0-afae122839bb'),
	(305,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:34','2023-11-13 10:28:34',NULL,'2023-11-13 10:28:37','3cf610c1-5e9f-494c-ba61-28c395470ded'),
	(306,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:34','2023-11-13 10:28:34',NULL,'2023-11-13 10:28:37','2de863d5-d75c-4d3b-8c78-7af9a04c8f90'),
	(307,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:34','2023-11-13 10:28:34',NULL,'2023-11-13 10:28:37','84a48cbc-b0cf-487e-822d-2a9e8cfe06bd'),
	(308,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:34','2023-11-13 10:28:34',NULL,'2023-11-13 10:28:37','e135068f-45ba-4194-8636-2d2d46985772'),
	(309,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 14:48:32',NULL,NULL,'a5223c3b-1519-4fb6-8ef4-00caefef80a6'),
	(310,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:45',NULL,NULL,'c5a9e483-7008-4838-920b-bfb2df7d6619'),
	(311,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:45',NULL,NULL,'cd856e2b-04b8-425d-9377-27fdc2e654d0'),
	(312,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:45',NULL,NULL,'ff607e57-a3eb-47a7-b406-b6c7ce1ced5d'),
	(313,NULL,NULL,NULL,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:45',NULL,NULL,'8ae9a2d2-81ad-4a8e-a941-d6d49ba82234'),
	(314,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:45',NULL,NULL,'9030902f-7343-4ac9-9083-568cdb691ab4'),
	(315,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:45',NULL,NULL,'e64fc700-16bd-4c88-9009-d7c5961bfc91'),
	(316,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:45',NULL,NULL,'1f0a27d0-75a3-4ce0-b823-7808d0ef183a'),
	(317,60,NULL,30,7,'craft\\elements\\Entry',1,0,'2023-11-13 10:28:39','2023-11-13 10:28:39',NULL,NULL,'7cd9011e-7eb4-4d21-9350-178899ff7b80'),
	(318,309,NULL,31,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:17',NULL,NULL,'a77dd631-1830-4574-8c57-fc63a716224a'),
	(319,310,NULL,32,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:17',NULL,NULL,'b5b1aa66-d5ea-4988-bec6-e5c18f9cbe2f'),
	(320,311,NULL,33,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:17',NULL,NULL,'dfc22563-c976-44f4-ad2d-b2d3c334056e'),
	(321,312,NULL,34,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:17',NULL,NULL,'f58a9e7e-687c-4a60-b202-7d0872d0236e'),
	(322,313,NULL,35,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:17',NULL,NULL,'e6108ed0-0147-414e-abe7-34d6c338cf21'),
	(323,314,NULL,36,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:17',NULL,NULL,'6272d8c4-485a-40fc-b5f0-0fb3c1522e35'),
	(324,315,NULL,37,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:17',NULL,NULL,'a7de7331-7533-4f67-b51b-4b4385518426'),
	(325,316,NULL,38,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:28:37','2023-11-13 10:32:17',NULL,NULL,'0695a887-18eb-451a-bc7a-4038a665a9dd'),
	(326,NULL,NULL,NULL,13,'craft\\elements\\Category',1,0,'2023-11-13 11:20:33','2023-11-13 11:20:51',NULL,NULL,'7d5d2287-3dc8-44ce-a062-2ff7a01d9033'),
	(328,60,NULL,39,7,'craft\\elements\\Entry',1,0,'2023-11-13 11:22:39','2023-11-13 11:22:39',NULL,NULL,'35518f93-1843-4730-9e57-fb27ffc22bcd'),
	(329,309,NULL,40,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 11:22:40',NULL,NULL,'13ef6815-1fef-474a-a630-ce493e3be80a'),
	(330,310,NULL,41,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 11:22:40',NULL,NULL,'a0eb4d91-ed40-4c47-ba7b-c94ac438f1f2'),
	(331,311,NULL,42,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 11:22:40',NULL,NULL,'25abb379-1567-43f2-9edc-cb94e74ad350'),
	(332,312,NULL,43,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 11:22:40',NULL,NULL,'6912faca-d6e2-4d00-ab90-8f9d107ada95'),
	(333,313,NULL,44,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 11:22:40',NULL,NULL,'30f80876-c237-4efd-aca9-c95bc5b182da'),
	(334,314,NULL,45,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 11:22:40',NULL,NULL,'3692b253-49ca-4357-a6c2-e285efc1576e'),
	(335,315,NULL,46,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 11:22:40',NULL,NULL,'43e04c46-8509-49b1-a5fc-7d529e9ab74a'),
	(336,316,NULL,47,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 11:22:40',NULL,NULL,'faac2eba-9312-4d02-88ed-f4a416d1973d'),
	(338,NULL,NULL,NULL,13,'craft\\elements\\Category',1,0,'2023-11-13 14:44:43','2023-11-13 14:45:01',NULL,NULL,'d63b883a-9883-437d-b696-7bbe97276226'),
	(339,NULL,NULL,NULL,13,'craft\\elements\\Category',1,0,'2023-11-13 14:45:03','2023-11-13 14:45:21',NULL,NULL,'806c148d-8c7b-4508-be91-037681730599'),
	(341,43,NULL,48,2,'craft\\elements\\Entry',1,0,'2023-11-13 14:45:29','2023-11-13 14:45:29',NULL,NULL,'c008dde5-d9a2-40a1-90cc-d79be66e4ead'),
	(343,18,NULL,49,2,'craft\\elements\\Entry',1,0,'2023-11-13 14:45:35','2023-11-13 14:45:35',NULL,NULL,'acd7a813-05d2-478d-9645-85d2ec29e57a'),
	(344,6,NULL,50,2,'craft\\elements\\Entry',1,0,'2023-11-13 14:45:38','2023-11-13 14:45:38',NULL,NULL,'dd32da29-ff28-45a0-a156-226315572941'),
	(347,60,NULL,51,7,'craft\\elements\\Entry',1,0,'2023-11-13 14:48:32','2023-11-13 14:48:33',NULL,NULL,'31759aef-b6e9-4792-8106-ab1188752686'),
	(348,309,NULL,52,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 14:48:32','2023-11-13 14:48:33',NULL,NULL,'0aad7165-cec6-42f2-9844-ae5cf72c5521'),
	(349,310,NULL,53,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 14:48:33',NULL,NULL,'86f2da25-705a-4bc3-acc4-71b42538850b'),
	(350,311,NULL,54,9,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 14:48:33',NULL,NULL,'db7648d5-4b3f-40c6-a09b-76f99b0c43f1'),
	(351,312,NULL,55,10,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 14:48:33',NULL,NULL,'0333d1da-1429-43fd-bddb-c23ccaed3cf0'),
	(352,313,NULL,56,12,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 14:48:33',NULL,NULL,'5b467ba4-e805-495a-9a3c-7c1cf7d76eab'),
	(353,314,NULL,57,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 14:48:33',NULL,NULL,'0a5e8f44-71a7-48af-9ffb-c9c0d76efa16'),
	(354,315,NULL,58,8,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 14:48:33',NULL,NULL,'1b88f2e7-94cf-41c1-b1aa-f644c772ba31'),
	(355,316,NULL,59,11,'craft\\elements\\MatrixBlock',1,0,'2023-11-13 10:32:45','2023-11-13 14:48:33',NULL,NULL,'9db0d31d-e1b1-4d87-9098-8380fb03f104'),
	(356,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-11-13 14:49:23','2023-11-13 16:18:31',NULL,NULL,'4480f1b7-ed2a-43f2-9d1c-ffef6c4c0c9f'),
	(357,356,NULL,60,2,'craft\\elements\\Entry',1,0,'2023-11-13 14:50:05','2023-11-13 14:50:05',NULL,NULL,'66600214-ad9b-4a25-a44c-2fb7c2cfd42e'),
	(358,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2023-11-13 16:17:04','2023-11-13 16:17:19',NULL,NULL,'9b1cfcbd-ef81-4a1f-88b4-7cd0c93e525f'),
	(359,358,NULL,61,7,'craft\\elements\\Entry',1,0,'2023-11-13 16:17:19','2023-11-13 16:17:19',NULL,NULL,'65519665-2507-4f99-b332-5b6ff4fad8ca'),
	(360,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2023-11-13 16:17:23','2023-11-13 16:17:35',NULL,NULL,'968cff03-32ab-40a8-a525-b2cd5d1496e7'),
	(361,360,NULL,62,7,'craft\\elements\\Entry',1,0,'2023-11-13 16:17:35','2023-11-13 16:17:35',NULL,NULL,'a94c7cee-081d-43c0-a348-69e2a3899273'),
	(363,356,NULL,63,2,'craft\\elements\\Entry',1,0,'2023-11-13 16:17:42','2023-11-13 16:17:42',NULL,NULL,'95486694-0382-4f72-bf6b-f89b9c64e0eb'),
	(365,43,NULL,64,2,'craft\\elements\\Entry',1,0,'2023-11-13 16:17:53','2023-11-13 16:17:53',NULL,NULL,'469b5661-20f4-4085-91a5-365a1069ae4e'),
	(367,6,NULL,65,2,'craft\\elements\\Entry',1,0,'2023-11-13 16:18:13','2023-11-13 16:18:13',NULL,NULL,'098217bc-c4a8-4b20-aca5-00a435549eab'),
	(369,18,NULL,66,2,'craft\\elements\\Entry',1,0,'2023-11-13 16:18:26','2023-11-13 16:18:26',NULL,NULL,'c181d573-690a-4a8e-bb7f-65ef29d95ab6'),
	(370,356,NULL,67,2,'craft\\elements\\Entry',1,0,'2023-11-13 16:18:31','2023-11-13 16:18:31',NULL,NULL,'896d58fc-6d26-46ae-9dc5-c11be238b572');

/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_elements_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements_sites`;

CREATE TABLE `craft_elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_vyyogffswatjytbtlfinlgdwflrpmxnyksmj` (`elementId`,`siteId`),
  KEY `craft_idx_vmijndtvdfgwttklmxiqgvjbdaaoveqanwtu` (`siteId`),
  KEY `craft_idx_jgwrhvafoxsxgwvhjhpcgcidqymgbucjmclm` (`slug`,`siteId`),
  KEY `craft_idx_utpkfapicaovzfgoxhbasponkhewcjfrskah` (`enabled`),
  KEY `craft_idx_jkimnmlyeoyjihvhxoojjoxdtxpaewelihlb` (`uri`,`siteId`),
  CONSTRAINT `craft_fk_cxljrfkewbjwkjjqdbaqwcwtflynemwtmydj` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_hfzbdwagsxurwycfioputjseiupjozvkngvf` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_elements_sites` WRITE;
/*!40000 ALTER TABLE `craft_elements_sites` DISABLE KEYS */;

INSERT INTO `craft_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,NULL,NULL,1,'2023-06-23 21:48:48','2023-06-23 21:48:48','de810c46-99ef-4f3e-b148-82dfc793d367'),
	(2,2,1,'hello-world','hello-world',1,'2023-06-28 21:19:50','2023-06-28 21:19:57','b3fb3987-1916-4382-9770-05cae0612ef8'),
	(3,3,1,'hello-world','hello-world',1,'2023-06-28 21:20:50','2023-06-28 21:20:50','0f59c2d9-4e08-4e7c-8394-36b21d3357b2'),
	(4,4,1,'__temp_rcaqdaxgtmszpawzbbydnahyxwkknpxluccr','drinks/__temp_rcaqdaxgtmszpawzbbydnahyxwkknpxluccr',1,'2023-07-07 22:43:10','2023-07-07 22:43:10','5e1a8f28-2dd3-46fd-bedc-8e3413617f43'),
	(5,5,1,'__temp_kmdklxjxqnvkpiotdvlsymylcfuhwymrsgug','drinks/__temp_kmdklxjxqnvkpiotdvlsymylcfuhwymrsgug',1,'2023-07-07 22:44:01','2023-07-07 22:44:01','ffd9f7df-ef07-48cc-9f99-9ff5c0558f04'),
	(6,6,1,'espresso','drinks/espresso',1,'2023-07-08 07:42:28','2023-07-08 07:42:40','92d63e7c-6cbd-48b4-bcca-0df71d162763'),
	(7,7,1,'espresso','drinks/espresso',1,'2023-07-08 07:44:13','2023-07-08 07:44:13','fd32d02b-d6a3-404a-a651-5163b64abc4f'),
	(8,8,1,'new-coffee-coming-soon','news/new-coffee-coming-soon',1,'2023-07-08 07:52:28','2023-07-08 07:53:53','7377847a-8d68-414e-b21f-a194118a74c6'),
	(9,9,1,'new-coffee-coming-soon','news/new-coffee-coming-soon',1,'2023-07-08 07:54:22','2023-07-08 07:54:22','566e28cb-2711-45fc-b396-f0220cd7696a'),
	(10,10,1,'homepage','__home__',1,'2023-07-22 07:33:24','2023-07-22 07:33:24','a7b2e09e-6ed1-4431-ac9c-ce6644b8beb1'),
	(11,11,1,'homepage','__home__',1,'2023-07-22 07:33:24','2023-07-22 07:33:24','666eb9b9-25a1-41e5-a8cb-c71e0571117c'),
	(12,12,1,'homepage','__home__',1,'2023-07-22 07:33:24','2023-07-22 07:33:24','18d6f55a-4c37-4625-ba7a-b5eeb1a5f8a2'),
	(13,13,1,'homepage','__home__',1,'2023-07-22 07:34:26','2023-07-22 07:34:26','7620df70-4fb0-4c58-bcc2-24183d30d9fb'),
	(14,14,1,NULL,NULL,1,'2023-07-23 07:54:24','2023-07-23 07:54:24','859afe3b-d999-470a-9fb0-75988d0b7bb0'),
	(16,16,1,'espresso','drinks/espresso',1,'2023-07-23 08:05:13','2023-07-23 08:05:13','472fa824-b334-4000-875b-1b0152a15292'),
	(17,17,1,NULL,NULL,1,'2023-07-23 08:13:24','2023-07-23 08:13:24','8a483c2a-d1bc-47e0-841d-0ba4af80de64'),
	(18,18,1,'iced-coffee','drinks/iced-coffee',1,'2023-07-23 08:13:30','2023-07-23 08:13:41','4bdf429e-3d9c-4480-85f8-2a6a5ec55b84'),
	(19,19,1,'iced-coffee','drinks/iced-coffee',1,'2023-07-23 08:14:14','2023-07-23 08:14:14','4fb84929-e12d-48c0-8b9f-5a0aac16e539'),
	(20,20,1,'iced-coffee','drinks/iced-coffee',1,'2023-07-23 08:14:21','2023-07-23 08:14:21','f85857b8-ba62-4045-b237-c9f55fc88cfd'),
	(21,21,1,'about','about',1,'2023-11-10 12:50:04','2023-11-10 13:38:01','6e7859bf-4c9d-42e2-ba84-c0339137ba19'),
	(22,22,1,'about','about/about',1,'2023-11-10 12:50:17','2023-11-10 12:50:17','c89bc417-badc-4621-aad6-4ba83640431c'),
	(23,23,1,'locations','about/locations',1,'2023-11-10 12:50:24','2023-11-13 09:25:09','5d21c61d-7a6d-4f58-a916-75e73753df02'),
	(24,24,1,'locations','about/locations',1,'2023-11-10 12:50:33','2023-11-10 12:50:33','594f9d2b-bf40-4d71-91b7-9d2c80af93ac'),
	(25,25,1,'austin-tx','about/locations/austin-tx',1,'2023-11-10 12:50:39','2023-11-10 13:38:02','5c825905-bc6d-4e8a-aeb4-d438c09d24c8'),
	(26,26,1,'austin-tx','about/austin-tx',1,'2023-11-10 12:50:50','2023-11-10 12:50:50','cf4b191b-62ef-44d6-8382-2d08a24050b7'),
	(27,27,1,'mission-statement','about/mission-statement',1,'2023-11-10 12:51:09','2023-11-13 09:25:09','9330dddb-a045-48f7-bd92-1603de1d8560'),
	(28,28,1,'mission-statement','about/mission-statement',1,'2023-11-10 12:51:24','2023-11-10 12:51:24','76581ce9-1331-4234-a13e-003a7a5f664a'),
	(30,30,1,'about','about',1,'2023-11-10 13:42:58','2023-11-10 13:42:58','6fd7a31d-10bb-424c-8d2e-085a1a8cf573'),
	(31,31,1,'homepage','__home__',1,'2023-11-10 16:31:42','2023-11-10 16:31:42','e1fb7088-6d3f-478e-85e6-dc3ae59a27c5'),
	(33,33,1,'homepage','__home__',1,'2023-11-10 16:32:17','2023-11-10 16:32:17','fb3530a6-0161-4a46-a44d-5ed1f8ab26bd'),
	(35,35,1,'iced-coffee','drinks/iced-coffee',1,'2023-11-10 16:46:18','2023-11-10 16:46:18','8685c0a2-f7eb-45d6-a9f8-824f0c74f89c'),
	(37,37,1,NULL,NULL,1,'2023-11-10 16:47:36','2023-11-10 16:47:36','89c3e32a-3666-4c04-a676-fac2d6884ef1'),
	(38,38,1,'espresso','drinks/espresso',1,'2023-11-10 16:47:45','2023-11-10 16:47:45','2d849c9b-4505-473b-a5eb-7e3bf9ed2469'),
	(40,40,1,NULL,NULL,1,'2023-11-10 16:47:59','2023-11-10 16:47:59','92d5702c-f910-4d61-ac3a-2e584ab0d24e'),
	(41,41,1,NULL,NULL,1,'2023-11-10 16:48:08','2023-11-10 16:48:08','27451460-6add-4293-b1cb-c55e1746cba6'),
	(42,42,1,'espresso','drinks/espresso',1,'2023-11-10 16:48:19','2023-11-10 16:48:19','5884fcc1-c9fa-4355-8c1c-cb5f29380fa5'),
	(43,43,1,'chemex','drinks/chemex',1,'2023-11-10 16:48:21','2023-11-10 16:48:26','41ef78fb-6beb-4339-b02d-da4557e18821'),
	(44,44,1,'chemex','drinks/chemex',1,'2023-11-10 16:48:40','2023-11-10 16:48:40','4e3c294c-c151-4825-b806-65e95bcaa032'),
	(45,45,1,'another-news-story','news/another-news-story',1,'2023-11-10 16:54:09','2023-11-10 16:54:20','389255ff-853d-4483-bdba-ef35c16cd1bc'),
	(46,46,1,'another-news-story','news/another-news-story',1,'2023-11-10 16:54:42','2023-11-10 16:54:42','fd0aba24-b2d3-416d-83b8-ca73829a5b5a'),
	(47,47,1,'espresso','drinks/espresso',1,'2023-11-10 17:03:14','2023-11-10 17:03:14','e28bb3c0-1e11-4b2c-9174-913c31648390'),
	(48,48,1,'espresso','drinks/espresso',1,'2023-11-10 17:03:19','2023-11-10 17:03:19','e9c9f114-d829-4e5f-9534-6049d8be4255'),
	(50,50,1,'espresso','drinks/espresso',1,'2023-11-10 17:03:42','2023-11-10 17:03:42','9bacbbed-b60b-4b47-b22f-2de0f68cf98f'),
	(51,51,1,'espresso','drinks/espresso',1,'2023-11-10 18:10:27','2023-11-10 18:10:27','0a90f035-219a-43e0-96fc-55c9795ca531'),
	(53,53,1,'espresso','drinks/espresso',1,'2023-11-10 18:17:50','2023-11-10 18:17:50','504cf1c7-ed05-40d8-bf9a-5e56c97899d8'),
	(55,55,1,'another-news-story','news/another-news-story',1,'2023-11-10 18:49:44','2023-11-10 18:49:44','65b23385-a401-45e3-9be3-c1bf6ff6447c'),
	(57,57,1,'about','about',1,'2023-11-13 09:24:50','2023-11-13 09:24:50','9e7cd11b-1134-46cb-8533-a70931943265'),
	(59,59,1,'austin-tx','about/locations/austin-tx',1,'2023-11-13 09:25:58','2023-11-13 09:25:58','42b66709-ac5f-441a-a4e2-fd79c6c565af'),
	(60,60,1,'perfect-espresso','recipes/perfect-espresso',1,'2023-11-13 10:25:20','2023-11-13 10:32:17','f55b78c8-9770-40e5-ab60-68684ed4ba11'),
	(61,61,1,NULL,NULL,1,'2023-11-13 10:25:40','2023-11-13 10:25:40','c58f148a-f67d-4031-9073-6af6b55fcb3f'),
	(62,62,1,NULL,NULL,1,'2023-11-13 10:25:49','2023-11-13 10:25:49','29c5e152-ea3f-4e09-b58f-f6a4cff8209e'),
	(63,63,1,NULL,NULL,1,'2023-11-13 10:25:50','2023-11-13 10:25:50','77c717b9-d625-4eb6-974f-6e3767c2a0aa'),
	(64,64,1,NULL,NULL,1,'2023-11-13 10:25:51','2023-11-13 10:25:51','0e946cae-dfa3-4a88-965c-07c469a54da0'),
	(65,65,1,NULL,NULL,1,'2023-11-13 10:25:51','2023-11-13 10:25:51','772ff3ac-fc1c-4334-8960-c130c248a0cb'),
	(66,66,1,NULL,NULL,1,'2023-11-13 10:25:57','2023-11-13 10:25:57','bad04827-074e-4c15-b128-2b377a97cac4'),
	(67,67,1,NULL,NULL,1,'2023-11-13 10:25:57','2023-11-13 10:25:57','f8409f3d-67c7-42dd-b47a-33e20caad538'),
	(68,68,1,NULL,NULL,1,'2023-11-13 10:26:01','2023-11-13 10:26:01','07711e56-ed25-4628-bff7-3178a8c285b7'),
	(69,69,1,NULL,NULL,1,'2023-11-13 10:26:01','2023-11-13 10:26:01','0e174c2d-c59f-4c8a-80e2-5056c38380d9'),
	(70,70,1,NULL,NULL,1,'2023-11-13 10:26:03','2023-11-13 10:26:03','11ab18fe-2820-4e14-a822-3ddfbc6162ed'),
	(71,71,1,NULL,NULL,1,'2023-11-13 10:26:03','2023-11-13 10:26:03','33791eb6-afb9-425c-875f-4372e37f6fd8'),
	(72,72,1,NULL,NULL,1,'2023-11-13 10:26:08','2023-11-13 10:26:08','3b2f256e-6057-4c0d-9fae-d326364f0353'),
	(73,73,1,NULL,NULL,1,'2023-11-13 10:26:08','2023-11-13 10:26:08','cee965ac-09f4-463d-b23e-658e0f20f8b3'),
	(74,74,1,NULL,NULL,1,'2023-11-13 10:26:14','2023-11-13 10:26:14','c6c11f66-088c-4de8-9399-da9d6adaf87b'),
	(75,75,1,NULL,NULL,1,'2023-11-13 10:26:14','2023-11-13 10:26:14','50e432fd-e839-4693-98ff-70d7fdd2a67a'),
	(76,76,1,NULL,NULL,1,'2023-11-13 10:26:15','2023-11-13 10:26:15','f24c7e75-72d8-4b97-8da8-db846f990d44'),
	(77,77,1,NULL,NULL,1,'2023-11-13 10:26:15','2023-11-13 10:26:15','3140d88d-86ff-4dbb-b493-529554a48a3a'),
	(78,78,1,NULL,NULL,1,'2023-11-13 10:26:15','2023-11-13 10:26:15','de520190-b3c5-4b41-8065-90ceffd9a94a'),
	(79,79,1,NULL,NULL,1,'2023-11-13 10:26:21','2023-11-13 10:26:21','6499f322-5ace-4130-89ad-44788ae32b41'),
	(80,80,1,NULL,NULL,1,'2023-11-13 10:26:21','2023-11-13 10:26:21','6286008d-b30f-454c-b0aa-69e77fd20213'),
	(81,81,1,NULL,NULL,1,'2023-11-13 10:26:21','2023-11-13 10:26:21','916abd19-cf3a-414a-a5a2-e7cc07c22e64'),
	(82,82,1,NULL,NULL,1,'2023-11-13 10:26:22','2023-11-13 10:26:22','05f83670-0971-4b28-8a46-b32ea6a36f9c'),
	(83,83,1,NULL,NULL,1,'2023-11-13 10:26:22','2023-11-13 10:26:22','1f121ee5-6c95-4a24-bb8d-ecbae1a0eda7'),
	(84,84,1,NULL,NULL,1,'2023-11-13 10:26:22','2023-11-13 10:26:22','0997e1bf-3158-4858-bbc3-2053b2e3f3b2'),
	(85,85,1,NULL,NULL,1,'2023-11-13 10:26:24','2023-11-13 10:26:24','08dba438-ea62-4958-8efb-794db564fbaa'),
	(86,86,1,NULL,NULL,1,'2023-11-13 10:26:24','2023-11-13 10:26:24','3263c2c7-9331-45fb-bfec-44b3310baddb'),
	(87,87,1,NULL,NULL,1,'2023-11-13 10:26:24','2023-11-13 10:26:24','79e68dbf-cf58-4745-874e-24747e4ec9de'),
	(88,88,1,NULL,NULL,1,'2023-11-13 10:26:31','2023-11-13 10:26:31','e7d16525-0ac1-497e-b8e2-4955e60ecaf4'),
	(89,89,1,NULL,NULL,1,'2023-11-13 10:26:31','2023-11-13 10:26:31','2c479bd3-efe3-475b-bd8c-449ad396c1f4'),
	(90,90,1,NULL,NULL,1,'2023-11-13 10:26:31','2023-11-13 10:26:31','151d11c6-4aa7-4abc-a341-f3e24122ccfa'),
	(91,91,1,NULL,NULL,1,'2023-11-13 10:26:32','2023-11-13 10:26:32','3bf264dd-3e2b-4701-9543-6387c052b26f'),
	(92,92,1,NULL,NULL,1,'2023-11-13 10:26:32','2023-11-13 10:26:32','91d20ecf-d0cf-4a9c-8b32-455feaaa5845'),
	(93,93,1,NULL,NULL,1,'2023-11-13 10:26:32','2023-11-13 10:26:32','ecfd7618-a9bf-46a4-95f3-62712da46906'),
	(94,94,1,NULL,NULL,1,'2023-11-13 10:26:53','2023-11-13 10:26:53','ce8e3dbf-c5c1-4633-a2e8-ec77798ea0ac'),
	(95,95,1,NULL,NULL,1,'2023-11-13 10:26:53','2023-11-13 10:26:53','d228d7d0-cff2-454c-88bf-2b0617520853'),
	(96,96,1,NULL,NULL,1,'2023-11-13 10:26:53','2023-11-13 10:26:53','31322174-08c4-4832-b27a-bb362aa3a50b'),
	(97,97,1,NULL,NULL,1,'2023-11-13 10:26:53','2023-11-13 10:26:53','3d7a94ce-ca70-405c-a199-49fec0d875f0'),
	(98,98,1,NULL,NULL,1,'2023-11-13 10:26:58','2023-11-13 10:26:58','01de1ec9-d034-4ca5-80b8-2bdce846d827'),
	(99,99,1,NULL,NULL,1,'2023-11-13 10:26:58','2023-11-13 10:26:58','88de79c8-3189-487c-b60d-cd9cf30a2865'),
	(100,100,1,NULL,NULL,1,'2023-11-13 10:26:58','2023-11-13 10:26:58','a6b9867e-c098-47d6-af4c-0acaf43f19c1'),
	(101,101,1,NULL,NULL,1,'2023-11-13 10:26:58','2023-11-13 10:26:58','271cdc3c-633e-4450-a04f-3cc005e58e57'),
	(102,102,1,NULL,NULL,1,'2023-11-13 10:26:58','2023-11-13 10:26:58','c5e47a23-f164-44a4-a39c-140f86d96608'),
	(103,103,1,NULL,NULL,1,'2023-11-13 10:27:04','2023-11-13 10:27:04','50a18bcd-db8d-40e1-92c1-c8f1492c7d6e'),
	(104,104,1,NULL,NULL,1,'2023-11-13 10:27:05','2023-11-13 10:27:05','d0dd53da-8334-45e1-9f98-c6a364738b2c'),
	(105,105,1,NULL,NULL,1,'2023-11-13 10:27:05','2023-11-13 10:27:05','231b931c-2147-4c04-932e-85b61b4cc62a'),
	(106,106,1,NULL,NULL,1,'2023-11-13 10:27:05','2023-11-13 10:27:05','5fcb49d5-dba4-4940-b66b-3b843d8825ce'),
	(107,107,1,NULL,NULL,1,'2023-11-13 10:27:05','2023-11-13 10:27:05','d7692046-74d0-4915-acd7-e470b251c92e'),
	(108,108,1,NULL,NULL,1,'2023-11-13 10:27:06','2023-11-13 10:27:06','d68f79c5-a7ec-43b2-bb0d-5894e761c226'),
	(109,109,1,NULL,NULL,1,'2023-11-13 10:27:06','2023-11-13 10:27:06','ee1e52d6-f547-44c1-91b9-debb6b18db11'),
	(110,110,1,NULL,NULL,1,'2023-11-13 10:27:06','2023-11-13 10:27:06','cddedfa9-37dd-4116-a901-a6588aab31b8'),
	(111,111,1,NULL,NULL,1,'2023-11-13 10:27:06','2023-11-13 10:27:06','d2ab9388-03ab-4e77-9532-49977c6b9a82'),
	(112,112,1,NULL,NULL,1,'2023-11-13 10:27:06','2023-11-13 10:27:06','746af602-687f-40f0-bf28-cbede238863f'),
	(113,113,1,NULL,NULL,1,'2023-11-13 10:27:13','2023-11-13 10:27:13','51a5d90f-9aef-426a-ae7f-f1cd68e6ab2f'),
	(114,114,1,NULL,NULL,1,'2023-11-13 10:27:13','2023-11-13 10:27:13','628ccde7-5fc6-4c9b-9a6f-4b69c6a1a2c3'),
	(115,115,1,NULL,NULL,1,'2023-11-13 10:27:13','2023-11-13 10:27:13','768db3e5-145d-45d3-ac57-507423c73c53'),
	(116,116,1,NULL,NULL,1,'2023-11-13 10:27:13','2023-11-13 10:27:13','01add39f-2c64-4428-a265-7e099e4c3801'),
	(117,117,1,NULL,NULL,1,'2023-11-13 10:27:13','2023-11-13 10:27:13','01020045-ccef-44b4-9c21-dd1f2775a3dc'),
	(118,118,1,NULL,NULL,1,'2023-11-13 10:27:16','2023-11-13 10:27:16','46ca5420-a993-40b7-a2f9-571ae3272359'),
	(119,119,1,NULL,NULL,1,'2023-11-13 10:27:16','2023-11-13 10:27:16','bd4aa3e0-74ba-4fb2-8475-0438e574d321'),
	(120,120,1,NULL,NULL,1,'2023-11-13 10:27:16','2023-11-13 10:27:16','391e0432-8106-45ec-8425-fc4a0cab516c'),
	(121,121,1,NULL,NULL,1,'2023-11-13 10:27:16','2023-11-13 10:27:16','3ba84390-c6e6-44e6-aba3-a935931ec6e3'),
	(122,122,1,NULL,NULL,1,'2023-11-13 10:27:16','2023-11-13 10:27:16','7a1e263b-e842-485c-8eaa-fe4b3d749f25'),
	(123,123,1,NULL,NULL,1,'2023-11-13 10:27:17','2023-11-13 10:27:17','383fdea0-bc33-43d1-84db-3d1cf0623501'),
	(124,124,1,NULL,NULL,1,'2023-11-13 10:27:17','2023-11-13 10:27:17','deab5f51-4569-4d46-a5be-4162fff6f10c'),
	(125,125,1,NULL,NULL,1,'2023-11-13 10:27:17','2023-11-13 10:27:17','4870d188-f5d9-41e4-882d-fff072772408'),
	(126,126,1,NULL,NULL,1,'2023-11-13 10:27:17','2023-11-13 10:27:17','a7f002b6-e07c-4436-a088-06f33e8e56d2'),
	(127,127,1,NULL,NULL,1,'2023-11-13 10:27:17','2023-11-13 10:27:17','13f8ce06-332c-4c37-8353-eaae8817c105'),
	(128,128,1,NULL,NULL,1,'2023-11-13 10:27:18','2023-11-13 10:27:18','494f5f99-45fb-414d-92e5-3d6e15c34fc7'),
	(129,129,1,NULL,NULL,1,'2023-11-13 10:27:18','2023-11-13 10:27:18','1ac787fc-79e6-4e23-9285-11c8a7c76d9d'),
	(130,130,1,NULL,NULL,1,'2023-11-13 10:27:19','2023-11-13 10:27:19','f512cac1-6be4-42d4-83c6-b4c25456165b'),
	(131,131,1,NULL,NULL,1,'2023-11-13 10:27:19','2023-11-13 10:27:19','ae79fcaf-ad1d-4bc1-af7d-dd3017b7a918'),
	(132,132,1,NULL,NULL,1,'2023-11-13 10:27:19','2023-11-13 10:27:19','04fc7feb-d478-4485-b99b-17eea87f05b8'),
	(133,133,1,NULL,NULL,1,'2023-11-13 10:27:21','2023-11-13 10:27:21','45a5858c-fe10-4bf6-9c71-14e559000358'),
	(134,134,1,NULL,NULL,1,'2023-11-13 10:27:21','2023-11-13 10:27:21','32e5a5d9-3157-4f83-b1f8-0d843855dcc7'),
	(135,135,1,NULL,NULL,1,'2023-11-13 10:27:21','2023-11-13 10:27:21','0b5290d6-94bb-4778-af3e-914127859ccc'),
	(136,136,1,NULL,NULL,1,'2023-11-13 10:27:21','2023-11-13 10:27:21','b1d9aa88-b392-4004-9265-902d5ce5fbef'),
	(137,137,1,NULL,NULL,1,'2023-11-13 10:27:21','2023-11-13 10:27:21','4b1987fd-6e7c-46ef-a5c7-3c494c2cf6ea'),
	(138,138,1,NULL,NULL,1,'2023-11-13 10:27:24','2023-11-13 10:27:24','ac6fc5d0-7213-4318-baff-82c322d7121a'),
	(139,139,1,NULL,NULL,1,'2023-11-13 10:27:24','2023-11-13 10:27:24','357b8ae8-a772-4de1-b86d-64ad0a089b27'),
	(140,140,1,NULL,NULL,1,'2023-11-13 10:27:24','2023-11-13 10:27:24','0164414d-e6a8-4827-b5ea-f0bf8ddd90f3'),
	(141,141,1,NULL,NULL,1,'2023-11-13 10:27:24','2023-11-13 10:27:24','5bb98fbc-0889-426e-aaeb-e3c5f024f947'),
	(142,142,1,NULL,NULL,1,'2023-11-13 10:27:24','2023-11-13 10:27:24','16c7a089-3108-4700-82b2-c681c2cace11'),
	(143,143,1,NULL,NULL,1,'2023-11-13 10:27:26','2023-11-13 10:27:26','6df697e4-05b6-40ee-ac73-6040e9fa5f6c'),
	(144,144,1,NULL,NULL,1,'2023-11-13 10:27:26','2023-11-13 10:27:26','18923847-6dba-43f5-8bd0-2cb83fbcc764'),
	(145,145,1,NULL,NULL,1,'2023-11-13 10:27:26','2023-11-13 10:27:26','8c5857c6-a583-437d-b33c-efd29074b116'),
	(146,146,1,NULL,NULL,1,'2023-11-13 10:27:26','2023-11-13 10:27:26','b3155cc1-794a-434f-ac61-4d9a1f5a5807'),
	(147,147,1,NULL,NULL,1,'2023-11-13 10:27:26','2023-11-13 10:27:26','41696601-6d92-4a00-ad98-95dec272c24e'),
	(148,148,1,NULL,NULL,1,'2023-11-13 10:27:26','2023-11-13 10:27:26','571ef0be-5b92-425c-b1f1-415aabb03d16'),
	(149,149,1,NULL,NULL,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','52a56b00-7457-4e18-bd63-0b679734ec36'),
	(150,150,1,NULL,NULL,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','4817e895-8b29-4d08-bb1d-521da7bf48ee'),
	(151,151,1,NULL,NULL,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','44ece5af-266c-42d3-ae8f-4e0a0bd7c88a'),
	(152,152,1,NULL,NULL,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','2fa68ad0-6220-4710-b033-eab527614af4'),
	(153,153,1,NULL,NULL,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','4601de31-6169-4980-af99-d185da2de073'),
	(154,154,1,NULL,NULL,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','9cc3934f-d77b-4d56-b9df-3bd72b7a30de'),
	(155,155,1,NULL,NULL,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','5152ddcf-7225-4603-8b8f-651da4de566f'),
	(156,156,1,NULL,NULL,1,'2023-11-13 10:27:33','2023-11-13 10:27:33','ca167ee9-2d6a-452f-9557-e9299904ec46'),
	(157,157,1,NULL,NULL,1,'2023-11-13 10:27:33','2023-11-13 10:27:33','53e3d06c-8735-4186-be35-f4ac1b441c71'),
	(158,158,1,NULL,NULL,1,'2023-11-13 10:27:33','2023-11-13 10:27:33','a40c8e3b-b6c7-4db1-bd19-51e674478c8a'),
	(159,159,1,NULL,NULL,1,'2023-11-13 10:27:33','2023-11-13 10:27:33','1d91eacc-8236-45f7-bc06-212631a15480'),
	(160,160,1,NULL,NULL,1,'2023-11-13 10:27:33','2023-11-13 10:27:33','cdd1efd3-e476-4185-87ac-b69a9fd30aaf'),
	(161,161,1,NULL,NULL,1,'2023-11-13 10:27:33','2023-11-13 10:27:33','34f96818-f476-4756-89bc-566b41168bb1'),
	(162,162,1,NULL,NULL,1,'2023-11-13 10:27:41','2023-11-13 10:27:41','872923e0-4b43-455c-a558-2b35b6b05346'),
	(163,163,1,NULL,NULL,1,'2023-11-13 10:27:41','2023-11-13 10:27:41','ec9e5225-8da4-411a-85f2-7183f2d8b744'),
	(164,164,1,NULL,NULL,1,'2023-11-13 10:27:41','2023-11-13 10:27:41','5ed63c13-e263-47dc-ad88-3922b654941d'),
	(165,165,1,NULL,NULL,1,'2023-11-13 10:27:41','2023-11-13 10:27:41','e6c50cec-ef77-4d37-a297-aa95694667ba'),
	(166,166,1,NULL,NULL,1,'2023-11-13 10:27:41','2023-11-13 10:27:41','b1194339-e035-4e3e-8280-2a0d913e1cc8'),
	(167,167,1,NULL,NULL,1,'2023-11-13 10:27:41','2023-11-13 10:27:41','3534ed5b-8802-4672-a3e0-eb90d3a5e007'),
	(168,168,1,NULL,NULL,1,'2023-11-13 10:27:44','2023-11-13 10:27:44','b100aa66-f7e4-44ee-9546-8ef6b8e4cddc'),
	(169,169,1,NULL,NULL,1,'2023-11-13 10:27:44','2023-11-13 10:27:44','419fd230-5cb8-46a8-aab0-8de3b7f62557'),
	(170,170,1,NULL,NULL,1,'2023-11-13 10:27:44','2023-11-13 10:27:44','317f3076-4df9-403a-b96a-b2a3191f846e'),
	(171,171,1,NULL,NULL,1,'2023-11-13 10:27:44','2023-11-13 10:27:44','b16b8793-affc-4c0c-bfb5-1f875df9019b'),
	(172,172,1,NULL,NULL,1,'2023-11-13 10:27:44','2023-11-13 10:27:44','36b2e6db-7ccb-4536-9e69-16d16333bda3'),
	(173,173,1,NULL,NULL,1,'2023-11-13 10:27:44','2023-11-13 10:27:44','7f5785fc-7843-46d5-97db-8a41c01deb02'),
	(174,174,1,NULL,NULL,1,'2023-11-13 10:27:45','2023-11-13 10:27:45','54cb34cc-52d7-4614-8b4e-6e140981614b'),
	(175,175,1,NULL,NULL,1,'2023-11-13 10:27:45','2023-11-13 10:27:45','12cd8a6c-299e-40bc-8c06-e6bbd1a26cc8'),
	(176,176,1,NULL,NULL,1,'2023-11-13 10:27:45','2023-11-13 10:27:45','8bc6b50e-4429-48d7-b056-53c16890675c'),
	(177,177,1,NULL,NULL,1,'2023-11-13 10:27:45','2023-11-13 10:27:45','d295f81d-fd59-4d2b-a7ca-91024a4b854a'),
	(178,178,1,NULL,NULL,1,'2023-11-13 10:27:45','2023-11-13 10:27:45','8b758a9f-a4fd-4006-b534-11900903fe46'),
	(179,179,1,NULL,NULL,1,'2023-11-13 10:27:45','2023-11-13 10:27:45','e5a7eabb-0008-432c-b0a2-343b33fdbea5'),
	(180,180,1,NULL,NULL,1,'2023-11-13 10:27:50','2023-11-13 10:27:50','5203fb24-47b5-467e-9048-321d1fe75840'),
	(181,181,1,NULL,NULL,1,'2023-11-13 10:27:50','2023-11-13 10:27:50','f8ff8bbb-eaa3-43aa-93a3-5a3df0b2430e'),
	(182,182,1,NULL,NULL,1,'2023-11-13 10:27:50','2023-11-13 10:27:50','caff6760-f826-4e9c-aaf5-e9b715b0d128'),
	(183,183,1,NULL,NULL,1,'2023-11-13 10:27:50','2023-11-13 10:27:50','90f9c069-4775-4bd4-a17d-e81adf9e0bdd'),
	(184,184,1,NULL,NULL,1,'2023-11-13 10:27:50','2023-11-13 10:27:50','a870026a-2922-40ad-b386-204c5fed2af5'),
	(185,185,1,NULL,NULL,1,'2023-11-13 10:27:50','2023-11-13 10:27:50','5d8de096-af62-41a6-a52f-5c3dc5d2a8fb'),
	(186,186,1,NULL,NULL,1,'2023-11-13 10:27:52','2023-11-13 10:27:52','7f8b328e-344e-47f4-aaa0-85e0be600546'),
	(187,187,1,NULL,NULL,1,'2023-11-13 10:27:52','2023-11-13 10:27:52','72d63824-9b0b-43b3-8354-d3772707e9e4'),
	(188,188,1,NULL,NULL,1,'2023-11-13 10:27:52','2023-11-13 10:27:52','bdaf3a4d-2b5e-479e-b609-71271ddc06f6'),
	(189,189,1,NULL,NULL,1,'2023-11-13 10:27:52','2023-11-13 10:27:52','bfc9677d-0282-4b97-94cf-b94627be78d0'),
	(190,190,1,NULL,NULL,1,'2023-11-13 10:27:52','2023-11-13 10:27:52','21cb2efa-beea-451b-9d17-65db0161c777'),
	(191,191,1,NULL,NULL,1,'2023-11-13 10:27:52','2023-11-13 10:27:52','e683123a-3aaa-4737-b205-b9acc82d9398'),
	(192,192,1,NULL,NULL,1,'2023-11-13 10:27:55','2023-11-13 10:27:55','314994c3-9057-4bb1-927c-704a527cf5d2'),
	(193,193,1,NULL,NULL,1,'2023-11-13 10:27:55','2023-11-13 10:27:55','70e735db-1020-48f7-ba9f-c9bdc20afa4c'),
	(194,194,1,NULL,NULL,1,'2023-11-13 10:27:55','2023-11-13 10:27:55','96715784-e57d-49a4-85be-b25ace975dac'),
	(195,195,1,NULL,NULL,1,'2023-11-13 10:27:55','2023-11-13 10:27:55','8af73037-fbbb-46f1-9ba4-451106f829f9'),
	(196,196,1,NULL,NULL,1,'2023-11-13 10:27:55','2023-11-13 10:27:55','68d0f284-c379-4f13-b3dd-96bfccf8f86f'),
	(197,197,1,NULL,NULL,1,'2023-11-13 10:27:55','2023-11-13 10:27:55','be702f48-f96b-4b71-bdd6-9c7802a90961'),
	(198,198,1,NULL,NULL,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','01b3d8e2-f40f-4ea6-9cd4-c00fb9fe5675'),
	(199,199,1,NULL,NULL,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','43828974-dd85-4dbb-a026-f5dce554ca15'),
	(200,200,1,NULL,NULL,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','ced62416-aa85-47ba-8c90-e319c9bf8745'),
	(201,201,1,NULL,NULL,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','5452dc0a-5d35-4a32-8163-ca25580fccaa'),
	(202,202,1,NULL,NULL,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','372b7658-11b9-47c6-a6b4-39b150152a5d'),
	(203,203,1,NULL,NULL,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','e40e25a0-020c-4451-af23-f18fc7fc4240'),
	(204,204,1,NULL,NULL,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','6351d61c-bcfd-4329-989e-2868568ca544'),
	(205,205,1,NULL,NULL,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','15926e1d-b8c1-4324-bc82-8031c1e4e94b'),
	(206,206,1,NULL,NULL,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','1dd94dc3-040b-44f5-bbfe-640e25ec2e48'),
	(207,207,1,NULL,NULL,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','748a02e5-caf1-45c8-aa1d-01e417d80788'),
	(208,208,1,NULL,NULL,1,'2023-11-13 10:27:57','2023-11-13 10:27:57','37b5f0c2-58ad-4863-8735-f1e191fee9c2'),
	(209,209,1,NULL,NULL,1,'2023-11-13 10:27:57','2023-11-13 10:27:57','399831a7-fe32-4501-a170-fdb838f79915'),
	(210,210,1,NULL,NULL,1,'2023-11-13 10:27:59','2023-11-13 10:27:59','ba89ac82-868c-48fd-8415-090297f0fc3f'),
	(211,211,1,NULL,NULL,1,'2023-11-13 10:27:59','2023-11-13 10:27:59','782ed0c1-c311-47e0-b8b8-4009e8a29800'),
	(212,212,1,NULL,NULL,1,'2023-11-13 10:27:59','2023-11-13 10:27:59','f32a95a0-88d0-40cf-88f2-8b68ff4b6550'),
	(213,213,1,NULL,NULL,1,'2023-11-13 10:27:59','2023-11-13 10:27:59','582a0c5e-fc25-4a06-8b96-84a5d1890012'),
	(214,214,1,NULL,NULL,1,'2023-11-13 10:27:59','2023-11-13 10:27:59','31e098ff-3e3c-46e6-9542-38efafbd1faa'),
	(215,215,1,NULL,NULL,1,'2023-11-13 10:27:59','2023-11-13 10:27:59','56897b5c-415a-4471-9ac5-f76fcb1c5b95'),
	(216,216,1,NULL,NULL,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','fcc9b2e0-b213-49e8-956b-06fb974ccc8d'),
	(217,217,1,NULL,NULL,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','3328707d-3d1a-4b08-8e09-5a65b74d45ed'),
	(218,218,1,NULL,NULL,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','7a187108-52c8-461b-8b6c-88c1482764ec'),
	(219,219,1,NULL,NULL,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','079ac4aa-3381-4526-931d-d1740fa802a5'),
	(220,220,1,NULL,NULL,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','4c059ee8-8e74-4084-bff4-cb4ac6b95d9f'),
	(221,221,1,NULL,NULL,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','4ae660ef-9a07-449d-9636-c8d8effb6b93'),
	(222,222,1,NULL,NULL,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','24b35e60-6d54-4fcc-9f0c-4481995bfe8b'),
	(223,223,1,NULL,NULL,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','f8902052-952f-445a-aa23-29b173214b87'),
	(224,224,1,NULL,NULL,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','e2821a06-6c9a-440e-a282-d13481a7a79d'),
	(225,225,1,NULL,NULL,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','7096d2aa-faee-425f-abab-1f4cb1d6106b'),
	(226,226,1,NULL,NULL,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','cec93530-ce22-4a75-8b7b-358f54753c7e'),
	(227,227,1,NULL,NULL,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','169cbf0f-f256-4e6e-b8ea-4a2e9346ec29'),
	(228,228,1,NULL,NULL,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','917041cf-56a0-4a70-afc4-e9fb9dc0553e'),
	(229,229,1,NULL,NULL,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','7102d3f8-8b90-4ef7-8e00-a2455b3ab287'),
	(230,230,1,NULL,NULL,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','7e57c60d-9d7b-4ccd-aa28-d23f81a3c994'),
	(231,231,1,NULL,NULL,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','5244f022-0720-4e6f-8c96-1e7648b3f3cd'),
	(232,232,1,NULL,NULL,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','2af92c95-dab9-4f96-9799-d715d645ae7e'),
	(233,233,1,NULL,NULL,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','5ffb4a64-373c-4406-85c2-a533f4b6b26a'),
	(234,234,1,NULL,NULL,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','468b7454-8bb4-4f47-a4f3-01c4604aa260'),
	(235,235,1,NULL,NULL,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','a7a85896-6056-498a-99ef-553099aa9a72'),
	(236,236,1,NULL,NULL,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','d91b18f5-f045-4360-9c0f-a2d61e310782'),
	(237,237,1,NULL,NULL,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','e3539d35-051f-4450-b126-c6252b46dcc4'),
	(238,238,1,NULL,NULL,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','fe7513eb-a732-4c86-b245-6439047be50d'),
	(239,239,1,NULL,NULL,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','4655d650-6771-4aa6-8e51-06b915de8339'),
	(240,240,1,NULL,NULL,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','033a2bef-faaf-4ebc-8248-67b9b8e09954'),
	(241,241,1,NULL,NULL,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','1bed1c1e-ff64-45d9-ab80-7af8d60658e3'),
	(242,242,1,NULL,NULL,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','412c8564-31b4-4872-9e90-928d9c48064f'),
	(243,243,1,NULL,NULL,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','b0b83eb7-8785-4e0f-b140-d9aa2e9f133d'),
	(244,244,1,NULL,NULL,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','d1175c5c-f2d1-41ad-9f2c-667c7b5a4379'),
	(245,245,1,NULL,NULL,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','31feb2b6-6f5f-4f79-93c0-a3d98e5eb35a'),
	(246,246,1,NULL,NULL,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','4cb3d12e-ecff-4d8b-a0e1-6bd07c5a37ad'),
	(247,247,1,NULL,NULL,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','9625e574-84f8-431b-b5eb-1ecace71500b'),
	(248,248,1,NULL,NULL,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','e124dcd1-8b02-41e8-958f-8418771e0cda'),
	(249,249,1,NULL,NULL,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','2d7f8787-f2ef-4cc0-a507-b93e42ea5107'),
	(250,250,1,NULL,NULL,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','1b7e735e-055e-4fa0-9236-30b03028e23c'),
	(251,251,1,NULL,NULL,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','7711e0d7-6565-452c-aa19-4d0e83880dad'),
	(252,252,1,NULL,NULL,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','d4214f8b-f1b4-45eb-b68b-45ad6765d65f'),
	(253,253,1,NULL,NULL,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','f0c5cded-56a0-4ec5-9617-7a6f34e85ea2'),
	(254,254,1,NULL,NULL,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','6e5d7e6a-f290-44c9-82db-57cfcf213fa5'),
	(255,255,1,NULL,NULL,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','3a861c11-39f2-4a83-9f6e-bb626aca6d73'),
	(256,256,1,NULL,NULL,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','d5f1a846-a2e0-4b98-8763-33c3d8cae8d6'),
	(257,257,1,NULL,NULL,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','ce79cd8e-52e0-4068-b8fe-ca1abbdc50ff'),
	(258,258,1,NULL,NULL,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','283f113d-9524-4152-aefb-db18fa7d9c52'),
	(259,259,1,NULL,NULL,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','76d9b8ee-a4cc-4ce6-97c6-2c7dce991cb3'),
	(260,260,1,NULL,NULL,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','e0e33309-ea2c-4b1c-b0e7-df2f93345f6a'),
	(261,261,1,NULL,NULL,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','c1ba9946-46ca-4302-b90b-91d4c1a0c213'),
	(262,262,1,NULL,NULL,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','574a4ace-ed04-4173-97b7-6b22369976e4'),
	(263,263,1,NULL,NULL,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','d0ae736c-92f7-46f7-a578-a902c45ac7ad'),
	(264,264,1,NULL,NULL,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','640ff7b8-15c8-440c-9f2d-67b3ca668d64'),
	(265,265,1,NULL,NULL,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','22a8bf2a-1d19-48cf-8974-fbd135b0c4d2'),
	(266,266,1,NULL,NULL,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','73c83cd0-ddeb-4583-9cae-09a838b05890'),
	(267,267,1,NULL,NULL,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','c13b3b79-5185-4d0d-93b9-ffd3bb75f416'),
	(268,268,1,NULL,NULL,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','16cb24b7-660e-4ee9-a899-07660208f81c'),
	(269,269,1,NULL,NULL,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','42d14415-a27e-4e97-866b-160ccfa69eb4'),
	(270,270,1,NULL,NULL,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','ed1980a1-6b0d-46c5-bd05-8caaf8dff1a3'),
	(271,271,1,NULL,NULL,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','6a667b28-0e7f-401f-a2ef-0d6b24111c91'),
	(272,272,1,NULL,NULL,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','aba54df6-6bec-4845-8038-69833de27280'),
	(273,273,1,NULL,NULL,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','b03ea5d6-2331-460b-89f8-ff1c25b1d391'),
	(274,274,1,NULL,NULL,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','b39c2b09-bfe7-4b92-8bae-92d51df05972'),
	(275,275,1,NULL,NULL,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','eb5ad9a2-cacf-44b1-b6c2-75161171a149'),
	(276,276,1,NULL,NULL,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','7a6cb405-be39-4362-a055-0b0c4af39229'),
	(277,277,1,NULL,NULL,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','42650ee9-560f-4099-a6c3-06dabfb5d41c'),
	(278,278,1,NULL,NULL,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','e3aab02c-25e4-4db8-9f03-e1f45ddb01e8'),
	(279,279,1,NULL,NULL,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','4c39e0f0-1ed2-4364-91ce-40dbf34f5754'),
	(280,280,1,NULL,NULL,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','97d9a682-4290-44d7-a04e-771b42be8e4b'),
	(281,281,1,NULL,NULL,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','0086aa9c-37c3-4819-afb6-2ac95ec57567'),
	(282,282,1,NULL,NULL,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','3aef3a6b-7132-4411-a56e-7ad3bd1c9b96'),
	(283,283,1,NULL,NULL,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','cd24ba16-ecd1-4a63-b46f-474c9ee9b3e4'),
	(284,284,1,NULL,NULL,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','0c72ca0b-f469-4afb-8917-8ef7b951e130'),
	(285,285,1,NULL,NULL,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','f934ecd4-aa04-45f6-806c-84866aff8d42'),
	(286,286,1,NULL,NULL,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','ec241e95-35d3-4a30-9b7c-1170593b9f0a'),
	(287,287,1,NULL,NULL,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','9313f3dd-3eaa-4bb5-854f-92205356ccf5'),
	(288,288,1,NULL,NULL,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','1a1ead3f-f8e1-48e5-900a-7d6a584e3c28'),
	(289,289,1,NULL,NULL,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','af2c0927-206c-4b87-8103-1870ead69784'),
	(290,290,1,NULL,NULL,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','e73b8569-226d-4d9c-8180-60bf34bbba08'),
	(291,291,1,NULL,NULL,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','f0fb72c3-2f11-4a48-b6bc-2fe359809e04'),
	(292,292,1,NULL,NULL,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','80ab5008-9408-4df0-9814-8c5b9c8e2323'),
	(293,293,1,NULL,NULL,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','75b7b70c-0878-48ad-be9d-7571e70911e1'),
	(294,294,1,NULL,NULL,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','f6d367a8-b978-4b15-9496-bda87c422b74'),
	(295,295,1,NULL,NULL,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','b44e6c7e-2fdd-43cb-b3c8-38ccc9460a0d'),
	(296,296,1,NULL,NULL,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','4f8c4bd9-64e3-4bcb-a29e-43e6b2d70923'),
	(297,297,1,NULL,NULL,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','b65bf7f6-d5e8-4c3f-8536-38d7c84b30b9'),
	(298,298,1,NULL,NULL,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','913787be-d6be-4aa2-97b1-83a35831c78f'),
	(299,299,1,NULL,NULL,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','cc87ca4a-4e93-46c2-a438-4ced40b98fdf'),
	(300,300,1,NULL,NULL,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','c70df673-941f-4bb3-9c46-0e0d3d345eb4'),
	(301,301,1,NULL,NULL,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','6d159c53-6083-402e-8060-bd3c025c83cf'),
	(302,302,1,NULL,NULL,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','7dad2a9a-9c28-4ead-89af-756c7cddd7da'),
	(303,303,1,NULL,NULL,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','6d2007f0-809e-41ce-aa0d-99c83a7214dd'),
	(304,304,1,NULL,NULL,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','88af9698-43d8-4357-ac5c-f1ca35738d62'),
	(305,305,1,NULL,NULL,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','8ebc36c3-04c2-45fb-91f1-6a904c5f0b69'),
	(306,306,1,NULL,NULL,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','5264fac2-967c-4c46-8ebd-4d29c54fea29'),
	(307,307,1,NULL,NULL,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','fbf2f49f-4335-46e0-88b1-ac2202fda3fc'),
	(308,308,1,NULL,NULL,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','4414f050-ea96-40b0-aa53-e254b5c96b35'),
	(309,309,1,NULL,NULL,1,'2023-11-13 10:28:37','2023-11-13 10:28:37','d47befe7-449b-41db-9932-7c798f12f7a6'),
	(310,310,1,NULL,NULL,1,'2023-11-13 10:28:37','2023-11-13 10:28:37','f3240ea2-9540-475f-a0ee-7d929a930705'),
	(311,311,1,NULL,NULL,1,'2023-11-13 10:28:37','2023-11-13 10:28:37','9752f67e-2387-4810-9f43-00046f4a0ea5'),
	(312,312,1,NULL,NULL,1,'2023-11-13 10:28:37','2023-11-13 10:28:37','90acd445-0646-4dc0-afc9-1371b1c9d839'),
	(313,313,1,NULL,NULL,1,'2023-11-13 10:28:37','2023-11-13 10:28:37','d34345b1-c660-4f81-a1f3-ca5df158b8fb'),
	(314,314,1,NULL,NULL,1,'2023-11-13 10:28:37','2023-11-13 10:28:37','c735a804-9518-415e-9b02-9db5e0a79da5'),
	(315,315,1,NULL,NULL,1,'2023-11-13 10:28:37','2023-11-13 10:28:37','e9154c9c-43c7-431e-b607-e29085c9e977'),
	(316,316,1,NULL,NULL,1,'2023-11-13 10:28:37','2023-11-13 10:28:37','032dd0d6-aace-4643-bc54-f608333f32f8'),
	(317,317,1,'perfect-espresso','recipes/perfect-espresso',1,'2023-11-13 10:28:39','2023-11-13 10:28:39','b766b926-e1ef-4b80-bb3d-c111c5d8e2e2'),
	(318,318,1,NULL,NULL,1,'2023-11-13 10:28:39','2023-11-13 10:28:39','f1618089-ddbd-4c33-93bd-1f14f158f62a'),
	(319,319,1,NULL,NULL,1,'2023-11-13 10:28:39','2023-11-13 10:28:39','79c09189-e913-4d4d-8df8-3a21c3530a88'),
	(320,320,1,NULL,NULL,1,'2023-11-13 10:28:39','2023-11-13 10:28:39','fd4d6893-5c9b-4f2d-931d-7851c95562fd'),
	(321,321,1,NULL,NULL,1,'2023-11-13 10:28:39','2023-11-13 10:28:39','8dfc0b3a-e686-4b51-85f6-7d9780076bea'),
	(322,322,1,NULL,NULL,1,'2023-11-13 10:28:39','2023-11-13 10:28:39','d734b9c0-5eba-4e55-83f0-fd86ae055e86'),
	(323,323,1,NULL,NULL,1,'2023-11-13 10:28:39','2023-11-13 10:28:39','646d6af6-fcba-48d7-9ce4-ccb8c9677a52'),
	(324,324,1,NULL,NULL,1,'2023-11-13 10:28:39','2023-11-13 10:28:39','00d92ffd-4c2e-45bb-8599-e605abb3fc21'),
	(325,325,1,NULL,NULL,1,'2023-11-13 10:28:39','2023-11-13 10:28:39','45da3cd1-cd72-41d3-9738-86fd948634c0'),
	(326,326,1,'espresso','styles/espresso',1,'2023-11-13 11:20:33','2023-11-13 11:20:37','c99f693a-32cc-4f2d-a276-508952db638e'),
	(328,328,1,'perfect-espresso','recipes/perfect-espresso',1,'2023-11-13 11:22:39','2023-11-13 11:22:39','d0d12195-050b-4cc4-b6b5-111fe57b73b0'),
	(329,329,1,NULL,NULL,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','8edaff56-5ed4-4bb8-9083-cb0752c81e91'),
	(330,330,1,NULL,NULL,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','db6b3081-c546-4d49-bf4e-978a5c2598cb'),
	(331,331,1,NULL,NULL,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','c4ad3111-ab73-4cb2-aa0a-ce45e6c39cc7'),
	(332,332,1,NULL,NULL,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','c2ae3aaa-8ceb-4c8f-8569-b7ad95a87635'),
	(333,333,1,NULL,NULL,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','0c682709-8974-402a-96ec-f9e57dba8d8e'),
	(334,334,1,NULL,NULL,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','ff7889ed-3c55-4427-9b29-a9a8b6cd38cc'),
	(335,335,1,NULL,NULL,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','e5ca52db-f8d5-4dc5-a908-f8c29ccaf511'),
	(336,336,1,NULL,NULL,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','0c2f5ad4-237d-4667-9728-d08318722295'),
	(338,338,1,'drip-coffee','styles/drip-coffee',1,'2023-11-13 14:44:43','2023-11-13 14:48:24','bedd4b33-9d0e-4417-823e-073c26fafef0'),
	(339,339,1,'iced-coffee','styles/iced-coffee',1,'2023-11-13 14:45:04','2023-11-13 14:48:24','b5120b13-7dc8-4de6-b3b7-65d711fa21ff'),
	(341,341,1,'chemex','drinks/chemex',1,'2023-11-13 14:45:29','2023-11-13 14:45:29','cb10b191-813a-4210-b28d-ae8833580310'),
	(343,343,1,'iced-coffee','drinks/iced-coffee',1,'2023-11-13 14:45:35','2023-11-13 14:45:35','a830e389-355c-40ad-aa9d-2cff5bd8b249'),
	(344,344,1,'espresso','drinks/espresso',1,'2023-11-13 14:45:38','2023-11-13 14:45:38','ffffd3ae-1b19-42b1-8953-64d375182597'),
	(347,347,1,'perfect-espresso','recipes/perfect-espresso',1,'2023-11-13 14:48:33','2023-11-13 14:48:33','14043ee0-1586-4135-80a5-b76be3b96b1e'),
	(348,348,1,NULL,NULL,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','7645a23d-8989-42df-b899-e566e40c51d0'),
	(349,349,1,NULL,NULL,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','da5018fb-550d-43fb-9639-7def07683f1f'),
	(350,350,1,NULL,NULL,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','c007f024-add9-4c94-8324-0d2b571f963d'),
	(351,351,1,NULL,NULL,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','be557e1e-aacd-47ac-a341-a82b5264f735'),
	(352,352,1,NULL,NULL,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','c281bb37-bdb8-4a64-b079-dc4b8c7b09b1'),
	(353,353,1,NULL,NULL,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','d39ad62a-e1ef-4f3a-941c-c71435734a4b'),
	(354,354,1,NULL,NULL,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','77ce0676-103f-4f80-ad9a-eee208cf60a0'),
	(355,355,1,NULL,NULL,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','0a6e385b-a015-4112-8923-aca0d2815903'),
	(356,356,1,'iced-amerciano','drinks/iced-amerciano',1,'2023-11-13 14:49:23','2023-11-13 14:49:28','a6aef570-e24b-4aae-9c1f-9c3324df040a'),
	(357,357,1,'iced-amerciano','drinks/iced-amerciano',1,'2023-11-13 14:50:05','2023-11-13 14:50:05','a7c11f31-ae18-4963-9dd7-78b71d0605ce'),
	(358,358,1,'iced-coffee-recipe','recipes/iced-coffee-recipe',1,'2023-11-13 16:17:04','2023-11-13 16:17:12','a63402d5-aa34-41ff-9102-65a57e7e7c73'),
	(359,359,1,'iced-coffee-recipe','recipes/iced-coffee-recipe',1,'2023-11-13 16:17:19','2023-11-13 16:17:19','6f6076b1-bd81-4154-a047-73be185a5318'),
	(360,360,1,'chemex','recipes/chemex',1,'2023-11-13 16:17:23','2023-11-13 16:17:28','5f32095f-af7f-41d8-b57f-8e40e11657ae'),
	(361,361,1,'chemex','recipes/chemex',1,'2023-11-13 16:17:35','2023-11-13 16:17:35','4652aeb7-9217-4675-a39e-458f0c74a70b'),
	(363,363,1,'iced-amerciano','drinks/iced-amerciano',1,'2023-11-13 16:17:42','2023-11-13 16:17:42','8a775ce5-3d39-4ce8-8b74-050e2140f631'),
	(365,365,1,'chemex','drinks/chemex',1,'2023-11-13 16:17:53','2023-11-13 16:17:53','dbcd3445-1378-4f9a-84c2-1b229172bd8c'),
	(367,367,1,'espresso','drinks/espresso',1,'2023-11-13 16:18:13','2023-11-13 16:18:13','903ca823-36d6-454b-a50c-1eb685a61efb'),
	(369,369,1,'iced-coffee','drinks/iced-coffee',1,'2023-11-13 16:18:26','2023-11-13 16:18:26','8b75d7db-98b6-4a52-877a-1d7a68c8d670'),
	(370,370,1,'iced-amerciano','drinks/iced-amerciano',1,'2023-11-13 16:18:31','2023-11-13 16:18:31','c2949bea-eca5-425b-b5c0-75e8bea42429');

/*!40000 ALTER TABLE `craft_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entries`;

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_sawuxrpjaxlebdeejqgjfyorwyupldgxdtmr` (`postDate`),
  KEY `craft_idx_veeobpskgduwlfuwuxjewndjfwcgozcxybot` (`expiryDate`),
  KEY `craft_idx_fwyejgswpmesbvpciebvubkzgngxsntsuatn` (`authorId`),
  KEY `craft_idx_dstlejzraywmzifqqhqmdkymdrbpoyepaubq` (`sectionId`),
  KEY `craft_idx_ontskvpxjttnfeorqcvvozsajsfpyqfsaqkh` (`typeId`),
  KEY `craft_fk_ztshrcjmjhpptsssysmlyxiniopdsumgnugp` (`parentId`),
  CONSTRAINT `craft_fk_mhkkvlwokcvsxifgbwepnykpdqxdujyiylqk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_rgslnjzkarinbqpanfbesmpbkzorbrgppkau` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_wormzhhayogrukiqnnjnumzipexfnrusxxfm` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_zqgzrbegalpqqfqfacmouswpdmjixikpbtzf` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ztshrcjmjhpptsssysmlyxiniopdsumgnugp` FOREIGN KEY (`parentId`) REFERENCES `craft_entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;

INSERT INTO `craft_entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`)
VALUES
	(2,1,NULL,1,1,'2023-06-28 21:20:00',NULL,1,'2023-06-28 21:19:50','2023-06-28 21:20:50'),
	(3,1,NULL,1,1,'2023-06-28 21:20:00',NULL,NULL,'2023-06-28 21:20:50','2023-06-28 21:20:50'),
	(4,2,NULL,2,1,'2023-07-07 22:43:10',NULL,NULL,'2023-07-07 22:43:10','2023-07-07 22:43:10'),
	(5,2,NULL,2,1,'2023-07-07 22:44:01',NULL,NULL,'2023-07-07 22:44:01','2023-07-07 22:44:01'),
	(6,2,NULL,2,1,'2023-07-08 07:44:00',NULL,NULL,'2023-07-08 07:42:28','2023-07-08 07:44:13'),
	(7,2,NULL,2,1,'2023-07-08 07:44:00',NULL,NULL,'2023-07-08 07:44:13','2023-07-08 07:44:13'),
	(8,3,NULL,3,1,'2023-07-08 07:54:00',NULL,NULL,'2023-07-08 07:52:28','2023-07-08 07:54:21'),
	(9,3,NULL,3,1,'2023-07-08 07:54:00',NULL,NULL,'2023-07-08 07:54:22','2023-07-08 07:54:22'),
	(10,4,NULL,4,NULL,'2023-07-22 07:33:00',NULL,NULL,'2023-07-22 07:33:24','2023-07-22 07:33:24'),
	(11,4,NULL,4,NULL,'2023-07-22 07:33:00',NULL,NULL,'2023-07-22 07:33:24','2023-07-22 07:33:24'),
	(12,4,NULL,4,NULL,'2023-07-22 07:33:00',NULL,NULL,'2023-07-22 07:33:24','2023-07-22 07:33:24'),
	(13,4,NULL,4,NULL,'2023-07-22 07:33:00',NULL,NULL,'2023-07-22 07:34:26','2023-07-22 07:34:26'),
	(16,2,NULL,2,1,'2023-07-08 07:44:00',NULL,NULL,'2023-07-23 08:05:13','2023-07-23 08:05:13'),
	(18,2,NULL,2,1,'2023-07-23 08:14:00',NULL,NULL,'2023-07-23 08:13:30','2023-07-23 08:14:14'),
	(19,2,NULL,2,1,'2023-07-23 08:14:00',NULL,NULL,'2023-07-23 08:14:14','2023-07-23 08:14:14'),
	(20,2,NULL,2,1,'2023-07-23 08:14:00',NULL,NULL,'2023-07-23 08:14:21','2023-07-23 08:14:21'),
	(21,5,NULL,5,1,'2023-11-10 12:50:00',NULL,NULL,'2023-11-10 12:50:04','2023-11-10 12:50:17'),
	(22,5,NULL,5,1,'2023-11-10 12:50:00',NULL,NULL,'2023-11-10 12:50:17','2023-11-10 12:50:17'),
	(23,5,NULL,5,1,'2023-11-10 12:50:00',NULL,NULL,'2023-11-10 12:50:24','2023-11-10 12:50:33'),
	(24,5,NULL,5,1,'2023-11-10 12:50:00',NULL,NULL,'2023-11-10 12:50:33','2023-11-10 12:50:33'),
	(25,5,NULL,5,1,'2023-11-10 12:50:00',NULL,NULL,'2023-11-10 12:50:39','2023-11-10 12:50:50'),
	(26,5,NULL,5,1,'2023-11-10 12:50:00',NULL,NULL,'2023-11-10 12:50:50','2023-11-10 12:50:50'),
	(27,5,NULL,5,1,'2023-11-10 12:51:00',NULL,NULL,'2023-11-10 12:51:09','2023-11-10 12:51:24'),
	(28,5,NULL,5,1,'2023-11-10 12:51:00',NULL,NULL,'2023-11-10 12:51:24','2023-11-10 12:51:24'),
	(30,5,NULL,5,1,'2023-11-10 12:50:00',NULL,NULL,'2023-11-10 13:42:58','2023-11-10 13:42:58'),
	(31,4,NULL,4,NULL,'2023-07-22 07:33:00',NULL,NULL,'2023-11-10 16:31:42','2023-11-10 16:31:42'),
	(33,4,NULL,4,NULL,'2023-07-22 07:33:00',NULL,NULL,'2023-11-10 16:32:17','2023-11-10 16:32:17'),
	(35,2,NULL,2,1,'2023-07-23 08:14:00',NULL,NULL,'2023-11-10 16:46:18','2023-11-10 16:46:18'),
	(38,2,NULL,2,1,'2023-07-08 07:44:00',NULL,NULL,'2023-11-10 16:47:45','2023-11-10 16:47:45'),
	(42,2,NULL,2,1,'2023-07-08 07:44:00',NULL,NULL,'2023-11-10 16:48:19','2023-11-10 16:48:19'),
	(43,2,NULL,2,1,'2023-11-10 16:48:00',NULL,NULL,'2023-11-10 16:48:21','2023-11-10 16:48:40'),
	(44,2,NULL,2,1,'2023-11-10 16:48:00',NULL,NULL,'2023-11-10 16:48:40','2023-11-10 16:48:40'),
	(45,3,NULL,3,1,'2023-11-10 16:54:00',NULL,NULL,'2023-11-10 16:54:09','2023-11-10 16:54:42'),
	(46,3,NULL,3,1,'2023-11-10 16:54:00',NULL,NULL,'2023-11-10 16:54:42','2023-11-10 16:54:42'),
	(47,2,NULL,2,1,'2023-07-08 07:44:00',NULL,NULL,'2023-11-10 17:03:14','2023-11-10 17:03:14'),
	(48,2,NULL,2,1,'2023-07-08 07:44:00',NULL,NULL,'2023-11-10 17:03:19','2023-11-10 17:03:19'),
	(50,2,NULL,2,1,'2023-07-08 07:44:00',NULL,NULL,'2023-11-10 17:03:42','2023-11-10 17:03:42'),
	(51,2,NULL,2,1,'2023-07-08 07:44:00',NULL,NULL,'2023-11-10 18:10:27','2023-11-10 18:10:27'),
	(53,2,NULL,2,1,'2023-07-08 07:44:00',NULL,NULL,'2023-11-10 18:17:50','2023-11-10 18:17:50'),
	(55,3,NULL,3,1,'2023-11-10 16:54:00',NULL,NULL,'2023-11-10 18:49:44','2023-11-10 18:49:44'),
	(57,5,NULL,5,1,'2023-11-10 12:50:00',NULL,NULL,'2023-11-13 09:24:50','2023-11-13 09:24:50'),
	(59,5,NULL,5,1,'2023-11-10 12:50:00',NULL,NULL,'2023-11-13 09:25:58','2023-11-13 09:25:58'),
	(60,6,NULL,6,1,'2023-11-13 10:28:00',NULL,NULL,'2023-11-13 10:25:20','2023-11-13 10:28:39'),
	(317,6,NULL,6,1,'2023-11-13 10:28:00',NULL,NULL,'2023-11-13 10:28:39','2023-11-13 10:28:39'),
	(328,6,NULL,6,1,'2023-11-13 10:28:00',NULL,NULL,'2023-11-13 11:22:40','2023-11-13 11:22:40'),
	(341,2,NULL,2,1,'2023-11-10 16:48:00',NULL,NULL,'2023-11-13 14:45:29','2023-11-13 14:45:29'),
	(343,2,NULL,2,1,'2023-07-23 08:14:00',NULL,NULL,'2023-11-13 14:45:35','2023-11-13 14:45:35'),
	(344,2,NULL,2,1,'2023-07-08 07:44:00',NULL,NULL,'2023-11-13 14:45:38','2023-11-13 14:45:38'),
	(347,6,NULL,6,1,'2023-11-13 10:28:00',NULL,NULL,'2023-11-13 14:48:33','2023-11-13 14:48:33'),
	(356,2,NULL,2,1,'2023-11-13 14:50:00',NULL,NULL,'2023-11-13 14:49:23','2023-11-13 14:50:05'),
	(357,2,NULL,2,1,'2023-11-13 14:50:00',NULL,NULL,'2023-11-13 14:50:05','2023-11-13 14:50:05'),
	(358,6,NULL,6,1,'2023-11-13 16:17:00',NULL,NULL,'2023-11-13 16:17:04','2023-11-13 16:17:19'),
	(359,6,NULL,6,1,'2023-11-13 16:17:00',NULL,NULL,'2023-11-13 16:17:19','2023-11-13 16:17:19'),
	(360,6,NULL,6,1,'2023-11-13 16:17:00',NULL,NULL,'2023-11-13 16:17:23','2023-11-13 16:17:35'),
	(361,6,NULL,6,1,'2023-11-13 16:17:00',NULL,NULL,'2023-11-13 16:17:35','2023-11-13 16:17:35'),
	(363,2,NULL,2,1,'2023-11-13 14:50:00',NULL,NULL,'2023-11-13 16:17:42','2023-11-13 16:17:42'),
	(365,2,NULL,2,1,'2023-11-10 16:48:00',NULL,NULL,'2023-11-13 16:17:53','2023-11-13 16:17:53'),
	(367,2,NULL,2,1,'2023-07-08 07:44:00',NULL,NULL,'2023-11-13 16:18:13','2023-11-13 16:18:13'),
	(369,2,NULL,2,1,'2023-07-23 08:14:00',NULL,NULL,'2023-11-13 16:18:26','2023-11-13 16:18:26'),
	(370,2,NULL,2,1,'2023-11-13 14:50:00',NULL,NULL,'2023-11-13 16:18:31','2023-11-13 16:18:31');

/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrytypes`;

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_lyirwsgobwtasrohtwfpsrrxsqxaahghvkoh` (`name`,`sectionId`),
  KEY `craft_idx_jnpjukgkrcwswnkqnuhweptsvqjwixrwmkyp` (`handle`,`sectionId`),
  KEY `craft_idx_dxxkfvijrzlfambghiebhrhhmujjoomzdwgn` (`sectionId`),
  KEY `craft_idx_vnqkzymmyytlutjvhhhbayxsnvflavaljjbv` (`fieldLayoutId`),
  KEY `craft_idx_ljhrmlvgcgqphkfuyycpwczbbalnxbinkzqj` (`dateDeleted`),
  CONSTRAINT `craft_fk_dptwkodkyuirpdbjvzivilmrbynrjhcdwqrg` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ezqbhjllewjdevovzesooaoxiryvsvdxekko` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `slugTranslationMethod`, `slugTranslationKeyFormat`, `showStatusField`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,'Homepage','default',1,'site',NULL,NULL,'site',NULL,1,1,'2023-06-28 21:19:00','2023-06-28 21:19:24','2023-06-28 21:26:48','135337dd-23fc-408c-ab46-9f4e87a772a2'),
	(2,2,2,'Drinks','drinks',1,'site',NULL,NULL,'site',NULL,1,1,'2023-07-07 21:53:57','2023-07-08 07:42:21',NULL,'b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5'),
	(3,3,3,'News','news',1,'site',NULL,NULL,'site',NULL,1,1,'2023-07-08 07:03:05','2023-07-08 07:53:34',NULL,'986aa4bb-41f0-4f08-a80b-5def7c05e9e2'),
	(4,4,4,'Homepage','homepage',1,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2023-07-22 07:33:23','2023-11-10 16:31:42',NULL,'ffe7f2a0-f138-4ab9-b44d-b139aebec30c'),
	(5,5,6,'Default','default',1,'site',NULL,NULL,'site',NULL,1,1,'2023-11-10 12:48:56','2023-11-10 12:48:56',NULL,'2925c6ab-87b9-47ba-af26-0a2217645c59'),
	(6,6,7,'Recipes','recipes',1,'site',NULL,NULL,'site',NULL,1,1,'2023-11-13 10:19:04','2023-11-13 10:32:44',NULL,'c9f73d3c-e360-4514-b61b-5311acbc0682');

/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldgroups`;

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_icblozjrzjegltbuufqhdfypqtkwdbfsrwev` (`name`),
  KEY `craft_idx_uazsyddluqsqnltewcbpasxvsuebthduvwku` (`dateDeleted`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Common','2023-06-23 21:48:48','2023-06-23 21:48:48',NULL,'2e5ac707-b113-48a6-a39f-cd16b37e8dfd'),
	(2,'Drinks','2023-07-07 22:32:05','2023-07-07 22:33:04',NULL,'7fb8ff63-f6d7-4722-9949-b41918660706'),
	(3,'News','2023-07-08 07:04:02','2023-07-08 07:04:02',NULL,'d9733ce0-764f-4a3b-87c7-78604d73922c'),
	(4,'About','2023-11-10 13:40:39','2023-11-10 13:40:39',NULL,'8eccfec3-f740-4d42-a415-51a2d9ab649a'),
	(5,'Recipes','2023-11-13 10:21:06','2023-11-13 10:21:11',NULL,'e2aec99d-f269-419f-859c-d74d6da3828c'),
	(6,'Styles','2023-11-13 11:19:55','2023-11-13 11:19:55',NULL,'e0623228-802b-4c2e-9082-5065523c2a1d');

/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_wplgksogvsplhjcfhjxtxdlugaaigwjquums` (`layoutId`,`fieldId`),
  KEY `craft_idx_kukxyiynxkhqtnsbjdpjhsogfongolqbjltr` (`sortOrder`),
  KEY `craft_idx_qnoaqcjthlgtsmfzbjcasbgxbhpxxppawykp` (`tabId`),
  KEY `craft_idx_xdewcvsgwdoyzbsmflbvasekmqxwmbtomryv` (`fieldId`),
  CONSTRAINT `craft_fk_blvmptlwxzqkwwcitjtklzcpglbgoovqivyv` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_fabsxcdvxytiiawrwybixfekyzonyjsrvktm` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_vgzctpgmwbfzytrficutpifuxlbnngqacybi` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,3,7,3,0,1,'2023-07-08 07:53:34','2023-07-08 07:53:34','7c4f6bf0-6992-462e-b141-abe2439d2665'),
	(4,3,7,4,0,2,'2023-07-08 07:53:34','2023-07-08 07:53:34','220ecd4a-186f-4830-8220-d41a1f80d136'),
	(14,6,16,6,0,1,'2023-11-10 13:43:24','2023-11-10 13:43:24','cfd81e81-0df2-4593-a32f-5994ff8ddcad'),
	(15,6,16,7,0,2,'2023-11-10 13:43:24','2023-11-10 13:43:24','66d98633-472b-479d-b7a1-7aacac7919e5'),
	(16,6,16,2,1,3,'2023-11-10 13:43:24','2023-11-10 13:43:24','8deb68ad-de16-45b8-9c0c-c05ef08caf13'),
	(17,4,17,6,0,1,'2023-11-10 16:31:42','2023-11-10 16:31:42','fd5404b3-cbdc-4c14-a176-7c02c0d43965'),
	(18,8,19,10,0,0,'2023-11-13 10:24:45','2023-11-13 10:24:45','cbea51fb-46a4-4c30-bc87-8a19f0093c67'),
	(19,8,19,9,0,1,'2023-11-13 10:24:45','2023-11-13 10:24:45','2d9549e6-8b37-4c7e-8c36-d70154eed8c2'),
	(20,9,20,11,0,0,'2023-11-13 10:24:45','2023-11-13 10:24:45','eafa0c35-4c6b-4464-8aa4-4cfe6ea3d447'),
	(21,10,21,12,0,0,'2023-11-13 10:24:45','2023-11-13 10:24:45','49afe3c9-2cfd-4bbe-bd5d-d8fffdc8e5b5'),
	(22,11,22,14,0,0,'2023-11-13 10:24:45','2023-11-13 10:24:45','c255e97c-62a2-4ae8-9af0-b2bde1e953d2'),
	(23,11,22,13,0,1,'2023-11-13 10:24:45','2023-11-13 10:24:45','164fe9f4-c188-46ee-8646-beb3b65bc04e'),
	(24,12,23,15,0,0,'2023-11-13 10:24:45','2023-11-13 10:24:45','942721b2-b20b-4e66-a397-1fa33cf85cc8'),
	(27,13,27,16,0,1,'2023-11-13 11:20:28','2023-11-13 11:20:28','8d9fa14e-a678-4f8d-aafe-884030af3aa6'),
	(36,7,31,17,0,1,'2023-11-13 11:22:49','2023-11-13 11:22:49','99d5ee1d-e350-40d9-b0a1-f800bd0dc717'),
	(37,7,31,8,0,2,'2023-11-13 11:22:49','2023-11-13 11:22:49','9160ccf9-b474-4468-9680-b3def01b589f'),
	(42,2,33,17,0,1,'2023-11-13 16:16:44','2023-11-13 16:16:44','1ad487e9-587c-4fbf-815d-b3ae6b336a19'),
	(43,2,33,1,0,2,'2023-11-13 16:16:44','2023-11-13 16:16:44','8c9326e3-d6cc-4633-9a2d-e2d9ee1e5535'),
	(44,2,33,2,0,3,'2023-11-13 16:16:44','2023-11-13 16:16:44','63763f23-4ffc-407c-90e2-58e2f4825a3f'),
	(45,2,33,5,0,4,'2023-11-13 16:16:44','2023-11-13 16:16:44','234689b7-efb0-4f0a-9c59-c38930dc8b72'),
	(46,2,33,18,0,5,'2023-11-13 16:16:44','2023-11-13 16:16:44','b678b41b-0db8-40d3-96e5-521723123c38');

/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouts`;

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_bahmbpimlmivytdctkgzuxtvfbuokfibtasw` (`dateDeleted`),
  KEY `craft_idx_fknfwigfaklnzdhrtyyuuwbjhastxfnayhar` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'craft\\elements\\Entry','2023-06-28 21:19:00','2023-06-28 21:19:00','2023-06-28 21:26:48','c5e2d20b-3d11-4045-a063-215d1ba4f9ca'),
	(2,'craft\\elements\\Entry','2023-07-07 21:53:57','2023-07-07 21:53:57',NULL,'ecc3579d-fd33-4263-8c9a-ae09f137c6c4'),
	(3,'craft\\elements\\Entry','2023-07-08 07:03:05','2023-07-08 07:03:05',NULL,'5f6bddac-6954-4bab-a4f6-4fcb7db3b581'),
	(4,'craft\\elements\\Entry','2023-07-22 07:33:23','2023-07-22 07:33:23',NULL,'f116de9a-3dfb-439c-a7fe-2111845202f9'),
	(5,'craft\\elements\\Asset','2023-07-23 07:42:15','2023-07-23 07:42:15',NULL,'10d27903-5538-43d5-b90f-33d78c819c79'),
	(6,'craft\\elements\\Entry','2023-11-10 12:48:56','2023-11-10 12:48:56',NULL,'9e671188-f075-412f-b65a-caa80e166922'),
	(7,'craft\\elements\\Entry','2023-11-13 10:19:04','2023-11-13 10:19:04',NULL,'710e2221-2133-40db-b260-0272929f637f'),
	(8,'craft\\elements\\MatrixBlock','2023-11-13 10:24:45','2023-11-13 10:24:45',NULL,'3d670f67-9b40-4d3c-bee9-d2123b46a500'),
	(9,'craft\\elements\\MatrixBlock','2023-11-13 10:24:45','2023-11-13 10:24:45',NULL,'afa6fdb3-ee5b-4205-9508-f712c2f3c831'),
	(10,'craft\\elements\\MatrixBlock','2023-11-13 10:24:45','2023-11-13 10:24:45',NULL,'ccdfa2f3-419d-4602-96b6-e830c5815833'),
	(11,'craft\\elements\\MatrixBlock','2023-11-13 10:24:45','2023-11-13 10:24:45',NULL,'308cfa53-5e69-4003-bb7b-98c67cbc9484'),
	(12,'craft\\elements\\MatrixBlock','2023-11-13 10:24:45','2023-11-13 10:24:45',NULL,'d5e3ddda-e5f4-4245-9360-a61b0e9cff15'),
	(13,'craft\\elements\\Category','2023-11-13 11:18:51','2023-11-13 11:18:51',NULL,'20f278c0-01e9-4b66-a1ea-406420f66d7d');

/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_eyrdxkzygzhxgsolijtmtqzcxhhwvwhabnjb` (`sortOrder`),
  KEY `craft_idx_ztwqzomdwghytdcozoiyksvhqmkgxpzupdzj` (`layoutId`),
  CONSTRAINT `craft_fk_ftawcnjmvfpuurpvxzosxcldgvvcgtszblls` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `settings`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"14802070-afbe-4d16-91d0-da6c959bd30d\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-06-28 21:19:24','2023-06-28 21:19:24','0d30295d-bed4-48fc-a0fb-1d6b23b90959'),
	(7,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":\"Headline\",\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"91318e01-38b5-4b87-b006-7467cc529cc6\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"e9834db8-b644-474b-afcc-d1a0536b49b6\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"73f4252e-66e1-47b9-bca6-9539be73126b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"1a379f11-d689-4fd3-8e43-96e988e8708d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753\"}]',1,'2023-07-08 07:53:34','2023-07-08 07:53:34','29e8f753-f4d8-4f52-ace5-b2699c6ebe64'),
	(12,5,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"2b4f338c-415f-4220-a938-b863d3185dd8\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-07-23 07:48:47','2023-07-23 07:48:47','2aff7332-7ba9-41ed-85d9-728302d372b4'),
	(16,6,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":\"Page Title\",\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"fa710a5b-e1f2-45a9-b219-4bf6759cf147\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"3f8108f5-a947-428e-a81c-5bb26ac73dab\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c0aec353-cfd5-4cb5-a54c-ba4d04080107\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"eb9ceaf1-b7c8-41ca-97e5-df3eb1a41f8e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"b69006e0-11e2-4f01-b0fc-0d584155e3ee\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"fcc525be-f230-4560-bc56-e7f674800e79\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"698c2c75-2a70-480a-852c-8e6c9dc2f095\"}]',1,'2023-11-10 13:43:24','2023-11-10 13:43:24','5659025a-e45a-4b36-b6d5-3edc50d1ae37'),
	(17,4,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"acc06c62-9e69-42fb-a3b4-30cd52caa123\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"74be3a12-9f05-4bb7-843b-a8da3fd1442b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c0aec353-cfd5-4cb5-a54c-ba4d04080107\"}]',1,'2023-11-10 16:31:42','2023-11-10 16:31:42','5b7235f5-d4d3-4922-92e9-9ee90c0a1203'),
	(19,8,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"5f563175-9ded-406d-9f22-f886dd57e104\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"caea4449-52ec-4f58-b4b5-10a73028a1bd\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"49396025-a61d-4c5b-ba7a-e347d2ed01d5\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"0b992201-02d6-482e-95db-9deda58d0abd\"}]',1,'2023-11-13 10:24:45','2023-11-13 10:24:45','8c8b6e48-2498-4582-a30b-77b77c6f72b7'),
	(20,9,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"c45c2ec0-f37c-46d2-a693-a1073b704d70\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"408e958f-484f-4218-97a1-61928d88e082\"}]',1,'2023-11-13 10:24:45','2023-11-13 10:24:45','22d4cdac-8f6d-439c-b4f4-01653413f21f'),
	(21,10,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"3e5d8ab6-2ba9-4c84-9cf1-3c96067c706e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"b646caf2-73a7-4576-b914-49d7767fb79a\"}]',1,'2023-11-13 10:24:45','2023-11-13 10:24:45','7ed7ccc1-2345-41aa-9d30-9d8152b5398d'),
	(22,11,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"791f78e8-81f6-4cb4-846d-eaa54421efff\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e9185427-bcf9-4ecd-af4b-e8b247a7df7c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"620fa0f2-6224-41c2-a74e-5e13ccd7c599\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"13c08d93-1751-4725-aa81-f7930303df4e\"}]',1,'2023-11-13 10:24:45','2023-11-13 10:24:45','ec3dc15b-61b6-4465-a090-affea62ac30c'),
	(23,12,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b80d23ed-dc4e-4428-b4e6-729b198885ce\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"a3769b58-80e0-4684-81b8-70cb37801eaa\"}]',1,'2023-11-13 10:24:45','2023-11-13 10:24:45','f126a761-e4be-4741-a949-42a4b9204d1d'),
	(27,13,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"4fe87b70-140a-4bd1-b697-bdc24cc63ce0\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"3b3d9081-6a57-448d-afeb-83315f2f66d5\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4105ff33-812d-4a27-9f88-9d4e339e488b\"}]',1,'2023-11-13 11:20:28','2023-11-13 11:20:28','df680ccd-9569-402a-8b0c-955124b4131c'),
	(31,7,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"a1e19f32-c088-4db6-83da-ce4f291be91a\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"2a93975b-21de-46ea-97b4-f0ed88b3bf3b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"aa5e3e23-3c7c-4e0d-898b-81c0190210de\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"cb21c80c-3bc4-4cef-b1d4-1829e488ed05\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"04ded7df-16f3-4718-b279-c9dd1cc6ff91\"}]',1,'2023-11-13 11:22:49','2023-11-13 11:22:49','a36885f8-b2f4-474e-8859-47d9b19b8064'),
	(33,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":\"Drink name\",\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"7509c466-8dcc-452f-a77c-ddf44953bb16\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"5717fcb0-3610-43e9-a5c6-05cb5feb05ad\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"aa5e3e23-3c7c-4e0d-898b-81c0190210de\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"a50c658c-0ec5-436a-bb12-46d256e27e39\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"ba0bdeaf-4263-470a-8e8b-fdd4569be76b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"698c2c75-2a70-480a-852c-8e6c9dc2f095\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"c19d2b4f-e58b-46ce-a49e-8b3ecba9b26d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4a683cf6-5953-4f09-8452-49db78a17da1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"59d4f3c7-9559-4fa5-8844-5f2d93c30a7f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1e1fdf64-5300-4a26-8dc0-12d34e412de3\"}]',1,'2023-11-13 16:16:44','2023-11-13 16:16:44','264cb0a3-acc5-4873-a843-2c10221439a1');

/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fields`;

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_fbkzhsumckdowxxnjvozfxbjevvhrzavemgd` (`handle`,`context`),
  KEY `craft_idx_eajmydcjxqafwboemejrbrgpdfwvnrzpbinf` (`groupId`),
  KEY `craft_idx_wyskuhtnmsywoopmaijguwrinhguqvupiuhm` (`context`),
  CONSTRAINT `craft_fk_zjtdemkkgdwfkbiunpqeryrlomhrqnaaacys` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,2,'Introduction','introduction','global','yetqqcwj','Short sentence at top of drink page',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-07-07 22:46:13','2023-07-07 22:46:13','dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3'),
	(2,2,'Page copy','pageCopy','global','fpawuluh',NULL,1,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"\",\"ckeConfig\":\"0a4d3e62-b383-4317-83ec-0dab9cfcb550\",\"columnType\":\"text\",\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false}','2023-07-08 07:02:02','2023-07-08 07:02:02','698c2c75-2a70-480a-852c-8e6c9dc2f095'),
	(3,1,'Excerpt','excerpt','global','xuzzitfj',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-07-08 07:04:46','2023-07-08 07:05:38','73f4252e-66e1-47b9-bca6-9539be73126b'),
	(4,3,'News body','newsBody','global','fnteyxpg',NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"\",\"ckeConfig\":\"0a4d3e62-b383-4317-83ec-0dab9cfcb550\",\"columnType\":\"text\",\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false}','2023-07-08 07:05:54','2023-07-08 07:05:54','cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753'),
	(5,2,'Drink image','drinkImage','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:33f7304a-36e8-41e2-a1af-285e3885fab8\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:33f7304a-36e8-41e2-a1af-285e3885fab8\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":\"Add a drink image\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:33f7304a-36e8-41e2-a1af-285e3885fab8\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2023-07-23 08:04:07','2023-07-23 08:04:07','4a683cf6-5953-4f09-8452-49db78a17da1'),
	(6,4,'Subtitle','subtitle','global','nztqoamm',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-11-10 13:41:16','2023-11-10 13:41:16','c0aec353-cfd5-4cb5-a54c-ba4d04080107'),
	(7,4,'Page intro','pageIntro','global','cemhehvv',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-11-10 13:41:26','2023-11-10 13:41:26','b69006e0-11e2-4f01-b0fc-0d584155e3ee'),
	(8,5,'Recipe Contents','recipeContents','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_recipecontents}}\",\"maxBlocks\":null,\"minBlocks\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2023-11-13 10:24:44','2023-11-13 10:24:44','04ded7df-16f3-4718-b279-c9dd1cc6ff91'),
	(9,NULL,'Image caption','imageCaption','matrixBlockType:907915af-87d2-4703-95a1-ebb8a652d445','lknkamcy',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-11-13 10:24:45','2023-11-13 10:24:45','0b992201-02d6-482e-95db-9deda58d0abd'),
	(10,NULL,'Image','image','matrixBlockType:907915af-87d2-4703-95a1-ebb8a652d445',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:33f7304a-36e8-41e2-a1af-285e3885fab8\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":1,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:33f7304a-36e8-41e2-a1af-285e3885fab8\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2023-11-13 10:24:45','2023-11-13 10:24:45','caea4449-52ec-4f58-b4b5-10a73028a1bd'),
	(11,NULL,'Tip content','tipContent','matrixBlockType:13c6813c-41d2-4c4a-8e07-1a08250f74d7','ifbkxxbo',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-11-13 10:24:45','2023-11-13 10:24:45','408e958f-484f-4218-97a1-61928d88e082'),
	(12,NULL,'Body content','bodyContent','matrixBlockType:51831859-89b7-488a-b11f-bdbe47efe345','ixsvoiho',NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"ckeConfig\":\"0a4d3e62-b383-4317-83ec-0dab9cfcb550\",\"columnType\":\"text\",\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2023-11-13 10:24:45','2023-11-13 10:24:45','b646caf2-73a7-4576-b914-49d7767fb79a'),
	(13,NULL,'Steps content','stepsContent','matrixBlockType:618c8b80-48c6-4f21-b4b5-3799513c0ec4','phtxafmo',NULL,0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columnType\":\"text\",\"columns\":{\"col1\":{\"heading\":\"Step Instructions\",\"handle\":\"stepInstructions\",\"width\":\"\",\"type\":\"multiline\"}},\"defaults\":null,\"maxRows\":null,\"minRows\":null,\"staticRows\":false}','2023-11-13 10:24:45','2023-11-13 10:24:45','13c08d93-1751-4725-aa81-f7930303df4e'),
	(14,NULL,'Steps Title','stepsTitle','matrixBlockType:618c8b80-48c6-4f21-b4b5-3799513c0ec4','wfhmkbiz',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-11-13 10:24:45','2023-11-13 10:24:45','e9185427-bcf9-4ecd-af4b-e8b247a7df7c'),
	(15,NULL,'Ingredients','ingredients','matrixBlockType:c5a06246-b324-46d5-8727-2789c2374a92','hnwidpcl',NULL,0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"columnType\":\"text\",\"columns\":{\"col1\":{\"heading\":\"Amount\",\"handle\":\"amount\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Ingredient\",\"handle\":\"ingredient\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\",\"col2\":\"\"}],\"maxRows\":null,\"minRows\":null,\"staticRows\":false}','2023-11-13 10:24:45','2023-11-13 10:24:45','a3769b58-80e0-4684-81b8-70cb37801eaa'),
	(16,6,'Style description','styleDescription','global','bdexzddb',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-11-13 11:20:12','2023-11-13 11:20:12','4105ff33-812d-4a27-9f88-9d4e339e488b'),
	(17,6,'Drink style','drinkStyle','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Categories','{\"allowSelfRelations\":false,\"branchLimit\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":1,\"selectionLabel\":null,\"showSiteMenu\":true,\"source\":\"group:e682d4a9-435d-4cf8-9892-a3e34f88f406\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2023-11-13 11:21:48','2023-11-13 11:23:05','aa5e3e23-3c7c-4e0d-898b-81c0190210de'),
	(18,2,'Drink recipe','drinkRecipe','global',NULL,NULL,1,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":1,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"},\"selectionLabel\":\"Add a drink recipe\",\"showSiteMenu\":false,\"sources\":[\"section:783b5a78-d3c7-4b2e-9fea-0459bc803fe0\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2023-11-13 16:16:11','2023-11-13 16:16:11','1e1fdf64-5300-4a26-8dc0-12d34e412de3');

/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_globalsets`;

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_wvdboabfwmddcwxenhbbluhpqgfhgzvbbduv` (`name`),
  KEY `craft_idx_jyqjvvlzgqgppmsvybbaiwulvuardgfrriaa` (`handle`),
  KEY `craft_idx_yzhstqlctfjvpebpxgrnqeykqnixujfzzmqy` (`fieldLayoutId`),
  KEY `craft_idx_hkxpmyvzzpnfvlzfxvvpurplcbtlxfhhgmyk` (`sortOrder`),
  CONSTRAINT `craft_fk_anssgymxlkrfnbjamdevyhtaupdznztbtske` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_suuhmbdcybvbuwvgvnccxkomwwrvubymdrqo` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_gqlschemas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_gqlschemas`;

CREATE TABLE `craft_gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_gqlschemas` WRITE;
/*!40000 ALTER TABLE `craft_gqlschemas` DISABLE KEYS */;

INSERT INTO `craft_gqlschemas` (`id`, `name`, `scope`, `isPublic`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Public Schema','[]',1,'2023-06-24 06:23:59','2023-06-24 06:23:59','7f9cf7cc-e388-4dd8-819d-17427ec39847');

/*!40000 ALTER TABLE `craft_gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_gqltokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_gqltokens`;

CREATE TABLE `craft_gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_ffnuatvocojzdftacfdbqrcfdwrnfocdqrjv` (`accessToken`),
  UNIQUE KEY `craft_idx_hrmjzgeklcvtttrpuugywezghbfxrpatttjc` (`name`),
  KEY `craft_fk_wqvromzkvtzzsmbeqywtbhshajyuqkigkgys` (`schemaId`),
  CONSTRAINT `craft_fk_wqvromzkvtzzsmbeqywtbhshajyuqkigkgys` FOREIGN KEY (`schemaId`) REFERENCES `craft_gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_imagetransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_imagetransformindex`;

CREATE TABLE `craft_imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_sroufzztlkukqacdhkrtxmcygspmkujbfwsx` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_imagetransformindex` WRITE;
/*!40000 ALTER TABLE `craft_imagetransformindex` DISABLE KEYS */;

INSERT INTO `craft_imagetransformindex` (`id`, `assetId`, `transformer`, `filename`, `format`, `transformString`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(12,17,'craft\\imagetransforms\\ImageTransformer','iced-coffee.jpg',NULL,'_34x27_crop_center-center_none',1,0,0,'2023-11-10 16:47:41','2023-11-10 16:47:41','2023-11-10 16:47:42','b48810e7-52f6-4151-8dc9-0bb5cbe07561'),
	(13,17,'craft\\imagetransforms\\ImageTransformer','iced-coffee.jpg',NULL,'_68x55_crop_center-center_none',1,0,0,'2023-11-10 16:47:41','2023-11-10 16:47:41','2023-11-10 16:47:44','e8661452-80eb-4447-bb95-e79711915187'),
	(14,17,'craft\\imagetransforms\\ImageTransformer','iced-coffee.jpg',NULL,'_120x97_crop_center-center_none',1,0,0,'2023-11-10 16:47:48','2023-11-10 16:47:48','2023-11-10 16:47:49','6f42de03-9219-4bb9-967f-a28a25694bc7'),
	(15,17,'craft\\imagetransforms\\ImageTransformer','iced-coffee.jpg',NULL,'_240x194_crop_center-center_none',1,0,0,'2023-11-10 16:47:48','2023-11-10 16:47:48','2023-11-10 16:47:49','5c204643-30d8-4725-bd44-ea5b777f47b4'),
	(16,14,'craft\\imagetransforms\\ImageTransformer','espresso-shot.jpg',NULL,'_34x19_crop_center-center_none',1,0,0,'2023-11-10 16:48:04','2023-11-10 16:48:04','2023-11-10 16:48:04','29d35ee5-1d3d-463b-bd72-f85f7a8ec6e4'),
	(17,14,'craft\\imagetransforms\\ImageTransformer','espresso-shot.jpg',NULL,'_68x39_crop_center-center_none',1,0,0,'2023-11-10 16:48:04','2023-11-10 16:48:04','2023-11-10 16:48:12','ab425078-c983-4182-9d49-3caf2025c7d8'),
	(18,41,'craft\\imagetransforms\\ImageTransformer','chemex.jpg',NULL,'_34x28_crop_center-center_none',1,0,0,'2023-11-10 16:48:12','2023-11-10 16:48:12','2023-11-10 16:48:13','8497cf24-afa6-44c0-83cc-9c2f14b2bee7'),
	(19,41,'craft\\imagetransforms\\ImageTransformer','chemex.jpg',NULL,'_68x57_crop_center-center_none',1,0,0,'2023-11-10 16:48:12','2023-11-10 16:48:12','2023-11-10 16:48:14','27c45614-0866-4163-b2a7-94eec9c556cf'),
	(20,14,'craft\\imagetransforms\\ImageTransformer','espresso-shot.jpg',NULL,'_120x68_crop_center-center_none',1,0,0,'2023-11-10 17:03:06','2023-11-10 17:03:06','2023-11-10 17:03:07','6121e23a-e95b-4c8a-b0f0-0f307a2c0081'),
	(21,14,'craft\\imagetransforms\\ImageTransformer','espresso-shot.jpg',NULL,'_240x137_crop_center-center_none',1,0,0,'2023-11-10 17:03:06','2023-11-10 17:03:06','2023-11-10 17:03:07','6e6ccba6-485b-47f2-bafc-702fe7412880'),
	(22,41,'craft\\imagetransforms\\ImageTransformer','chemex.jpg',NULL,'_120x101_crop_center-center_none',1,0,0,'2023-11-10 18:34:45','2023-11-10 18:34:45','2023-11-10 18:34:46','a47a1e94-2f33-4671-9e6a-4d8f15986076'),
	(23,41,'craft\\imagetransforms\\ImageTransformer','chemex.jpg',NULL,'_240x202_crop_center-center_none',1,0,0,'2023-11-10 18:34:45','2023-11-10 18:34:45','2023-11-10 18:34:46','ed31b023-932b-4ac3-85ec-700ed20dfd2d');

/*!40000 ALTER TABLE `craft_imagetransformindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_imagetransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_imagetransforms`;

CREATE TABLE `craft_imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_rxivzmbihsnsphamsjbwrcihiiefjydbfwrc` (`name`),
  KEY `craft_idx_aeppqaoreqyhkvbfhryherwzwlxnecwtdnlk` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_imagetransforms` WRITE;
/*!40000 ALTER TABLE `craft_imagetransforms` DISABLE KEYS */;

INSERT INTO `craft_imagetransforms` (`id`, `name`, `handle`, `mode`, `position`, `width`, `height`, `format`, `quality`, `interlace`, `fill`, `upscale`, `parameterChangeTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'840x200 Thumb','Thumb840x200','crop','center-center',840,200,NULL,NULL,'none',NULL,1,'2023-07-23 08:12:39','2023-07-23 08:12:39','2023-07-23 08:12:39','42840bed-00c3-43de-ad99-357a1473c37a');

/*!40000 ALTER TABLE `craft_imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_info`;

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;

INSERT INTO `craft_info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'4.5.6.1','4.5.3.0',0,'oczwcuznisjm','3@rmkqgtfbbe','2023-06-23 21:48:48','2023-11-13 16:16:44','6acc31c2-6955-4d4c-ba57-301ec312296f');

/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocks`;

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_exdwfefjqueyjcaqfagzntkrxleuefapaass` (`primaryOwnerId`),
  KEY `craft_idx_ufnguglnxgcgatkxpyxrisdntygoifyffeby` (`fieldId`),
  KEY `craft_idx_hvxcidplzigqbcoynltztakiowvxzlpunmhv` (`typeId`),
  CONSTRAINT `craft_fk_arsxkjbxuuofxsldhoypzzaychtlrfgtwusz` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_mzlewysjocrowojtmdigjoxqdpcjrgykreob` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_tftoabyrzhjhkjcfwhcidvboskjkmoufrrnk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_wvyjmeqtwtwundlnrjqrgvihezitcuzfgnhd` FOREIGN KEY (`primaryOwnerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_matrixblocks` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks` DISABLE KEYS */;

INSERT INTO `craft_matrixblocks` (`id`, `primaryOwnerId`, `fieldId`, `typeId`, `deletedWithOwner`, `dateCreated`, `dateUpdated`)
VALUES
	(61,60,8,3,0,'2023-11-13 10:25:40','2023-11-13 10:25:40'),
	(62,60,8,3,0,'2023-11-13 10:25:49','2023-11-13 10:25:49'),
	(63,60,8,3,0,'2023-11-13 10:25:50','2023-11-13 10:25:50'),
	(64,60,8,3,0,'2023-11-13 10:25:51','2023-11-13 10:25:51'),
	(65,60,8,1,0,'2023-11-13 10:25:51','2023-11-13 10:25:51'),
	(66,60,8,3,0,'2023-11-13 10:25:57','2023-11-13 10:25:57'),
	(67,60,8,1,0,'2023-11-13 10:25:57','2023-11-13 10:25:57'),
	(68,60,8,3,0,'2023-11-13 10:26:01','2023-11-13 10:26:01'),
	(69,60,8,1,0,'2023-11-13 10:26:01','2023-11-13 10:26:01'),
	(70,60,8,3,0,'2023-11-13 10:26:03','2023-11-13 10:26:03'),
	(71,60,8,1,0,'2023-11-13 10:26:03','2023-11-13 10:26:03'),
	(72,60,8,3,0,'2023-11-13 10:26:08','2023-11-13 10:26:08'),
	(73,60,8,1,0,'2023-11-13 10:26:08','2023-11-13 10:26:08'),
	(74,60,8,3,0,'2023-11-13 10:26:14','2023-11-13 10:26:14'),
	(75,60,8,1,0,'2023-11-13 10:26:14','2023-11-13 10:26:14'),
	(76,60,8,3,0,'2023-11-13 10:26:15','2023-11-13 10:26:15'),
	(77,60,8,1,0,'2023-11-13 10:26:15','2023-11-13 10:26:15'),
	(78,60,8,2,0,'2023-11-13 10:26:15','2023-11-13 10:26:15'),
	(79,60,8,3,0,'2023-11-13 10:26:21','2023-11-13 10:26:21'),
	(80,60,8,1,0,'2023-11-13 10:26:21','2023-11-13 10:26:21'),
	(81,60,8,2,0,'2023-11-13 10:26:21','2023-11-13 10:26:21'),
	(82,60,8,3,0,'2023-11-13 10:26:22','2023-11-13 10:26:22'),
	(83,60,8,1,0,'2023-11-13 10:26:22','2023-11-13 10:26:22'),
	(84,60,8,2,0,'2023-11-13 10:26:22','2023-11-13 10:26:22'),
	(85,60,8,3,0,'2023-11-13 10:26:24','2023-11-13 10:26:24'),
	(86,60,8,1,0,'2023-11-13 10:26:24','2023-11-13 10:26:24'),
	(87,60,8,2,0,'2023-11-13 10:26:24','2023-11-13 10:26:24'),
	(88,60,8,3,0,'2023-11-13 10:26:31','2023-11-13 10:26:31'),
	(89,60,8,1,0,'2023-11-13 10:26:31','2023-11-13 10:26:31'),
	(90,60,8,2,0,'2023-11-13 10:26:31','2023-11-13 10:26:31'),
	(91,60,8,3,0,'2023-11-13 10:26:32','2023-11-13 10:26:32'),
	(92,60,8,1,0,'2023-11-13 10:26:32','2023-11-13 10:26:32'),
	(93,60,8,2,0,'2023-11-13 10:26:32','2023-11-13 10:26:32'),
	(94,60,8,3,0,'2023-11-13 10:26:53','2023-11-13 10:26:53'),
	(95,60,8,1,0,'2023-11-13 10:26:53','2023-11-13 10:26:53'),
	(96,60,8,2,0,'2023-11-13 10:26:53','2023-11-13 10:26:53'),
	(97,60,8,3,0,'2023-11-13 10:26:53','2023-11-13 10:26:53'),
	(98,60,8,3,0,'2023-11-13 10:26:58','2023-11-13 10:26:58'),
	(99,60,8,1,0,'2023-11-13 10:26:58','2023-11-13 10:26:58'),
	(100,60,8,2,0,'2023-11-13 10:26:58','2023-11-13 10:26:58'),
	(101,60,8,3,0,'2023-11-13 10:26:58','2023-11-13 10:26:58'),
	(102,60,8,5,0,'2023-11-13 10:26:58','2023-11-13 10:26:58'),
	(103,60,8,3,0,'2023-11-13 10:27:04','2023-11-13 10:27:04'),
	(104,60,8,1,0,'2023-11-13 10:27:05','2023-11-13 10:27:05'),
	(105,60,8,2,0,'2023-11-13 10:27:05','2023-11-13 10:27:05'),
	(106,60,8,3,0,'2023-11-13 10:27:05','2023-11-13 10:27:05'),
	(107,60,8,5,0,'2023-11-13 10:27:05','2023-11-13 10:27:05'),
	(108,60,8,3,0,'2023-11-13 10:27:06','2023-11-13 10:27:06'),
	(109,60,8,1,0,'2023-11-13 10:27:06','2023-11-13 10:27:06'),
	(110,60,8,2,0,'2023-11-13 10:27:06','2023-11-13 10:27:06'),
	(111,60,8,3,0,'2023-11-13 10:27:06','2023-11-13 10:27:06'),
	(112,60,8,5,0,'2023-11-13 10:27:06','2023-11-13 10:27:06'),
	(113,60,8,3,0,'2023-11-13 10:27:13','2023-11-13 10:27:13'),
	(114,60,8,1,0,'2023-11-13 10:27:13','2023-11-13 10:27:13'),
	(115,60,8,2,0,'2023-11-13 10:27:13','2023-11-13 10:27:13'),
	(116,60,8,3,0,'2023-11-13 10:27:13','2023-11-13 10:27:13'),
	(117,60,8,5,0,'2023-11-13 10:27:13','2023-11-13 10:27:13'),
	(118,60,8,3,0,'2023-11-13 10:27:16','2023-11-13 10:27:16'),
	(119,60,8,1,0,'2023-11-13 10:27:16','2023-11-13 10:27:16'),
	(120,60,8,2,0,'2023-11-13 10:27:16','2023-11-13 10:27:16'),
	(121,60,8,3,0,'2023-11-13 10:27:16','2023-11-13 10:27:16'),
	(122,60,8,5,0,'2023-11-13 10:27:16','2023-11-13 10:27:16'),
	(123,60,8,3,0,'2023-11-13 10:27:17','2023-11-13 10:27:17'),
	(124,60,8,1,0,'2023-11-13 10:27:17','2023-11-13 10:27:17'),
	(125,60,8,2,0,'2023-11-13 10:27:17','2023-11-13 10:27:17'),
	(126,60,8,3,0,'2023-11-13 10:27:17','2023-11-13 10:27:17'),
	(127,60,8,5,0,'2023-11-13 10:27:17','2023-11-13 10:27:17'),
	(128,60,8,3,0,'2023-11-13 10:27:18','2023-11-13 10:27:18'),
	(129,60,8,1,0,'2023-11-13 10:27:18','2023-11-13 10:27:18'),
	(130,60,8,2,0,'2023-11-13 10:27:19','2023-11-13 10:27:19'),
	(131,60,8,3,0,'2023-11-13 10:27:19','2023-11-13 10:27:19'),
	(132,60,8,5,0,'2023-11-13 10:27:19','2023-11-13 10:27:19'),
	(133,60,8,3,0,'2023-11-13 10:27:21','2023-11-13 10:27:21'),
	(134,60,8,1,0,'2023-11-13 10:27:21','2023-11-13 10:27:21'),
	(135,60,8,2,0,'2023-11-13 10:27:21','2023-11-13 10:27:21'),
	(136,60,8,3,0,'2023-11-13 10:27:21','2023-11-13 10:27:21'),
	(137,60,8,5,0,'2023-11-13 10:27:21','2023-11-13 10:27:21'),
	(138,60,8,3,0,'2023-11-13 10:27:24','2023-11-13 10:27:24'),
	(139,60,8,1,0,'2023-11-13 10:27:24','2023-11-13 10:27:24'),
	(140,60,8,2,0,'2023-11-13 10:27:24','2023-11-13 10:27:24'),
	(141,60,8,3,0,'2023-11-13 10:27:24','2023-11-13 10:27:24'),
	(142,60,8,5,0,'2023-11-13 10:27:24','2023-11-13 10:27:24'),
	(143,60,8,3,0,'2023-11-13 10:27:26','2023-11-13 10:27:26'),
	(144,60,8,1,0,'2023-11-13 10:27:26','2023-11-13 10:27:26'),
	(145,60,8,2,0,'2023-11-13 10:27:26','2023-11-13 10:27:26'),
	(146,60,8,3,0,'2023-11-13 10:27:26','2023-11-13 10:27:26'),
	(147,60,8,5,0,'2023-11-13 10:27:26','2023-11-13 10:27:26'),
	(148,60,8,3,0,'2023-11-13 10:27:26','2023-11-13 10:27:26'),
	(149,60,8,3,0,'2023-11-13 10:27:29','2023-11-13 10:27:29'),
	(150,60,8,1,0,'2023-11-13 10:27:29','2023-11-13 10:27:29'),
	(151,60,8,2,0,'2023-11-13 10:27:29','2023-11-13 10:27:29'),
	(152,60,8,3,0,'2023-11-13 10:27:29','2023-11-13 10:27:29'),
	(153,60,8,5,0,'2023-11-13 10:27:29','2023-11-13 10:27:29'),
	(154,60,8,3,0,'2023-11-13 10:27:29','2023-11-13 10:27:29'),
	(155,60,8,4,0,'2023-11-13 10:27:29','2023-11-13 10:27:29'),
	(156,60,8,3,0,'2023-11-13 10:27:33','2023-11-13 10:27:33'),
	(157,60,8,1,0,'2023-11-13 10:27:33','2023-11-13 10:27:33'),
	(158,60,8,2,0,'2023-11-13 10:27:33','2023-11-13 10:27:33'),
	(159,60,8,3,0,'2023-11-13 10:27:33','2023-11-13 10:27:33'),
	(160,60,8,5,0,'2023-11-13 10:27:33','2023-11-13 10:27:33'),
	(161,60,8,4,0,'2023-11-13 10:27:33','2023-11-13 10:27:33'),
	(162,60,8,3,0,'2023-11-13 10:27:41','2023-11-13 10:27:41'),
	(163,60,8,1,0,'2023-11-13 10:27:41','2023-11-13 10:27:41'),
	(164,60,8,2,0,'2023-11-13 10:27:41','2023-11-13 10:27:41'),
	(165,60,8,3,0,'2023-11-13 10:27:41','2023-11-13 10:27:41'),
	(166,60,8,5,0,'2023-11-13 10:27:41','2023-11-13 10:27:41'),
	(167,60,8,4,0,'2023-11-13 10:27:41','2023-11-13 10:27:41'),
	(168,60,8,3,0,'2023-11-13 10:27:44','2023-11-13 10:27:44'),
	(169,60,8,1,0,'2023-11-13 10:27:44','2023-11-13 10:27:44'),
	(170,60,8,2,0,'2023-11-13 10:27:44','2023-11-13 10:27:44'),
	(171,60,8,3,0,'2023-11-13 10:27:44','2023-11-13 10:27:44'),
	(172,60,8,5,0,'2023-11-13 10:27:44','2023-11-13 10:27:44'),
	(173,60,8,4,0,'2023-11-13 10:27:44','2023-11-13 10:27:44'),
	(174,60,8,3,0,'2023-11-13 10:27:45','2023-11-13 10:27:45'),
	(175,60,8,1,0,'2023-11-13 10:27:45','2023-11-13 10:27:45'),
	(176,60,8,2,0,'2023-11-13 10:27:45','2023-11-13 10:27:45'),
	(177,60,8,3,0,'2023-11-13 10:27:45','2023-11-13 10:27:45'),
	(178,60,8,5,0,'2023-11-13 10:27:45','2023-11-13 10:27:45'),
	(179,60,8,4,0,'2023-11-13 10:27:45','2023-11-13 10:27:45'),
	(180,60,8,3,0,'2023-11-13 10:27:50','2023-11-13 10:27:50'),
	(181,60,8,1,0,'2023-11-13 10:27:50','2023-11-13 10:27:50'),
	(182,60,8,2,0,'2023-11-13 10:27:50','2023-11-13 10:27:50'),
	(183,60,8,3,0,'2023-11-13 10:27:50','2023-11-13 10:27:50'),
	(184,60,8,5,0,'2023-11-13 10:27:50','2023-11-13 10:27:50'),
	(185,60,8,4,0,'2023-11-13 10:27:50','2023-11-13 10:27:50'),
	(186,60,8,3,0,'2023-11-13 10:27:52','2023-11-13 10:27:52'),
	(187,60,8,1,0,'2023-11-13 10:27:52','2023-11-13 10:27:52'),
	(188,60,8,2,0,'2023-11-13 10:27:52','2023-11-13 10:27:52'),
	(189,60,8,3,0,'2023-11-13 10:27:52','2023-11-13 10:27:52'),
	(190,60,8,5,0,'2023-11-13 10:27:52','2023-11-13 10:27:52'),
	(191,60,8,4,0,'2023-11-13 10:27:52','2023-11-13 10:27:52'),
	(192,60,8,3,0,'2023-11-13 10:27:55','2023-11-13 10:27:55'),
	(193,60,8,1,0,'2023-11-13 10:27:55','2023-11-13 10:27:55'),
	(194,60,8,2,0,'2023-11-13 10:27:55','2023-11-13 10:27:55'),
	(195,60,8,3,0,'2023-11-13 10:27:55','2023-11-13 10:27:55'),
	(196,60,8,5,0,'2023-11-13 10:27:55','2023-11-13 10:27:55'),
	(197,60,8,4,0,'2023-11-13 10:27:55','2023-11-13 10:27:55'),
	(198,60,8,3,0,'2023-11-13 10:27:56','2023-11-13 10:27:56'),
	(199,60,8,1,0,'2023-11-13 10:27:56','2023-11-13 10:27:56'),
	(200,60,8,2,0,'2023-11-13 10:27:56','2023-11-13 10:27:56'),
	(201,60,8,3,0,'2023-11-13 10:27:56','2023-11-13 10:27:56'),
	(202,60,8,5,0,'2023-11-13 10:27:56','2023-11-13 10:27:56'),
	(203,60,8,4,0,'2023-11-13 10:27:56','2023-11-13 10:27:56'),
	(204,60,8,3,0,'2023-11-13 10:27:56','2023-11-13 10:27:56'),
	(205,60,8,1,0,'2023-11-13 10:27:56','2023-11-13 10:27:56'),
	(206,60,8,2,0,'2023-11-13 10:27:56','2023-11-13 10:27:56'),
	(207,60,8,3,0,'2023-11-13 10:27:56','2023-11-13 10:27:56'),
	(208,60,8,5,0,'2023-11-13 10:27:57','2023-11-13 10:27:57'),
	(209,60,8,4,0,'2023-11-13 10:27:57','2023-11-13 10:27:57'),
	(210,60,8,3,0,'2023-11-13 10:27:59','2023-11-13 10:27:59'),
	(211,60,8,1,0,'2023-11-13 10:27:59','2023-11-13 10:27:59'),
	(212,60,8,2,0,'2023-11-13 10:27:59','2023-11-13 10:27:59'),
	(213,60,8,3,0,'2023-11-13 10:27:59','2023-11-13 10:27:59'),
	(214,60,8,5,0,'2023-11-13 10:27:59','2023-11-13 10:27:59'),
	(215,60,8,4,0,'2023-11-13 10:27:59','2023-11-13 10:27:59'),
	(216,60,8,3,0,'2023-11-13 10:28:00','2023-11-13 10:28:00'),
	(217,60,8,1,0,'2023-11-13 10:28:00','2023-11-13 10:28:00'),
	(218,60,8,2,0,'2023-11-13 10:28:00','2023-11-13 10:28:00'),
	(219,60,8,3,0,'2023-11-13 10:28:00','2023-11-13 10:28:00'),
	(220,60,8,5,0,'2023-11-13 10:28:00','2023-11-13 10:28:00'),
	(221,60,8,4,0,'2023-11-13 10:28:00','2023-11-13 10:28:00'),
	(222,60,8,1,0,'2023-11-13 10:28:00','2023-11-13 10:28:00'),
	(223,60,8,3,0,'2023-11-13 10:28:05','2023-11-13 10:28:05'),
	(224,60,8,1,0,'2023-11-13 10:28:05','2023-11-13 10:28:05'),
	(225,60,8,2,0,'2023-11-13 10:28:05','2023-11-13 10:28:05'),
	(226,60,8,3,0,'2023-11-13 10:28:05','2023-11-13 10:28:05'),
	(227,60,8,5,0,'2023-11-13 10:28:05','2023-11-13 10:28:05'),
	(228,60,8,4,0,'2023-11-13 10:28:05','2023-11-13 10:28:05'),
	(229,60,8,1,0,'2023-11-13 10:28:05','2023-11-13 10:28:05'),
	(230,60,8,3,0,'2023-11-13 10:28:13','2023-11-13 10:28:13'),
	(231,60,8,1,0,'2023-11-13 10:28:13','2023-11-13 10:28:13'),
	(232,60,8,2,0,'2023-11-13 10:28:13','2023-11-13 10:28:13'),
	(233,60,8,3,0,'2023-11-13 10:28:13','2023-11-13 10:28:13'),
	(234,60,8,5,0,'2023-11-13 10:28:13','2023-11-13 10:28:13'),
	(235,60,8,4,0,'2023-11-13 10:28:13','2023-11-13 10:28:13'),
	(236,60,8,1,0,'2023-11-13 10:28:13','2023-11-13 10:28:13'),
	(237,60,8,3,0,'2023-11-13 10:28:16','2023-11-13 10:28:16'),
	(238,60,8,1,0,'2023-11-13 10:28:16','2023-11-13 10:28:16'),
	(239,60,8,2,0,'2023-11-13 10:28:16','2023-11-13 10:28:16'),
	(240,60,8,3,0,'2023-11-13 10:28:16','2023-11-13 10:28:16'),
	(241,60,8,5,0,'2023-11-13 10:28:16','2023-11-13 10:28:16'),
	(242,60,8,4,0,'2023-11-13 10:28:16','2023-11-13 10:28:16'),
	(243,60,8,1,0,'2023-11-13 10:28:16','2023-11-13 10:28:16'),
	(244,60,8,4,0,'2023-11-13 10:28:16','2023-11-13 10:28:16'),
	(245,60,8,3,0,'2023-11-13 10:28:19','2023-11-13 10:28:19'),
	(246,60,8,1,0,'2023-11-13 10:28:19','2023-11-13 10:28:19'),
	(247,60,8,2,0,'2023-11-13 10:28:19','2023-11-13 10:28:19'),
	(248,60,8,3,0,'2023-11-13 10:28:19','2023-11-13 10:28:19'),
	(249,60,8,5,0,'2023-11-13 10:28:19','2023-11-13 10:28:19'),
	(250,60,8,4,0,'2023-11-13 10:28:19','2023-11-13 10:28:19'),
	(251,60,8,1,0,'2023-11-13 10:28:19','2023-11-13 10:28:19'),
	(252,60,8,4,0,'2023-11-13 10:28:19','2023-11-13 10:28:19'),
	(253,60,8,3,0,'2023-11-13 10:28:22','2023-11-13 10:28:22'),
	(254,60,8,1,0,'2023-11-13 10:28:22','2023-11-13 10:28:22'),
	(255,60,8,2,0,'2023-11-13 10:28:22','2023-11-13 10:28:22'),
	(256,60,8,3,0,'2023-11-13 10:28:22','2023-11-13 10:28:22'),
	(257,60,8,5,0,'2023-11-13 10:28:22','2023-11-13 10:28:22'),
	(258,60,8,4,0,'2023-11-13 10:28:22','2023-11-13 10:28:22'),
	(259,60,8,1,0,'2023-11-13 10:28:22','2023-11-13 10:28:22'),
	(260,60,8,4,0,'2023-11-13 10:28:22','2023-11-13 10:28:22'),
	(261,60,8,3,0,'2023-11-13 10:28:24','2023-11-13 10:28:24'),
	(262,60,8,1,0,'2023-11-13 10:28:24','2023-11-13 10:28:24'),
	(263,60,8,2,0,'2023-11-13 10:28:24','2023-11-13 10:28:24'),
	(264,60,8,3,0,'2023-11-13 10:28:24','2023-11-13 10:28:24'),
	(265,60,8,5,0,'2023-11-13 10:28:24','2023-11-13 10:28:24'),
	(266,60,8,4,0,'2023-11-13 10:28:24','2023-11-13 10:28:24'),
	(267,60,8,1,0,'2023-11-13 10:28:24','2023-11-13 10:28:24'),
	(268,60,8,4,0,'2023-11-13 10:28:24','2023-11-13 10:28:24'),
	(269,60,8,3,0,'2023-11-13 10:28:26','2023-11-13 10:28:26'),
	(270,60,8,1,0,'2023-11-13 10:28:26','2023-11-13 10:28:26'),
	(271,60,8,2,0,'2023-11-13 10:28:26','2023-11-13 10:28:26'),
	(272,60,8,3,0,'2023-11-13 10:28:26','2023-11-13 10:28:26'),
	(273,60,8,5,0,'2023-11-13 10:28:26','2023-11-13 10:28:26'),
	(274,60,8,4,0,'2023-11-13 10:28:26','2023-11-13 10:28:26'),
	(275,60,8,1,0,'2023-11-13 10:28:26','2023-11-13 10:28:26'),
	(276,60,8,4,0,'2023-11-13 10:28:26','2023-11-13 10:28:26'),
	(277,60,8,3,0,'2023-11-13 10:28:29','2023-11-13 10:28:29'),
	(278,60,8,1,0,'2023-11-13 10:28:29','2023-11-13 10:28:29'),
	(279,60,8,2,0,'2023-11-13 10:28:29','2023-11-13 10:28:29'),
	(280,60,8,3,0,'2023-11-13 10:28:29','2023-11-13 10:28:29'),
	(281,60,8,5,0,'2023-11-13 10:28:29','2023-11-13 10:28:29'),
	(282,60,8,4,0,'2023-11-13 10:28:29','2023-11-13 10:28:29'),
	(283,60,8,1,0,'2023-11-13 10:28:29','2023-11-13 10:28:29'),
	(284,60,8,4,0,'2023-11-13 10:28:29','2023-11-13 10:28:29'),
	(285,60,8,3,0,'2023-11-13 10:28:32','2023-11-13 10:28:32'),
	(286,60,8,1,0,'2023-11-13 10:28:32','2023-11-13 10:28:32'),
	(287,60,8,2,0,'2023-11-13 10:28:32','2023-11-13 10:28:32'),
	(288,60,8,3,0,'2023-11-13 10:28:32','2023-11-13 10:28:32'),
	(289,60,8,5,0,'2023-11-13 10:28:32','2023-11-13 10:28:32'),
	(290,60,8,4,0,'2023-11-13 10:28:32','2023-11-13 10:28:32'),
	(291,60,8,1,0,'2023-11-13 10:28:32','2023-11-13 10:28:32'),
	(292,60,8,4,0,'2023-11-13 10:28:32','2023-11-13 10:28:32'),
	(293,60,8,3,0,'2023-11-13 10:28:33','2023-11-13 10:28:33'),
	(294,60,8,1,0,'2023-11-13 10:28:33','2023-11-13 10:28:33'),
	(295,60,8,2,0,'2023-11-13 10:28:33','2023-11-13 10:28:33'),
	(296,60,8,3,0,'2023-11-13 10:28:33','2023-11-13 10:28:33'),
	(297,60,8,5,0,'2023-11-13 10:28:33','2023-11-13 10:28:33'),
	(298,60,8,4,0,'2023-11-13 10:28:33','2023-11-13 10:28:33'),
	(299,60,8,1,0,'2023-11-13 10:28:33','2023-11-13 10:28:33'),
	(300,60,8,4,0,'2023-11-13 10:28:33','2023-11-13 10:28:33'),
	(301,60,8,3,0,'2023-11-13 10:28:34','2023-11-13 10:28:34'),
	(302,60,8,1,0,'2023-11-13 10:28:34','2023-11-13 10:28:34'),
	(303,60,8,2,0,'2023-11-13 10:28:34','2023-11-13 10:28:34'),
	(304,60,8,3,0,'2023-11-13 10:28:34','2023-11-13 10:28:34'),
	(305,60,8,5,0,'2023-11-13 10:28:34','2023-11-13 10:28:34'),
	(306,60,8,4,0,'2023-11-13 10:28:34','2023-11-13 10:28:34'),
	(307,60,8,1,0,'2023-11-13 10:28:34','2023-11-13 10:28:34'),
	(308,60,8,4,0,'2023-11-13 10:28:34','2023-11-13 10:28:34'),
	(309,60,8,3,NULL,'2023-11-13 10:28:37','2023-11-13 10:28:37'),
	(310,60,8,1,NULL,'2023-11-13 10:28:37','2023-11-13 10:28:37'),
	(311,60,8,2,NULL,'2023-11-13 10:28:37','2023-11-13 10:28:37'),
	(312,60,8,3,NULL,'2023-11-13 10:28:37','2023-11-13 10:28:37'),
	(313,60,8,5,NULL,'2023-11-13 10:28:37','2023-11-13 10:28:37'),
	(314,60,8,4,NULL,'2023-11-13 10:28:37','2023-11-13 10:28:37'),
	(315,60,8,1,NULL,'2023-11-13 10:28:37','2023-11-13 10:28:37'),
	(316,60,8,4,NULL,'2023-11-13 10:28:37','2023-11-13 10:28:37'),
	(318,317,8,3,NULL,'2023-11-13 10:28:39','2023-11-13 10:28:39'),
	(319,317,8,1,NULL,'2023-11-13 10:28:39','2023-11-13 10:28:39'),
	(320,317,8,2,NULL,'2023-11-13 10:28:39','2023-11-13 10:28:39'),
	(321,317,8,3,NULL,'2023-11-13 10:28:39','2023-11-13 10:28:39'),
	(322,317,8,5,NULL,'2023-11-13 10:28:39','2023-11-13 10:28:39'),
	(323,317,8,4,NULL,'2023-11-13 10:28:39','2023-11-13 10:28:39'),
	(324,317,8,1,NULL,'2023-11-13 10:28:39','2023-11-13 10:28:39'),
	(325,317,8,4,NULL,'2023-11-13 10:28:39','2023-11-13 10:28:39'),
	(329,328,8,3,NULL,'2023-11-13 11:22:40','2023-11-13 11:22:40'),
	(330,328,8,1,NULL,'2023-11-13 11:22:40','2023-11-13 11:22:40'),
	(331,328,8,2,NULL,'2023-11-13 11:22:40','2023-11-13 11:22:40'),
	(332,328,8,3,NULL,'2023-11-13 11:22:40','2023-11-13 11:22:40'),
	(333,328,8,5,NULL,'2023-11-13 11:22:40','2023-11-13 11:22:40'),
	(334,328,8,4,NULL,'2023-11-13 11:22:40','2023-11-13 11:22:40'),
	(335,328,8,1,NULL,'2023-11-13 11:22:40','2023-11-13 11:22:40'),
	(336,328,8,4,NULL,'2023-11-13 11:22:40','2023-11-13 11:22:40'),
	(348,347,8,3,NULL,'2023-11-13 14:48:33','2023-11-13 14:48:33'),
	(349,347,8,1,NULL,'2023-11-13 14:48:33','2023-11-13 14:48:33'),
	(350,347,8,2,NULL,'2023-11-13 14:48:33','2023-11-13 14:48:33'),
	(351,347,8,3,NULL,'2023-11-13 14:48:33','2023-11-13 14:48:33'),
	(352,347,8,5,NULL,'2023-11-13 14:48:33','2023-11-13 14:48:33'),
	(353,347,8,4,NULL,'2023-11-13 14:48:33','2023-11-13 14:48:33'),
	(354,347,8,1,NULL,'2023-11-13 14:48:33','2023-11-13 14:48:33'),
	(355,347,8,4,NULL,'2023-11-13 14:48:33','2023-11-13 14:48:33');

/*!40000 ALTER TABLE `craft_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_matrixblocks_owners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocks_owners`;

CREATE TABLE `craft_matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `craft_fk_iqhlbqyxrecvuxeibalygbldxqbuawsawecs` (`ownerId`),
  CONSTRAINT `craft_fk_iqhlbqyxrecvuxeibalygbldxqbuawsawecs` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_lfgxfzpnspmspcxplmrxaijmmfvewoduvewi` FOREIGN KEY (`blockId`) REFERENCES `craft_matrixblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks_owners` DISABLE KEYS */;

INSERT INTO `craft_matrixblocks_owners` (`blockId`, `ownerId`, `sortOrder`)
VALUES
	(61,60,1),
	(62,60,1),
	(63,60,1),
	(64,60,1),
	(65,60,2),
	(66,60,1),
	(67,60,2),
	(68,60,1),
	(69,60,2),
	(70,60,1),
	(71,60,2),
	(72,60,1),
	(73,60,2),
	(74,60,1),
	(75,60,2),
	(76,60,1),
	(77,60,2),
	(78,60,3),
	(79,60,1),
	(80,60,2),
	(81,60,3),
	(82,60,1),
	(83,60,2),
	(84,60,3),
	(85,60,1),
	(86,60,2),
	(87,60,3),
	(88,60,1),
	(89,60,2),
	(90,60,3),
	(91,60,1),
	(92,60,2),
	(93,60,3),
	(94,60,1),
	(95,60,2),
	(96,60,3),
	(97,60,4),
	(98,60,1),
	(99,60,2),
	(100,60,3),
	(101,60,4),
	(102,60,5),
	(103,60,1),
	(104,60,2),
	(105,60,3),
	(106,60,4),
	(107,60,5),
	(108,60,1),
	(109,60,2),
	(110,60,3),
	(111,60,4),
	(112,60,5),
	(113,60,1),
	(114,60,2),
	(115,60,3),
	(116,60,4),
	(117,60,5),
	(118,60,1),
	(119,60,2),
	(120,60,3),
	(121,60,4),
	(122,60,5),
	(123,60,1),
	(124,60,2),
	(125,60,3),
	(126,60,4),
	(127,60,5),
	(128,60,1),
	(129,60,2),
	(130,60,3),
	(131,60,4),
	(132,60,5),
	(133,60,1),
	(134,60,2),
	(135,60,3),
	(136,60,4),
	(137,60,5),
	(138,60,1),
	(139,60,2),
	(140,60,3),
	(141,60,4),
	(142,60,5),
	(143,60,1),
	(144,60,2),
	(145,60,3),
	(146,60,4),
	(147,60,5),
	(148,60,6),
	(149,60,1),
	(150,60,2),
	(151,60,3),
	(152,60,4),
	(153,60,5),
	(154,60,6),
	(155,60,7),
	(156,60,1),
	(157,60,2),
	(158,60,3),
	(159,60,4),
	(160,60,5),
	(161,60,6),
	(162,60,1),
	(163,60,2),
	(164,60,3),
	(165,60,4),
	(166,60,5),
	(167,60,6),
	(168,60,1),
	(169,60,2),
	(170,60,3),
	(171,60,4),
	(172,60,5),
	(173,60,6),
	(174,60,1),
	(175,60,2),
	(176,60,3),
	(177,60,4),
	(178,60,5),
	(179,60,6),
	(180,60,1),
	(181,60,2),
	(182,60,3),
	(183,60,4),
	(184,60,5),
	(185,60,6),
	(186,60,1),
	(187,60,2),
	(188,60,3),
	(189,60,4),
	(190,60,5),
	(191,60,6),
	(192,60,1),
	(193,60,2),
	(194,60,3),
	(195,60,4),
	(196,60,5),
	(197,60,6),
	(198,60,1),
	(199,60,2),
	(200,60,3),
	(201,60,4),
	(202,60,5),
	(203,60,6),
	(204,60,1),
	(205,60,2),
	(206,60,3),
	(207,60,4),
	(208,60,5),
	(209,60,6),
	(210,60,1),
	(211,60,2),
	(212,60,3),
	(213,60,4),
	(214,60,5),
	(215,60,6),
	(216,60,1),
	(217,60,2),
	(218,60,3),
	(219,60,4),
	(220,60,5),
	(221,60,6),
	(222,60,7),
	(223,60,1),
	(224,60,2),
	(225,60,3),
	(226,60,4),
	(227,60,5),
	(228,60,6),
	(229,60,7),
	(230,60,1),
	(231,60,2),
	(232,60,3),
	(233,60,4),
	(234,60,5),
	(235,60,6),
	(236,60,7),
	(237,60,1),
	(238,60,2),
	(239,60,3),
	(240,60,4),
	(241,60,5),
	(242,60,6),
	(243,60,7),
	(244,60,8),
	(245,60,1),
	(246,60,2),
	(247,60,3),
	(248,60,4),
	(249,60,5),
	(250,60,6),
	(251,60,7),
	(252,60,8),
	(253,60,1),
	(254,60,2),
	(255,60,3),
	(256,60,4),
	(257,60,5),
	(258,60,6),
	(259,60,7),
	(260,60,8),
	(261,60,1),
	(262,60,2),
	(263,60,3),
	(264,60,4),
	(265,60,5),
	(266,60,6),
	(267,60,7),
	(268,60,8),
	(269,60,1),
	(270,60,2),
	(271,60,3),
	(272,60,4),
	(273,60,5),
	(274,60,6),
	(275,60,7),
	(276,60,8),
	(277,60,1),
	(278,60,2),
	(279,60,3),
	(280,60,4),
	(281,60,5),
	(282,60,6),
	(283,60,7),
	(284,60,8),
	(285,60,1),
	(286,60,2),
	(287,60,3),
	(288,60,4),
	(289,60,5),
	(290,60,6),
	(291,60,7),
	(292,60,8),
	(293,60,1),
	(294,60,2),
	(295,60,3),
	(296,60,4),
	(297,60,5),
	(298,60,6),
	(299,60,7),
	(300,60,8),
	(301,60,1),
	(302,60,2),
	(303,60,3),
	(304,60,4),
	(305,60,5),
	(306,60,6),
	(307,60,7),
	(308,60,8),
	(309,60,1),
	(310,60,2),
	(311,60,3),
	(312,60,4),
	(313,60,5),
	(314,60,6),
	(315,60,7),
	(316,60,8),
	(318,317,1),
	(319,317,2),
	(320,317,3),
	(321,317,4),
	(322,317,5),
	(323,317,6),
	(324,317,7),
	(325,317,8),
	(329,328,1),
	(330,328,2),
	(331,328,3),
	(332,328,4),
	(333,328,5),
	(334,328,6),
	(335,328,7),
	(336,328,8),
	(348,347,1),
	(349,347,2),
	(350,347,3),
	(351,347,4),
	(352,347,5),
	(353,347,6),
	(354,347,7),
	(355,347,8);

/*!40000 ALTER TABLE `craft_matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocktypes`;

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_tfighhcnkonvriezxduvmyvmxyruqmwzflvw` (`name`,`fieldId`),
  KEY `craft_idx_ycnlzdwonwpymxeskeztlapevevkoompkksb` (`handle`,`fieldId`),
  KEY `craft_idx_lalhncckktniufghpvlqexrysaxkwwfxflzp` (`fieldId`),
  KEY `craft_idx_lsezbzozzjiwolfmpsqrxlbqthogwvwdqwpv` (`fieldLayoutId`),
  CONSTRAINT `craft_fk_cevvjibnpwfmckjqudgnpwzsdivlyiexbjjw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_ecwebngvjilmtlbxmmaevjyzlyilnvmwbicg` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocktypes` DISABLE KEYS */;

INSERT INTO `craft_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,8,8,'Recipe image','recipeImage',1,'2023-11-13 10:24:45','2023-11-13 10:24:45','907915af-87d2-4703-95a1-ebb8a652d445'),
	(2,8,9,'Recipe tip','recipeTip',2,'2023-11-13 10:24:45','2023-11-13 10:24:45','13c6813c-41d2-4c4a-8e07-1a08250f74d7'),
	(3,8,10,'Recipe copy','recipeCopy',3,'2023-11-13 10:24:45','2023-11-13 10:24:45','51831859-89b7-488a-b11f-bdbe47efe345'),
	(4,8,11,'Recipe steps','recipeSteps',4,'2023-11-13 10:24:45','2023-11-13 10:24:45','618c8b80-48c6-4f21-b4b5-3799513c0ec4'),
	(5,8,12,'Recipe ingredients','recipeIngredients',5,'2023-11-13 10:24:45','2023-11-13 10:24:45','c5a06246-b324-46d5-8727-2789c2374a92');

/*!40000 ALTER TABLE `craft_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_matrixcontent_recipecontents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixcontent_recipecontents`;

CREATE TABLE `craft_matrixcontent_recipecontents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_recipeImage_imageCaption_lknkamcy` text,
  `field_recipeTip_tipContent_ifbkxxbo` text,
  `field_recipeCopy_bodyContent_ixsvoiho` text,
  `field_recipeSteps_stepsContent_phtxafmo` text,
  `field_recipeSteps_stepsTitle_wfhmkbiz` text,
  `field_recipeIngredients_ingredients_hnwidpcl` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_kyqpfdtnvoumnsaqiqxwqlkqbwzucoxhzopt` (`elementId`,`siteId`),
  KEY `craft_fk_kixkwizpgcodbpuycfcygmqirgpihkyvjyqv` (`siteId`),
  CONSTRAINT `craft_fk_kixkwizpgcodbpuycfcygmqirgpihkyvjyqv` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_pufxrhpflstftdydacghiskcopdxlykovvng` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_matrixcontent_recipecontents` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_recipecontents` DISABLE KEYS */;

INSERT INTO `craft_matrixcontent_recipecontents` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_recipeImage_imageCaption_lknkamcy`, `field_recipeTip_tipContent_ifbkxxbo`, `field_recipeCopy_bodyContent_ixsvoiho`, `field_recipeSteps_stepsContent_phtxafmo`, `field_recipeSteps_stepsTitle_wfhmkbiz`, `field_recipeIngredients_ingredients_hnwidpcl`)
VALUES
	(1,61,1,'2023-11-13 10:25:40','2023-11-13 10:25:40','f4c8747b-6dc0-4ca3-85e1-692a3fbb91ac',NULL,NULL,NULL,NULL,NULL,NULL),
	(2,62,1,'2023-11-13 10:25:49','2023-11-13 10:25:49','cab0fda3-535f-46af-a908-d40abafdd96c',NULL,NULL,'<p>This is the initial </p>',NULL,NULL,NULL),
	(3,63,1,'2023-11-13 10:25:50','2023-11-13 10:25:50','5c5cb4e6-4348-479f-b4ec-8ce6b024de6e',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(4,64,1,'2023-11-13 10:25:51','2023-11-13 10:25:51','3f7f97c0-3773-4667-8aa3-9b6b3c9d3e98',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(5,65,1,'2023-11-13 10:25:51','2023-11-13 10:25:51','72b92faf-271c-46e9-a103-4e401014c3f0',NULL,NULL,NULL,NULL,NULL,NULL),
	(6,66,1,'2023-11-13 10:25:57','2023-11-13 10:25:57','3eaa722b-50b6-472b-b0de-48846294305b',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(7,67,1,'2023-11-13 10:25:57','2023-11-13 10:25:57','00820715-61f4-4058-9cf2-3fb37d2a93fe',NULL,NULL,NULL,NULL,NULL,NULL),
	(8,68,1,'2023-11-13 10:26:01','2023-11-13 10:26:01','5f183090-d801-49a1-a069-ff11a7c9a94d',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(9,69,1,'2023-11-13 10:26:01','2023-11-13 10:26:01','c85eeeab-be15-426e-93e6-640c038abaeb','The',NULL,NULL,NULL,NULL,NULL),
	(10,70,1,'2023-11-13 10:26:03','2023-11-13 10:26:03','03cb9101-bb74-4212-88a4-cd8e82d7cabd',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(11,71,1,'2023-11-13 10:26:03','2023-11-13 10:26:03','3950a303-80d8-4a8e-b382-e85430a74442','The perfect shot',NULL,NULL,NULL,NULL,NULL),
	(12,72,1,'2023-11-13 10:26:08','2023-11-13 10:26:08','dfe23691-329d-4e96-a6d5-b9851526946f',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(13,73,1,'2023-11-13 10:26:08','2023-11-13 10:26:08','11bd2878-21bf-423a-b979-570ddc0d3562','The perfect E',NULL,NULL,NULL,NULL,NULL),
	(14,74,1,'2023-11-13 10:26:14','2023-11-13 10:26:14','41a1140b-f708-4877-a7a1-4d477d10289c',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(15,75,1,'2023-11-13 10:26:14','2023-11-13 10:26:14','590475d7-8d5b-4720-882a-67175dcb173e','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(16,76,1,'2023-11-13 10:26:15','2023-11-13 10:26:15','139165cd-8c8f-4a97-8247-d90f4c488c3d',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(17,77,1,'2023-11-13 10:26:15','2023-11-13 10:26:15','502bd450-a833-44d3-bef7-87eb20770b28','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(18,78,1,'2023-11-13 10:26:15','2023-11-13 10:26:15','3c2cba85-1c64-4da0-bb38-54af7e255222',NULL,NULL,NULL,NULL,NULL,NULL),
	(19,79,1,'2023-11-13 10:26:21','2023-11-13 10:26:21','ab211a31-ac05-4c16-9b83-f9eb271d954c',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(20,80,1,'2023-11-13 10:26:21','2023-11-13 10:26:21','0e7a4e2a-2d1b-4059-8558-26211d542ed6','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(21,81,1,'2023-11-13 10:26:21','2023-11-13 10:26:21','8515ac36-6558-4765-b408-f2c20e30caa3',NULL,'Be careful with the water temperat',NULL,NULL,NULL,NULL),
	(22,82,1,'2023-11-13 10:26:22','2023-11-13 10:26:22','7d4513c6-b11d-4fc8-bff6-05a2c3261f27',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(23,83,1,'2023-11-13 10:26:22','2023-11-13 10:26:22','42ed4900-98cd-4db0-9017-03368c0e3e0c','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(24,84,1,'2023-11-13 10:26:22','2023-11-13 10:26:22','4a35ea4e-bc89-41b5-8d22-2370182852d5',NULL,'Be careful with the water temperature.',NULL,NULL,NULL,NULL),
	(25,85,1,'2023-11-13 10:26:24','2023-11-13 10:26:24','3902b251-d908-4d01-929e-cd200bb38916',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(26,86,1,'2023-11-13 10:26:24','2023-11-13 10:26:24','881b65e8-9a7d-48e0-8d0f-79c4fb480675','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(27,87,1,'2023-11-13 10:26:24','2023-11-13 10:26:24','74d37cc3-20a7-4b96-8456-fd79de8ee7d5',NULL,'Be careful with the water temperature. It\'s impr',NULL,NULL,NULL,NULL),
	(28,88,1,'2023-11-13 10:26:31','2023-11-13 10:26:31','81f09d8b-5048-49be-939a-68ca076eefcb',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(29,89,1,'2023-11-13 10:26:31','2023-11-13 10:26:31','8a2a6548-403c-4af8-8a63-c95aa90b9c03','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(30,90,1,'2023-11-13 10:26:31','2023-11-13 10:26:31','abeea29e-bf0a-47d3-86ae-a3111c6d1f38',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot!',NULL,NULL,NULL,NULL),
	(31,91,1,'2023-11-13 10:26:32','2023-11-13 10:26:32','f6d80b3a-2668-4584-abe7-6a16ebd1cfea',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(32,92,1,'2023-11-13 10:26:32','2023-11-13 10:26:32','858e2c6b-bd2c-4f3a-b580-940fd387e591','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(33,93,1,'2023-11-13 10:26:32','2023-11-13 10:26:32','396a8611-53ac-47ea-925c-264fa5ebe5ba',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(34,94,1,'2023-11-13 10:26:53','2023-11-13 10:26:53','8ed09d19-cc66-472f-b9a0-3fbdf028e03a',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(35,95,1,'2023-11-13 10:26:53','2023-11-13 10:26:53','3ca1a28b-7f3b-4b1d-a34b-bdab40e2c8e6','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(36,96,1,'2023-11-13 10:26:53','2023-11-13 10:26:53','765d0e09-9406-438e-bd90-ea4d9e60b8d9',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(37,97,1,'2023-11-13 10:26:53','2023-11-13 10:26:53','234ff910-eefd-4863-9688-5dee716e29d2',NULL,NULL,NULL,NULL,NULL,NULL),
	(38,98,1,'2023-11-13 10:26:58','2023-11-13 10:26:58','63025ee5-ba85-4e54-a4c9-6fa4ab337a24',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(39,99,1,'2023-11-13 10:26:58','2023-11-13 10:26:58','c2e27ae2-4cbf-4101-972d-838bef48bf26','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(40,100,1,'2023-11-13 10:26:58','2023-11-13 10:26:58','5c768bb4-d8bf-489e-a84f-7c36b269839b',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(41,101,1,'2023-11-13 10:26:58','2023-11-13 10:26:58','06006df6-9470-4a2d-8725-b6ab30e884d7',NULL,NULL,NULL,NULL,NULL,NULL),
	(42,102,1,'2023-11-13 10:26:58','2023-11-13 10:26:58','07ae5c0d-0a6e-409d-91a2-27e03988757b',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"\",\"col2\":\"\"}]'),
	(43,103,1,'2023-11-13 10:27:04','2023-11-13 10:27:04','d33d7910-ed6a-48b3-9f2d-ccb7d6b4f313',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(44,104,1,'2023-11-13 10:27:05','2023-11-13 10:27:05','526726ea-dada-4586-999d-5ffd01db28a4','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(45,105,1,'2023-11-13 10:27:05','2023-11-13 10:27:05','52df379c-27ff-457b-b2f5-41e0b30116d5',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(46,106,1,'2023-11-13 10:27:05','2023-11-13 10:27:05','44f67d88-faa5-436f-bb79-eb899d6fb0a8',NULL,NULL,NULL,NULL,NULL,NULL),
	(47,107,1,'2023-11-13 10:27:05','2023-11-13 10:27:05','97ac9829-15a4-49ed-a8bf-6144c48415e3',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"}]'),
	(48,108,1,'2023-11-13 10:27:06','2023-11-13 10:27:06','0bdbf8d6-98e4-4174-8dee-0b10f10c2bd1',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(49,109,1,'2023-11-13 10:27:06','2023-11-13 10:27:06','e1102ea7-9560-4e96-9cae-fbdae5fb2e72','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(50,110,1,'2023-11-13 10:27:06','2023-11-13 10:27:06','e69c1c1d-e7a0-42e2-abe7-5840027350fc',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(51,111,1,'2023-11-13 10:27:06','2023-11-13 10:27:06','c08dffea-05c3-4a31-9079-91fa07848577',NULL,NULL,NULL,NULL,NULL,NULL),
	(52,112,1,'2023-11-13 10:27:06','2023-11-13 10:27:06','c82e431c-4cdc-45d6-8fa5-36336e80b2bc',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"\",\"col2\":\"\"}]'),
	(53,113,1,'2023-11-13 10:27:13','2023-11-13 10:27:13','4bfa6bb5-25ec-4733-98e5-b27e1dc712fb',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(54,114,1,'2023-11-13 10:27:13','2023-11-13 10:27:13','3beeda25-d4b7-4636-ba34-31026d7eb794','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(55,115,1,'2023-11-13 10:27:13','2023-11-13 10:27:13','d04e08fd-81dd-4a9c-9fac-9e9aea61eaf8',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(56,116,1,'2023-11-13 10:27:13','2023-11-13 10:27:13','04b7993e-7cf1-44da-8a5e-fa1149d01f3b',NULL,NULL,NULL,NULL,NULL,NULL),
	(57,117,1,'2023-11-13 10:27:13','2023-11-13 10:27:13','a899a4f1-690c-4b43-8060-fb7e50591b2b',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"\"}]'),
	(58,118,1,'2023-11-13 10:27:16','2023-11-13 10:27:16','17908370-f4db-4374-9bb1-c898f6f257bd',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(59,119,1,'2023-11-13 10:27:16','2023-11-13 10:27:16','f7116012-7ddd-45b5-82df-96c44944197f','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(60,120,1,'2023-11-13 10:27:16','2023-11-13 10:27:16','95103452-893a-4347-bfa0-5d92b76556cd',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(61,121,1,'2023-11-13 10:27:16','2023-11-13 10:27:16','02403bcd-da43-40f5-9357-045a2264e05b',NULL,NULL,NULL,NULL,NULL,NULL),
	(62,122,1,'2023-11-13 10:27:16','2023-11-13 10:27:16','bfadb966-2ab8-411a-bbd0-ec10ef110e2d',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"}]'),
	(63,123,1,'2023-11-13 10:27:17','2023-11-13 10:27:17','36c1bb6c-f930-480a-8780-a0686a574794',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(64,124,1,'2023-11-13 10:27:17','2023-11-13 10:27:17','aef87e02-bd03-4518-a71a-c451dd413878','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(65,125,1,'2023-11-13 10:27:17','2023-11-13 10:27:17','d3f39933-d674-44a1-a922-e37a1049425b',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(66,126,1,'2023-11-13 10:27:17','2023-11-13 10:27:17','686a96e8-d2bd-455f-b442-8f66478eae70',NULL,NULL,NULL,NULL,NULL,NULL),
	(67,127,1,'2023-11-13 10:27:17','2023-11-13 10:27:17','a5c439a4-f824-49c9-a812-08dad46f6e65',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"\",\"col2\":\"\"}]'),
	(68,128,1,'2023-11-13 10:27:18','2023-11-13 10:27:18','0eb117fb-2cf3-4ba7-a46a-632541cb86a7',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(69,129,1,'2023-11-13 10:27:18','2023-11-13 10:27:18','2bf41e90-edef-497d-92f9-2749aa516813','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(70,130,1,'2023-11-13 10:27:19','2023-11-13 10:27:19','66d5bf76-537c-4f9c-9f89-d9736b089d6c',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(71,131,1,'2023-11-13 10:27:19','2023-11-13 10:27:19','4b93f0a8-40ba-48bc-a827-e6b7a1869465',NULL,NULL,NULL,NULL,NULL,NULL),
	(72,132,1,'2023-11-13 10:27:19','2023-11-13 10:27:19','bd2b150c-7773-4c40-8a57-24efe21e9452',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"\"}]'),
	(73,133,1,'2023-11-13 10:27:21','2023-11-13 10:27:21','db8faf8f-a2ff-4e1a-a1ca-6e4e2bd5ca15',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(74,134,1,'2023-11-13 10:27:21','2023-11-13 10:27:21','14d27486-ac85-4856-aa6e-7bb421717532','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(75,135,1,'2023-11-13 10:27:21','2023-11-13 10:27:21','8d6c6f0d-07d5-4af6-9525-88f4e58936f0',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(76,136,1,'2023-11-13 10:27:21','2023-11-13 10:27:21','499cd74b-5bd6-412f-a639-28bba9477707',NULL,NULL,NULL,NULL,NULL,NULL),
	(77,137,1,'2023-11-13 10:27:21','2023-11-13 10:27:21','9d5b007d-d341-42f8-991e-6eed9413465e',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Es\"}]'),
	(78,138,1,'2023-11-13 10:27:24','2023-11-13 10:27:24','fe49fd58-69eb-429b-8fad-3398a43ecaad',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(79,139,1,'2023-11-13 10:27:24','2023-11-13 10:27:24','f461991d-165e-410e-ad4f-e202f79c5bf0','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(80,140,1,'2023-11-13 10:27:24','2023-11-13 10:27:24','82a5ad9f-c099-45be-bd5f-eadc196ea80f',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(81,141,1,'2023-11-13 10:27:24','2023-11-13 10:27:24','c49bce49-37a1-4b27-955b-e93506805aa3',NULL,NULL,NULL,NULL,NULL,NULL),
	(82,142,1,'2023-11-13 10:27:24','2023-11-13 10:27:24','e8b2c5be-9eb6-42ac-91d9-1f6c7ec66f64',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(83,143,1,'2023-11-13 10:27:26','2023-11-13 10:27:26','0b1fa51f-87f8-4387-b670-5b2dd865239a',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(84,144,1,'2023-11-13 10:27:26','2023-11-13 10:27:26','b133a045-9a27-4635-9640-057bd6290048','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(85,145,1,'2023-11-13 10:27:26','2023-11-13 10:27:26','8131c64b-6e0d-4df3-bb4a-dcbadd942137',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(86,146,1,'2023-11-13 10:27:26','2023-11-13 10:27:26','20ea6829-77d0-42e6-8f6b-95765318a7ff',NULL,NULL,NULL,NULL,NULL,NULL),
	(87,147,1,'2023-11-13 10:27:26','2023-11-13 10:27:26','0542c0d7-a270-42fe-909e-c1e2d535a1d6',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(88,148,1,'2023-11-13 10:27:26','2023-11-13 10:27:26','bf5c08f8-665d-4407-9d07-622036a88d26',NULL,NULL,NULL,NULL,NULL,NULL),
	(89,149,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','587f7370-9b65-491d-918c-db0f8bbfebd5',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(90,150,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','86662dbb-cdc0-49b3-8e50-9a449dfeabc6','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(91,151,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','3c460d36-7ae7-4ed1-afba-d631b7b7f982',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(92,152,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','a2c64384-e6b7-43bf-8f88-cb522287337a',NULL,NULL,NULL,NULL,NULL,NULL),
	(93,153,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','097f02df-3a4f-4122-abaf-77e783842ea0',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(94,154,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','33016647-db9f-4cbb-8e29-fe0b55b43ebb',NULL,NULL,NULL,NULL,NULL,NULL),
	(95,155,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','402ba4ac-3238-4bf9-830f-a6082495b463',NULL,NULL,NULL,NULL,NULL,NULL),
	(96,156,1,'2023-11-13 10:27:33','2023-11-13 10:27:33','d15b2802-7e35-46f0-9bf8-681dfc3788ca',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(97,157,1,'2023-11-13 10:27:33','2023-11-13 10:27:33','ffdb69cc-5d97-4b18-b027-6b3ddce6edc2','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(98,158,1,'2023-11-13 10:27:33','2023-11-13 10:27:33','793fa80e-7d63-4e03-9c83-77a68a332880',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(99,159,1,'2023-11-13 10:27:33','2023-11-13 10:27:33','f17dc42a-cf09-432c-8f20-9864a2b2004f',NULL,NULL,NULL,NULL,NULL,NULL),
	(100,160,1,'2023-11-13 10:27:33','2023-11-13 10:27:33','83ba95a6-163e-4495-88e7-e3514ee1d410',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(101,161,1,'2023-11-13 10:27:33','2023-11-13 10:27:33','ac5e090e-df5d-4b1b-9fbb-3a172a63bf24',NULL,NULL,NULL,NULL,NULL,NULL),
	(102,162,1,'2023-11-13 10:27:41','2023-11-13 10:27:41','0f0aeb52-7bc4-4b5b-a712-60898bf94906',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(103,163,1,'2023-11-13 10:27:41','2023-11-13 10:27:41','44d5bbd7-7325-4e36-9fd8-51fb319d6a73','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(104,164,1,'2023-11-13 10:27:41','2023-11-13 10:27:41','e4a28677-7be8-4f67-a514-cce3b4378c17',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(105,165,1,'2023-11-13 10:27:41','2023-11-13 10:27:41','a5c4eee8-2d10-4104-8937-187e871b96b8',NULL,NULL,NULL,NULL,NULL,NULL),
	(106,166,1,'2023-11-13 10:27:41','2023-11-13 10:27:41','4a539965-90fa-43dd-b4ad-10ceb21e0cc2',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(107,167,1,'2023-11-13 10:27:41','2023-11-13 10:27:41','87ee019d-e4f5-4816-b48e-a7c5f0b17840',NULL,NULL,NULL,NULL,'Pr',NULL),
	(108,168,1,'2023-11-13 10:27:44','2023-11-13 10:27:44','e385cf5a-0ba6-4ce6-8890-f76844225e15',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(109,169,1,'2023-11-13 10:27:44','2023-11-13 10:27:44','99a53c15-1dc6-4c41-8b89-2fb218228d37','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(110,170,1,'2023-11-13 10:27:44','2023-11-13 10:27:44','d073668a-4e95-4856-af06-cc261e9a893a',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(111,171,1,'2023-11-13 10:27:44','2023-11-13 10:27:44','1f2b761c-7821-4ffe-a31c-c76b0f445759',NULL,NULL,NULL,NULL,NULL,NULL),
	(112,172,1,'2023-11-13 10:27:44','2023-11-13 10:27:44','d75a5e61-9a7f-434d-aaab-4fc54d519a1b',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(113,173,1,'2023-11-13 10:27:44','2023-11-13 10:27:44','34c4a453-559f-4932-8fa9-e1fe82d3e722',NULL,NULL,NULL,NULL,'Preparing your workspace',NULL),
	(114,174,1,'2023-11-13 10:27:45','2023-11-13 10:27:45','ec048750-cdf8-419b-a0e7-d8ddd5cf7069',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(115,175,1,'2023-11-13 10:27:45','2023-11-13 10:27:45','beb95fe5-d69a-431a-a347-f6a3ee312840','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(116,176,1,'2023-11-13 10:27:45','2023-11-13 10:27:45','0d0b75fd-e7d1-4d0a-907f-56edb58972ae',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(117,177,1,'2023-11-13 10:27:45','2023-11-13 10:27:45','27b7b694-004f-4b00-a955-08a93b8440c8',NULL,NULL,NULL,NULL,NULL,NULL),
	(118,178,1,'2023-11-13 10:27:45','2023-11-13 10:27:45','d39ee508-7da5-4607-9d72-034fb5fd67c7',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(119,179,1,'2023-11-13 10:27:45','2023-11-13 10:27:45','47f3de6a-46a4-413c-922d-a4313c4bc73c',NULL,NULL,NULL,'[{\"col1\":\"\"}]','Preparing your workspace',NULL),
	(120,180,1,'2023-11-13 10:27:50','2023-11-13 10:27:50','7257f8e9-7794-4e22-8126-2c4ad6dba413',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(121,181,1,'2023-11-13 10:27:50','2023-11-13 10:27:50','6a2a398c-7091-4951-88a4-54ed568ec632','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(122,182,1,'2023-11-13 10:27:50','2023-11-13 10:27:50','0ce9b747-5555-4d2c-a3fb-862c7b45f92f',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(123,183,1,'2023-11-13 10:27:50','2023-11-13 10:27:50','e3b3311a-61e4-4880-8369-0f88643d07d9',NULL,NULL,NULL,NULL,NULL,NULL),
	(124,184,1,'2023-11-13 10:27:50','2023-11-13 10:27:50','2578282c-dab4-41d9-aaa6-dcc78b576591',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(125,185,1,'2023-11-13 10:27:50','2023-11-13 10:27:50','30d1013f-7ef0-4d89-a70e-04986f1919d3',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"}]','Preparing your workspace',NULL),
	(126,186,1,'2023-11-13 10:27:52','2023-11-13 10:27:52','1372b5f6-7c02-4025-a596-8bcfe1b9be91',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(127,187,1,'2023-11-13 10:27:52','2023-11-13 10:27:52','195772aa-aefb-46c7-b9b8-1062fc38d916','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(128,188,1,'2023-11-13 10:27:52','2023-11-13 10:27:52','1e35c147-44ba-4b13-9e81-a197252248a2',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(129,189,1,'2023-11-13 10:27:52','2023-11-13 10:27:52','c3b4cbf7-c628-48a7-b906-d79c178a23a3',NULL,NULL,NULL,NULL,NULL,NULL),
	(130,190,1,'2023-11-13 10:27:52','2023-11-13 10:27:52','45fd2042-146a-4049-998c-a2470d295f3c',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(131,191,1,'2023-11-13 10:27:52','2023-11-13 10:27:52','37440497-c774-4f6e-8d8a-3203cca6145b',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"\"}]','Preparing your workspace',NULL),
	(132,192,1,'2023-11-13 10:27:55','2023-11-13 10:27:55','538c8d52-7b67-45fa-bddd-fa174318a376',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(133,193,1,'2023-11-13 10:27:55','2023-11-13 10:27:55','f5080839-23ec-459c-9fc8-c6d7804dfd7c','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(134,194,1,'2023-11-13 10:27:55','2023-11-13 10:27:55','9edba843-4c4a-4086-8e7a-e24463b49355',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(135,195,1,'2023-11-13 10:27:55','2023-11-13 10:27:55','4fc571d1-6c49-4ab4-b3e0-e2b41a14f6ea',NULL,NULL,NULL,NULL,NULL,NULL),
	(136,196,1,'2023-11-13 10:27:55','2023-11-13 10:27:55','210e916a-3d43-47b6-9b3d-c85c6e19a664',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(137,197,1,'2023-11-13 10:27:55','2023-11-13 10:27:55','ce7dce35-4ea2-4816-bf4b-1bc993cf651b',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on\"}]','Preparing your workspace',NULL),
	(138,198,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','e7914175-7e5a-4382-80d8-862b29f7fc01',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(139,199,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','4df8f257-200c-400c-8f06-43485cb470bc','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(140,200,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','ee4f09d7-1cd5-44f7-b2b1-585c86ae502b',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(141,201,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','6630fc93-46e5-428d-af2b-c0f819dd0fc6',NULL,NULL,NULL,NULL,NULL,NULL),
	(142,202,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','b0930515-3cb4-4160-b1fc-58cde47086b2',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(143,203,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','e95df426-197f-4f60-b2cf-be6da1956447',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on e\"}]','Preparing your workspace',NULL),
	(144,204,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','1ffb7f5f-8b40-4fcb-92ed-5b1576e4fb13',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(145,205,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','9282bd15-820d-471f-a08d-5375135225cb','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(146,206,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','bcaf10d0-3a4b-4677-8cd9-8acb0b156fd9',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(147,207,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','db4eacc9-57e6-4c57-b5e5-835f9135bb7f',NULL,NULL,NULL,NULL,NULL,NULL),
	(148,208,1,'2023-11-13 10:27:57','2023-11-13 10:27:57','bc29b18d-78ab-43ef-ab68-0bb4a86c9463',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(149,209,1,'2023-11-13 10:27:57','2023-11-13 10:27:57','6860cd2e-9446-4659-b326-655437591020',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on es\"}]','Preparing your workspace',NULL),
	(150,210,1,'2023-11-13 10:27:59','2023-11-13 10:27:59','c008359d-1fdc-43b0-902d-886b814e29d4',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(151,211,1,'2023-11-13 10:27:59','2023-11-13 10:27:59','89dbc648-589e-4442-8d16-49f89d59a409','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(152,212,1,'2023-11-13 10:27:59','2023-11-13 10:27:59','ceb4d0cf-30b7-4544-baaf-fc5d55b7d630',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(153,213,1,'2023-11-13 10:27:59','2023-11-13 10:27:59','43b95089-9bdb-4feb-8ff4-d90331aeb4bf',NULL,NULL,NULL,NULL,NULL,NULL),
	(154,214,1,'2023-11-13 10:27:59','2023-11-13 10:27:59','f588a157-f6cb-4bf5-8ac1-c2797c871775',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(155,215,1,'2023-11-13 10:27:59','2023-11-13 10:27:59','c488dbaf-7225-406b-9ec4-a01d5d2fd0b9',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(156,216,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','bed03b43-23a4-4383-8c88-9f7da775c996',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(157,217,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','ec60fa68-f5bd-4958-87fc-ee953c9709f8','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(158,218,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','e8d01db1-b77a-482b-b534-d1f95c313d06',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(159,219,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','6d05ca86-71cf-4395-ae24-30d88751d372',NULL,NULL,NULL,NULL,NULL,NULL),
	(160,220,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','2d23df6c-03b0-440f-a342-58b41490a223',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(161,221,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','b537f679-dde8-478b-92b5-993d7f61869d',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(162,222,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','ef3b50e1-fa72-440f-80aa-4be706dc15a4',NULL,NULL,NULL,NULL,NULL,NULL),
	(163,223,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','8824bb16-bae7-4c19-9f2e-f26a0a6a0874',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(164,224,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','61704731-7892-4791-b6e9-d15e91cb1c3e','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(165,225,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','df4e6ddb-23f9-4e9f-ac84-f15136abd89b',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(166,226,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','08b42269-f5a4-4611-9b95-cb02d473dda0',NULL,NULL,NULL,NULL,NULL,NULL),
	(167,227,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','4211cbd6-2032-4c19-9327-7c933028d7c9',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(168,228,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','d9d35c02-7b39-474b-b8e3-780a5390df33',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(169,229,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','ac424bb1-576e-4dfc-ac66-46923976ca83',NULL,NULL,NULL,NULL,NULL,NULL),
	(170,230,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','6d2320e3-7008-49e9-9993-8d481673654d',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(171,231,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','919ef1c6-4507-4f04-87cd-ae8f479a424e','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(172,232,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','46b8173b-2d1f-4157-9588-9060af0ea93f',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(173,233,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','8dc02462-4ffd-4c01-89d2-b465ccf1f9a2',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(174,234,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','96f1ff84-363a-48e2-95db-e902d5b89d19',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(175,235,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','0b3ccb64-1176-468a-8b0b-9bfbaffeec6d',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(176,236,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','c9a2ef21-3287-40cb-b0b0-aa77b3622610',NULL,NULL,NULL,NULL,NULL,NULL),
	(177,237,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','b9359c2c-9573-44e9-942d-0fa0d8532d71',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(178,238,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','fe8c82d2-4134-4501-87bb-ed26d819586d','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(179,239,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','7e9d1e65-fec2-4fd7-8668-1becbe514b23',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(180,240,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','0a7da41c-dec4-4ecc-a4c6-3e998db5e72a',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(181,241,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','5a79eaad-3d72-410d-974b-50d869445bd6',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(182,242,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','18426083-7059-48fc-8cad-862c97995640',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(183,243,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','6f70e3a8-be49-41df-9d31-cb128541c5e4',NULL,NULL,NULL,NULL,NULL,NULL),
	(184,244,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','f794b9ae-9d8c-41e0-b0ea-46bbb6103ffc',NULL,NULL,NULL,NULL,NULL,NULL),
	(185,245,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','754390bd-cba9-4cb2-89ad-9b281dd836b0',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(186,246,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','a57323cd-4091-451f-b803-cd40a6579e20','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(187,247,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','a84325ff-7177-4f78-b23d-83a38482f638',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(188,248,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','583c468b-5d07-4ddb-a63c-25ac10145063',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(189,249,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','a6de77e0-4600-4490-b382-89cf6917f1f9',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(190,250,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','2323f7ab-f5fd-4822-9282-373b68d61f09',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(191,251,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','755745e3-2085-4ba4-bd43-5e04733876d5',NULL,NULL,NULL,NULL,NULL,NULL),
	(192,252,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','181d6538-df43-4638-89ed-533f5662e9f6',NULL,NULL,NULL,NULL,'Step',NULL),
	(193,253,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','e741cfb1-b3a3-46c5-9380-cf7b7d69c03f',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(194,254,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','08ff9095-d3aa-4301-9896-9adfabfd72d1','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(195,255,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','3eae76a6-a6e5-4d80-a371-ca20152e0e76',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(196,256,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','bdda70c4-72cd-49d1-832b-44d04aef34a1',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(197,257,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','9971abde-1bad-4973-ab91-9f9a0107effc',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(198,258,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','17deef69-2bb9-4451-9dc5-fe56d398f46e',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(199,259,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','952aa31a-b565-4ba6-b73c-5a329e8c4ce0',NULL,NULL,NULL,NULL,NULL,NULL),
	(200,260,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','1923f20f-66f2-4e71-a2de-37ed6308f383',NULL,NULL,NULL,NULL,'Grind',NULL),
	(201,261,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','f56bafbf-c8c1-4b5c-b906-b1b24e18cbe9',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(202,262,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','3447b8ea-2d04-4269-97a8-0ebe7d717e36','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(203,263,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','05bd0289-07fc-429e-a139-7c729e847489',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(204,264,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','35199dd8-63df-4c47-81bb-0b2227a7d93e',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(205,265,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','24d3495f-906c-4f61-8575-76827c3db7a6',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(206,266,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','e0cd8f28-bdf4-499c-980b-e3643c4b23fe',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(207,267,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','a8d78317-d618-4100-b613-f765e2af9b16',NULL,NULL,NULL,NULL,NULL,NULL),
	(208,268,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','0a3553aa-9508-49a6-8f3a-62abb407d10f',NULL,NULL,NULL,NULL,'Grinding the copy',NULL),
	(209,269,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','a00fce22-b0ca-4684-b544-b967b31b337a',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(210,270,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','f833b567-e162-46ff-90f2-0fae051c9a55','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(211,271,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','12b93c32-289d-4f3a-9676-6a87c09c9d7d',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(212,272,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','249cafc4-cd65-4521-abc6-8e35e8153e39',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(213,273,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','b598ce90-5a88-44e4-97cd-49ce5c2f46f3',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(214,274,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','74461541-b18c-4a92-948d-02277756a3a9',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(215,275,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','2c534c8e-6351-4b66-b17c-0d64139aae5c',NULL,NULL,NULL,NULL,NULL,NULL),
	(216,276,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','7d3a8c01-d08d-46f8-aa87-33486bcff5a7',NULL,NULL,NULL,'[{\"col1\":\"\"}]','Grinding the copy',NULL),
	(217,277,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','b2e2d73b-5dbb-4d19-9850-11c0f3099481',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(218,278,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','da2a93ab-f945-4117-8305-bc925c51fcb8','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(219,279,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','b927f444-17df-4c85-94fa-b4301ba9b040',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(220,280,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','703b4a47-3110-4c9c-b8ec-ad70efccdcc5',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(221,281,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','920d2632-8f3e-40d0-9557-a13cc44c8107',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(222,282,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','425b0bc7-e9bc-474c-b8d1-84075b264883',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(223,283,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','bee70fcf-46fc-4fea-b3cc-9c58248f78f6',NULL,NULL,NULL,NULL,NULL,NULL),
	(224,284,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','1a8ba4dc-9801-4bdc-8f3f-41f3dea5f56d',NULL,NULL,NULL,'[{\"col1\":\"Int\"}]','Grinding the copy',NULL),
	(225,285,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','74afd881-5a19-4ffc-89d5-3ee48d1062c6',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(226,286,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','1cbc365c-470a-49d3-a264-42b3b368787b','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(227,287,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','637c26a2-cf88-4d4c-9778-3990dc01c02d',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(228,288,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','ecf54303-6606-4951-b1b9-1efc795ccbcb',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(229,289,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','dd1ef0af-fee0-442b-b045-1664f9d2ade7',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(230,290,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','c3bfc8b3-da24-4b44-9221-a5e3fc60fde9',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(231,291,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','3874420a-6a52-412f-a398-43e37e70b0ba',NULL,NULL,NULL,NULL,NULL,NULL),
	(232,292,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','cb8403ef-ae24-4412-ad1d-a2f2ac4f36d1',NULL,NULL,NULL,'[{\"col1\":\"Instruction\"}]','Grinding the copy',NULL),
	(233,293,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','1b61da82-6b45-4fe6-80a0-25f60c95d36a',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(234,294,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','a737c28a-7d78-4399-8860-7c688c9df165','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(235,295,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','4cc2e956-c4b7-42f6-8c74-e80582f6363a',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(236,296,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','06966ec5-bc57-4055-938c-39b2dd7e1c8b',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(237,297,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','9307efff-493b-43f9-b397-3e8c3c6b51dd',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(238,298,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','a2d40a1f-f0e9-4027-931c-c5427aba6237',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(239,299,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','a8fad452-cf81-454d-ac8b-424a05122bbb',NULL,NULL,NULL,NULL,NULL,NULL),
	(240,300,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','eb772a4a-4505-43cd-b78e-9aae49066866',NULL,NULL,NULL,'[{\"col1\":\"Instruction 1\"}]','Grinding the copy',NULL),
	(241,301,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','8f8fb957-e695-4fa8-82f3-210a6c9e4ec0',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(242,302,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','facc7a74-41ac-46b9-8fe9-25d56bede11d','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(243,303,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','d0f7e822-3d35-44a1-b5fa-17df653efeb2',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(244,304,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','cd3e30be-0fe9-4faf-bb12-1be01fac9cf9',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(245,305,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','eaef2572-4898-4f69-b0b5-7a40838b2c89',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(246,306,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','759d94e4-7f0e-49db-ab08-0f138dd78e8a',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(247,307,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','3aefe915-c267-4d66-8ee3-59b044981485',NULL,NULL,NULL,NULL,NULL,NULL),
	(248,308,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','7fdca618-8427-42ee-a139-9ad03db24ba6',NULL,NULL,NULL,'[{\"col1\":\"Instruction 1\"},{\"col1\":\"\"}]','Grinding the copy',NULL),
	(249,309,1,'2023-11-13 10:28:37','2023-11-13 14:48:32','3e2a6355-a548-48ec-be94-1b7b7e068ec0',NULL,NULL,'<p>Espresso our way</p>',NULL,NULL,NULL),
	(250,310,1,'2023-11-13 10:28:37','2023-11-13 10:32:45','3a642174-924b-445c-9f68-c84178caf0cb','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(251,311,1,'2023-11-13 10:28:37','2023-11-13 10:32:45','8fba4a8c-3830-4d4e-b166-8824b6a4ff7f',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(252,312,1,'2023-11-13 10:28:37','2023-11-13 10:32:45','429f321a-b6e5-4069-8857-afb350514829',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(253,313,1,'2023-11-13 10:28:37','2023-11-13 10:32:45','faf8b34c-36cf-47fa-b345-8262d7193cdd',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(254,314,1,'2023-11-13 10:28:37','2023-11-13 10:32:45','a3096698-465e-48b2-b70e-d14b5028a0c3',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(255,315,1,'2023-11-13 10:28:37','2023-11-13 10:32:45','8fdd9d97-1614-44bf-9984-af1fa2a8ea89',NULL,NULL,NULL,NULL,NULL,NULL),
	(256,316,1,'2023-11-13 10:28:37','2023-11-13 10:32:45','f0061813-4dc4-4224-83b2-1234f4a6e035',NULL,NULL,NULL,'[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]','Grinding the copy',NULL),
	(257,318,1,'2023-11-13 10:28:39','2023-11-13 10:32:17','17813843-77c7-41ee-a5cf-480bcf01cf9c',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(258,319,1,'2023-11-13 10:28:39','2023-11-13 10:32:17','308f985e-aaca-4960-acfd-131b44ae3a99','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(259,320,1,'2023-11-13 10:28:39','2023-11-13 10:32:17','7108e29d-ad68-4797-8c9f-99b38d043e22',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(260,321,1,'2023-11-13 10:28:39','2023-11-13 10:32:17','4dfe0342-cb60-47c7-8bf8-f9cbcf1825c8',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(261,322,1,'2023-11-13 10:28:39','2023-11-13 10:32:17','b719746d-12a7-4b00-8749-18596195c400',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(262,323,1,'2023-11-13 10:28:39','2023-11-13 10:32:17','7fb61a43-f022-4ff4-bc5a-6f7248511f0a',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(263,324,1,'2023-11-13 10:28:39','2023-11-13 10:32:17','21dfd812-4b04-4490-b032-c0b25a1a4cd9',NULL,NULL,NULL,NULL,NULL,NULL),
	(264,325,1,'2023-11-13 10:28:39','2023-11-13 10:32:17','a114fdca-6d6e-46a9-bb59-4c3827126004',NULL,NULL,NULL,'[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]','Grinding the copy',NULL),
	(265,329,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','3d865297-cc70-4536-8f6f-823b9f283611',NULL,NULL,'<p>This is the initial page copy</p>',NULL,NULL,NULL),
	(266,330,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','a5423034-e6c3-4716-badd-d959f1310eed','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(267,331,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','67585d29-607a-4ebc-83ac-4c3c5fdae963',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(268,332,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','f0a1e29f-d2cd-4846-ad23-f5b3621fa782',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(269,333,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','62be7743-f1e1-48d6-8298-0068325aa410',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(270,334,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','c3d0f90b-3efc-4770-94d2-8437e2bc9d84',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(271,335,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','bc405756-b683-4e8a-bcfe-a4e8e4266059',NULL,NULL,NULL,NULL,NULL,NULL),
	(272,336,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','2d02d13a-fca6-4b9e-a7e9-cb8bd352624e',NULL,NULL,NULL,'[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]','Grinding the copy',NULL),
	(274,348,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','bb330c3b-1eb2-402a-8f7d-6e27604883b9',NULL,NULL,'<p>Espresso our way</p>',NULL,NULL,NULL),
	(275,349,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','cbe1b27b-dda0-4bc3-abbe-e7d5496faa39','The perfect espresso. Time to drink!',NULL,NULL,NULL,NULL,NULL),
	(276,350,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','ee6bd2b3-c3e7-404d-a874-aca086858392',NULL,'Be careful with the water temperature. It\'s important that the water is hot enough, but not too hot.',NULL,NULL,NULL,NULL),
	(277,351,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','59540e7c-d625-4cd4-841b-b180e134df6e',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit nisi, tempor at rhoncus id, porta tincidunt metus. Nulla dictum faucibus justo. Quisque non urna nec tortor cursus lobortis. Proin quis nunc nibh. Curabitur consequat gravida augue, vitae vestibulum sem eleifend ac. Maecenas facilisis molestie vehicula. Fusce pulvinar nisi a orci iaculis bibendum.</p>',NULL,NULL,NULL),
	(278,352,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','f6738b41-cbfa-435a-a754-eff8d394901c',NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"22 grams\",\"col2\":\"Ground coffee\"},{\"col1\":\"200ml\",\"col2\":\"Hot water\"},{\"col1\":\"1\",\"col2\":\"Espresso machine\"}]'),
	(279,353,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','b1cc93ec-f856-4a2f-b177-f19743919304',NULL,NULL,NULL,'[{\"col1\":\"Clean up area\"},{\"col1\":\"Turn on espresso machine\"}]','Preparing your workspace',NULL),
	(280,354,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','cc5af5e1-265d-4831-8ec6-c06e0d4bd68a',NULL,NULL,NULL,NULL,NULL,NULL),
	(281,355,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','985357f8-636f-4398-9181-3fcc34bd23ff',NULL,NULL,NULL,'[{\"col1\":\"Instruction 1\"},{\"col1\":\"Instruction 2\"}]','Grinding the copy',NULL);

/*!40000 ALTER TABLE `craft_matrixcontent_recipecontents` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_migrations`;

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_beciaozahxmhyifdcemagtfffzntgairhovt` (`track`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;

INSERT INTO `craft_migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'craft','Install','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','6b291914-a84a-467c-beb9-1e15b82d22c5'),
	(2,'craft','m210121_145800_asset_indexing_changes','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','f4046a7b-f64c-48b4-9d25-12c912681e28'),
	(3,'craft','m210624_222934_drop_deprecated_tables','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','ddb719ba-620c-42e0-93f7-095df437a25d'),
	(4,'craft','m210724_180756_rename_source_cols','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','1d6e7b5b-4513-471b-830b-d56443593240'),
	(5,'craft','m210809_124211_remove_superfluous_uids','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','eccffe11-89ad-46ad-a9ed-33f34bd9bdf8'),
	(6,'craft','m210817_014201_universal_users','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','c825395c-57cb-4342-87b1-03e41722b6c6'),
	(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','4a818631-20a3-4f00-9cfa-7a5d692514fa'),
	(8,'craft','m211115_135500_image_transformers','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','7708c0af-e350-4c40-9015-2e9f76645011'),
	(9,'craft','m211201_131000_filesystems','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','64f368e3-a48a-4b3c-9cd9-06849aad24f7'),
	(10,'craft','m220103_043103_tab_conditions','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','50cfa279-0257-401d-ba6b-7db23cde28cd'),
	(11,'craft','m220104_003433_asset_alt_text','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','e5cdc31c-b3e4-4e34-b410-5e33c6e12b0a'),
	(12,'craft','m220123_213619_update_permissions','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','fc6133a7-f12a-4217-a606-a6d4f10a89c0'),
	(13,'craft','m220126_003432_addresses','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','778f55bb-9394-4eed-84b1-618598eb2db4'),
	(14,'craft','m220209_095604_add_indexes','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','33b5e93b-1919-45ac-8919-855ac28936b1'),
	(15,'craft','m220213_015220_matrixblocks_owners_table','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','fc53df99-dc59-4465-ab18-114661dd89cf'),
	(16,'craft','m220214_000000_truncate_sessions','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','9cddd6bd-3b6c-4c31-8d0a-8c6768f77718'),
	(17,'craft','m220222_122159_full_names','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','6a0c689d-30c2-44e2-93f8-5c9bb63b63d2'),
	(18,'craft','m220223_180559_nullable_address_owner','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','02a5665f-02b5-458d-b423-35fe57adcd8a'),
	(19,'craft','m220225_165000_transform_filesystems','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','5e8c6276-cff4-417f-bd0c-0b7ebcadf2fe'),
	(20,'craft','m220309_152006_rename_field_layout_elements','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','43c0ef71-259f-4ff6-afe1-2b11fbde369c'),
	(21,'craft','m220314_211928_field_layout_element_uids','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','43f28f92-80ca-4afc-863b-475690bdd761'),
	(22,'craft','m220316_123800_transform_fs_subpath','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','456c5df3-b53e-4bd7-baed-da8dabd3d971'),
	(23,'craft','m220317_174250_release_all_jobs','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','2308b7be-4ec7-43da-a530-a149a45f04c1'),
	(24,'craft','m220330_150000_add_site_gql_schema_components','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','d3f68ae1-eb30-4520-a897-5a555733c9cf'),
	(25,'craft','m220413_024536_site_enabled_string','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','ba5398e8-d7d0-41bb-851c-94192e046821'),
	(26,'craft','m221027_160703_add_image_transform_fill','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','7ec96482-5c05-4483-ab08-bb64ce329609'),
	(27,'craft','m221028_130548_add_canonical_id_index','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','ec974d73-a6b7-4c53-a97d-de09fcf1ea9d'),
	(28,'craft','m221118_003031_drop_element_fks','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','60ed644d-a13a-4d46-bb4c-73981f47b884'),
	(29,'craft','m230131_120713_asset_indexing_session_new_options','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','b439c11c-b721-44dc-98a7-4669b178f716'),
	(30,'craft','m230226_013114_drop_plugin_license_columns','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','292e582b-283c-413f-a217-07bf30818497'),
	(31,'plugin:ckeditor','Install','2023-07-08 07:00:56','2023-07-08 07:00:56','2023-07-08 07:00:56','fbde3bf8-7c79-4e7a-8020-7920ac79760f'),
	(32,'plugin:ckeditor','m230408_163704_v3_upgrade','2023-07-08 07:00:56','2023-07-08 07:00:56','2023-07-08 07:00:56','78870018-818d-46db-9627-3a1e5ef199e1'),
	(33,'craft','m230531_123004_add_entry_type_show_status_field','2023-10-09 09:21:36','2023-10-09 09:21:36','2023-10-09 09:21:36','7568cf9b-5a0a-444b-b092-55d164feb30a'),
	(34,'craft','m230607_102049_add_entrytype_slug_translation_columns','2023-10-09 09:21:36','2023-10-09 09:21:36','2023-10-09 09:21:36','c85bb815-068f-4890-be84-4fb90750dc88'),
	(35,'craft','m230710_162700_element_activity','2023-10-09 09:21:37','2023-10-09 09:21:37','2023-10-09 09:21:37','4d92311d-6547-4def-b476-87a26d10a90f'),
	(36,'craft','m230820_162023_fix_cache_id_type','2023-10-09 09:21:37','2023-10-09 09:21:37','2023-10-09 09:21:37','9a158d9c-cd4e-4069-a827-712fba3670b2'),
	(37,'craft','m230826_094050_fix_session_id_type','2023-10-09 09:21:37','2023-10-09 09:21:37','2023-10-09 09:21:37','111196b3-2bc3-418b-8ecc-64b28620797a');

/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_plugins`;

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_irzzhqsstxusyyhehjlpxyqlncdeycdcvnix` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;

INSERT INTO `craft_plugins` (`id`, `handle`, `version`, `schemaVersion`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'ckeditor','3.6.0','3.0.0.0','2023-07-08 07:00:56','2023-07-08 07:00:56','2023-10-09 09:44:26','982b8dfe-0182-4aa6-b989-29f41ab8efe9');

/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_projectconfig
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_projectconfig`;

CREATE TABLE `craft_projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_projectconfig` WRITE;
/*!40000 ALTER TABLE `craft_projectconfig` DISABLE KEYS */;

INSERT INTO `craft_projectconfig` (`path`, `value`)
VALUES
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.defaultPlacement','\"end\"'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elementCondition','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.autocapitalize','true'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.autocomplete','false'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.autocorrect','true'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.class','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.disabled','false'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.elementCondition','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.id','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.instructions','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.label','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.max','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.min','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.name','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.orientation','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.placeholder','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.readonly','false'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.requirable','false'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.size','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.step','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.tip','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.title','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.uid','\"4fe87b70-140a-4bd1-b697-bdc24cc63ce0\"'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.userCondition','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.warning','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.0.width','100'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.1.elementCondition','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.1.fieldUid','\"4105ff33-812d-4a27-9f88-9d4e339e488b\"'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.1.instructions','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.1.label','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.1.required','false'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.1.tip','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.1.uid','\"3b3d9081-6a57-448d-afeb-83315f2f66d5\"'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.1.userCondition','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.1.warning','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.elements.1.width','100'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.name','\"Content\"'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.uid','\"df680ccd-9569-402a-8b0c-955124b4131c\"'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.fieldLayouts.20f278c0-01e9-4b66-a1ea-406420f66d7d.tabs.0.userCondition','null'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.handle','\"drinkStyles\"'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.name','\"Drink styles\"'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.hasUrls','true'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.template','\"styles/_entry.twig\"'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.uriFormat','\"styles/{slug}\"'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.structure.maxLevels','5'),
	('categoryGroups.e682d4a9-435d-4cf8-9892-a3e34f88f406.structure.uid','\"01c585ce-7138-4881-805f-f365bb5f8375\"'),
	('ckeditor.configs.0a4d3e62-b383-4317-83ec-0dab9cfcb550.headingLevels.0','2'),
	('ckeditor.configs.0a4d3e62-b383-4317-83ec-0dab9cfcb550.headingLevels.1','3'),
	('ckeditor.configs.0a4d3e62-b383-4317-83ec-0dab9cfcb550.headingLevels.2','4'),
	('ckeditor.configs.0a4d3e62-b383-4317-83ec-0dab9cfcb550.headingLevels.3','5'),
	('ckeditor.configs.0a4d3e62-b383-4317-83ec-0dab9cfcb550.headingLevels.4','6'),
	('ckeditor.configs.0a4d3e62-b383-4317-83ec-0dab9cfcb550.name','\"Simple\"'),
	('ckeditor.configs.0a4d3e62-b383-4317-83ec-0dab9cfcb550.toolbar.0','\"heading\"'),
	('ckeditor.configs.0a4d3e62-b383-4317-83ec-0dab9cfcb550.toolbar.1','\"|\"'),
	('ckeditor.configs.0a4d3e62-b383-4317-83ec-0dab9cfcb550.toolbar.2','\"bold\"'),
	('ckeditor.configs.0a4d3e62-b383-4317-83ec-0dab9cfcb550.toolbar.3','\"italic\"'),
	('ckeditor.configs.0a4d3e62-b383-4317-83ec-0dab9cfcb550.toolbar.4','\"link\"'),
	('dateModified','1699892204'),
	('email.fromEmail','\"bauerindustries@icloud.com\"'),
	('email.fromName','\"crafty coffee\"'),
	('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elementCondition','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.autocapitalize','true'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.autocomplete','false'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.autocorrect','true'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.class','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.disabled','false'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.elementCondition','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.id','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.instructions','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.label','\"Page Title\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.max','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.min','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.name','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.orientation','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.placeholder','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.readonly','false'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.requirable','false'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.size','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.step','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.tip','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.title','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.uid','\"fa710a5b-e1f2-45a9-b219-4bf6759cf147\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.userCondition','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.warning','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.0.width','100'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.1.elementCondition','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.1.fieldUid','\"c0aec353-cfd5-4cb5-a54c-ba4d04080107\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.1.instructions','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.1.label','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.1.required','false'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.1.tip','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.1.uid','\"3f8108f5-a947-428e-a81c-5bb26ac73dab\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.1.userCondition','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.1.warning','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.1.width','100'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.2.elementCondition','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.2.fieldUid','\"b69006e0-11e2-4f01-b0fc-0d584155e3ee\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.2.instructions','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.2.label','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.2.required','false'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.2.tip','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.2.uid','\"eb9ceaf1-b7c8-41ca-97e5-df3eb1a41f8e\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.2.userCondition','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.2.warning','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.2.width','100'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.3.elementCondition','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.3.fieldUid','\"698c2c75-2a70-480a-852c-8e6c9dc2f095\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.3.instructions','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.3.label','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.3.required','true'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.3.tip','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.3.uid','\"fcc525be-f230-4560-bc56-e7f674800e79\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.3.userCondition','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.3.warning','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.elements.3.width','100'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.name','\"Content\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.uid','\"5659025a-e45a-4b36-b6d5-3edc50d1ae37\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.fieldLayouts.9e671188-f075-412f-b65a-caa80e166922.tabs.0.userCondition','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.handle','\"default\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.hasTitleField','true'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.name','\"Default\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.section','\"f1ff2a0a-7a84-43df-addb-8762c79a4f9f\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.showStatusField','true'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.slugTranslationKeyFormat','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.slugTranslationMethod','\"site\"'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.sortOrder','1'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.titleFormat','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.titleTranslationKeyFormat','null'),
	('entryTypes.2925c6ab-87b9-47ba-af26-0a2217645c59.titleTranslationMethod','\"site\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elementCondition','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.autocapitalize','true'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.autocomplete','false'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.autocorrect','true'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.class','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.disabled','false'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.elementCondition','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.id','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.instructions','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.label','\"Headline\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.max','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.min','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.name','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.orientation','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.placeholder','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.readonly','false'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.requirable','false'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.size','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.step','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.tip','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.title','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.uid','\"91318e01-38b5-4b87-b006-7467cc529cc6\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.userCondition','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.warning','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.0.width','100'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.1.elementCondition','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.1.fieldUid','\"73f4252e-66e1-47b9-bca6-9539be73126b\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.1.instructions','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.1.label','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.1.required','false'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.1.tip','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.1.uid','\"e9834db8-b644-474b-afcc-d1a0536b49b6\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.1.userCondition','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.1.warning','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.1.width','100'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.2.elementCondition','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.2.fieldUid','\"cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.2.instructions','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.2.label','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.2.required','false'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.2.tip','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.2.uid','\"1a379f11-d689-4fd3-8e43-96e988e8708d\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.2.userCondition','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.2.warning','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.elements.2.width','100'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.name','\"Content\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.uid','\"29e8f753-f4d8-4f52-ace5-b2699c6ebe64\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.fieldLayouts.5f6bddac-6954-4bab-a4f6-4fcb7db3b581.tabs.0.userCondition','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.handle','\"news\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.hasTitleField','true'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.name','\"News\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.section','\"d35a6ed0-f1a6-4189-a205-ed008cb9e034\"'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.sortOrder','1'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.titleFormat','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.titleTranslationKeyFormat','null'),
	('entryTypes.986aa4bb-41f0-4f08-a80b-5def7c05e9e2.titleTranslationMethod','\"site\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elementCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.autocapitalize','true'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.autocomplete','false'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.autocorrect','true'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.class','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.disabled','false'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.elementCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.id','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.instructions','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.label','\"Drink name\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.max','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.min','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.name','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.orientation','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.placeholder','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.readonly','false'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.requirable','false'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.size','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.step','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.tip','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.title','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.uid','\"7509c466-8dcc-452f-a77c-ddf44953bb16\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.userCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.warning','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.0.width','100'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.elementCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.fieldUid','\"aa5e3e23-3c7c-4e0d-898b-81c0190210de\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.instructions','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.label','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.required','false'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.tip','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.uid','\"5717fcb0-3610-43e9-a5c6-05cb5feb05ad\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.userCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.warning','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.width','100'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.elementCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.fieldUid','\"dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.instructions','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.label','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.required','false'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.tip','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.uid','\"a50c658c-0ec5-436a-bb12-46d256e27e39\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.userCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.warning','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.width','100'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.elementCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.fieldUid','\"698c2c75-2a70-480a-852c-8e6c9dc2f095\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.instructions','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.label','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.required','false'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.tip','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.uid','\"ba0bdeaf-4263-470a-8e8b-fdd4569be76b\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.userCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.warning','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.width','100'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.4.elementCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.4.fieldUid','\"4a683cf6-5953-4f09-8452-49db78a17da1\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.4.instructions','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.4.label','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.4.required','false'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.4.tip','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.4.uid','\"c19d2b4f-e58b-46ce-a49e-8b3ecba9b26d\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.4.userCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.4.warning','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.4.width','100'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.5.elementCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.5.fieldUid','\"1e1fdf64-5300-4a26-8dc0-12d34e412de3\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.5.instructions','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.5.label','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.5.required','false'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.5.tip','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.5.uid','\"59d4f3c7-9559-4fa5-8844-5f2d93c30a7f\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.5.userCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.5.warning','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.5.width','100'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.name','\"Content\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.uid','\"264cb0a3-acc5-4873-a843-2c10221439a1\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.userCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.handle','\"drinks\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.hasTitleField','true'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.name','\"Drinks\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.section','\"d067198d-0272-4232-b2b6-778b2c6a7b10\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.showStatusField','true'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.slugTranslationKeyFormat','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.slugTranslationMethod','\"site\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.sortOrder','1'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.titleFormat','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.titleTranslationKeyFormat','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.titleTranslationMethod','\"site\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elementCondition','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.autocapitalize','true'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.autocomplete','false'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.autocorrect','true'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.class','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.disabled','false'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.elementCondition','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.id','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.instructions','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.label','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.max','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.min','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.name','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.orientation','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.placeholder','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.readonly','false'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.requirable','false'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.size','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.step','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.tip','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.title','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.uid','\"a1e19f32-c088-4db6-83da-ce4f291be91a\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.userCondition','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.warning','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.0.width','100'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.1.elementCondition','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.1.fieldUid','\"aa5e3e23-3c7c-4e0d-898b-81c0190210de\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.1.instructions','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.1.label','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.1.required','false'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.1.tip','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.1.uid','\"2a93975b-21de-46ea-97b4-f0ed88b3bf3b\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.1.userCondition','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.1.warning','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.1.width','100'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.2.elementCondition','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.2.fieldUid','\"04ded7df-16f3-4718-b279-c9dd1cc6ff91\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.2.instructions','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.2.label','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.2.required','false'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.2.tip','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.2.uid','\"cb21c80c-3bc4-4cef-b1d4-1829e488ed05\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.2.userCondition','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.2.warning','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.elements.2.width','100'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.name','\"Content\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.uid','\"a36885f8-b2f4-474e-8859-47d9b19b8064\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.fieldLayouts.710e2221-2133-40db-b260-0272929f637f.tabs.0.userCondition','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.handle','\"recipes\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.hasTitleField','true'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.name','\"Recipes\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.section','\"783b5a78-d3c7-4b2e-9fea-0459bc803fe0\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.showStatusField','true'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.slugTranslationKeyFormat','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.slugTranslationMethod','\"site\"'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.sortOrder','1'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.titleFormat','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.titleTranslationKeyFormat','null'),
	('entryTypes.c9f73d3c-e360-4514-b61b-5311acbc0682.titleTranslationMethod','\"site\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elementCondition','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.autocapitalize','true'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.autocomplete','false'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.autocorrect','true'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.class','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.disabled','false'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.elementCondition','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.id','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.instructions','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.label','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.max','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.min','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.name','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.orientation','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.placeholder','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.readonly','false'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.requirable','false'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.size','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.step','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.tip','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.title','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.uid','\"acc06c62-9e69-42fb-a3b4-30cd52caa123\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.userCondition','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.warning','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.0.width','100'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.elementCondition','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.fieldUid','\"c0aec353-cfd5-4cb5-a54c-ba4d04080107\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.instructions','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.label','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.required','false'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.tip','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.uid','\"74be3a12-9f05-4bb7-843b-a8da3fd1442b\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.userCondition','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.warning','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.width','100'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.name','\"Content\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.uid','\"5b7235f5-d4d3-4922-92e9-9ee90c0a1203\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.userCondition','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.handle','\"homepage\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.hasTitleField','true'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.name','\"Homepage\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.section','\"18d9a6c5-f2cc-4518-a7d0-0254317ec34c\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.showStatusField','true'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.slugTranslationKeyFormat','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.slugTranslationMethod','\"site\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.sortOrder','1'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.titleFormat','\"{section.name|raw}\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.titleTranslationKeyFormat','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.titleTranslationMethod','\"site\"'),
	('fieldGroups.2e5ac707-b113-48a6-a39f-cd16b37e8dfd.name','\"Common\"'),
	('fieldGroups.7fb8ff63-f6d7-4722-9949-b41918660706.name','\"Drinks\"'),
	('fieldGroups.8eccfec3-f740-4d42-a415-51a2d9ab649a.name','\"About\"'),
	('fieldGroups.d9733ce0-764f-4a3b-87c7-78604d73922c.name','\"News\"'),
	('fieldGroups.e0623228-802b-4c2e-9082-5065523c2a1d.name','\"Styles\"'),
	('fieldGroups.e2aec99d-f269-419f-859c-d74d6da3828c.name','\"Recipes\"'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.columnSuffix','null'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.contentColumnType','\"string\"'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.fieldGroup','\"e2aec99d-f269-419f-859c-d74d6da3828c\"'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.handle','\"recipeContents\"'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.instructions','null'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.name','\"Recipe Contents\"'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.searchable','false'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.settings.contentTable','\"{{%matrixcontent_recipecontents}}\"'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.settings.maxBlocks','null'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.settings.minBlocks','null'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.settings.propagationKeyFormat','null'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.settings.propagationMethod','\"all\"'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.translationKeyFormat','null'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.translationMethod','\"site\"'),
	('fields.04ded7df-16f3-4718-b279-c9dd1cc6ff91.type','\"craft\\\\fields\\\\Matrix\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.columnSuffix','null'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.contentColumnType','\"string\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.fieldGroup','\"7fb8ff63-f6d7-4722-9949-b41918660706\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.handle','\"drinkRecipe\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.instructions','null'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.name','\"Drink recipe\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.searchable','true'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.allowSelfRelations','false'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.branchLimit','null'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.localizeRelations','false'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.maintainHierarchy','false'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.maxRelations','null'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.minRelations','1'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Entry\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.selectionCondition.__assoc__.1.1','\"global\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.selectionCondition.__assoc__.2.0','\"class\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.selectionLabel','\"Add a drink recipe\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.showSiteMenu','false'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.sources.0','\"section:783b5a78-d3c7-4b2e-9fea-0459bc803fe0\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.targetSiteId','null'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.validateRelatedElements','false'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.settings.viewMode','null'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.translationKeyFormat','null'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.translationMethod','\"site\"'),
	('fields.1e1fdf64-5300-4a26-8dc0-12d34e412de3.type','\"craft\\\\fields\\\\Entries\"'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.columnSuffix','\"bdexzddb\"'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.contentColumnType','\"text\"'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.fieldGroup','\"e0623228-802b-4c2e-9082-5065523c2a1d\"'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.handle','\"styleDescription\"'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.instructions','null'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.name','\"Style description\"'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.searchable','false'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.settings.byteLimit','null'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.settings.charLimit','null'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.settings.code','false'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.settings.columnType','null'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.settings.initialRows','4'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.settings.multiline','true'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.settings.placeholder','null'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.settings.uiMode','\"normal\"'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.translationKeyFormat','null'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.translationMethod','\"none\"'),
	('fields.4105ff33-812d-4a27-9f88-9d4e339e488b.type','\"craft\\\\fields\\\\PlainText\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.columnSuffix','null'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.contentColumnType','\"string\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.fieldGroup','\"7fb8ff63-f6d7-4722-9949-b41918660706\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.handle','\"drinkImage\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.instructions','null'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.name','\"Drink image\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.searchable','false'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.allowedKinds.0','\"image\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.allowSelfRelations','false'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.allowSubfolders','false'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.allowUploads','true'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.branchLimit','null'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.defaultUploadLocationSource','\"volume:33f7304a-36e8-41e2-a1af-285e3885fab8\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.defaultUploadLocationSubpath','null'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.localizeRelations','false'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.maintainHierarchy','false'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.maxRelations','1'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.minRelations','null'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.previewMode','\"full\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.restrictedDefaultUploadSubpath','null'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.restrictedLocationSource','\"volume:33f7304a-36e8-41e2-a1af-285e3885fab8\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.restrictedLocationSubpath','null'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.restrictFiles','true'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.restrictLocation','false'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.selectionCondition.__assoc__.1.1','\"global\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.selectionCondition.__assoc__.2.0','\"class\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.selectionLabel','\"Add a drink image\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.showSiteMenu','false'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.showUnpermittedFiles','false'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.showUnpermittedVolumes','false'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.sources.0','\"volume:33f7304a-36e8-41e2-a1af-285e3885fab8\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.targetSiteId','null'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.validateRelatedElements','false'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.settings.viewMode','\"large\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.translationKeyFormat','null'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.translationMethod','\"site\"'),
	('fields.4a683cf6-5953-4f09-8452-49db78a17da1.type','\"craft\\\\fields\\\\Assets\"'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.columnSuffix','\"fpawuluh\"'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.contentColumnType','\"text\"'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.fieldGroup','\"7fb8ff63-f6d7-4722-9949-b41918660706\"'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.handle','\"pageCopy\"'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.instructions','null'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.name','\"Page copy\"'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.searchable','true'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.settings.availableTransforms','\"\"'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.settings.availableVolumes','\"\"'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.settings.ckeConfig','\"0a4d3e62-b383-4317-83ec-0dab9cfcb550\"'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.settings.columnType','\"text\"'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.settings.defaultTransform','null'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.settings.enableSourceEditingForNonAdmins','false'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.settings.purifierConfig','null'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.settings.purifyHtml','true'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.settings.showUnpermittedFiles','false'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.settings.showUnpermittedVolumes','false'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.settings.showWordCount','false'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.translationKeyFormat','null'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.translationMethod','\"none\"'),
	('fields.698c2c75-2a70-480a-852c-8e6c9dc2f095.type','\"craft\\\\ckeditor\\\\Field\"'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.columnSuffix','\"xuzzitfj\"'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.contentColumnType','\"text\"'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.fieldGroup','\"2e5ac707-b113-48a6-a39f-cd16b37e8dfd\"'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.handle','\"excerpt\"'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.instructions','null'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.name','\"Excerpt\"'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.searchable','false'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.settings.byteLimit','null'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.settings.charLimit','null'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.settings.code','false'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.settings.columnType','null'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.settings.initialRows','4'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.settings.multiline','false'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.settings.placeholder','null'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.settings.uiMode','\"normal\"'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.translationKeyFormat','null'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.translationMethod','\"none\"'),
	('fields.73f4252e-66e1-47b9-bca6-9539be73126b.type','\"craft\\\\fields\\\\PlainText\"'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.columnSuffix','null'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.contentColumnType','\"string\"'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.fieldGroup','\"e0623228-802b-4c2e-9082-5065523c2a1d\"'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.handle','\"drinkStyle\"'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.instructions','null'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.name','\"Drink style\"'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.searchable','false'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.settings.allowSelfRelations','false'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.settings.branchLimit','null'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.settings.localizeRelations','false'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.settings.maintainHierarchy','false'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.settings.maxRelations','null'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.settings.minRelations','1'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.settings.selectionLabel','null'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.settings.showSiteMenu','true'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.settings.source','\"group:e682d4a9-435d-4cf8-9892-a3e34f88f406\"'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.settings.targetSiteId','null'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.settings.validateRelatedElements','false'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.settings.viewMode','null'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.translationKeyFormat','null'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.translationMethod','\"site\"'),
	('fields.aa5e3e23-3c7c-4e0d-898b-81c0190210de.type','\"craft\\\\fields\\\\Categories\"'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.columnSuffix','\"cemhehvv\"'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.contentColumnType','\"text\"'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.fieldGroup','\"8eccfec3-f740-4d42-a415-51a2d9ab649a\"'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.handle','\"pageIntro\"'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.instructions','null'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.name','\"Page intro\"'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.searchable','false'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.settings.byteLimit','null'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.settings.charLimit','null'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.settings.code','false'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.settings.columnType','null'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.settings.initialRows','4'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.settings.multiline','false'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.settings.placeholder','null'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.settings.uiMode','\"normal\"'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.translationKeyFormat','null'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.translationMethod','\"none\"'),
	('fields.b69006e0-11e2-4f01-b0fc-0d584155e3ee.type','\"craft\\\\fields\\\\PlainText\"'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.columnSuffix','\"nztqoamm\"'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.contentColumnType','\"text\"'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.fieldGroup','\"8eccfec3-f740-4d42-a415-51a2d9ab649a\"'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.handle','\"subtitle\"'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.instructions','null'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.name','\"Subtitle\"'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.searchable','false'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.settings.byteLimit','null'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.settings.charLimit','null'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.settings.code','false'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.settings.columnType','null'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.settings.initialRows','4'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.settings.multiline','false'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.settings.placeholder','null'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.settings.uiMode','\"normal\"'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.translationKeyFormat','null'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.translationMethod','\"none\"'),
	('fields.c0aec353-cfd5-4cb5-a54c-ba4d04080107.type','\"craft\\\\fields\\\\PlainText\"'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.columnSuffix','\"fnteyxpg\"'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.contentColumnType','\"text\"'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.fieldGroup','\"d9733ce0-764f-4a3b-87c7-78604d73922c\"'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.handle','\"newsBody\"'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.instructions','null'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.name','\"News body\"'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.searchable','false'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.settings.availableTransforms','\"\"'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.settings.availableVolumes','\"\"'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.settings.ckeConfig','\"0a4d3e62-b383-4317-83ec-0dab9cfcb550\"'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.settings.columnType','\"text\"'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.settings.defaultTransform','null'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.settings.enableSourceEditingForNonAdmins','false'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.settings.purifierConfig','null'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.settings.purifyHtml','true'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.settings.showUnpermittedFiles','false'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.settings.showUnpermittedVolumes','false'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.settings.showWordCount','false'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.translationKeyFormat','null'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.translationMethod','\"none\"'),
	('fields.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753.type','\"craft\\\\ckeditor\\\\Field\"'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.columnSuffix','\"yetqqcwj\"'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.contentColumnType','\"text\"'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.fieldGroup','\"7fb8ff63-f6d7-4722-9949-b41918660706\"'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.handle','\"introduction\"'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.instructions','\"Short sentence at top of drink page\"'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.name','\"Introduction\"'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.searchable','false'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.settings.byteLimit','null'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.settings.charLimit','null'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.settings.code','false'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.settings.columnType','null'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.settings.initialRows','4'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.settings.multiline','false'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.settings.placeholder','null'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.settings.uiMode','\"normal\"'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.translationKeyFormat','null'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.translationMethod','\"none\"'),
	('fields.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3.type','\"craft\\\\fields\\\\PlainText\"'),
	('fs.drinks.hasUrls','true'),
	('fs.drinks.name','\"Drinks\"'),
	('fs.drinks.settings.path','\"@webroot/assets/images/drinks\"'),
	('fs.drinks.type','\"craft\\\\fs\\\\Local\"'),
	('fs.drinks.url','\"@web/assets/images/drinks\"'),
	('graphql.publicToken.enabled','false'),
	('graphql.publicToken.expiryDate','null'),
	('graphql.schemas.7f9cf7cc-e388-4dd8-819d-17427ec39847.isPublic','true'),
	('graphql.schemas.7f9cf7cc-e388-4dd8-819d-17427ec39847.name','\"Public Schema\"'),
	('imageTransforms.42840bed-00c3-43de-ad99-357a1473c37a.fill','null'),
	('imageTransforms.42840bed-00c3-43de-ad99-357a1473c37a.format','null'),
	('imageTransforms.42840bed-00c3-43de-ad99-357a1473c37a.handle','\"Thumb840x200\"'),
	('imageTransforms.42840bed-00c3-43de-ad99-357a1473c37a.height','200'),
	('imageTransforms.42840bed-00c3-43de-ad99-357a1473c37a.interlace','\"none\"'),
	('imageTransforms.42840bed-00c3-43de-ad99-357a1473c37a.mode','\"crop\"'),
	('imageTransforms.42840bed-00c3-43de-ad99-357a1473c37a.name','\"840x200 Thumb\"'),
	('imageTransforms.42840bed-00c3-43de-ad99-357a1473c37a.position','\"center-center\"'),
	('imageTransforms.42840bed-00c3-43de-ad99-357a1473c37a.quality','null'),
	('imageTransforms.42840bed-00c3-43de-ad99-357a1473c37a.upscale','true'),
	('imageTransforms.42840bed-00c3-43de-ad99-357a1473c37a.width','840'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.field','\"04ded7df-16f3-4718-b279-c9dd1cc6ff91\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.elementCondition','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.elements.0.elementCondition','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.elements.0.fieldUid','\"408e958f-484f-4218-97a1-61928d88e082\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.elements.0.instructions','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.elements.0.label','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.elements.0.required','false'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.elements.0.tip','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.elements.0.uid','\"c45c2ec0-f37c-46d2-a693-a1073b704d70\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.elements.0.userCondition','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.elements.0.warning','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.elements.0.width','100'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.name','\"Content\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.uid','\"22d4cdac-8f6d-439c-b4f4-01653413f21f\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fieldLayouts.afa6fdb3-ee5b-4205-9508-f712c2f3c831.tabs.0.userCondition','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.columnSuffix','\"ifbkxxbo\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.contentColumnType','\"text\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.fieldGroup','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.handle','\"tipContent\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.instructions','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.name','\"Tip content\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.searchable','false'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.settings.byteLimit','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.settings.charLimit','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.settings.code','false'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.settings.columnType','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.settings.initialRows','4'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.settings.multiline','false'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.settings.placeholder','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.settings.uiMode','\"normal\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.translationKeyFormat','null'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.translationMethod','\"none\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.fields.408e958f-484f-4218-97a1-61928d88e082.type','\"craft\\\\fields\\\\PlainText\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.handle','\"recipeTip\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.name','\"Recipe tip\"'),
	('matrixBlockTypes.13c6813c-41d2-4c4a-8e07-1a08250f74d7.sortOrder','2'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.field','\"04ded7df-16f3-4718-b279-c9dd1cc6ff91\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.elementCondition','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.elements.0.elementCondition','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.elements.0.fieldUid','\"b646caf2-73a7-4576-b914-49d7767fb79a\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.elements.0.instructions','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.elements.0.label','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.elements.0.required','false'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.elements.0.tip','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.elements.0.uid','\"3e5d8ab6-2ba9-4c84-9cf1-3c96067c706e\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.elements.0.userCondition','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.elements.0.warning','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.elements.0.width','100'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.name','\"Content\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.uid','\"7ed7ccc1-2345-41aa-9d30-9d8152b5398d\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fieldLayouts.ccdfa2f3-419d-4602-96b6-e830c5815833.tabs.0.userCondition','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.columnSuffix','\"ixsvoiho\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.contentColumnType','\"text\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.fieldGroup','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.handle','\"bodyContent\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.instructions','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.name','\"Body content\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.searchable','false'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.settings.availableTransforms','\"*\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.settings.availableVolumes','\"*\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.settings.ckeConfig','\"0a4d3e62-b383-4317-83ec-0dab9cfcb550\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.settings.columnType','\"text\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.settings.defaultTransform','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.settings.enableSourceEditingForNonAdmins','false'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.settings.purifierConfig','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.settings.purifyHtml','true'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.settings.showUnpermittedFiles','false'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.settings.showUnpermittedVolumes','false'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.settings.showWordCount','false'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.settings.wordLimit','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.translationKeyFormat','null'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.translationMethod','\"none\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.fields.b646caf2-73a7-4576-b914-49d7767fb79a.type','\"craft\\\\ckeditor\\\\Field\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.handle','\"recipeCopy\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.name','\"Recipe copy\"'),
	('matrixBlockTypes.51831859-89b7-488a-b11f-bdbe47efe345.sortOrder','3'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.field','\"04ded7df-16f3-4718-b279-c9dd1cc6ff91\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elementCondition','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.0.elementCondition','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.0.fieldUid','\"e9185427-bcf9-4ecd-af4b-e8b247a7df7c\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.0.instructions','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.0.label','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.0.required','false'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.0.tip','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.0.uid','\"791f78e8-81f6-4cb4-846d-eaa54421efff\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.0.userCondition','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.0.warning','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.0.width','100'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.1.elementCondition','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.1.fieldUid','\"13c08d93-1751-4725-aa81-f7930303df4e\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.1.instructions','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.1.label','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.1.required','false'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.1.tip','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.1.uid','\"620fa0f2-6224-41c2-a74e-5e13ccd7c599\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.1.userCondition','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.1.warning','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.elements.1.width','100'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.name','\"Content\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.uid','\"ec3dc15b-61b6-4465-a090-affea62ac30c\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fieldLayouts.308cfa53-5e69-4003-bb7b-98c67cbc9484.tabs.0.userCondition','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.columnSuffix','\"phtxafmo\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.contentColumnType','\"text\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.fieldGroup','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.handle','\"stepsContent\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.instructions','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.name','\"Steps content\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.searchable','false'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.addRowLabel','\"Add a row\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.columns.__assoc__.0.0','\"col1\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Step Instructions\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.columns.__assoc__.0.1.__assoc__.1.1','\"stepInstructions\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.columns.__assoc__.0.1.__assoc__.3.1','\"multiline\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.columnType','\"text\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.defaults','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.maxRows','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.minRows','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.settings.staticRows','false'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.translationKeyFormat','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.translationMethod','\"none\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.13c08d93-1751-4725-aa81-f7930303df4e.type','\"craft\\\\fields\\\\Table\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.columnSuffix','\"wfhmkbiz\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.contentColumnType','\"text\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.fieldGroup','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.handle','\"stepsTitle\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.instructions','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.name','\"Steps Title\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.searchable','false'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.settings.byteLimit','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.settings.charLimit','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.settings.code','false'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.settings.columnType','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.settings.initialRows','4'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.settings.multiline','false'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.settings.placeholder','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.settings.uiMode','\"normal\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.translationKeyFormat','null'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.translationMethod','\"none\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.fields.e9185427-bcf9-4ecd-af4b-e8b247a7df7c.type','\"craft\\\\fields\\\\PlainText\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.handle','\"recipeSteps\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.name','\"Recipe steps\"'),
	('matrixBlockTypes.618c8b80-48c6-4f21-b4b5-3799513c0ec4.sortOrder','4'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.field','\"04ded7df-16f3-4718-b279-c9dd1cc6ff91\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elementCondition','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.0.elementCondition','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.0.fieldUid','\"caea4449-52ec-4f58-b4b5-10a73028a1bd\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.0.instructions','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.0.label','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.0.required','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.0.tip','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.0.uid','\"5f563175-9ded-406d-9f22-f886dd57e104\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.0.userCondition','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.0.warning','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.0.width','100'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.1.elementCondition','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.1.fieldUid','\"0b992201-02d6-482e-95db-9deda58d0abd\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.1.instructions','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.1.label','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.1.required','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.1.tip','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.1.uid','\"49396025-a61d-4c5b-ba7a-e347d2ed01d5\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.1.userCondition','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.1.warning','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.elements.1.width','100'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.name','\"Content\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.uid','\"8c8b6e48-2498-4582-a30b-77b77c6f72b7\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fieldLayouts.3d670f67-9b40-4d3c-bee9-d2123b46a500.tabs.0.userCondition','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.columnSuffix','\"lknkamcy\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.contentColumnType','\"text\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.fieldGroup','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.handle','\"imageCaption\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.instructions','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.name','\"Image caption\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.searchable','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.settings.byteLimit','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.settings.charLimit','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.settings.code','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.settings.columnType','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.settings.initialRows','4'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.settings.multiline','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.settings.placeholder','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.settings.uiMode','\"normal\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.translationKeyFormat','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.translationMethod','\"none\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.0b992201-02d6-482e-95db-9deda58d0abd.type','\"craft\\\\fields\\\\PlainText\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.columnSuffix','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.contentColumnType','\"string\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.fieldGroup','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.handle','\"image\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.instructions','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.name','\"Image\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.searchable','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.allowedKinds','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.allowSelfRelations','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.allowSubfolders','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.allowUploads','true'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.branchLimit','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.defaultUploadLocationSource','\"volume:33f7304a-36e8-41e2-a1af-285e3885fab8\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.defaultUploadLocationSubpath','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.localizeRelations','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.maintainHierarchy','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.maxRelations','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.minRelations','1'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.previewMode','\"full\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.restrictedDefaultUploadSubpath','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.restrictedLocationSource','\"volume:33f7304a-36e8-41e2-a1af-285e3885fab8\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.restrictedLocationSubpath','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.restrictFiles','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.restrictLocation','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.selectionCondition.__assoc__.1.1','\"global\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.selectionCondition.__assoc__.2.0','\"class\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.selectionLabel','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.showSiteMenu','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.showUnpermittedFiles','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.showUnpermittedVolumes','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.sources','\"*\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.targetSiteId','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.validateRelatedElements','false'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.settings.viewMode','\"list\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.translationKeyFormat','null'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.translationMethod','\"site\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.fields.caea4449-52ec-4f58-b4b5-10a73028a1bd.type','\"craft\\\\fields\\\\Assets\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.handle','\"recipeImage\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.name','\"Recipe image\"'),
	('matrixBlockTypes.907915af-87d2-4703-95a1-ebb8a652d445.sortOrder','1'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.field','\"04ded7df-16f3-4718-b279-c9dd1cc6ff91\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.elementCondition','null'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.elements.0.elementCondition','null'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.elements.0.fieldUid','\"a3769b58-80e0-4684-81b8-70cb37801eaa\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.elements.0.instructions','null'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.elements.0.label','null'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.elements.0.required','false'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.elements.0.tip','null'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.elements.0.uid','\"b80d23ed-dc4e-4428-b4e6-729b198885ce\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.elements.0.userCondition','null'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.elements.0.warning','null'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.elements.0.width','100'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.name','\"Content\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.uid','\"f126a761-e4be-4741-a949-42a4b9204d1d\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fieldLayouts.d5e3ddda-e5f4-4245-9360-a61b0e9cff15.tabs.0.userCondition','null'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.columnSuffix','\"hnwidpcl\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.contentColumnType','\"text\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.fieldGroup','null'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.handle','\"ingredients\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.instructions','null'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.name','\"Ingredients\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.searchable','false'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.addRowLabel','\"Add a row\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.0.0','\"col1\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Amount\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.0.1.__assoc__.1.1','\"amount\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.1.0','\"col2\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.1.1.__assoc__.0.1','\"Ingredient\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.1.1.__assoc__.1.1','\"ingredient\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columns.__assoc__.1.1.__assoc__.3.1','\"singleline\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.columnType','\"text\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.defaults.0.__assoc__.0.0','\"col1\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.defaults.0.__assoc__.0.1','\"\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.defaults.0.__assoc__.1.0','\"col2\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.defaults.0.__assoc__.1.1','\"\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.maxRows','null'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.minRows','null'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.settings.staticRows','false'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.translationKeyFormat','null'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.translationMethod','\"none\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.fields.a3769b58-80e0-4684-81b8-70cb37801eaa.type','\"craft\\\\fields\\\\Table\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.handle','\"recipeIngredients\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.name','\"Recipe ingredients\"'),
	('matrixBlockTypes.c5a06246-b324-46d5-8727-2789c2374a92.sortOrder','5'),
	('meta.__names__.04ded7df-16f3-4718-b279-c9dd1cc6ff91','\"Recipe Contents\"'),
	('meta.__names__.0a4d3e62-b383-4317-83ec-0dab9cfcb550','\"Simple\"'),
	('meta.__names__.0b992201-02d6-482e-95db-9deda58d0abd','\"Image caption\"'),
	('meta.__names__.13c08d93-1751-4725-aa81-f7930303df4e','\"Steps content\"'),
	('meta.__names__.13c6813c-41d2-4c4a-8e07-1a08250f74d7','\"Recipe tip\"'),
	('meta.__names__.18d9a6c5-f2cc-4518-a7d0-0254317ec34c','\"Homepage\"'),
	('meta.__names__.1e1fdf64-5300-4a26-8dc0-12d34e412de3','\"Drink recipe\"'),
	('meta.__names__.25dcf5ff-387f-4f58-b014-15685772b51f','\"crafty coffee\"'),
	('meta.__names__.2925c6ab-87b9-47ba-af26-0a2217645c59','\"Default\"'),
	('meta.__names__.2e5ac707-b113-48a6-a39f-cd16b37e8dfd','\"Common\"'),
	('meta.__names__.33f7304a-36e8-41e2-a1af-285e3885fab8','\"Drinks\"'),
	('meta.__names__.408e958f-484f-4218-97a1-61928d88e082','\"Tip content\"'),
	('meta.__names__.4105ff33-812d-4a27-9f88-9d4e339e488b','\"Style description\"'),
	('meta.__names__.42840bed-00c3-43de-ad99-357a1473c37a','\"840x200 Thumb\"'),
	('meta.__names__.4a683cf6-5953-4f09-8452-49db78a17da1','\"Drink image\"'),
	('meta.__names__.51831859-89b7-488a-b11f-bdbe47efe345','\"Recipe copy\"'),
	('meta.__names__.5d3ef853-3a34-4342-a721-1f59d43ad1b0','\"Public Schema\"'),
	('meta.__names__.618c8b80-48c6-4f21-b4b5-3799513c0ec4','\"Recipe steps\"'),
	('meta.__names__.684353c1-0d73-43a1-913e-6d34bbadfea9','\"crafty coffee\"'),
	('meta.__names__.698c2c75-2a70-480a-852c-8e6c9dc2f095','\"Page copy\"'),
	('meta.__names__.73f4252e-66e1-47b9-bca6-9539be73126b','\"Excerpt\"'),
	('meta.__names__.783b5a78-d3c7-4b2e-9fea-0459bc803fe0','\"Recipes\"'),
	('meta.__names__.7f9cf7cc-e388-4dd8-819d-17427ec39847','\"Public Schema\"'),
	('meta.__names__.7fb8ff63-f6d7-4722-9949-b41918660706','\"Drinks\"'),
	('meta.__names__.8eccfec3-f740-4d42-a415-51a2d9ab649a','\"About\"'),
	('meta.__names__.907915af-87d2-4703-95a1-ebb8a652d445','\"Recipe image\"'),
	('meta.__names__.986aa4bb-41f0-4f08-a80b-5def7c05e9e2','\"News\"'),
	('meta.__names__.a3769b58-80e0-4684-81b8-70cb37801eaa','\"Ingredients\"'),
	('meta.__names__.aa5e3e23-3c7c-4e0d-898b-81c0190210de','\"Drink style\"'),
	('meta.__names__.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5','\"Drinks\"'),
	('meta.__names__.b646caf2-73a7-4576-b914-49d7767fb79a','\"Body content\"'),
	('meta.__names__.b69006e0-11e2-4f01-b0fc-0d584155e3ee','\"Page intro\"'),
	('meta.__names__.c0aec353-cfd5-4cb5-a54c-ba4d04080107','\"Subtitle\"'),
	('meta.__names__.c5a06246-b324-46d5-8727-2789c2374a92','\"Recipe ingredients\"'),
	('meta.__names__.c9f73d3c-e360-4514-b61b-5311acbc0682','\"Recipes\"'),
	('meta.__names__.caea4449-52ec-4f58-b4b5-10a73028a1bd','\"Image\"'),
	('meta.__names__.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753','\"News body\"'),
	('meta.__names__.d067198d-0272-4232-b2b6-778b2c6a7b10','\"Drinks\"'),
	('meta.__names__.d35a6ed0-f1a6-4189-a205-ed008cb9e034','\"News\"'),
	('meta.__names__.d39bc870-b3d1-4067-a9ec-dce454eb40d9','\"Public Schema\"'),
	('meta.__names__.d9733ce0-764f-4a3b-87c7-78604d73922c','\"News\"'),
	('meta.__names__.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3','\"Introduction\"'),
	('meta.__names__.e0623228-802b-4c2e-9082-5065523c2a1d','\"Styles\"'),
	('meta.__names__.e2aec99d-f269-419f-859c-d74d6da3828c','\"Recipes\"'),
	('meta.__names__.e682d4a9-435d-4cf8-9892-a3e34f88f406','\"Drink styles\"'),
	('meta.__names__.e9185427-bcf9-4ecd-af4b-e8b247a7df7c','\"Steps Title\"'),
	('meta.__names__.f1ff2a0a-7a84-43df-addb-8762c79a4f9f','\"About Crafty Coffee\"'),
	('meta.__names__.ffe7f2a0-f138-4ab9-b44d-b139aebec30c','\"Homepage\"'),
	('plugins.ckeditor.edition','\"standard\"'),
	('plugins.ckeditor.enabled','true'),
	('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.defaultPlacement','\"end\"'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.enableVersioning','true'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.handle','\"homepage\"'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.name','\"Homepage\"'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.previewTargets.0.__assoc__.0.0','\"label\"'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.previewTargets.0.__assoc__.1.1','\"{url}\"'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.previewTargets.0.__assoc__.2.0','\"refresh\"'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.previewTargets.0.__assoc__.2.1','\"1\"'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.propagationMethod','\"all\"'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.enabledByDefault','true'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.hasUrls','true'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.template','\"index\"'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.uriFormat','\"__home__\"'),
	('sections.18d9a6c5-f2cc-4518-a7d0-0254317ec34c.type','\"single\"'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.defaultPlacement','\"end\"'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.enableVersioning','true'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.handle','\"recipes\"'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.name','\"Recipes\"'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.previewTargets.0.__assoc__.0.0','\"label\"'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.previewTargets.0.__assoc__.1.1','\"{url}\"'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.previewTargets.0.__assoc__.2.0','\"refresh\"'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.previewTargets.0.__assoc__.2.1','\"1\"'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.propagationMethod','\"all\"'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.enabledByDefault','true'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.hasUrls','true'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.template','\"recipes/_entry.twig\"'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.uriFormat','\"recipes/{slug}\"'),
	('sections.783b5a78-d3c7-4b2e-9fea-0459bc803fe0.type','\"channel\"'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.defaultPlacement','\"end\"'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.enableVersioning','true'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.handle','\"drinks\"'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.name','\"Drinks\"'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.previewTargets.0.__assoc__.0.0','\"label\"'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.previewTargets.0.__assoc__.1.1','\"{url}\"'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.previewTargets.0.__assoc__.2.0','\"refresh\"'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.previewTargets.0.__assoc__.2.1','\"1\"'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.propagationMethod','\"all\"'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.enabledByDefault','true'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.hasUrls','true'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.template','\"drinks/_entry\"'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.uriFormat','\"drinks/{slug}\"'),
	('sections.d067198d-0272-4232-b2b6-778b2c6a7b10.type','\"channel\"'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.defaultPlacement','\"end\"'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.enableVersioning','true'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.handle','\"news\"'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.name','\"News\"'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.previewTargets.0.__assoc__.0.0','\"label\"'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.previewTargets.0.__assoc__.1.1','\"{url}\"'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.previewTargets.0.__assoc__.2.0','\"refresh\"'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.previewTargets.0.__assoc__.2.1','\"1\"'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.propagationMethod','\"all\"'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.enabledByDefault','true'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.hasUrls','true'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.template','\"news/_entry\"'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.uriFormat','\"news/{slug}\"'),
	('sections.d35a6ed0-f1a6-4189-a205-ed008cb9e034.type','\"channel\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.defaultPlacement','\"end\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.enableVersioning','true'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.handle','\"aboutCraftyCoffee\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.name','\"About Crafty Coffee\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.previewTargets.0.__assoc__.0.0','\"label\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.previewTargets.0.__assoc__.1.1','\"{url}\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.previewTargets.0.__assoc__.2.0','\"refresh\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.previewTargets.0.__assoc__.2.1','\"1\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.propagationMethod','\"all\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.enabledByDefault','true'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.hasUrls','true'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.template','\"about/_entry\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.siteSettings.684353c1-0d73-43a1-913e-6d34bbadfea9.uriFormat','\"{parent.uri}/{slug}\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.structure.maxLevels','null'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.structure.uid','\"175e7b20-d82d-4aab-908c-0ac21a52cae3\"'),
	('sections.f1ff2a0a-7a84-43df-addb-8762c79a4f9f.type','\"structure\"'),
	('siteGroups.25dcf5ff-387f-4f58-b014-15685772b51f.name','\"crafty coffee\"'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.baseUrl','\"$PRIMARY_SITE_URL\"'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.enabled','true'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.handle','\"default\"'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.hasUrls','true'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.language','\"en-US\"'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.name','\"crafty coffee\"'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.primary','true'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.siteGroup','\"25dcf5ff-387f-4f58-b014-15685772b51f\"'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.sortOrder','1'),
	('system.edition','\"pro\"'),
	('system.live','true'),
	('system.name','\"crafty coffee\"'),
	('system.schemaVersion','\"4.5.3.0\"'),
	('system.timeZone','\"America/Los_Angeles\"'),
	('users.allowPublicRegistration','false'),
	('users.defaultGroup','null'),
	('users.fieldLayouts.a7c8ef5d-8a5f-412b-9da9-f267966e991e','null'),
	('users.photoSubpath','null'),
	('users.photoVolumeUid','null'),
	('users.requireEmailVerification','true'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elementCondition','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.autocapitalize','true'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.autocomplete','false'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.autocorrect','true'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.class','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.disabled','false'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.elementCondition','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.id','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.instructions','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.label','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.max','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.min','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.name','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.orientation','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.placeholder','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.readonly','false'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.requirable','false'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.size','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.step','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.tip','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.title','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.uid','\"2b4f338c-415f-4220-a938-b863d3185dd8\"'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.userCondition','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.warning','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.elements.0.width','100'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.name','\"Content\"'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.uid','\"2aff7332-7ba9-41ed-85d9-728302d372b4\"'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fieldLayouts.10d27903-5538-43d5-b90f-33d78c819c79.tabs.0.userCondition','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.fs','\"drinks\"'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.handle','\"drinks\"'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.name','\"Drinks\"'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.sortOrder','1'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.titleTranslationKeyFormat','null'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.titleTranslationMethod','\"site\"'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.transformFs','\"\"'),
	('volumes.33f7304a-36e8-41e2-a1af-285e3885fab8.transformSubpath','\"\"');

/*!40000 ALTER TABLE `craft_projectconfig` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_queue`;

CREATE TABLE `craft_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `craft_idx_aenpicwxusxzsacqighcghxrujgjzndodubh` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `craft_idx_fwqertpmiyazhtwmsiuvxeydbdormdamnsmt` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_relations`;

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_dklbqzptxbkitzzrjumefqxornagvfvsnquu` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `craft_idx_pumgsyxgvypeowpmrwkuluujsvyajcjquqdh` (`sourceId`),
  KEY `craft_idx_txwldtjyiowfeskcwypjcoxihwmfxfzropfo` (`targetId`),
  KEY `craft_idx_nefemyjbmzmxlmfydvkcrmmchbenialphtdm` (`sourceSiteId`),
  CONSTRAINT `craft_fk_onrhzaihcucxfsecpznolpxmjjcwuouceewk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_tgnempgorvrqbbrdhcdaxqvzcqhdcsrabrbb` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_yploqwyhcrjggmfdvbosspykcyicytpihmrv` FOREIGN KEY (`sourceSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;

INSERT INTO `craft_relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,5,16,NULL,14,1,'2023-07-23 08:05:13','2023-07-23 08:05:13','6362dacc-15bf-4e70-8abe-1505d09b6dca'),
	(4,5,18,NULL,17,1,'2023-07-23 08:14:12','2023-07-23 08:14:12','1d679ec0-c780-4ee4-9223-5e979f9649cb'),
	(5,5,19,NULL,17,1,'2023-07-23 08:14:14','2023-07-23 08:14:14','a5b11a71-e808-417a-a27e-7afdd0035f66'),
	(6,5,20,NULL,17,1,'2023-07-23 08:14:21','2023-07-23 08:14:21','d49d2c50-2351-439f-8da4-56c23f3367bb'),
	(9,5,35,NULL,17,1,'2023-11-10 16:46:18','2023-11-10 16:46:18','b6af460e-d671-4f9a-a4b1-a70c505fca97'),
	(13,5,38,NULL,17,1,'2023-11-10 16:47:45','2023-11-10 16:47:45','ea64ae14-b871-4100-aba3-849a6238d86b'),
	(16,5,6,NULL,14,1,'2023-11-10 16:48:19','2023-11-10 16:48:19','4c7520f7-0838-4c95-a0dc-46e0c14d8ae3'),
	(17,5,42,NULL,14,1,'2023-11-10 16:48:19','2023-11-10 16:48:19','d3ea5064-d3c6-4084-948a-0128bd986e39'),
	(18,5,43,NULL,41,1,'2023-11-10 16:48:39','2023-11-10 16:48:39','3220f6e8-93a4-437d-8241-4b2f83473b7b'),
	(19,5,44,NULL,41,1,'2023-11-10 16:48:40','2023-11-10 16:48:40','b51e91c8-b2b2-4c87-86a6-97355cee4610'),
	(20,5,47,NULL,14,1,'2023-11-10 17:03:14','2023-11-10 17:03:14','8b18b9e0-2e66-4e82-8c74-1e4838f66583'),
	(21,5,48,NULL,14,1,'2023-11-10 17:03:19','2023-11-10 17:03:19','107c56bd-2b47-4b98-a1b1-11d5afd89ca1'),
	(23,5,50,NULL,14,1,'2023-11-10 17:03:42','2023-11-10 17:03:42','6ed74af1-b701-4521-8490-31adb020da04'),
	(24,5,51,NULL,14,1,'2023-11-10 18:10:27','2023-11-10 18:10:27','2cb7eefe-74c9-43b3-8c6a-b7c76b4d0931'),
	(27,5,53,NULL,14,1,'2023-11-10 18:17:50','2023-11-10 18:17:50','b5a89c03-7c0e-4daa-85db-251b20588647'),
	(28,10,67,NULL,14,1,'2023-11-13 10:25:57','2023-11-13 10:25:57','f4c08f88-e2d1-4116-b813-f725465a01e2'),
	(29,10,69,NULL,14,1,'2023-11-13 10:26:01','2023-11-13 10:26:01','bf3c88c0-4ab9-4ff2-9808-e03e28579f19'),
	(30,10,71,NULL,14,1,'2023-11-13 10:26:03','2023-11-13 10:26:03','70a83f65-c843-4bcf-a33c-94aa238ca80a'),
	(31,10,73,NULL,14,1,'2023-11-13 10:26:08','2023-11-13 10:26:08','95807689-18bf-4fe3-8a71-c03ca8b26e36'),
	(32,10,75,NULL,14,1,'2023-11-13 10:26:14','2023-11-13 10:26:14','99d8c63d-79d7-4101-9626-376e0dd80dcf'),
	(33,10,77,NULL,14,1,'2023-11-13 10:26:15','2023-11-13 10:26:15','052bb0ab-5245-4428-befd-ceeabf43865a'),
	(34,10,80,NULL,14,1,'2023-11-13 10:26:21','2023-11-13 10:26:21','3ffa1989-e3ca-48c2-a7ca-a8656438d9dd'),
	(35,10,83,NULL,14,1,'2023-11-13 10:26:22','2023-11-13 10:26:22','d3e90325-6409-45ae-b645-97871a1f1964'),
	(36,10,86,NULL,14,1,'2023-11-13 10:26:24','2023-11-13 10:26:24','dba468d5-c991-4c5b-bbac-44e5b8093626'),
	(37,10,89,NULL,14,1,'2023-11-13 10:26:31','2023-11-13 10:26:31','002a8657-7e6b-4d58-a73c-f764888eec2c'),
	(38,10,92,NULL,14,1,'2023-11-13 10:26:32','2023-11-13 10:26:32','f09422f6-407b-4ce9-927c-ee9f179c4e87'),
	(39,10,95,NULL,14,1,'2023-11-13 10:26:53','2023-11-13 10:26:53','0c91e606-f434-4982-b0a6-e65adc62449c'),
	(40,10,99,NULL,14,1,'2023-11-13 10:26:58','2023-11-13 10:26:58','dbdc9cdb-3001-4f9c-ab67-000fa12eb95c'),
	(41,10,104,NULL,14,1,'2023-11-13 10:27:05','2023-11-13 10:27:05','0775fae5-4a23-4720-96dd-b4f02d91ff06'),
	(42,10,109,NULL,14,1,'2023-11-13 10:27:06','2023-11-13 10:27:06','b4e25400-6dd6-41ca-a2af-6cdc0100ecd6'),
	(43,10,114,NULL,14,1,'2023-11-13 10:27:13','2023-11-13 10:27:13','913077ef-e927-457e-ae15-2586eb292a67'),
	(44,10,119,NULL,14,1,'2023-11-13 10:27:16','2023-11-13 10:27:16','61e277c2-3c8f-4343-a6b6-2ba35f9f78d4'),
	(45,10,124,NULL,14,1,'2023-11-13 10:27:17','2023-11-13 10:27:17','8b222248-aafb-4e57-b77b-4ff255992aec'),
	(46,10,129,NULL,14,1,'2023-11-13 10:27:19','2023-11-13 10:27:19','6d8ac414-1d10-4a03-a477-d4fd8c79b55c'),
	(47,10,134,NULL,14,1,'2023-11-13 10:27:21','2023-11-13 10:27:21','db2fc162-715b-45d5-9a18-d61889a6376c'),
	(48,10,139,NULL,14,1,'2023-11-13 10:27:24','2023-11-13 10:27:24','e9788930-96ca-487f-9d0a-26d6f16608f3'),
	(49,10,144,NULL,14,1,'2023-11-13 10:27:26','2023-11-13 10:27:26','0b6b3614-8236-4e73-ae92-9147aef35649'),
	(50,10,150,NULL,14,1,'2023-11-13 10:27:29','2023-11-13 10:27:29','1f8a1cea-bb88-490b-a915-29471871f5c7'),
	(51,10,157,NULL,14,1,'2023-11-13 10:27:33','2023-11-13 10:27:33','a0642b5b-a3b7-44d1-abf2-02ffaec8d134'),
	(52,10,163,NULL,14,1,'2023-11-13 10:27:41','2023-11-13 10:27:41','b4564fb2-e2fa-4b44-bcfd-c98caccaede8'),
	(53,10,169,NULL,14,1,'2023-11-13 10:27:44','2023-11-13 10:27:44','1069124f-6231-434d-be32-ac5dc55ee1c7'),
	(54,10,175,NULL,14,1,'2023-11-13 10:27:45','2023-11-13 10:27:45','8641b0ee-f0e5-407f-aae3-68bb45deb744'),
	(55,10,181,NULL,14,1,'2023-11-13 10:27:50','2023-11-13 10:27:50','2dc0eb7c-4dff-4f4a-a775-fad97dfb3ae6'),
	(56,10,187,NULL,14,1,'2023-11-13 10:27:52','2023-11-13 10:27:52','5b8283ce-0440-42ee-b49b-7562f52a50d3'),
	(57,10,193,NULL,14,1,'2023-11-13 10:27:55','2023-11-13 10:27:55','903ec896-a6fe-411e-8c53-ba11c392c701'),
	(58,10,199,NULL,14,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','233453c2-57da-41e5-b01b-a0831a73de0f'),
	(59,10,205,NULL,14,1,'2023-11-13 10:27:56','2023-11-13 10:27:56','57809c29-2c0f-43c2-bc5d-c648fef4d75f'),
	(60,10,211,NULL,14,1,'2023-11-13 10:27:59','2023-11-13 10:27:59','ca61856b-3e4f-4450-ad5c-7e0db4f5f895'),
	(61,10,217,NULL,14,1,'2023-11-13 10:28:00','2023-11-13 10:28:00','21d72090-60fe-4a68-91a0-5d47533d984d'),
	(62,10,224,NULL,14,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','74c2285d-2fb5-4310-ac4f-712aee7e3e96'),
	(63,10,229,NULL,14,1,'2023-11-13 10:28:05','2023-11-13 10:28:05','786ebbde-d32d-40e0-a704-aba1ab0a5dbf'),
	(64,10,231,NULL,14,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','c91092c4-7e07-4866-9696-b08fec0674c6'),
	(65,10,236,NULL,14,1,'2023-11-13 10:28:13','2023-11-13 10:28:13','9116a6ba-8099-4337-bb95-79062aab26db'),
	(66,10,238,NULL,14,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','fec3355f-fbe6-4516-9258-56fd50b3252c'),
	(67,10,243,NULL,14,1,'2023-11-13 10:28:16','2023-11-13 10:28:16','fa9c4e85-c821-4852-a834-cde0b03abe46'),
	(68,10,246,NULL,14,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','d5f20925-2c11-46d8-9401-99300bc45590'),
	(69,10,251,NULL,14,1,'2023-11-13 10:28:19','2023-11-13 10:28:19','587b8913-18f9-4888-b127-e3833bf6a07a'),
	(70,10,254,NULL,14,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','cabbd5fd-9d93-4e5a-881d-911ed897ba6f'),
	(71,10,259,NULL,14,1,'2023-11-13 10:28:22','2023-11-13 10:28:22','5a090172-7d90-44ac-987e-6659b3d37c4c'),
	(72,10,262,NULL,14,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','e8859838-19b9-4209-86fb-1ec92fbf620b'),
	(73,10,267,NULL,14,1,'2023-11-13 10:28:24','2023-11-13 10:28:24','c8cd4cdd-ba25-4e56-876c-ca70651c6d97'),
	(74,10,270,NULL,14,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','b04f258d-e2b5-4f53-85dc-5f8eec1869d8'),
	(75,10,275,NULL,14,1,'2023-11-13 10:28:26','2023-11-13 10:28:26','2feb2407-305f-4fbc-abfa-6f2a4134aa46'),
	(76,10,278,NULL,14,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','6bda9d64-8de1-460c-856c-3afe51d2c4fa'),
	(77,10,283,NULL,14,1,'2023-11-13 10:28:29','2023-11-13 10:28:29','78b2512e-39b2-4d6c-8a38-73d141880466'),
	(78,10,286,NULL,14,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','8c6aea88-cb1f-4e42-bde0-48b96aa6bf8a'),
	(79,10,291,NULL,14,1,'2023-11-13 10:28:32','2023-11-13 10:28:32','4c8e4aff-8afa-484c-83ab-e7e4d6c86c52'),
	(80,10,294,NULL,14,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','42d5605a-3707-491b-8f2c-8c7b9aa7e513'),
	(81,10,299,NULL,14,1,'2023-11-13 10:28:33','2023-11-13 10:28:33','09a7ccfc-1e7b-492b-898c-6cde69b112e3'),
	(82,10,302,NULL,14,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','d1434c5f-fec5-47de-afda-420a48c5d7e9'),
	(83,10,307,NULL,14,1,'2023-11-13 10:28:34','2023-11-13 10:28:34','2b3ebad4-03a8-4ff4-a610-cf1d819cde1a'),
	(84,10,310,NULL,14,1,'2023-11-13 10:28:37','2023-11-13 10:28:37','69720b9c-6801-41f6-ab59-ef216dfc2838'),
	(85,10,315,NULL,14,1,'2023-11-13 10:28:37','2023-11-13 10:28:37','8226fe7d-009e-46e9-aeee-c67e63148047'),
	(86,10,319,NULL,14,1,'2023-11-13 10:28:39','2023-11-13 10:28:39','6a97f626-d032-4737-acd0-d09a39e13721'),
	(87,10,324,NULL,14,1,'2023-11-13 10:28:39','2023-11-13 10:28:39','a339799d-0b2a-43bd-9565-cf51aeaf90d6'),
	(89,17,60,NULL,326,1,'2023-11-13 11:22:39','2023-11-13 11:22:39','0b175bef-59f1-4f55-8ea6-09ee9fca943f'),
	(90,17,328,NULL,326,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','ef313217-fb6f-4de9-ac04-919c2424f74d'),
	(91,10,330,NULL,14,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','3809415c-bfb6-41d3-b666-e23cf9408459'),
	(92,10,335,NULL,14,1,'2023-11-13 11:22:40','2023-11-13 11:22:40','182a875c-f60d-4a21-b3eb-8a88b851eefe'),
	(97,17,43,NULL,338,1,'2023-11-13 14:45:29','2023-11-13 14:45:29','f3beda41-34e6-4338-9176-9ea85c3f609f'),
	(98,17,341,NULL,338,1,'2023-11-13 14:45:29','2023-11-13 14:45:29','e25b5a92-be3b-4529-99fd-9cc2d4efafaa'),
	(99,5,341,NULL,41,1,'2023-11-13 14:45:29','2023-11-13 14:45:29','0be41eff-0425-4ab2-948e-4ce3ad0d3133'),
	(102,17,18,NULL,339,1,'2023-11-13 14:45:35','2023-11-13 14:45:35','0f852f10-a02d-4874-a598-52eac829741b'),
	(103,17,343,NULL,339,1,'2023-11-13 14:45:35','2023-11-13 14:45:35','24587efe-fedc-4659-97ab-353f4a11ba78'),
	(104,5,343,NULL,17,1,'2023-11-13 14:45:35','2023-11-13 14:45:35','1766bb9f-31a9-48a0-9145-4da0a1e236a1'),
	(105,17,6,NULL,326,1,'2023-11-13 14:45:38','2023-11-13 14:45:38','9a7c1dff-a880-4823-9b9f-e84180a47041'),
	(106,17,344,NULL,326,1,'2023-11-13 14:45:38','2023-11-13 14:45:38','2025468f-0364-4b1e-b22b-51f602993b92'),
	(107,5,344,NULL,14,1,'2023-11-13 14:45:38','2023-11-13 14:45:38','81685a9a-e4d4-4c07-94b8-e41badef0de9'),
	(109,17,347,NULL,326,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','72c5b18d-699d-48ac-8ba1-252f44075da3'),
	(110,10,349,NULL,14,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','b6dce995-29cf-40ac-a0a1-cdb2cdf53bc6'),
	(111,10,354,NULL,14,1,'2023-11-13 14:48:33','2023-11-13 14:48:33','b210da4a-504c-4d36-96b1-5317980be133'),
	(112,17,356,NULL,326,1,'2023-11-13 14:49:38','2023-11-13 14:49:38','f613bbe8-a115-435a-bfcc-df653c66a3b4'),
	(113,17,356,NULL,339,2,'2023-11-13 14:49:38','2023-11-13 14:49:38','0385bbe3-0f20-4479-857a-632a66b8e815'),
	(114,5,356,NULL,17,1,'2023-11-13 14:50:04','2023-11-13 14:50:04','f78dd601-5c07-4ee7-89b9-d7cac91e9af3'),
	(115,17,357,NULL,326,1,'2023-11-13 14:50:05','2023-11-13 14:50:05','5e202cd9-5a47-4be2-859a-de3637c00727'),
	(116,17,357,NULL,339,2,'2023-11-13 14:50:05','2023-11-13 14:50:05','aa67b6cf-81e0-4c99-b1f0-95033566a08c'),
	(117,5,357,NULL,17,1,'2023-11-13 14:50:05','2023-11-13 14:50:05','c8003a07-a7d2-4605-bfb1-e77bc368e5f8'),
	(118,17,358,NULL,339,1,'2023-11-13 16:17:16','2023-11-13 16:17:16','24906161-72f9-4ec0-844c-57c17bc0aaf4'),
	(119,17,359,NULL,339,1,'2023-11-13 16:17:19','2023-11-13 16:17:19','05f4f07a-ced1-4876-aa89-3a3296e324e2'),
	(120,17,360,NULL,338,1,'2023-11-13 16:17:33','2023-11-13 16:17:33','e64eae8f-4486-458d-8dc8-c29d3a365c73'),
	(121,17,361,NULL,338,1,'2023-11-13 16:17:35','2023-11-13 16:17:35','5c6ddbce-749a-4b98-a918-c58935ffb121'),
	(126,18,356,NULL,358,1,'2023-11-13 16:17:42','2023-11-13 16:17:42','ce96394e-c9e6-4e8f-8f1d-08247bb41f5c'),
	(127,17,363,NULL,326,1,'2023-11-13 16:17:42','2023-11-13 16:17:42','016d78b9-4f50-4a09-804f-906201097c7b'),
	(128,17,363,NULL,339,2,'2023-11-13 16:17:42','2023-11-13 16:17:42','226304d6-422e-4d28-8f94-3805432feff7'),
	(129,5,363,NULL,17,1,'2023-11-13 16:17:42','2023-11-13 16:17:42','09b672ea-b7b2-4078-8dc5-3223a45b5ba0'),
	(130,18,363,NULL,358,1,'2023-11-13 16:17:42','2023-11-13 16:17:42','7a11edc9-506d-4999-9458-86b575e8003d'),
	(134,18,43,NULL,360,1,'2023-11-13 16:17:53','2023-11-13 16:17:53','54ec8c80-d6ac-4b4d-aac2-7485f1a82d4e'),
	(135,17,365,NULL,338,1,'2023-11-13 16:17:53','2023-11-13 16:17:53','4d394d6c-6020-41f7-9c0b-238240a7d7e0'),
	(136,5,365,NULL,41,1,'2023-11-13 16:17:53','2023-11-13 16:17:53','67733a55-31cc-46b2-bb58-3423238f0401'),
	(137,18,365,NULL,360,1,'2023-11-13 16:17:53','2023-11-13 16:17:53','720ca6f5-3c87-4c16-8b65-e0990bb23a94'),
	(141,18,6,NULL,60,1,'2023-11-13 16:18:13','2023-11-13 16:18:13','11c96acf-8f13-496a-982a-ed3db832c42a'),
	(142,17,367,NULL,326,1,'2023-11-13 16:18:13','2023-11-13 16:18:13','db8246b7-afd1-49af-92a5-e6e2f40bacc6'),
	(143,5,367,NULL,14,1,'2023-11-13 16:18:13','2023-11-13 16:18:13','2ec59796-581c-4376-a441-15554e40aec5'),
	(144,18,367,NULL,60,1,'2023-11-13 16:18:13','2023-11-13 16:18:13','d76173eb-2845-4cd8-b6ce-7e87e39ae53f'),
	(148,18,18,NULL,358,1,'2023-11-13 16:18:26','2023-11-13 16:18:26','0799e53f-cb2c-4aa9-ab17-8710186780a8'),
	(149,17,369,NULL,339,1,'2023-11-13 16:18:26','2023-11-13 16:18:26','7df91053-fa16-4607-930e-87e318aad5a6'),
	(150,5,369,NULL,17,1,'2023-11-13 16:18:26','2023-11-13 16:18:26','160c3170-a457-49be-a6bc-ce62ff8b0a5b'),
	(151,18,369,NULL,358,1,'2023-11-13 16:18:26','2023-11-13 16:18:26','1c1b1688-01f1-496f-8645-9c2bd97b0b6e'),
	(152,17,370,NULL,326,1,'2023-11-13 16:18:31','2023-11-13 16:18:31','c773779b-9028-4cc5-9b1c-45e63d00efee'),
	(153,17,370,NULL,339,2,'2023-11-13 16:18:31','2023-11-13 16:18:31','943311a6-6cec-44a0-ab59-3a83fcdc91f7'),
	(154,5,370,NULL,17,1,'2023-11-13 16:18:31','2023-11-13 16:18:31','d89a13d1-d51c-441f-80ac-b127418b60d8'),
	(155,18,370,NULL,358,1,'2023-11-13 16:18:31','2023-11-13 16:18:31','7bdea8c9-73aa-4ec7-9dc7-4799235c4ad1');

/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_resourcepaths
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_resourcepaths`;

CREATE TABLE `craft_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_resourcepaths` WRITE;
/*!40000 ALTER TABLE `craft_resourcepaths` DISABLE KEYS */;

INSERT INTO `craft_resourcepaths` (`hash`, `path`)
VALUES
	('1086baca','@craft/web/assets/d3/dist'),
	('10cd4512','@craft/web/assets/updateswidget/dist'),
	('110cfd9b','@craft/web/assets/timepicker/dist'),
	('14d31e4c','@craft/web/assets/cp/dist'),
	('15c6b027','@craft/web/assets/xregexp/dist'),
	('17a267e3','@craft/web/assets/craftsupport/dist'),
	('189bbc04','@craft/web/assets/selectize/dist'),
	('1987b0ea','@craft/web/assets/garnish/dist'),
	('19e21149','@craft/web/assets/generalsettings/dist'),
	('1be7b37d','@craft/web/assets/iframeresizer/dist'),
	('1d8e664b','@craft/web/assets/fieldsettings/dist'),
	('1e7e0d27','@craft/web/assets/picturefill/dist'),
	('1ee84e9','@craft/web/assets/tailwindreset/dist'),
	('1f8e0626','@craft/web/assets/tailwindreset/dist'),
	('211f11c3','@craft/web/assets/utilities/dist'),
	('2225d7f9','@craft/web/assets/jquerypayment/dist'),
	('2276089b','@craft/web/assets/jquerytouchevents/dist'),
	('27b2d54e','@craft/web/assets/velocity/dist'),
	('27b44123','@craft/web/assets/updater/dist'),
	('28b75aa7','@craft/web/assets/feed/dist'),
	('28e210ea','@craft/web/assets/axios/dist'),
	('2e77077c','@craft/web/assets/recententries/dist'),
	('313587fd','@craft/web/assets/fabric/dist'),
	('3390ede7','@craft/web/assets/conditionbuilder/dist'),
	('33cafd4a','@craft/web/assets/editsection/dist'),
	('36829225','@craft/web/assets/axios/dist'),
	('36b22b2f','@yii/debug/assets'),
	('3c8acfe','@craft/web/assets/pluginstore/dist'),
	('3eee484','@craft/web/assets/fieldsettings/dist'),
	('406b3277','@craft/web/assets/fabric/dist'),
	('4522fee3','@craft/web/assets/htmx/dist'),
	('47dc27af','@craft/web/assets/axios/dist'),
	('4af37f1f','@craft/web/assets/edituser/dist'),
	('4e212686','@craft/web/assets/utilities/dist'),
	('4e3e9f00','@craft/web/assets/matrixsettings/dist'),
	('4e99366a','@craft/web/assets/sites/dist'),
	('5041a449','@craft/web/assets/utilities/dist'),
	('51f47c6c','@craft/web/assets/dashboard/dist'),
	('58731b2','@craft/web/assets/iframeresizer/dist'),
	('5e0bb0b8','@craft/web/assets/fabric/dist'),
	('60173a8c','@craft/web/assets/fileupload/dist'),
	('6193f098','@craft/web/assets/updateswidget/dist'),
	('61d80f40','@craft/web/assets/d3/dist'),
	('6825233a','@craft/web/assets/updates/dist'),
	('68d90560','@craft/web/assets/garnish/dist'),
	('6ab906f7','@craft/web/assets/iframeresizer/dist'),
	('6cd0d3c1','@craft/web/assets/fieldsettings/dist'),
	('6fb3ecb','@craft/web/assets/selectize/dist'),
	('70b03163','@craft/web/assets/tailwindreset/dist'),
	('716b63d9','@craft/web/assets/elementresizedetector/dist'),
	('72961974','@craft/web/assets/pluginstore/dist'),
	('748b7c31','@bower/jquery/dist'),
	('76b987af','@craft/web/assets/garnish/dist'),
	('77a58b41','@craft/web/assets/selectize/dist'),
	('7bed2909','@craft/web/assets/cp/dist'),
	('7cfc755','@craft/web/assets/installer/dist'),
	('7e6cec27','@craft/web/assets/jqueryui/dist'),
	('80691d1e','@craft/web/assets/dashboard/dist'),
	('809f315','@craft/web/assets/admintable/dist'),
	('82b5dc63','@craft/web/assets/jquerytouchevents/dist'),
	('82e60301','@craft/web/assets/jquerypayment/dist'),
	('877101b6','@craft/web/assets/velocity/dist'),
	('88748e5f','@craft/web/assets/feed/dist'),
	('8d33bbd0','@craft/web/assets/conditionbuilder/dist'),
	('8d69ab7d','@craft/web/assets/editsection/dist'),
	('930929b2','@craft/web/assets/editsection/dist'),
	('9351d9ed','@craft/web/assets/vue/dist'),
	('96140c90','@craft/web/assets/feed/dist'),
	('961bef2b','@craft/web/assets/edittransform/dist'),
	('964146dd','@craft/web/assets/axios/dist'),
	('99118379','@craft/web/assets/velocity/dist'),
	('9c8681ce','@craft/web/assets/jquerypayment/dist'),
	('9cd55eac','@craft/web/assets/jquerytouchevents/dist'),
	('a0dd5b10','@craft/web/assets/picturefill/dist'),
	('a0f602ab','@craft/web/assets/elementresizedetector/dist'),
	('a12d5011','@craft/web/assets/tailwindreset/dist'),
	('a5161d43','@bower/jquery/dist'),
	('a638ea33','@craft/web/assets/selectize/dist'),
	('a90131d4','@craft/web/assets/craftsupport/dist'),
	('aa70487b','@craft/web/assets/cp/dist'),
	('ab39c83','@craft/web/assets/cp/dist'),
	('ab65e610','@craft/web/assets/xregexp/dist'),
	('aff18d55','@craft/web/assets/jqueryui/dist'),
	('b00e91ea','@craft/web/assets/updateswidget/dist'),
	('b0456e32','@craft/web/assets/d3/dist'),
	('b18a5bfe','@craft/web/assets/fileupload/dist'),
	('b50564df','@craft/web/assets/xregexp/dist'),
	('b761b31b','@craft/web/assets/craftsupport/dist'),
	('b921c5b1','@craft/web/assets/generalsettings/dist'),
	('b9b84248','@craft/web/assets/updates/dist'),
	('bb246785','@craft/web/assets/iframeresizer/dist'),
	('bd4db2b3','@craft/web/assets/fieldsettings/dist'),
	('bebdd9df','@craft/web/assets/picturefill/dist'),
	('c0cfba10','@craft/web/assets/jqueryui/dist'),
	('c0d4ee74','@craft/web/assets/fileupload/dist'),
	('c45bd155','@craft/web/assets/xregexp/dist'),
	('c63f0691','@craft/web/assets/craftsupport/dist'),
	('c81ad198','@craft/web/assets/garnish/dist'),
	('c8e6f7c2','@craft/web/assets/updates/dist'),
	('ca282a06','@bower/jquery/dist'),
	('cb5ccd1d','@craft/web/assets/prismjs/dist'),
	('cfc835ee','@craft/web/assets/elementresizedetector/dist'),
	('cfe36c55','@craft/web/assets/picturefill/dist'),
	('d1a8b721','@craft/web/assets/elementresizedetector/dist'),
	('d448a8c9','@bower/jquery/dist'),
	('d686750d','@craft/web/assets/updates/dist'),
	('dc2dec23','@craft/web/assets/focalpoint/dist'),
	('deaf38df','@craft/web/assets/jqueryui/dist'),
	('deb46cbb','@craft/web/assets/fileupload/dist'),
	('e0a8e68f','@craft/web/assets/fabric/dist'),
	('e20f6c67','@craft/web/assets/vue/dist'),
	('e2579c38','@craft/web/assets/editsection/dist'),
	('ea30abe7','@craft/web/assets/edituser/dist'),
	('eadc7dd','@craft/web/assets/updateswidget/dist'),
	('ee63805','@craft/web/assets/d3/dist'),
	('eefbf506','@vendor/yiisoft/yii2/assets'),
	('ef572a5b','@craft/web/assets/dashboard/dist'),
	('f08270b1','@craft/web/assets/utilities/dist'),
	('f137a894','@craft/web/assets/dashboard/dist'),
	('f3b8b68b','@craft/web/assets/jquerypayment/dist'),
	('f3eb69e9','@craft/web/assets/jquerytouchevents/dist'),
	('f62fb43c','@craft/web/assets/velocity/dist'),
	('f8a8d8c7','@craft/web/assets/tablesettings/dist'),
	('f92a3bd5','@craft/web/assets/feed/dist'),
	('fb81a8d4','@craft/web/assets/htmx/dist');

/*!40000 ALTER TABLE `craft_resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_revisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_revisions`;

CREATE TABLE `craft_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_xemzcmkcvscfqshkccckhwryggohrqfgwqoo` (`canonicalId`,`num`),
  KEY `craft_fk_egkstojrcnxmpanowjzbbnnmvhgwbzxbcieh` (`creatorId`),
  CONSTRAINT `craft_fk_ccinttvhkhhvlncfzujldewpjjjodrdstmtu` FOREIGN KEY (`canonicalId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_egkstojrcnxmpanowjzbbnnmvhgwbzxbcieh` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_revisions` WRITE;
/*!40000 ALTER TABLE `craft_revisions` DISABLE KEYS */;

INSERT INTO `craft_revisions` (`id`, `canonicalId`, `creatorId`, `num`, `notes`)
VALUES
	(1,2,1,1,''),
	(2,6,1,1,''),
	(3,8,1,1,''),
	(4,10,1,1,NULL),
	(5,10,1,2,NULL),
	(6,10,1,3,NULL),
	(7,6,1,2,'Applied “Draft 1”'),
	(8,18,1,1,''),
	(9,18,1,2,''),
	(10,21,1,1,''),
	(11,23,1,1,''),
	(12,25,1,1,''),
	(13,27,1,1,''),
	(14,21,1,2,'Applied “Draft 1”'),
	(15,10,1,4,NULL),
	(16,10,1,5,'Applied “Draft 1”'),
	(17,18,1,3,'Applied “Draft 1”'),
	(18,6,1,3,'Applied “Draft 1”'),
	(19,6,1,4,'Applied “Draft 1”'),
	(20,43,1,1,''),
	(21,45,1,1,''),
	(22,6,1,5,''),
	(23,6,1,6,''),
	(24,6,1,7,'Applied “Draft 1”'),
	(25,6,1,8,''),
	(26,6,1,9,'Applied “Draft 1”'),
	(27,45,1,2,'Applied “Draft 1”'),
	(28,21,1,3,'Applied “Draft 1”'),
	(29,25,1,2,'Applied “Draft 1”'),
	(30,60,1,1,''),
	(31,309,1,1,NULL),
	(32,310,1,1,NULL),
	(33,311,1,1,NULL),
	(34,312,1,1,NULL),
	(35,313,1,1,NULL),
	(36,314,1,1,NULL),
	(37,315,1,1,NULL),
	(38,316,1,1,NULL),
	(39,60,1,2,'Applied “Draft 1”'),
	(40,309,1,2,NULL),
	(41,310,1,2,NULL),
	(42,311,1,2,NULL),
	(43,312,1,2,NULL),
	(44,313,1,2,NULL),
	(45,314,1,2,NULL),
	(46,315,1,2,NULL),
	(47,316,1,2,NULL),
	(48,43,1,2,'Applied “Draft 1”'),
	(49,18,1,4,'Applied “Draft 1”'),
	(50,6,1,10,'Applied “Draft 1”'),
	(51,60,1,3,'Applied “Draft 1”'),
	(52,309,1,3,NULL),
	(53,310,1,3,NULL),
	(54,311,1,3,NULL),
	(55,312,1,3,NULL),
	(56,313,1,3,NULL),
	(57,314,1,3,NULL),
	(58,315,1,3,NULL),
	(59,316,1,3,NULL),
	(60,356,1,1,''),
	(61,358,1,1,''),
	(62,360,1,1,''),
	(63,356,1,2,'Applied “Draft 1”'),
	(64,43,1,3,'Applied “Draft 1”'),
	(65,6,1,11,'Applied “Draft 1”'),
	(66,18,1,5,'Applied “Draft 1”'),
	(67,356,1,3,'');

/*!40000 ALTER TABLE `craft_revisions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_searchindex`;

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `craft_idx_bcmusljshjmiooayrwojqlefzvjtbydnakdp` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`)
VALUES
	(1,'email',0,1,' bauerindustries icloud com '),
	(1,'firstname',0,1,' chris '),
	(1,'fullname',0,1,' chris bauer '),
	(1,'lastname',0,1,' bauer '),
	(1,'slug',0,1,''),
	(1,'username',0,1,' admin '),
	(2,'slug',0,1,' hello world '),
	(2,'title',0,1,' hello world '),
	(4,'slug',0,1,' temp rcaqdaxgtmszpawzbbydnahyxwkknpxluccr '),
	(4,'title',0,1,''),
	(5,'slug',0,1,' temp kmdklxjxqnvkpiotdvlsymylcfuhwymrsgug '),
	(5,'title',0,1,''),
	(6,'field',2,1,' lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit '),
	(6,'field',18,1,' perfect espresso '),
	(6,'slug',0,1,' espresso '),
	(6,'title',0,1,' perfect espresso '),
	(8,'slug',0,1,' new coffee coming soon '),
	(8,'title',0,1,' new coffee coming soon '),
	(10,'slug',0,1,' homepage '),
	(10,'title',0,1,' crafty coffee '),
	(14,'alt',0,1,''),
	(14,'extension',0,1,' jpg '),
	(14,'filename',0,1,' espresso shot jpg '),
	(14,'kind',0,1,' image '),
	(14,'slug',0,1,''),
	(14,'title',0,1,' espresso shot '),
	(17,'alt',0,1,''),
	(17,'extension',0,1,' jpg '),
	(17,'filename',0,1,' iced coffee jpg '),
	(17,'kind',0,1,' image '),
	(17,'slug',0,1,''),
	(17,'title',0,1,' iced coffee '),
	(18,'field',2,1,' page copy placeholder '),
	(18,'field',18,1,' iced coffee recipe '),
	(18,'slug',0,1,' iced coffee '),
	(18,'title',0,1,' iced coffee '),
	(21,'field',2,1,' lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit '),
	(21,'slug',0,1,' about '),
	(21,'title',0,1,' about '),
	(23,'slug',0,1,' locations '),
	(23,'title',0,1,' locations '),
	(25,'field',2,1,' lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit '),
	(25,'slug',0,1,' austin tx '),
	(25,'title',0,1,' austin tx '),
	(27,'slug',0,1,' mission statement '),
	(27,'title',0,1,' mission statement '),
	(37,'alt',0,1,''),
	(37,'extension',0,1,' jpg '),
	(37,'filename',0,1,' iced coffee 2023 11 10 164736 utyw jpg '),
	(37,'kind',0,1,' image '),
	(37,'slug',0,1,''),
	(37,'title',0,1,' iced coffee '),
	(40,'alt',0,1,''),
	(40,'extension',0,1,' jpg '),
	(40,'filename',0,1,' espresso shot 2023 11 10 164759 njib jpg '),
	(40,'kind',0,1,' image '),
	(40,'slug',0,1,''),
	(40,'title',0,1,' espresso shot '),
	(41,'alt',0,1,''),
	(41,'extension',0,1,' jpg '),
	(41,'filename',0,1,' chemex jpg '),
	(41,'kind',0,1,' image '),
	(41,'slug',0,1,''),
	(41,'title',0,1,' chemex '),
	(43,'field',2,1,' lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit lorem ipsum dolor sit amet consectetur adipisicing elit animi aspernatur deleniti dignissimos est explicabo iure laborum minima natus nihil qui repudiandae velit voluptatum animi id illo illum in maiores velit '),
	(43,'field',18,1,' chemex '),
	(43,'slug',0,1,' chemex '),
	(43,'title',0,1,' chemex '),
	(45,'slug',0,1,' another news story '),
	(45,'title',0,1,' another news story '),
	(60,'slug',0,1,' perfect espresso '),
	(60,'title',0,1,' perfect espresso '),
	(309,'slug',0,1,''),
	(310,'slug',0,1,''),
	(311,'slug',0,1,''),
	(312,'slug',0,1,''),
	(313,'slug',0,1,''),
	(314,'slug',0,1,''),
	(315,'slug',0,1,''),
	(316,'slug',0,1,''),
	(326,'slug',0,1,' espresso '),
	(326,'title',0,1,' espresso '),
	(338,'slug',0,1,' drip coffee '),
	(338,'title',0,1,' drip coffee '),
	(339,'slug',0,1,' iced coffee '),
	(339,'title',0,1,' iced coffee '),
	(356,'field',2,1,' cold as you like and perky with it '),
	(356,'field',18,1,' iced coffee recipe '),
	(356,'slug',0,1,' iced amerciano '),
	(356,'title',0,1,' iced amerciano '),
	(358,'slug',0,1,' iced coffee recipe '),
	(358,'title',0,1,' iced coffee recipe '),
	(360,'slug',0,1,' chemex '),
	(360,'title',0,1,' chemex ');

/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections`;

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_oosfnehztldaleptfqahcuqdjlzzajkdwjpr` (`handle`),
  KEY `craft_idx_kdztoriyspsrcoyfqgcenxqtotdbpdsgnull` (`name`),
  KEY `craft_idx_qiyexrfvlxrvgvgqrdjqfzyadvyfhmsxosfo` (`structureId`),
  KEY `craft_idx_qekbfrkixtfdioftqvkkjjbbxwwsyszticbr` (`dateDeleted`),
  CONSTRAINT `craft_fk_menmmwtbhlowlftduwmxsxaoypkrkbpxjume` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,'Homepage','homepage','structure',1,'all','end',NULL,'2023-06-28 21:19:00','2023-06-28 21:19:00','2023-06-28 21:26:48','8587a272-df2b-404d-be8c-1ad5f4842456'),
	(2,NULL,'Drinks','drinks','channel',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-07-07 21:53:57','2023-07-07 21:53:57',NULL,'d067198d-0272-4232-b2b6-778b2c6a7b10'),
	(3,NULL,'News','news','channel',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-07-08 07:03:05','2023-07-08 07:03:05',NULL,'d35a6ed0-f1a6-4189-a205-ed008cb9e034'),
	(4,NULL,'Homepage','homepage','single',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-07-22 07:33:23','2023-07-22 07:33:23',NULL,'18d9a6c5-f2cc-4518-a7d0-0254317ec34c'),
	(5,2,'About Crafty Coffee','aboutCraftyCoffee','structure',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-11-10 12:48:56','2023-11-10 12:48:56',NULL,'f1ff2a0a-7a84-43df-addb-8762c79a4f9f'),
	(6,NULL,'Recipes','recipes','channel',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-11-13 10:19:04','2023-11-13 10:19:04',NULL,'783b5a78-d3c7-4b2e-9fea-0459bc803fe0');

/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sections_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections_sites`;

CREATE TABLE `craft_sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_kmozumayciretxtjqngphcurbfcrvnuynflx` (`sectionId`,`siteId`),
  KEY `craft_idx_ogtyyferqqdmdvqufvuivpmqlfhsyrjyjaqi` (`siteId`),
  CONSTRAINT `craft_fk_cyzjjirahqzucjauhzpjbupqgyvigrcfyhgd` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_qoltkjxmzxbbetcldfifhrxgwufcwhjchaxg` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_sections_sites` WRITE;
/*!40000 ALTER TABLE `craft_sections_sites` DISABLE KEYS */;

INSERT INTO `craft_sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,'{slug}','_entry',1,'2023-06-28 21:19:00','2023-06-28 21:19:00','c4231c9b-21f5-40f0-9857-b15dfb7c3527'),
	(2,2,1,1,'drinks/{slug}','drinks/_entry',1,'2023-07-07 21:53:57','2023-07-07 21:53:57','e9995474-d261-4df2-8fd8-1c8f28e4b4cc'),
	(3,3,1,1,'news/{slug}','news/_entry',1,'2023-07-08 07:03:05','2023-07-08 07:03:05','fe6b44c6-0d28-40f5-9360-98c6b05e58b9'),
	(4,4,1,1,'__home__','index',1,'2023-07-22 07:33:23','2023-07-22 07:33:23','badead11-0efd-43cd-90b8-d0f3305bffb8'),
	(5,5,1,1,'{parent.uri}/{slug}','about/_entry',1,'2023-11-10 12:48:56','2023-11-10 13:37:57','3b360b05-ccab-4934-9fc5-e3cf94f0a154'),
	(6,6,1,1,'recipes/{slug}','recipes/_entry.twig',1,'2023-11-13 10:19:04','2023-11-13 10:32:31','08065f9c-f27d-4428-82a7-75ba78b21b4c');

/*!40000 ALTER TABLE `craft_sections_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sequences`;

CREATE TABLE `craft_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sessions`;

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_phvypeewhoaogwmyxkqjestgannroiabtqmy` (`uid`),
  KEY `craft_idx_rsgururdizvmradggyaadpzwnxdyoxuhlnoc` (`token`),
  KEY `craft_idx_jwqqeunnzxbwtwqnlrigxekptcwtbcxmvlzo` (`dateUpdated`),
  KEY `craft_idx_lpbwwppnaqpafssbtlqmmdlvsgcytfggntai` (`userId`),
  CONSTRAINT `craft_fk_sigermeeuustofixdndezcapftdhhlgukumb` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'pxhB1prq1-delwX8fkx4ri-tcbbytpPHsnJ51f-oZQ2Xxe0q2OSrTiCRkabQ6ZrAyjyel2_Laur04-PqjGWcQA5Mmr795WM9k4Bd','2023-06-24 06:09:05','2023-06-24 06:57:32','9b70c4cd-adcf-409e-84b6-7e59742640bd'),
	(2,1,'UDzSsejWnR1FNcWJ8V-HlqloJZLBYuU2aiygPNjRYuROoXbwPiQluMzR60s_IECVD2vpmg3m-7cKuA0R4Kn3GJCl-fuViH7ZjDol','2023-07-23 07:20:44','2023-07-23 07:30:46','2b06caee-8ec3-48a0-8c5e-bdf2bc52b9b6'),
	(9,1,'QJkR787KRbZ_PslMEmTYOKTpmFlFmpHGsdXdxeRsKIJff10xPNFyJK8POFCvAM9ejYrxveWH0hi0HkEsnasQTmyO90RQYK1Vxmsh','2023-11-13 16:06:19','2023-11-13 16:35:33','b8a48cfe-e332-439a-ab6b-352d4faddd39');

/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_shunnedmessages`;

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_pdjjcwhaoizjrmdptirixyltuqkkbpdjnfpt` (`userId`,`message`),
  CONSTRAINT `craft_fk_rrpcfwealqpndhpnkxyvayzbgpfgbzispndc` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_sitegroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sitegroups`;

CREATE TABLE `craft_sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_hdyiuoewhoozdgbbckqhxofcdaiskpkokwvy` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_sitegroups` WRITE;
/*!40000 ALTER TABLE `craft_sitegroups` DISABLE KEYS */;

INSERT INTO `craft_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'crafty coffee','2023-06-23 21:48:48','2023-06-23 21:48:48',NULL,'25dcf5ff-387f-4f58-b014-15685772b51f');

/*!40000 ALTER TABLE `craft_sitegroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sites`;

CREATE TABLE `craft_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_ekldgbapekyxitgnryeupkwkyyjgebavjygp` (`dateDeleted`),
  KEY `craft_idx_gxvbtrhdrysjibevjlaxyidpqxyzcnovcqgg` (`handle`),
  KEY `craft_idx_xmclrvpuxershfnpzfotwxsotsszegiegfmh` (`sortOrder`),
  KEY `craft_fk_ovwmmumrvyydqnqdtkigipllrdewkddsihqf` (`groupId`),
  CONSTRAINT `craft_fk_ovwmmumrvyydqnqdtkigipllrdewkddsihqf` FOREIGN KEY (`groupId`) REFERENCES `craft_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_sites` WRITE;
/*!40000 ALTER TABLE `craft_sites` DISABLE KEYS */;

INSERT INTO `craft_sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,'true','crafty coffee','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-06-23 21:48:48','2023-06-23 21:48:48',NULL,'684353c1-0d73-43a1-913e-6d34bbadfea9');

/*!40000 ALTER TABLE `craft_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_structureelements`;

CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_otvxkqhkbubkqyareszedyzgnujcfwliffis` (`structureId`,`elementId`),
  KEY `craft_idx_drrjrvftsfzsehbqnubygqtwkwylsdundvuk` (`root`),
  KEY `craft_idx_jsckpjpjwvlyfasrlwyrqjjcmrqzlomqykie` (`lft`),
  KEY `craft_idx_nocxdekawcjprkdjbrgfqezlrqghzpcysamb` (`rgt`),
  KEY `craft_idx_rahzybkpuhszclwwwwjffxbkqifgatywbweq` (`level`),
  KEY `craft_idx_kbbqgdgdxfjelvjvssillwmfckyggfhzfcie` (`elementId`),
  CONSTRAINT `craft_fk_tejrvqnkrdidxnbfrfeqaqbbwgzigyxpeijc` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;

INSERT INTO `craft_structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,NULL,1,1,4,0,'2023-06-28 21:19:50','2023-06-28 21:19:50','ef4ee8f2-43c5-4a82-b97e-6c61096fd93f'),
	(2,1,2,1,2,3,1,'2023-06-28 21:19:50','2023-06-28 21:19:50','33566ead-d499-480a-908a-2bc0374ec879'),
	(3,2,NULL,3,1,10,0,'2023-11-10 12:50:04','2023-11-10 12:51:23','75c643d2-3f92-413d-b825-eb5c3ac977e3'),
	(4,2,21,3,2,9,1,'2023-11-10 12:50:04','2023-11-10 12:51:23','cacf6ffe-ba6e-48fb-8113-eb3090e7ac59'),
	(5,2,23,3,3,6,2,'2023-11-10 12:50:24','2023-11-10 12:50:49','6b8e8731-f904-41a9-ae6b-db0ea635c362'),
	(6,2,25,3,4,5,3,'2023-11-10 12:50:39','2023-11-10 12:50:49','d25109f5-ff69-43c1-b9e9-fed407e9107d'),
	(7,2,27,3,7,8,2,'2023-11-10 12:51:09','2023-11-10 12:51:23','f3f91930-8947-426a-883a-fca3ee48f641'),
	(8,3,NULL,8,1,8,0,'2023-11-13 11:20:33','2023-11-13 14:45:04','f953ead1-6439-49c5-9c52-a90a02d5d4c1'),
	(9,3,326,8,2,3,1,'2023-11-13 11:20:33','2023-11-13 11:20:33','a50531a4-e2a6-4778-915b-ee8bcf09fb87'),
	(10,3,338,8,4,5,1,'2023-11-13 14:44:43','2023-11-13 14:44:43','f8aa3db5-3732-4d25-8330-7288bf477321'),
	(11,3,339,8,6,7,1,'2023-11-13 14:45:04','2023-11-13 14:45:04','abfe2e3f-9f81-4009-adda-dd205212c12c');

/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_structures`;

CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_bvonjwydknbjnrnaacxxkzjfdyjhgitwwjsb` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;

INSERT INTO `craft_structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'2023-06-28 21:19:00','2023-06-28 21:19:00','2023-06-28 21:26:48','090bc9d3-4d35-4d1d-a39f-e9980d17f50e'),
	(2,NULL,'2023-11-10 12:48:56','2023-11-10 12:48:56',NULL,'175e7b20-d82d-4aab-908c-0ac21a52cae3'),
	(3,5,'2023-11-13 11:18:51','2023-11-13 11:18:51',NULL,'01c585ce-7138-4881-805f-f365bb5f8375');

/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_systemmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_systemmessages`;

CREATE TABLE `craft_systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_autjhzpsssfshxfftziixcaybfzcjotnlkib` (`key`,`language`),
  KEY `craft_idx_watgejpastvmlyiznneqxmncrocwpulvpoyj` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_taggroups`;

CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_dlzltbyspmslxcjccnaorlzyjmejvdkmbvuh` (`name`),
  KEY `craft_idx_usvsxdxgadwhwmyaufzgwswekjoidwsvjjic` (`handle`),
  KEY `craft_idx_bkrxassqppzvihykyhcvcoeqahwuouvipaqg` (`dateDeleted`),
  KEY `craft_fk_qqhwcmknfivnwfrhgllhotqldrrrupmkgljf` (`fieldLayoutId`),
  CONSTRAINT `craft_fk_qqhwcmknfivnwfrhgllhotqldrrrupmkgljf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tags`;

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_ccmiswzknlpsawhxpkfccqxaxysnfyavxfvo` (`groupId`),
  CONSTRAINT `craft_fk_glgnextaahodjtgmbfiwnmvslnciunbvlfry` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_xuloiunwgucdhpmwaoluqzhgmeklcumrkqft` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tokens`;

CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_waxbrvstubxnffedjrzecpghyqiyzteyanad` (`token`),
  KEY `craft_idx_hvhldcmmgwpughnacznkfcxpynpiubhismfq` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups`;

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_nwqzqbvanhnlrkkdycxroqakprnnvrurmmbq` (`handle`),
  KEY `craft_idx_wwmkhvkmihfhqlafkctqohslfucqosgdqjsn` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups_users`;

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_nafhozzrmsahbqxgcjunqupyfbhuuocazqbe` (`groupId`,`userId`),
  KEY `craft_idx_bsdfnstvjmuoigwzvinedocucklqedlvwcri` (`userId`),
  CONSTRAINT `craft_fk_ffrkcnwzhvugxvkzsndpxaxhufmzjjwsxzos` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_pimgfkpzwtnevcvsvdaxebqjkjpfbohbonxm` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions`;

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_uwuusevtqtxghpjgbkmufifqhkdnguqfqrjv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_ctwnllqiviicydefofwoucgvqfecywdkxfru` (`permissionId`,`groupId`),
  KEY `craft_idx_xzmnrlnpueyulspvwnsthtyknanqtsfdafyp` (`groupId`),
  CONSTRAINT `craft_fk_snnrsbgkjufnggnrhfbucyopnvsxiszarfnv` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_vyrumspsiopozeisgeodypwzftdarlsytuwb` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_users`;

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_sijgusyfhhnxajamsgkoiwiebpoxnvwhuwfp` (`permissionId`,`userId`),
  KEY `craft_idx_ioaiaxpwiufzjtqfnvgqvayatalijwzdnieu` (`userId`),
  CONSTRAINT `craft_fk_ndnwbmnbamhhnjlkwcakzvtpjwfarfurzzyu` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_rbmfogkpxpvackdrxidszxxclyixxnojbrax` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_userpreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpreferences`;

CREATE TABLE `craft_userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `craft_fk_wsjmuefugowrcyfhkhcnzufhtgtkqsmemeyb` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_userpreferences` WRITE;
/*!40000 ALTER TABLE `craft_userpreferences` DISABLE KEYS */;

INSERT INTO `craft_userpreferences` (`userId`, `preferences`)
VALUES
	(1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"notificationDuration\":\"5000\",\"showFieldHandles\":true,\"enableDebugToolbarForSite\":true,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');

/*!40000 ALTER TABLE `craft_userpreferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_users`;

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_oybiscvlhzertdbjyavgdayjppyruvvoqokm` (`active`),
  KEY `craft_idx_ejvqjlyuqzpepygbdjjfgfhvcsontdknvoga` (`locked`),
  KEY `craft_idx_npxibeuudyoduvczkheprnjxauibmdyhwute` (`pending`),
  KEY `craft_idx_loosdinafhobfoaghfogjnqidtysqcqforaw` (`suspended`),
  KEY `craft_idx_ssitqnixshwuvrkkytntmkvecvlcvcfvojng` (`verificationCode`),
  KEY `craft_idx_pyzncwixoqsivoddemytcfzrzlsclibjkwpf` (`email`),
  KEY `craft_idx_bacyhijjaknesupphhuudbrmxqrthfhpleiz` (`username`),
  KEY `craft_fk_tfbgehiengkisolgksdvacpojbbxnulvnmnd` (`photoId`),
  CONSTRAINT `craft_fk_acuhtnggytzcbjnsvatuysscjynimvnwfpxq` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_tfbgehiengkisolgksdvacpojbbxnulvnmnd` FOREIGN KEY (`photoId`) REFERENCES `craft_assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;

INSERT INTO `craft_users` (`id`, `photoId`, `active`, `pending`, `locked`, `suspended`, `admin`, `username`, `fullName`, `firstName`, `lastName`, `email`, `password`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`)
VALUES
	(1,NULL,1,0,0,0,1,'admin','Chris Bauer','Chris','Bauer','bauerindustries@icloud.com','$2y$13$anR.Zds8AiztYtpiexwDw.ONhJUg95etlNXnjruBOmQNXTYWBCq8C','2023-11-13 16:35:33',NULL,NULL,NULL,'2023-11-10 12:41:56',NULL,1,NULL,NULL,NULL,0,'2023-06-23 21:48:48','2023-06-23 21:48:48','2023-11-13 16:35:33');

/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_volumefolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_volumefolders`;

CREATE TABLE `craft_volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_moziirpuacvqsfntcyixtorosrlxzomaxwal` (`name`,`parentId`,`volumeId`),
  KEY `craft_idx_zwxtnhctotmvpvgrigarpoxzzzpjpnsrzgwr` (`parentId`),
  KEY `craft_idx_skususcspjeiebezbzcumwpjkkpeiypaihee` (`volumeId`),
  CONSTRAINT `craft_fk_oehmlkwcnigcvdlhbaitzudnjrrgmvwvmzzo` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_pumvjehmxglvugpbyxduvvqhhloazdphbxge` FOREIGN KEY (`parentId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_volumefolders` WRITE;
/*!40000 ALTER TABLE `craft_volumefolders` DISABLE KEYS */;

INSERT INTO `craft_volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'Drinks',NULL,'2023-07-23 07:42:15','2023-07-23 07:44:16','d82c92dc-1157-4a78-bfc7-d15a8b35f24c'),
	(2,NULL,NULL,'Temporary filesystem',NULL,'2023-07-23 07:53:52','2023-07-23 07:53:52','8cb0ebc4-5850-42bc-a070-8c3908af0634'),
	(3,2,NULL,'user_1','user_1/','2023-07-23 07:53:52','2023-07-23 07:53:52','e39704f4-45f7-4639-9409-94a2832fd64b');

/*!40000 ALTER TABLE `craft_volumefolders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_volumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_volumes`;

CREATE TABLE `craft_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_gsjoprjptrevendqzrygqnmuqlktzcaabiwq` (`name`),
  KEY `craft_idx_lkaddtxpvpqxmgxemtctjmmnovioskwiqsav` (`handle`),
  KEY `craft_idx_yicqiqpwfxexjrunkoqdawtjrrdyiipzserr` (`fieldLayoutId`),
  KEY `craft_idx_vxtjbulrpynmngqmbyhglqckdcudzzodewzs` (`dateDeleted`),
  CONSTRAINT `craft_fk_dgkjgarjodgkedtqftbbxarnfvlnnnzqupbl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_volumes` WRITE;
/*!40000 ALTER TABLE `craft_volumes` DISABLE KEYS */;

INSERT INTO `craft_volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `fs`, `transformFs`, `transformSubpath`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,5,'Drinks','drinks','drinks','','','site',NULL,1,'2023-07-23 07:42:15','2023-07-23 07:48:47',NULL,'33f7304a-36e8-41e2-a1af-285e3885fab8');

/*!40000 ALTER TABLE `craft_volumes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_widgets`;

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_adiutuxkjlhzcxdffhmdlkfhtjevnrsufdxe` (`userId`),
  CONSTRAINT `craft_fk_osaelrdgpotjdjkgaleiyjnhicbqieiyrfsy` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-06-23 21:50:04','2023-06-23 21:50:04','0eabe79a-455a-476d-94c9-6d278edaf3be'),
	(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-06-23 21:50:04','2023-06-23 21:50:04','c1460061-738c-4864-9d80-1dd982dd1b30'),
	(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-06-23 21:50:04','2023-06-23 21:50:04','a3a29fa2-e523-4e2a-9984-90fe1aa6eca7');

/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
