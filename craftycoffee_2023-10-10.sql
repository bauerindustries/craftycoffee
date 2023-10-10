# ************************************************************
# Sequel Ace SQL dump
# Version 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 5.7.39)
# Database: craftycoffee
# Generation Time: 2023-10-10 19:00:06 +0000
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
	(14,1,1,1,'espresso-shot.jpg','image',NULL,1200,689,41638,NULL,NULL,NULL,'2023-07-23 07:54:25','2023-07-23 07:54:25','2023-07-23 07:54:25'),
	(17,1,1,1,'iced-coffee.jpg','image',NULL,1200,971,73675,NULL,NULL,NULL,'2023-07-23 08:13:24','2023-07-23 08:13:24','2023-07-23 08:13:24');

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
	(6,1,'title','2023-07-08 07:42:40',0,1),
	(6,1,'uri','2023-07-08 07:42:40',0,1),
	(8,1,'postDate','2023-07-08 07:54:21',0,1),
	(8,1,'slug','2023-07-08 07:53:53',0,1),
	(8,1,'title','2023-07-08 07:53:53',0,1),
	(8,1,'uri','2023-07-08 07:53:53',0,1),
	(18,1,'postDate','2023-07-23 08:14:14',0,1),
	(18,1,'slug','2023-07-23 08:13:41',0,1),
	(18,1,'title','2023-07-23 08:13:41',0,1),
	(18,1,'uri','2023-07-23 08:13:41',0,1);

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
	(6,1,1,'2023-07-08 07:42:54',0,1),
	(6,1,2,'2023-07-08 07:44:13',0,1),
	(6,1,5,'2023-07-23 08:05:13',0,1),
	(8,1,3,'2023-07-08 07:54:08',0,1),
	(8,1,4,'2023-07-08 07:54:20',0,1),
	(18,1,1,'2023-07-23 08:13:54',0,1),
	(18,1,2,'2023-07-23 08:14:05',0,1),
	(18,1,5,'2023-07-23 08:14:12',0,1);

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_xygnluzupetikccyjmzjsazxxfehetageoib` (`elementId`,`siteId`),
  KEY `craft_idx_onggxnrdmibkdotlawvsvapvywwudhivbgwo` (`siteId`),
  KEY `craft_idx_lgansciwntlebwgroflnejdphcpjdgpoiniu` (`title`),
  CONSTRAINT `craft_fk_btgtgspncjsdoketgugojwkqrdfgzitvebke` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ketwjyhpupanshmporjnharoranocufcwrxv` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;

