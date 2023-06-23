# ************************************************************
# Sequel Ace SQL dump
# Version 20046
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 5.7.39)
# Database: craftycoffee
# Generation Time: 2023-06-23 21:53:33 +0000
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_xygnluzupetikccyjmzjsazxxfehetageoib` (`elementId`,`siteId`),
  KEY `craft_idx_onggxnrdmibkdotlawvsvapvywwudhivbgwo` (`siteId`),
  KEY `craft_idx_lgansciwntlebwgroflnejdphcpjdgpoiniu` (`title`),
  CONSTRAINT `craft_fk_btgtgspncjsdoketgugojwkqrdfgzitvebke` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ketwjyhpupanshmporjnharoranocufcwrxv` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;

INSERT INTO `craft_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,NULL,'2023-06-23 21:48:48','2023-06-23 21:48:48','6144ea89-1e2f-4b73-8b8c-2327a30c5acb');

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
	(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-06-23 21:48:48','2023-06-23 21:48:48',NULL,NULL,'44885583-3af6-4071-97f5-c1600566a72b');

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
	(1,1,1,NULL,NULL,1,'2023-06-23 21:48:48','2023-06-23 21:48:48','de810c46-99ef-4f3e-b148-82dfc793d367');

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
	(1,'Common','2023-06-23 21:48:48','2023-06-23 21:48:48',NULL,'2e5ac707-b113-48a6-a39f-cd16b37e8dfd');

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
	(1,'4.4.14','4.4.0.4',0,'seecfaklyhia','3@oevuplqkih','2023-06-23 21:48:48','2023-06-23 21:49:47','6acc31c2-6955-4d4c-ba57-301ec312296f');

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
	(30,'craft','m230226_013114_drop_plugin_license_columns','2023-06-23 21:48:49','2023-06-23 21:48:49','2023-06-23 21:48:49','292e582b-283c-413f-a217-07bf30818497');

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
	('dateModified','1687556929'),
	('email.fromEmail','\"bauerindustries@icloud.com\"'),
	('email.fromName','\"crafty coffee\"'),
	('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
	('fieldGroups.2e5ac707-b113-48a6-a39f-cd16b37e8dfd.name','\"Common\"'),
	('meta.__names__.25dcf5ff-387f-4f58-b014-15685772b51f','\"crafty coffee\"'),
	('meta.__names__.2e5ac707-b113-48a6-a39f-cd16b37e8dfd','\"Common\"'),
	('meta.__names__.684353c1-0d73-43a1-913e-6d34bbadfea9','\"crafty coffee\"'),
	('siteGroups.25dcf5ff-387f-4f58-b014-15685772b51f.name','\"crafty coffee\"'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.baseUrl','\"$PRIMARY_SITE_URL\"'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.handle','\"default\"'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.hasUrls','true'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.language','\"en-US\"'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.name','\"crafty coffee\"'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.primary','true'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.siteGroup','\"25dcf5ff-387f-4f58-b014-15685772b51f\"'),
	('sites.684353c1-0d73-43a1-913e-6d34bbadfea9.sortOrder','1'),
	('system.edition','\"solo\"'),
	('system.live','true'),
	('system.name','\"crafty coffee\"'),
	('system.schemaVersion','\"4.4.0.4\"'),
	('system.timeZone','\"America/Los_Angeles\"'),
	('users.allowPublicRegistration','false'),
	('users.defaultGroup','null'),
	('users.photoSubpath','null'),
	('users.photoVolumeUid','null'),
	('users.requireEmailVerification','true');

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
	('1be7b37d','@craft/web/assets/iframeresizer/dist'),
	('1ee84e9','@craft/web/assets/tailwindreset/dist'),
	('2e77077c','@craft/web/assets/recententries/dist'),
	('36829225','@craft/web/assets/axios/dist'),
	('406b3277','@craft/web/assets/fabric/dist'),
	('68d90560','@craft/web/assets/garnish/dist'),
	('6fb3ecb','@craft/web/assets/selectize/dist'),
	('82b5dc63','@craft/web/assets/jquerytouchevents/dist'),
	('82e60301','@craft/web/assets/jquerypayment/dist'),
	('877101b6','@craft/web/assets/velocity/dist'),
	('88748e5f','@craft/web/assets/feed/dist'),
	('ab39c83','@craft/web/assets/cp/dist'),
	('b50564df','@craft/web/assets/xregexp/dist'),
	('b761b31b','@craft/web/assets/craftsupport/dist'),
	('bebdd9df','@craft/web/assets/picturefill/dist'),
	('c0d4ee74','@craft/web/assets/fileupload/dist'),
	('d1a8b721','@craft/web/assets/elementresizedetector/dist'),
	('d448a8c9','@bower/jquery/dist'),
	('deaf38df','@craft/web/assets/jqueryui/dist'),
	('f137a894','@craft/web/assets/dashboard/dist');

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
	(1,'firstname',0,1,''),
	(1,'fullname',0,1,''),
	(1,'lastname',0,1,''),
	(1,'slug',0,1,''),
	(1,'username',0,1,' admin ');

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
	(1,1,'NI9rMQLcrqhXFgDGNe3sp_w51Y0wy7YD6G_LB0ocKfZ4xCjXoTPeML3PSH-qHdQNrd8zWEsV9qRxI4Rw4tnOvjOW6iaESValjEXZ','2023-06-23 21:50:03','2023-06-23 21:52:42','07108bfd-4cd8-47af-862c-142ea5d9209e');

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
	(1,'{\"language\":\"en-US\"}');

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
	(1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'bauerindustries@icloud.com','$2y$13$anR.Zds8AiztYtpiexwDw.ONhJUg95etlNXnjruBOmQNXTYWBCq8C','2023-06-23 21:50:03',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2023-06-23 21:48:48','2023-06-23 21:48:48','2023-06-23 21:50:04');

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
	(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-06-23 21:50:04','2023-06-23 21:50:04','5ae3ffb6-0478-41c4-8c07-db0a7006888a'),
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
