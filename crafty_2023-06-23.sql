# ************************************************************
# Sequel Ace SQL dump
# Version 20046
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 5.7.39)
# Database: crafty
# Generation Time: 2023-06-23 20:42:29 +0000
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
  KEY `craft_fk_kffhykqdykaixrcfldoexpeodmhevpfqffix` (`ownerId`),
  CONSTRAINT `craft_fk_jgrlfsartynriujrhfjvqulxuauuumcmrrge` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_kffhykqdykaixrcfldoexpeodmhevpfqffix` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_lzsmxqqdxchqgwuwlywkrjffybczxsbhxelo` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `craft_idx_bpsqxaurzwejxqdzdlketgyfmsndjrzhlahd` (`dateRead`),
  KEY `craft_fk_mgqvsijfqrpghqypslksijfpmcpqaypcnyzc` (`pluginId`),
  CONSTRAINT `craft_fk_kcujiflolxgdowvojpfhykwsyamkqykhqdfi` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_mgqvsijfqrpghqypslksijfpmcpqaypcnyzc` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_cmhcxaaxbxfezfxtdalzddfxflmcsyswggmj` (`sessionId`,`volumeId`),
  KEY `craft_idx_klayvdsevmpblydrdjtidzvymbqhzmgqmkar` (`volumeId`),
  CONSTRAINT `craft_fk_gdarcepuyfasjrjrbckyotrnajjvyqqdfcyr` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_tlsqcjdgmbmpekgnvbooikrckfrypupqsrjz` FOREIGN KEY (`sessionId`) REFERENCES `craft_assetindexingsessions` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_mrgoaecrmakcevenofjworprrpvchichwjik` (`filename`,`folderId`),
  KEY `craft_idx_lrlqvmlqpszwhysowgcdchndlrnkzkyswwed` (`folderId`),
  KEY `craft_idx_sjbbnaolrfagksnlnppdhevumlzzjbbvbaww` (`volumeId`),
  KEY `craft_fk_tzcpfiksibkykyfgidzbppsuveddonuwuvwg` (`uploaderId`),
  CONSTRAINT `craft_fk_njregoggqqgvzgfohqnmfdupxrnbddxvnind` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ofzdjjfabgfijfycxsiyevcebtwcaoinxqxb` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ohnhfxhptlziuzambffmsseybudvdglkipnz` FOREIGN KEY (`folderId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_tzcpfiksibkykyfgidzbppsuveddonuwuvwg` FOREIGN KEY (`uploaderId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL
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
  KEY `craft_idx_ixhjtgkbomkzodshnmdrheskueasuybakeza` (`groupId`),
  KEY `craft_fk_uilspakbtvvwjudjtwmbiydsuojwntawvpcr` (`parentId`),
  CONSTRAINT `craft_fk_qutzzetscafejzmocmpigmcaktoyvweqgxmp` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_uilspakbtvvwjudjtwmbiydsuojwntawvpcr` FOREIGN KEY (`parentId`) REFERENCES `craft_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_xyutemlwrmemzhzrlhuwuoldjgswgevtinsn` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_iiuhmcunosuegtqznvogciogrkdhnerurlkt` (`name`),
  KEY `craft_idx_vvkpfiugxpndbajvihtgxbxibmcdjikgueln` (`handle`),
  KEY `craft_idx_ijaqbczrcpehknpgneipkdkdwfzwdtsowaqo` (`structureId`),
  KEY `craft_idx_iajqcdzketzyjijzfvjffpcjjiaagkylnptk` (`fieldLayoutId`),
  KEY `craft_idx_kfdsyvvmlakzmscrbpdahsimwqzvhfawajyp` (`dateDeleted`),
  CONSTRAINT `craft_fk_prtnnxruflkonhnzhsgksctcmwutzarvobcy` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_usmvrzkdsocugcuqfkqdihxkjeblzcqeefxz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
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
  UNIQUE KEY `craft_idx_nzwcxcmluatdtikrhbufzhvsqrtsjinzsjuz` (`groupId`,`siteId`),
  KEY `craft_idx_royeerwveaujwfmwqkruklqynkadldxajvks` (`siteId`),
  CONSTRAINT `craft_fk_rkfsbrgnoxlkgclsxbdcellhhvrtifwpifvs` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_sibkwlytlslvhtcmzxdqlgyopsrhiihziawy` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  KEY `craft_idx_ungctfewhdzjaswryybmalwwbtazbbmqafcg` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craft_fk_eftnjabzmbjxcajgfqikozywsfmxgwcmyvoj` (`siteId`),
  KEY `craft_fk_kjtzyzafybgehfkqeulpivwzhdtssswxhmma` (`userId`),
  CONSTRAINT `craft_fk_eftnjabzmbjxcajgfqikozywsfmxgwcmyvoj` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_gjnzntyeztlukexcajiujqtlclymtbijfwzy` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_kjtzyzafybgehfkqeulpivwzhdtssswxhmma` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
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
  KEY `craft_idx_vlkwnykhtdimsnbudyvxjjdnhkddnnmztmcj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craft_fk_mzjvhqtpihobrtbbvqbqxwlinslxciyydnsr` (`siteId`),
  KEY `craft_fk_suapmrvkdoqxcsgfzyhjncvtorpauisclpej` (`fieldId`),
  KEY `craft_fk_ldxhikkhwvmvbrpdsvecuiiqxzkajpnbrvmf` (`userId`),
  CONSTRAINT `craft_fk_alravcbdjairbiofvhbkviyluvqxytxaquuo` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_ldxhikkhwvmvbrpdsvecuiiqxzkajpnbrvmf` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_mzjvhqtpihobrtbbvqbqxwlinslxciyydnsr` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_suapmrvkdoqxcsgfzyhjncvtorpauisclpej` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  UNIQUE KEY `craft_idx_fhmshuezifbbiaxefejkxpexfjyvewazxgin` (`elementId`,`siteId`),
  KEY `craft_idx_niyjqlpjijtjcorqednycfxejfvzcvrjvkuq` (`siteId`),
  KEY `craft_idx_gsgiranfiumovpfuspfujkcgdgtpxfpluaci` (`title`),
  CONSTRAINT `craft_fk_dabdgxnfxlivojyoilawpvdlpncktezhaoql` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_foohyvfeqylyzukjwwswbhlvhwfnhpwqjkjc` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;

INSERT INTO `craft_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,NULL,'2023-06-23 17:52:17','2023-06-23 17:52:17','d51da862-ac20-43a1-855e-3cd005e87742');

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
  KEY `craft_fk_wdvhmdcqsrfdqzlaspoikbxxkezqgzzmnote` (`userId`),
  CONSTRAINT `craft_fk_wdvhmdcqsrfdqzlaspoikbxxkezqgzzmnote` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `craft_idx_weovsuobalwoubvqxkhghcuzgplntdportso` (`key`,`fingerprint`)
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
  KEY `craft_idx_fdyucbitkpuywupxeldofliozuzhqrvedmvy` (`creatorId`,`provisional`),
  KEY `craft_idx_gpriuxspgwnovahoxrivvpfnntpiecjfvjid` (`saved`),
  KEY `craft_fk_rnzryvknlgmnkisvdfbghyzktzicsqxnfnai` (`canonicalId`),
  CONSTRAINT `craft_fk_ggqtygjqqfutswpnzoxcpwvmelvutyrnfmoy` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_rnzryvknlgmnkisvdfbghyzktzicsqxnfnai` FOREIGN KEY (`canonicalId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_yurzvgtcqjinhltxdzgiskptcnmcwhfzemgp` (`dateDeleted`),
  KEY `craft_idx_nsapvmggdhuoqsbimirckcdfzdzolxteaepf` (`fieldLayoutId`),
  KEY `craft_idx_xdoeijnmbiapxfyqifklxhmpncuazywokyrz` (`type`),
  KEY `craft_idx_umlgwgjcqznqtfxqmwlbywfdrwzdmntkolbx` (`enabled`),
  KEY `craft_idx_avhvceolgvwhgbbeidtdbuinuxacrxdlbhhr` (`canonicalId`),
  KEY `craft_idx_ozqcimbiurimsrljduyuzhqwdaauvqlvstrg` (`archived`,`dateCreated`),
  KEY `craft_idx_qmgcpyxxktuhivqpothzjbffikjxsiuojbnp` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `craft_idx_oxxxrscanorxswzjmgbvacohwjhdtoskxeic` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `craft_fk_hwfkgijgsilloasaztqueuqmtdftaggzcgao` (`draftId`),
  KEY `craft_fk_eweimjvjtwfejfybxutzmnyntxnjmhgkfogj` (`revisionId`),
  CONSTRAINT `craft_fk_byqeurvfrolyfuyvvdgzchxplopzkdylfoqf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_eweimjvjtwfejfybxutzmnyntxnjmhgkfogj` FOREIGN KEY (`revisionId`) REFERENCES `craft_revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_hwfkgijgsilloasaztqueuqmtdftaggzcgao` FOREIGN KEY (`draftId`) REFERENCES `craft_drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ugcnsfnkgotaqvwcitbczbajhiskvcxwbxfq` FOREIGN KEY (`canonicalId`) REFERENCES `craft_elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;

INSERT INTO `craft_elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-06-23 17:52:17','2023-06-23 17:52:17',NULL,NULL,'24230c04-52c3-492e-aab2-8465b78cfd0d');

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
  UNIQUE KEY `craft_idx_ilchqyjfvjhekexwzetqbektrrqxbgdbumyw` (`elementId`,`siteId`),
  KEY `craft_idx_nqmdanlxcevwhwvmvhblnkzutybmiedahdxo` (`siteId`),
  KEY `craft_idx_knolaxqfvfydwnlisxaoqnizkilfmcwdyzku` (`slug`,`siteId`),
  KEY `craft_idx_comkdgpfztxaovqktegkijjxeqngbmbcetfe` (`enabled`),
  KEY `craft_idx_yehxtkluvszkpssmuiqqnrhhokauoumlflve` (`uri`,`siteId`),
  CONSTRAINT `craft_fk_frbruibiovoxzbhpdczqyngfmzondbfraruv` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_xophzgiuubqefgyfojwczalvwbrqqnkmrznb` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_elements_sites` WRITE;
/*!40000 ALTER TABLE `craft_elements_sites` DISABLE KEYS */;

INSERT INTO `craft_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,NULL,NULL,1,'2023-06-23 17:52:17','2023-06-23 17:52:17','7b2e7dcd-8bfc-4325-9b37-f31bf8d17654');

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
  KEY `craft_idx_jpujsnnpviknfdldhpxdabwbvkjqjyzvgevb` (`postDate`),
  KEY `craft_idx_euszzrcxchydiponlkaeqszvivjxdnedmcka` (`expiryDate`),
  KEY `craft_idx_zjxljnyiuswqyusraskueppeagfamfmbiqlh` (`authorId`),
  KEY `craft_idx_ybwzekvpmtzxnuouyjatasalzkiqejvqcubj` (`sectionId`),
  KEY `craft_idx_pvmiezfszxwufluyvxchtrwrgwalokjwlcpv` (`typeId`),
  KEY `craft_fk_prfcgmtufqmnnmjsxqorzoutpjpyqhhtzyfq` (`parentId`),
  CONSTRAINT `craft_fk_bmtwaqeyocrthwibosdcwejezjxyzcbckmnu` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_ngazeyihjmcafjfldpjrfzayczfmehubpswg` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_prfcgmtufqmnnmjsxqorzoutpjpyqhhtzyfq` FOREIGN KEY (`parentId`) REFERENCES `craft_entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_rabytzbpevhljgpqljxihznhkhedbxaevwvb` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ybikphgyjudqsroqqzgrguisuhfcogrjrpif` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_fdskiucbwprqxbytuphtnphywheyhorprrkh` (`name`,`sectionId`),
  KEY `craft_idx_mtdcqitusaxnazrevrhlepqprnlxfvhgsthc` (`handle`,`sectionId`),
  KEY `craft_idx_zmydrpffntybjpaaftzifebedhlqjsthcmze` (`sectionId`),
  KEY `craft_idx_lkcruidlbpfwsgmrybkewmuyapoqqgiqopac` (`fieldLayoutId`),
  KEY `craft_idx_xwjgxdfmjsizamnyueiupzjgiopghaytujmb` (`dateDeleted`),
  CONSTRAINT `craft_fk_pwaaqsklpwaxxgfrgtqnywzlddyrsiknrutw` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_qtseutvwwrjngdehqmgzzmcibujbkknutkaq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
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
  KEY `craft_idx_zxymjxqdkhloqaizrlmqbgbtggmnymlpaqsm` (`name`),
  KEY `craft_idx_ofuqwdjhvtzrdbmpiccbxpzplxcubwercjnv` (`dateDeleted`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Common','2023-06-23 17:52:17','2023-06-23 17:52:17',NULL,'ee1d7d23-5118-4ff6-8d3f-4d3138243883');

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
  UNIQUE KEY `craft_idx_tjvgwvufqgmlnlrkacqcxlsgfbjgbjiipklu` (`layoutId`,`fieldId`),
  KEY `craft_idx_jpoflrqgcluxdkibuuofwceobvhlocjtzrah` (`sortOrder`),
  KEY `craft_idx_jhqxysumcsgfcyulvuwnqzkgxdcpwcyspdax` (`tabId`),
  KEY `craft_idx_cconewgickaysfaygwqlavpyvkdyqkwwbbyd` (`fieldId`),
  CONSTRAINT `craft_fk_jbzhsikzswebrgvqzkmmunkgwdhtawahysya` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_odixxkqvrfdqzjfxvnxesxlglbflelmnokgc` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_uwwufkisytmrqnaolbmtcixnhibzlacmwtgi` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_dvctvzgrhndzsbyyemfhjoatievhiymipcdz` (`dateDeleted`),
  KEY `craft_idx_jtydwfstwxecbiofdyifgeqagcdrwvyydjlb` (`type`)
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
  KEY `craft_idx_tvetyvnvvncghrfrjiausylnxmnpxvyimckw` (`sortOrder`),
  KEY `craft_idx_sdpddhmnakrwftwuphxqsgyhhazdgkrhesrg` (`layoutId`),
  CONSTRAINT `craft_fk_kmidfatwdejdbckjaaqckubhrpbgruudhurx` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_rqvvrrbkblrsjqbixscaadwvjbhwatmyauvz` (`handle`,`context`),
  KEY `craft_idx_ypfvdfgmedlhvrxmbjhgnqnsskciepbeucbg` (`groupId`),
  KEY `craft_idx_wsvpkmhomtaixugqlnytogzfbgfpwvdczfkq` (`context`),
  CONSTRAINT `craft_fk_xciphzaxsijkkxeglebqhkpoypkeyapjjmwy` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_dtnrhureryyakstpherywfdzbhmzradrcagw` (`name`),
  KEY `craft_idx_bribpgsmfwxnelvlvjxitghhwonbjnmfgkaz` (`handle`),
  KEY `craft_idx_yqulxjbmgogqtvrincaysagytxyfvrjegciy` (`fieldLayoutId`),
  KEY `craft_idx_qhtubcqzmkpekxpwcdqycthqklqrdhtetsoh` (`sortOrder`),
  CONSTRAINT `craft_fk_jymojdlfbndbwcvilnaezetqajahkahndnku` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_pknitydjthepjmkavaaqunvhjcofsklierxl` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `craft_idx_npgjrscpdzljpoaccfncabqylshnftvqzqvg` (`accessToken`),
  UNIQUE KEY `craft_idx_thkxflmgydnyilncmzubodhazswksntgzkna` (`name`),
  KEY `craft_fk_trrxojsywxxgqrnzhvphrqsujjvcxvzlkrhx` (`schemaId`),
  CONSTRAINT `craft_fk_trrxojsywxxgqrnzhvphrqsujjvcxvzlkrhx` FOREIGN KEY (`schemaId`) REFERENCES `craft_gqlschemas` (`id`) ON DELETE SET NULL
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
  KEY `craft_idx_hhuvrwquyxtharyzgjrwhdcuweqyvgeunjrb` (`assetId`,`transformString`)
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
  KEY `craft_idx_lyelzfyjdxxbtwatocorogngzkjijwpkpcyu` (`name`),
  KEY `craft_idx_kaurcbjgrrbielosixhckekqszvgbhnlzzei` (`handle`)
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
	(1,'4.4.14','4.4.0.4',0,'vrlciqunhryq','3@bedghjpetq','2023-06-23 17:52:17','2023-06-23 17:56:01','ce33b712-40bd-4869-b0c3-d0eab0ab2da7');

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
  KEY `craft_idx_wivjqkgkdttaxnbftcziotjqoarracnxomra` (`primaryOwnerId`),
  KEY `craft_idx_lsgpscvqgfuuwebxwqesegpvojoxxnficlmp` (`fieldId`),
  KEY `craft_idx_ftsxszyyjjectnosjyicqlcqawwoadxkuwsh` (`typeId`),
  CONSTRAINT `craft_fk_dgsiryekjijeyqqovrcoyancummuyftzjjov` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_nqvcfjnrdtujwugqpwwmjbsenxvjcwadjywi` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ntexpwqqusomfnhjavpoeopifrzyvlylttls` FOREIGN KEY (`primaryOwnerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_rrhldfpgthqlrcyyfixttkdgwtptbyrzdwpw` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_matrixblocks_owners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocks_owners`;

CREATE TABLE `craft_matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `craft_fk_iirydjecoorvmikohovbvuydjwufsfletanc` (`ownerId`),
  CONSTRAINT `craft_fk_iirydjecoorvmikohovbvuydjwufsfletanc` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_wellvxsmikbehhnohwtbbynpxmywlfypasjq` FOREIGN KEY (`blockId`) REFERENCES `craft_matrixblocks` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_lgtvmyovfzaagdceeqixqjtvsgqnzkajhwnl` (`name`,`fieldId`),
  KEY `craft_idx_wfayporqxaeezygjetupteynhyqcrbkvqfux` (`handle`,`fieldId`),
  KEY `craft_idx_jobcahfvdirhuqycenbnsxnnhdpbwxyqywby` (`fieldId`),
  KEY `craft_idx_ycmayhbgzbyhnhroegrfqgjpbtmvgmurarsl` (`fieldLayoutId`),
  CONSTRAINT `craft_fk_bzdwhhsfnxswympmojaxjnenxwaiuytopqrz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_isbahouwpjeijmiqtepuhetclirgluwjxwfu` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `craft_idx_ytdvoxyrhbdiksrmtoegpotpdtvlvyvxyeqh` (`track`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;

INSERT INTO `craft_migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'craft','Install','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','bf2ecd2f-7814-466f-ad90-5376aa12ea35'),
	(2,'craft','m210121_145800_asset_indexing_changes','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','00fe986b-76ce-472d-ae24-09e7eb0705b7'),
	(3,'craft','m210624_222934_drop_deprecated_tables','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','57d684da-fb49-44c7-8fd2-4f14a41ee061'),
	(4,'craft','m210724_180756_rename_source_cols','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','c26fd5af-c815-4e33-b1a0-066eca2188f5'),
	(5,'craft','m210809_124211_remove_superfluous_uids','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','0c55e2b6-f310-44f0-9ccc-a4f2e877af16'),
	(6,'craft','m210817_014201_universal_users','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','3206687d-826d-4c8e-abf9-169d7cd9f606'),
	(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','4784a6bc-e37f-452a-a94a-936c4505886b'),
	(8,'craft','m211115_135500_image_transformers','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','efec21e5-2de8-400d-b0a9-e8d732d92e60'),
	(9,'craft','m211201_131000_filesystems','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','395f04cf-3982-4672-a260-7223881a6470'),
	(10,'craft','m220103_043103_tab_conditions','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','3017d4de-5b9d-448b-8686-a80b00dbea6e'),
	(11,'craft','m220104_003433_asset_alt_text','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','6e4aa6e4-c938-48c9-9586-73ef9f3790e9'),
	(12,'craft','m220123_213619_update_permissions','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','6f74f088-66d9-408d-bcf5-eb9fb7c8d3fc'),
	(13,'craft','m220126_003432_addresses','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','3e508b39-5963-4936-b979-f36ace934b3c'),
	(14,'craft','m220209_095604_add_indexes','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','40dc950c-082e-46ff-9804-c15f409bd99b'),
	(15,'craft','m220213_015220_matrixblocks_owners_table','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','e985b6fd-e3ca-435a-9e53-dab86ee6c944'),
	(16,'craft','m220214_000000_truncate_sessions','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','5c460e73-4f3c-4fac-bc36-4a7dff3a3ab1'),
	(17,'craft','m220222_122159_full_names','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','6f6a53bf-c4e2-493f-b502-b71862a3eea2'),
	(18,'craft','m220223_180559_nullable_address_owner','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','fc132acd-372e-4845-8179-3f9472a185b4'),
	(19,'craft','m220225_165000_transform_filesystems','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','1e7563b4-4473-4d41-b858-3ce170a8fb61'),
	(20,'craft','m220309_152006_rename_field_layout_elements','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','31266d9c-766d-4a79-b6d8-51d4dda27dac'),
	(21,'craft','m220314_211928_field_layout_element_uids','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','3da8c5ff-f30a-4b57-a20f-e6c6488f1181'),
	(22,'craft','m220316_123800_transform_fs_subpath','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','fbf86ccf-94f5-488a-9554-c30feec085ef'),
	(23,'craft','m220317_174250_release_all_jobs','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','04e57707-c179-4a0e-89fc-029068cafbc1'),
	(24,'craft','m220330_150000_add_site_gql_schema_components','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','441ee8ac-a8e2-42e7-a163-6325ff0cab06'),
	(25,'craft','m220413_024536_site_enabled_string','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','7442b59c-4d44-483f-b7b5-6f6023b8e060'),
	(26,'craft','m221027_160703_add_image_transform_fill','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','63b43a05-b20b-4fd7-9e05-f36baf03215a'),
	(27,'craft','m221028_130548_add_canonical_id_index','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','20bd0c2b-e3ea-4ada-bb44-fcfb5dc7d869'),
	(28,'craft','m221118_003031_drop_element_fks','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','3777da63-1c40-4361-8bd7-dc14de75d0ac'),
	(29,'craft','m230131_120713_asset_indexing_session_new_options','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','c66437f1-9719-4c36-9c41-19e2260dd3aa'),
	(30,'craft','m230226_013114_drop_plugin_license_columns','2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:52:17','4b8651e5-9fbd-4815-a661-9310836e78dd');

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
  UNIQUE KEY `craft_idx_ywgjvicxdpxogidafahlhgnzxfwddjnsffdg` (`handle`)
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
	('dateModified','1687542737'),
	('email.fromEmail','\"bauerindustries@icloud.com\"'),
	('email.fromName','\"craft coffeee\"'),
	('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
	('fieldGroups.ee1d7d23-5118-4ff6-8d3f-4d3138243883.name','\"Common\"'),
	('meta.__names__.35a3ba73-8300-4dee-acf2-2ac16819c8bf','\"craft coffeee\"'),
	('meta.__names__.958851dd-79e2-483f-8a6d-eeecd38a8043','\"craft coffeee\"'),
	('meta.__names__.ee1d7d23-5118-4ff6-8d3f-4d3138243883','\"Common\"'),
	('siteGroups.958851dd-79e2-483f-8a6d-eeecd38a8043.name','\"craft coffeee\"'),
	('sites.35a3ba73-8300-4dee-acf2-2ac16819c8bf.baseUrl','\"$PRIMARY_SITE_URL\"'),
	('sites.35a3ba73-8300-4dee-acf2-2ac16819c8bf.handle','\"default\"'),
	('sites.35a3ba73-8300-4dee-acf2-2ac16819c8bf.hasUrls','true'),
	('sites.35a3ba73-8300-4dee-acf2-2ac16819c8bf.language','\"en-US\"'),
	('sites.35a3ba73-8300-4dee-acf2-2ac16819c8bf.name','\"craft coffeee\"'),
	('sites.35a3ba73-8300-4dee-acf2-2ac16819c8bf.primary','true'),
	('sites.35a3ba73-8300-4dee-acf2-2ac16819c8bf.siteGroup','\"958851dd-79e2-483f-8a6d-eeecd38a8043\"'),
	('sites.35a3ba73-8300-4dee-acf2-2ac16819c8bf.sortOrder','1'),
	('system.edition','\"solo\"'),
	('system.live','true'),
	('system.name','\"craft coffeee\"'),
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
  KEY `craft_idx_nndfqlwcddujwlxgvbbhmqdmzuszwaikcnhh` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `craft_idx_pdjbudwugzmbxcykvraxcotqijrcscwwbarc` (`channel`,`fail`,`timeUpdated`,`delay`)
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
  UNIQUE KEY `craft_idx_vashthdjqavsbzhazolmgdxzjbbnqatgvqgl` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `craft_idx_uvidzdgokaspuycfnowkwohykzojunmuenkm` (`sourceId`),
  KEY `craft_idx_cfjzhsdkaxrnfuxtpbcuxfwlyhlbtcnhnjyw` (`targetId`),
  KEY `craft_idx_rqwpboennwnorqapcmyeazrxgurouufkuojv` (`sourceSiteId`),
  CONSTRAINT `craft_fk_jbncpvksglwwhkaagpxboukjrehxjafggfha` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_nnwepnrxvnjptbsycvspiqzsgimoofakvppf` FOREIGN KEY (`sourceSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_xootornnewgjrcrtbfhtgnnqvkzpihjmshjl` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
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
	('5041a449','@craft/web/assets/utilities/dist'),
	('68d90560','@craft/web/assets/garnish/dist'),
	('6fb3ecb','@craft/web/assets/selectize/dist'),
	('7cfc755','@craft/web/assets/installer/dist'),
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
  UNIQUE KEY `craft_idx_vzzorrqllbpcormajadrskrgsgtwatxaixpc` (`canonicalId`,`num`),
  KEY `craft_fk_yxykyhgmuxwzfwpvsunkcwnycxscijbjypdp` (`creatorId`),
  CONSTRAINT `craft_fk_uwdsdoauparyakpmqnaarpmdtxieedzdxmys` FOREIGN KEY (`canonicalId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_yxykyhgmuxwzfwpvsunkcwnycxscijbjypdp` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL
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
  FULLTEXT KEY `craft_idx_jizvvbjaojvzfcwojuwujruuhvjoptsmamav` (`keywords`)
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
  KEY `craft_idx_kpxgeclislzwuthhzjnrtknjslxtjxfuhssr` (`handle`),
  KEY `craft_idx_ljstqswivzayajaxiprxqvthuxuxnhyktgjg` (`name`),
  KEY `craft_idx_tpgcslqvhgjfamvvpoykozvqgabzgeftntjg` (`structureId`),
  KEY `craft_idx_kqturwcibicoyzovitdemmrwjngnoencsfwx` (`dateDeleted`),
  CONSTRAINT `craft_fk_naixcuinoptmhymdnokbgnoopjdmylulvhgj` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
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
  UNIQUE KEY `craft_idx_rsxkdpsdihzqefdlixvolipngeqboolaxmxk` (`sectionId`,`siteId`),
  KEY `craft_idx_flbogxswwiemzskqoymgczvhcfmpvaldgawb` (`siteId`),
  CONSTRAINT `craft_fk_haurwlulizwdwdygghwkjuxethesiranxseh` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_mmsndwkrhxmheqjvmzzfsvuuogftcgaapjyu` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_hmfywvlzqssbochjxgrevyvjltnwrhklhags` (`uid`),
  KEY `craft_idx_bowfijsdaykdljucdsmddsvssfhnnhwmufcf` (`token`),
  KEY `craft_idx_wgzpijsllnimspbfbarutpdmsjsupgnqjklm` (`dateUpdated`),
  KEY `craft_idx_drpxkfwwfifkoqekidohoywadgkvkvqmpjca` (`userId`),
  CONSTRAINT `craft_fk_hjqwhjlucnsrxawryvzfrftzmzxhkaqkndsv` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'NdU06uIy7yNttdYovCIUiajp9mLvcybgCyYcrXqaZ2hcklrTwzXq5bv_1El2rZkyhIq1m726oI7M6yjlNjFWB6J8w0e3-5xWYbkV','2023-06-23 17:56:15','2023-06-23 18:02:07','d87577e7-a16a-4ac0-9bbe-82fc7dc94f5b');

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
  UNIQUE KEY `craft_idx_ffhjltpldyrsbnihzwtateotsclrhbpmtkpt` (`userId`,`message`),
  CONSTRAINT `craft_fk_ryranznymvctlddfvczsrfomjxthfpcmflha` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_bnlbekqffqrsyvhbdqwdtsvgadkfaxtqdhrk` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_sitegroups` WRITE;
/*!40000 ALTER TABLE `craft_sitegroups` DISABLE KEYS */;

INSERT INTO `craft_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'craft coffeee','2023-06-23 17:52:17','2023-06-23 17:52:17',NULL,'958851dd-79e2-483f-8a6d-eeecd38a8043');

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
  KEY `craft_idx_rnnipezathqqpcrcauacrciwgohtphfrjauo` (`dateDeleted`),
  KEY `craft_idx_rbynqidpobswjqhqlbjxdqykyqzdaszgxdpq` (`handle`),
  KEY `craft_idx_cspyuaoqxqurorupjzfflubxldsfdcpbwgpv` (`sortOrder`),
  KEY `craft_fk_legvpnvtngnujrtkdfrmgtvkmqciutarsunl` (`groupId`),
  CONSTRAINT `craft_fk_legvpnvtngnujrtkdfrmgtvkmqciutarsunl` FOREIGN KEY (`groupId`) REFERENCES `craft_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_sites` WRITE;
/*!40000 ALTER TABLE `craft_sites` DISABLE KEYS */;

INSERT INTO `craft_sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,'true','craft coffeee','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-06-23 17:52:17','2023-06-23 17:52:17',NULL,'35a3ba73-8300-4dee-acf2-2ac16819c8bf');

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
  UNIQUE KEY `craft_idx_ozmlcegwrytaxqtbdjoblrlahzfmzpcqbnpg` (`structureId`,`elementId`),
  KEY `craft_idx_uotrnhpvjtujirovvuxehwtdmccbkiffgkqx` (`root`),
  KEY `craft_idx_gmbootubwzhpzzxheomggsxvuoncwwapqtrs` (`lft`),
  KEY `craft_idx_lagbwgigmqtkpudwexfottlzcbvdffxoxado` (`rgt`),
  KEY `craft_idx_qwamzixkbrqsaftyyqtluhmwtqiswfigyvtl` (`level`),
  KEY `craft_idx_jqaeisyntbktwgwivookanciinyunmgskqea` (`elementId`),
  CONSTRAINT `craft_fk_cwdmdyepkturqsqggrjergyidaviqlmmdtvb` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_kvrmbhvxhrstbyaftfupbcfyaxephxghhjdn` (`dateDeleted`)
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
  UNIQUE KEY `craft_idx_ioucncfoydkwsymjgzhzwanonvpngcasiobq` (`key`,`language`),
  KEY `craft_idx_hevwdpdmhjhkswlursmwarvkrbjgljkfegiz` (`language`)
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
  KEY `craft_idx_ewuvpwvbianrneyamqurnshijznboudsrxzp` (`name`),
  KEY `craft_idx_lgbvurdacmytdyerznebclkivfvbtwsnqcja` (`handle`),
  KEY `craft_idx_baemzsitogwcfmkvpkocpqmnkzighhlljpkl` (`dateDeleted`),
  KEY `craft_fk_ntdcemlubcgnjmkwdkareuiotgdsiizhqwnc` (`fieldLayoutId`),
  CONSTRAINT `craft_fk_ntdcemlubcgnjmkwdkareuiotgdsiizhqwnc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
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
  KEY `craft_idx_dofzouoitrjetgejmwpqcdeyvhdqlagoqrfd` (`groupId`),
  CONSTRAINT `craft_fk_cwcbkeopkfjgsonpmqkxalqvxlspeendseiu` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_jguzisvxynjzmtexnsovaudkmdbgcgppprpy` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `craft_idx_tynpfqynsbxqbcnyjnalyufsuwrrokzpswul` (`token`),
  KEY `craft_idx_nairinencwtrfatretdbfdlcmddiohxhqqry` (`expiryDate`)
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
  KEY `craft_idx_rzavdnbmpnkugyvqljtzqpwrprwdxtmfdguj` (`handle`),
  KEY `craft_idx_irvfproyqgifqkjwdamncdanpdtbezmkaqzt` (`name`)
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
  UNIQUE KEY `craft_idx_jzpbaeppetmrohcttjwccxpxvuxvpuwdfrkp` (`groupId`,`userId`),
  KEY `craft_idx_wenqkfjgrjwpsrgoybrjxxglyshggeckozvg` (`userId`),
  CONSTRAINT `craft_fk_gpmbgwzdorsdmyhaqhdbxsvpyirnudkbelbc` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_wdancnyndcvsknnpknxcvsqlrgsmzszwrbaw` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `craft_idx_ozryzxtsutyhfxvmayuhonskzkzoifxqrjpe` (`name`)
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
  UNIQUE KEY `craft_idx_stewfklxctezeyjbkhgulmluojklbidqevqd` (`permissionId`,`groupId`),
  KEY `craft_idx_oirrawwroadxjujnhnkncklggjbluxbmbogi` (`groupId`),
  CONSTRAINT `craft_fk_jlodtggdcwofejxdeqfhmevhkdfsjznynrbb` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_stfbxxgcfinhkcckcamcotquzqnatnnircaf` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `craft_idx_enediwpikuvidrskvrltbyjgtguxzzxezgbf` (`permissionId`,`userId`),
  KEY `craft_idx_lugxroldflkmaqizjwhfmuyeeirkmwplzbuz` (`userId`),
  CONSTRAINT `craft_fk_xfjpbijgjxnhwuehitwlzpoixkokscijodyf` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ywgprrdlnnpzbspybhudbdsqrudhtojjnnzt` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table craft_userpreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpreferences`;

CREATE TABLE `craft_userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `craft_fk_yqnvzkvinfxrlxlxmaierbamngtzmjmxegtr` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_czkddofpibkmkhtqzxkfihkbpmqniujqeyzs` (`active`),
  KEY `craft_idx_conalaytnvxrbtaxdrvirjcfpqcnmxoxqmyo` (`locked`),
  KEY `craft_idx_aslfunhrdwtjxrcvsfagamtoncxxtuaomalw` (`pending`),
  KEY `craft_idx_zvgoylhptwtqyzvsuhyxcxzefnqiillmrcoq` (`suspended`),
  KEY `craft_idx_vdwzahunoqrpppktawhybrjoqpwtipgcudqq` (`verificationCode`),
  KEY `craft_idx_kbyzwfdmpozpdpgmaxkjsccuaxrpvfiqzxar` (`email`),
  KEY `craft_idx_wckhagacmdlolaochmtqdahimjicnvrutljz` (`username`),
  KEY `craft_fk_yfcfsugrcslmhegcsagxvyzazznnoodewdce` (`photoId`),
  CONSTRAINT `craft_fk_yfcfsugrcslmhegcsagxvyzazznnoodewdce` FOREIGN KEY (`photoId`) REFERENCES `craft_assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_yqldjqbuasefzhtdfvxofyudjvkzlfjkqgat` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;

INSERT INTO `craft_users` (`id`, `photoId`, `active`, `pending`, `locked`, `suspended`, `admin`, `username`, `fullName`, `firstName`, `lastName`, `email`, `password`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`)
VALUES
	(1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'bauerindustries@icloud.com','$2y$13$8/x53iYKTZi6f7txwTHgLuWOSnw9HuHT5nuatRRwEOpDxz.j6Byfe','2023-06-23 17:56:15',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2023-06-23 17:52:17','2023-06-23 17:52:17','2023-06-23 17:56:17');

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
  UNIQUE KEY `craft_idx_amvodnmxsvuxdsxrilpnfzxdnaowootzxqvm` (`name`,`parentId`,`volumeId`),
  KEY `craft_idx_kynqxmvtlptwegcmsfejfzqdufvapjmgrnzo` (`parentId`),
  KEY `craft_idx_ueeorroftcskhnavggusykegzzqsbflyztth` (`volumeId`),
  CONSTRAINT `craft_fk_gfrrcebjfbefvrjprkirkjoajujyduotwjww` FOREIGN KEY (`parentId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_uvgytbcfuimrenlkdfftolufeijucytgrqot` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
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
  KEY `craft_idx_lgyjznhxcxpqokxrcmahyrgizqyooxsfshrd` (`name`),
  KEY `craft_idx_wxpvljhkrqsvtnjsdxdnecutviimkbhxccnc` (`handle`),
  KEY `craft_idx_fbbkyppbfqcukociqeqipvrptjzubabgrnto` (`fieldLayoutId`),
  KEY `craft_idx_zdyubnerdqmfvlywpwnplabtlafpdsffoswq` (`dateDeleted`),
  CONSTRAINT `craft_fk_llnbzhvprfbyejfggetygnvrisnulszvfgug` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
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
  KEY `craft_idx_xxncwymnqukphufdbqopksomggbjgugcjxol` (`userId`),
  CONSTRAINT `craft_fk_rzqqouixfjzmgunteqrumrxtrcfyzymjttbv` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-06-23 17:56:17','2023-06-23 17:56:17','9d9946ae-ae78-4fa2-a349-eeba3857c05f'),
	(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-06-23 17:56:17','2023-06-23 17:56:17','807f2ae7-0358-48f5-985a-be5aa9192a00'),
	(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-06-23 17:56:17','2023-06-23 17:56:17','39bf4731-7478-4bc1-8d8c-94581c894d6a'),
	(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-06-23 17:56:17','2023-06-23 17:56:17','612ac40c-6385-49e6-8f42-8a76659df63c');

/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