INSERT INTO `craft_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_introduction_yetqqcwj`, `field_pageCopy_fpawuluh`, `field_excerpt_xuzzitfj`, `field_newsBody_fnteyxpg`)
VALUES
	(1,1,1,NULL,'2023-06-23 21:48:48','2023-06-28 21:28:01','6144ea89-1e2f-4b73-8b8c-2327a30c5acb',NULL,NULL,NULL,NULL),
	(2,2,1,'Hello world!','2023-06-28 21:19:50','2023-06-28 21:20:50','d11e9fea-4a76-4391-98e1-25efb66a1eaa',NULL,NULL,NULL,NULL),
	(3,3,1,'Hello world!','2023-06-28 21:20:50','2023-06-28 21:20:50','b1caf811-0962-470d-909a-59c9ca533563',NULL,NULL,NULL,NULL),
	(4,4,1,NULL,'2023-07-07 22:43:10','2023-07-07 22:43:10','9712a9a1-389a-4ff7-8da9-4e3815cbb516',NULL,NULL,NULL,NULL),
	(5,5,1,NULL,'2023-07-07 22:44:01','2023-07-07 22:44:01','1f35b75a-53cc-499b-b40c-41d86a1fb966',NULL,NULL,NULL,NULL),
	(6,6,1,'Espresso','2023-07-08 07:42:28','2023-07-23 08:05:13','e8a21ddd-0e1d-48bf-b239-e4c7cfd6370d','News article lead or intro','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL),
	(7,7,1,'Espresso','2023-07-08 07:44:13','2023-07-08 07:44:13','02c7b241-d0de-4bd2-b097-4bdd5e4970fe','News article lead or intro','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL),
	(8,8,1,'New coffee coming soon','2023-07-08 07:52:29','2023-07-08 07:54:22','dc4dfbe5-3252-48a8-b75a-5dd5edc05775',NULL,NULL,'Check out the new style coming to Crafty Coffee very soon!','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>'),
	(9,9,1,'New coffee coming soon','2023-07-08 07:54:22','2023-07-08 07:54:22','49ba331a-684b-487e-b5b4-5d15ae495098',NULL,NULL,'Check out the new style coming to Crafty Coffee very soon!','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>'),
	(10,10,1,'Homepage','2023-07-22 07:33:24','2023-07-22 07:34:26','a18b4fc4-962f-4f26-b1b5-7352ecfcf8ed',NULL,NULL,NULL,NULL),
	(11,11,1,'Homepage','2023-07-22 07:33:24','2023-07-22 07:33:24','d47564f2-fb61-4096-a702-b6c6a4ae487b',NULL,NULL,NULL,NULL),
	(12,12,1,'Homepage','2023-07-22 07:33:24','2023-07-22 07:33:24','40c7445b-9fda-4320-bdc6-39f5f5474b7a',NULL,NULL,NULL,NULL),
	(13,13,1,'Homepage','2023-07-22 07:34:26','2023-07-22 07:34:26','dc157881-d450-4c86-a5d0-6e6e49e6aa1e',NULL,NULL,NULL,NULL),
	(14,14,1,'Espresso shot','2023-07-23 07:54:25','2023-07-23 07:54:25','e3c7efb1-941b-4806-a7fb-2635fe1d904a',NULL,NULL,NULL,NULL),
	(16,16,1,'Espresso','2023-07-23 08:05:13','2023-07-23 08:05:13','0ff23f8b-e995-4b7a-a1dd-60c95a82b25c','News article lead or intro','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aspernatur deleniti dignissimos est explicabo, iure laborum minima natus nihil qui repudiandae, velit voluptatum! Animi id illo illum in maiores velit?</p>',NULL,NULL),
	(17,17,1,'Iced coffee','2023-07-23 08:13:24','2023-07-23 08:13:24','4fe66a89-c596-4a0c-98ae-b1d80b228dca',NULL,NULL,NULL,NULL),
	(18,18,1,'Iced Coffee','2023-07-23 08:13:30','2023-07-23 08:14:21','c7492c45-7c62-41a3-a0de-0f057e63b224','Intro for Iced Coffee drink','<p>page copy placeholder</p>',NULL,NULL),
	(19,19,1,'Iced Coffee','2023-07-23 08:14:14','2023-07-23 08:14:14','9b1fa263-b0ab-425c-ae51-be8df5e4a25c','Intro for Iced Coffee drink','<p>page copy placeholder</p>',NULL,NULL),
	(20,20,1,'Iced Coffee','2023-07-23 08:14:21','2023-07-23 08:14:21','6bb9dc11-e862-45f6-b31b-c762afd98f8c','Intro for Iced Coffee drink','<p>page copy placeholder</p>',NULL,NULL);

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
	(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-06-23 21:48:48','2023-06-28 21:28:01',NULL,NULL,'44885583-3af6-4071-97f5-c1600566a72b'),
	(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-06-28 21:19:50','2023-06-28 21:20:50',NULL,'2023-06-28 21:26:48','4e0c553f-d964-4953-b730-7ff23ce5b29b'),
	(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2023-06-28 21:20:50','2023-06-28 21:20:50',NULL,NULL,'80d1184e-366f-415e-a74b-7579285b84cf'),
	(4,NULL,1,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 22:43:10','2023-07-07 22:43:10',NULL,NULL,'ff191e6e-5214-4c20-a3bf-950d7c9427b4'),
	(5,NULL,2,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 22:44:01','2023-07-07 22:44:01',NULL,NULL,'6d9bd90b-617c-42e9-b780-6bedb123df2a'),
	(6,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-08 07:42:28','2023-07-23 08:05:13',NULL,NULL,'b1b7e384-9f48-4c0b-aa55-14cea3c6549c'),
	(7,6,NULL,2,2,'craft\\elements\\Entry',1,0,'2023-07-08 07:44:13','2023-07-08 07:44:13',NULL,NULL,'641c59fb-33af-4be7-8fd1-0d64e1826218'),
	(8,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-07-08 07:52:28','2023-07-08 07:54:22',NULL,NULL,'bd9c0908-0e76-4c9f-b03e-eb5d84ab5054'),
	(9,8,NULL,3,3,'craft\\elements\\Entry',1,0,'2023-07-08 07:54:22','2023-07-08 07:54:22',NULL,NULL,'595ac5ef-1787-4d7d-8fe1-9d2381f65692'),
	(10,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2023-07-22 07:33:24','2023-07-22 07:34:26',NULL,NULL,'baa0c600-4391-4bdf-8708-ad100857786f'),
	(11,10,NULL,4,4,'craft\\elements\\Entry',1,0,'2023-07-22 07:33:24','2023-07-22 07:33:24',NULL,NULL,'9007c7cd-e918-4a14-85c9-c4d818756ba0'),
	(12,10,NULL,5,4,'craft\\elements\\Entry',1,0,'2023-07-22 07:33:24','2023-07-22 07:33:24',NULL,NULL,'396ac8e0-e11b-4639-ad3b-1cc6c15d75c3'),
	(13,10,NULL,6,4,'craft\\elements\\Entry',1,0,'2023-07-22 07:34:26','2023-07-22 07:34:26',NULL,NULL,'63829e59-f587-4185-ba4c-1837463392a0'),
	(14,NULL,NULL,NULL,5,'craft\\elements\\Asset',1,0,'2023-07-23 07:54:24','2023-07-23 07:54:24',NULL,NULL,'a03ec994-4acc-42e0-89e1-66ffef51fb5b'),
	(16,6,NULL,7,2,'craft\\elements\\Entry',1,0,'2023-07-23 08:05:13','2023-07-23 08:05:13',NULL,NULL,'e5161f7d-6bb0-4452-a49b-0b43c259310a'),
	(17,NULL,NULL,NULL,5,'craft\\elements\\Asset',1,0,'2023-07-23 08:13:24','2023-07-23 08:13:24',NULL,NULL,'57ef3645-0466-416f-94f5-9e7bbbaa4695'),
	(18,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-23 08:13:30','2023-07-23 08:14:21',NULL,NULL,'48d56591-1301-41da-abec-5f481c9d0d90'),
	(19,18,NULL,8,2,'craft\\elements\\Entry',1,0,'2023-07-23 08:14:14','2023-07-23 08:14:14',NULL,NULL,'142beaf4-6eb3-405c-b4a8-00bda7725852'),
	(20,18,NULL,9,2,'craft\\elements\\Entry',1,0,'2023-07-23 08:14:21','2023-07-23 08:14:21',NULL,NULL,'b2d8f0df-9e5b-43e5-88c6-1341dc132c57');

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
	(20,20,1,'iced-coffee','drinks/iced-coffee',1,'2023-07-23 08:14:21','2023-07-23 08:14:21','f85857b8-ba62-4045-b237-c9f55fc88cfd');

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
	(20,2,NULL,2,1,'2023-07-23 08:14:00',NULL,NULL,'2023-07-23 08:14:21','2023-07-23 08:14:21');

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
	(4,4,4,'Homepage','homepage',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2023-07-22 07:33:23','2023-07-22 07:33:23',NULL,'ffe7f2a0-f138-4ab9-b44d-b139aebec30c');

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
	(3,'News','2023-07-08 07:04:02','2023-07-08 07:04:02',NULL,'d9733ce0-764f-4a3b-87c7-78604d73922c');

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
	(5,4,9,1,0,1,'2023-07-22 07:34:26','2023-07-22 07:34:26','40c77807-cbd2-475c-96df-20f574ad8fe5'),
	(6,4,9,3,0,2,'2023-07-22 07:34:26','2023-07-22 07:34:26','d49282f9-0291-43b9-820b-b3e6d4e0b310'),
	(7,4,9,2,0,3,'2023-07-22 07:34:26','2023-07-22 07:34:26','094227be-a693-4a92-a2aa-ba368b5dc41d'),
	(8,2,13,1,0,1,'2023-07-23 08:04:43','2023-07-23 08:04:43','32d16eca-6493-4e05-85b2-578b775533ba'),
	(9,2,13,2,0,2,'2023-07-23 08:04:43','2023-07-23 08:04:43','5ff16ada-4fea-464c-8104-1a197b0e8415'),
	(10,2,13,5,0,3,'2023-07-23 08:04:43','2023-07-23 08:04:43','063f922c-0f56-4ad7-ab58-46cf10885ffc');

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
	(5,'craft\\elements\\Asset','2023-07-23 07:42:15','2023-07-23 07:42:15',NULL,'10d27903-5538-43d5-b90f-33d78c819c79');

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
	(9,4,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"acc06c62-9e69-42fb-a3b4-30cd52caa123\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"f8b09155-302b-4667-8361-62533eecb984\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"883380f6-6421-449a-81d8-b2389302478d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"73f4252e-66e1-47b9-bca6-9539be73126b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"061a4275-cc66-4f22-81f0-8f4605a57398\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"698c2c75-2a70-480a-852c-8e6c9dc2f095\"}]',1,'2023-07-22 07:34:26','2023-07-22 07:34:26','5b7235f5-d4d3-4922-92e9-9ee90c0a1203'),
	(12,5,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"2b4f338c-415f-4220-a938-b863d3185dd8\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-07-23 07:48:47','2023-07-23 07:48:47','2aff7332-7ba9-41ed-85d9-728302d372b4'),
	(13,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":\"Drink name\",\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"7509c466-8dcc-452f-a77c-ddf44953bb16\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"a50c658c-0ec5-436a-bb12-46d256e27e39\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"ba0bdeaf-4263-470a-8e8b-fdd4569be76b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"698c2c75-2a70-480a-852c-8e6c9dc2f095\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"c19d2b4f-e58b-46ce-a49e-8b3ecba9b26d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4a683cf6-5953-4f09-8452-49db78a17da1\"}]',1,'2023-07-23 08:04:43','2023-07-23 08:04:43','264cb0a3-acc5-4873-a843-2c10221439a1');

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
	(5,2,'Drink image','drinkImage','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:33f7304a-36e8-41e2-a1af-285e3885fab8\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:33f7304a-36e8-41e2-a1af-285e3885fab8\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":\"Add a drink image\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:33f7304a-36e8-41e2-a1af-285e3885fab8\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2023-07-23 08:04:07','2023-07-23 08:04:07','4a683cf6-5953-4f09-8452-49db78a17da1');

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
	(1,14,'craft\\imagetransforms\\ImageTransformer','espresso-shot.jpg',NULL,'_34x19_crop_center-center_none',1,0,0,'2023-07-23 07:54:26','2023-07-23 07:54:26','2023-07-23 08:01:32','5d2d7d0d-91a8-4f0e-ae52-0164ad38eee4'),
	(2,14,'craft\\imagetransforms\\ImageTransformer','espresso-shot.jpg',NULL,'_68x39_crop_center-center_none',1,0,0,'2023-07-23 07:54:26','2023-07-23 07:54:26','2023-07-23 07:54:27','76326f2c-d4c2-4f81-aeae-cd09b5a30313'),
	(3,14,'craft\\imagetransforms\\ImageTransformer','espresso-shot.jpg',NULL,'_120x68_crop_center-center_none',1,0,0,'2023-07-23 08:05:14','2023-07-23 08:05:14','2023-07-23 08:05:16','c7827c9a-876a-493e-a785-6344f60f4474'),
	(4,14,'craft\\imagetransforms\\ImageTransformer','espresso-shot.jpg',NULL,'_240x137_crop_center-center_none',1,0,0,'2023-07-23 08:05:14','2023-07-23 08:05:14','2023-07-23 08:05:15','b0f34235-8c0f-42ed-9b50-82059cc1a454'),
	(5,17,'craft\\imagetransforms\\ImageTransformer','iced-coffee.jpg',NULL,'_34x27_crop_center-center_none',1,0,0,'2023-07-23 08:13:25','2023-07-23 08:13:25','2023-07-23 08:13:28','d8d7a9f9-2ebc-4d2f-9d49-663d70316d30'),
	(6,17,'craft\\imagetransforms\\ImageTransformer','iced-coffee.jpg',NULL,'_68x55_crop_center-center_none',1,0,0,'2023-07-23 08:13:25','2023-07-23 08:13:25','2023-07-23 08:13:26','5fbbca14-b2cb-4671-bf4d-6a4924f7d241'),
	(7,17,'craft\\imagetransforms\\ImageTransformer','iced-coffee.jpg',NULL,'_120x97_crop_center-center_none',1,0,0,'2023-07-23 08:14:15','2023-07-23 08:14:15','2023-07-23 08:14:17','8267c8ba-5655-4dea-a640-c680f2cc2346'),
	(8,17,'craft\\imagetransforms\\ImageTransformer','iced-coffee.jpg',NULL,'_240x194_crop_center-center_none',1,0,0,'2023-07-23 08:14:15','2023-07-23 08:14:15','2023-07-23 08:14:17','62102ac6-46a0-46ac-bd6e-d48e575cc27f');

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
	(1,'4.5.6.1','4.5.3.0',0,'dsuzzkelslav','3@bvvypvedac','2023-06-23 21:48:48','2023-10-09 09:21:37','6acc31c2-6955-4d4c-ba57-301ec312296f');

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
	('dateModified','1696843297'),
	('email.fromEmail','\"bauerindustries@icloud.com\"'),
	('email.fromName','\"crafty coffee\"'),
	('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
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
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.fieldUid','\"dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.instructions','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.label','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.required','false'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.tip','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.uid','\"a50c658c-0ec5-436a-bb12-46d256e27e39\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.userCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.warning','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.1.width','100'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.elementCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.fieldUid','\"698c2c75-2a70-480a-852c-8e6c9dc2f095\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.instructions','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.label','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.required','false'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.tip','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.uid','\"ba0bdeaf-4263-470a-8e8b-fdd4569be76b\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.userCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.warning','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.2.width','100'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.elementCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.fieldUid','\"4a683cf6-5953-4f09-8452-49db78a17da1\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.instructions','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.label','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.required','false'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.tip','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.uid','\"c19d2b4f-e58b-46ce-a49e-8b3ecba9b26d\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.userCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.warning','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.elements.3.width','100'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.name','\"Content\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.uid','\"264cb0a3-acc5-4873-a843-2c10221439a1\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.fieldLayouts.ecc3579d-fd33-4263-8c9a-ae09f137c6c4.tabs.0.userCondition','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.handle','\"drinks\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.hasTitleField','true'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.name','\"Drinks\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.section','\"d067198d-0272-4232-b2b6-778b2c6a7b10\"'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.sortOrder','1'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.titleFormat','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.titleTranslationKeyFormat','null'),
	('entryTypes.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5.titleTranslationMethod','\"site\"'),
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
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.fieldUid','\"dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.instructions','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.label','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.required','false'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.tip','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.uid','\"f8b09155-302b-4667-8361-62533eecb984\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.userCondition','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.warning','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.1.width','100'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.2.elementCondition','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.2.fieldUid','\"73f4252e-66e1-47b9-bca6-9539be73126b\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.2.instructions','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.2.label','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.2.required','false'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.2.tip','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.2.uid','\"883380f6-6421-449a-81d8-b2389302478d\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.2.userCondition','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.2.warning','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.2.width','100'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.3.elementCondition','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.3.fieldUid','\"698c2c75-2a70-480a-852c-8e6c9dc2f095\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.3.instructions','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.3.label','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.3.required','false'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.3.tip','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.3.uid','\"061a4275-cc66-4f22-81f0-8f4605a57398\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.3.userCondition','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.3.warning','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.elements.3.width','100'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.name','\"Content\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.uid','\"5b7235f5-d4d3-4922-92e9-9ee90c0a1203\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.fieldLayouts.f116de9a-3dfb-439c-a7fe-2111845202f9.tabs.0.userCondition','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.handle','\"homepage\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.hasTitleField','false'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.name','\"Homepage\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.section','\"18d9a6c5-f2cc-4518-a7d0-0254317ec34c\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.sortOrder','1'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.titleFormat','\"{section.name|raw}\"'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.titleTranslationKeyFormat','null'),
	('entryTypes.ffe7f2a0-f138-4ab9-b44d-b139aebec30c.titleTranslationMethod','\"site\"'),
	('fieldGroups.2e5ac707-b113-48a6-a39f-cd16b37e8dfd.name','\"Common\"'),
	('fieldGroups.7fb8ff63-f6d7-4722-9949-b41918660706.name','\"Drinks\"'),
	('fieldGroups.d9733ce0-764f-4a3b-87c7-78604d73922c.name','\"News\"'),
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
	('meta.__names__.0a4d3e62-b383-4317-83ec-0dab9cfcb550','\"Simple\"'),
	('meta.__names__.18d9a6c5-f2cc-4518-a7d0-0254317ec34c','\"Homepage\"'),
	('meta.__names__.25dcf5ff-387f-4f58-b014-15685772b51f','\"crafty coffee\"'),
	('meta.__names__.2e5ac707-b113-48a6-a39f-cd16b37e8dfd','\"Common\"'),
	('meta.__names__.33f7304a-36e8-41e2-a1af-285e3885fab8','\"Drinks\"'),
	('meta.__names__.42840bed-00c3-43de-ad99-357a1473c37a','\"840x200 Thumb\"'),
	('meta.__names__.4a683cf6-5953-4f09-8452-49db78a17da1','\"Drink image\"'),
	('meta.__names__.5d3ef853-3a34-4342-a721-1f59d43ad1b0','\"Public Schema\"'),
	('meta.__names__.684353c1-0d73-43a1-913e-6d34bbadfea9','\"crafty coffee\"'),
	('meta.__names__.698c2c75-2a70-480a-852c-8e6c9dc2f095','\"Page copy\"'),
	('meta.__names__.73f4252e-66e1-47b9-bca6-9539be73126b','\"Excerpt\"'),
	('meta.__names__.7f9cf7cc-e388-4dd8-819d-17427ec39847','\"Public Schema\"'),
	('meta.__names__.7fb8ff63-f6d7-4722-9949-b41918660706','\"Drinks\"'),
	('meta.__names__.986aa4bb-41f0-4f08-a80b-5def7c05e9e2','\"News\"'),
	('meta.__names__.b50feb42-d1c3-4b0a-a7a3-4d49c8e19ea5','\"Drinks\"'),
	('meta.__names__.cb6b466e-f68f-44ae-9fa0-cf6a5ce6e753','\"News body\"'),
	('meta.__names__.d067198d-0272-4232-b2b6-778b2c6a7b10','\"Drinks\"'),
	('meta.__names__.d35a6ed0-f1a6-4189-a205-ed008cb9e034','\"News\"'),
	('meta.__names__.d39bc870-b3d1-4067-a9ec-dce454eb40d9','\"Public Schema\"'),
	('meta.__names__.d9733ce0-764f-4a3b-87c7-78604d73922c','\"News\"'),
	('meta.__names__.dd585b1f-baa1-4c7f-ba44-ffdc9ef956f3','\"Introduction\"'),
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
	(2,5,6,NULL,14,1,'2023-07-23 08:05:13','2023-07-23 08:05:13','c15af12b-f3b0-4e0b-a402-a1aa0dc4c2ba'),
	(3,5,16,NULL,14,1,'2023-07-23 08:05:13','2023-07-23 08:05:13','6362dacc-15bf-4e70-8abe-1505d09b6dca'),
	(4,5,18,NULL,17,1,'2023-07-23 08:14:12','2023-07-23 08:14:12','1d679ec0-c780-4ee4-9223-5e979f9649cb'),
	(5,5,19,NULL,17,1,'2023-07-23 08:14:14','2023-07-23 08:14:14','a5b11a71-e808-417a-a27e-7afdd0035f66'),
	(6,5,20,NULL,17,1,'2023-07-23 08:14:21','2023-07-23 08:14:21','d49d2c50-2351-439f-8da4-56c23f3367bb');

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
	('36829225','@craft/web/assets/axios/dist'),
	('36b22b2f','@yii/debug/assets'),
	('3c8acfe','@craft/web/assets/pluginstore/dist'),
	('3eee484','@craft/web/assets/fieldsettings/dist'),
	('406b3277','@craft/web/assets/fabric/dist'),
	('47dc27af','@craft/web/assets/axios/dist'),
	('4e212686','@craft/web/assets/utilities/dist'),
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
	('b9b84248','@craft/web/assets/updates/dist'),
	('bb246785','@craft/web/assets/iframeresizer/dist'),
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
	(9,18,1,2,'');

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
	(6,'slug',0,1,' espresso '),
	(6,'title',0,1,' espresso '),
	(8,'slug',0,1,' new coffee coming soon '),
	(8,'title',0,1,' new coffee coming soon '),
	(10,'slug',0,1,' homepage '),
	(10,'title',0,1,' homepage '),
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
	(18,'slug',0,1,' iced coffee '),
	(18,'title',0,1,' iced coffee ');

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
	(4,NULL,'Homepage','homepage','single',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-07-22 07:33:23','2023-07-22 07:33:23',NULL,'18d9a6c5-f2cc-4518-a7d0-0254317ec34c');

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
	(4,4,1,1,'__home__','index',1,'2023-07-22 07:33:23','2023-07-22 07:33:23','badead11-0efd-43cd-90b8-d0f3305bffb8');

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
	(2,1,'UDzSsejWnR1FNcWJ8V-HlqloJZLBYuU2aiygPNjRYuROoXbwPiQluMzR60s_IECVD2vpmg3m-7cKuA0R4Kn3GJCl-fuViH7ZjDol','2023-07-23 07:20:44','2023-07-23 07:30:46','2b06caee-8ec3-48a0-8c5e-bdf2bc52b9b6');

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
	(2,1,2,1,2,3,1,'2023-06-28 21:19:50','2023-06-28 21:19:50','33566ead-d499-480a-908a-2bc0374ec879');

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
	(1,NULL,'2023-06-28 21:19:00','2023-06-28 21:19:00','2023-06-28 21:26:48','090bc9d3-4d35-4d1d-a39f-e9980d17f50e');

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
	(1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"notificationDuration\":\"5000\",\"showFieldHandles\":false,\"enableDebugToolbarForSite\":true,\"enableDebugToolbarForCp\":true,\"showExceptionView\":false,\"profileTemplates\":false}');

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
	(1,NULL,1,0,0,0,1,'admin','Chris Bauer','Chris','Bauer','bauerindustries@icloud.com','$2y$13$anR.Zds8AiztYtpiexwDw.ONhJUg95etlNXnjruBOmQNXTYWBCq8C','2023-10-09 09:22:31',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2023-06-23 21:48:48','2023-06-23 21:48:48','2023-10-09 09:22:31');

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
