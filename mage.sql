-- --------------------------------------------------------
-- Host:                         192.168.10.4
-- Server version:               8.0.27-0ubuntu0.20.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mageclean
CREATE DATABASE IF NOT EXISTS `mageclean` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mageclean`;

-- Dumping structure for table mageclean.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.addon_account: ~2 rows (approximately)
DELETE FROM `addon_account`;
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('kek_kristaly', 'Kék tároló', 1),
	('kek_kristaly_money', 'Kék tároló', 1),
	('sarga_kristaly', 'Sárga tároló', 1),
	('sarga_kristaly_money', 'Sárga tároló', 1),
	('society_magiaugy', 'Mágiaügyi minisztérium', 1),
	('society_magiaugy_money', 'Mágiaügyi minisztérium', 1),
	('society_school', 'Roxfort Boszorkány- és Varázslóképző', 1),
	('society_school_money', 'Roxfort Boszorkány- és Varázslóképző', 1),
	('vault', 'Személyes tároló', 0),
	('vault_money', 'Személyes tároló', 0),
	('voros_kristaly', 'Vörös tároló', 1),
	('voros_kristaly_money', 'Vörös tároló', 1),
	('zold_kristaly', 'Zöld tároló', 1),
	('zold_kristaly_money', 'Zöld tároló', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumping structure for table mageclean.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.addon_account_data: ~144 rows (approximately)
DELETE FROM `addon_account_data`;
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumping structure for table mageclean.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.addon_inventory: ~7 rows (approximately)
DELETE FROM `addon_inventory`;
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('kek_kristaly', 'Kék tároló', 1),
	('sarga_kristaly', 'Sárga tároló', 1),
	('society_magiaugy', 'Mágiaügyi minisztérium', 1),
	('society_school', 'Roxfort Boszorkány- és Varázslóképző', 1),
	('vault', 'Személyes tároló', 0),
	('voros_kristaly', 'Vörös tároló', 1),
	('zold_kristaly', 'Zöld tároló', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumping structure for table mageclean.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.addon_inventory_items: ~175 rows (approximately)
DELETE FROM `addon_inventory_items`;
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumping structure for procedure mageclean.ADD_COLUMN_IF_NOT_EXISTS
DELIMITER //
CREATE PROCEDURE `ADD_COLUMN_IF_NOT_EXISTS`(
  IN dbName    tinytext,
  IN tableName tinytext,
  IN fieldName tinytext,
  IN fieldDef  text
)
BEGIN
  IF NOT EXISTS (
    SELECT * FROM information_schema.COLUMNS
    WHERE `column_name`  = fieldName
    AND   `table_name`   = tableName
    AND   `table_schema` = dbName
  )
  THEN
    SET @ddl=CONCAT('ALTER TABLE ', dbName, '.', tableName, ' ADD COLUMN ', fieldName, ' ', fieldDef);
    PREPARE stmt from @ddl;
    EXECUTE stmt;
  END IF;
END//
DELIMITER ;

-- Dumping structure for procedure mageclean.CharDel
DELIMITER //
CREATE PROCEDURE `CharDel`(
	IN `personid` nvarchar(50)
)
BEGIN

declare LID nvarchar(50);
set LID   = personid;

DELETE FROM billing WHERE identifier = LID;
DELETE FROM car_parking WHERE owner = LID;
DELETE FROM datastore_data WHERE owner = LID;
DELETE FROM h_impounded_vehicles WHERE identifier = LID;
DELETE FROM jailed WHERE identifier = LID;
DELETE FROM mdt_reports WHERE char_id = LID;
DELETE FROM owned_shops WHERE identifier = LID;
DELETE FROM owned_vehicles WHERE owner = LID;
DELETE FROM users WHERE identifier = LID;
DELETE FROM user_licenses WHERE owner = LID;
DELETE FROM user_documents WHERE owner = LID;
DELETE FROM user_mdt WHERE char_id = LID;
END//
DELIMITER ;

-- Dumping structure for table mageclean.communityservice
CREATE TABLE IF NOT EXISTS `communityservice` (
  `identifier` varchar(100) NOT NULL,
  `actions_remaining` int NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.communityservice: ~0 rows (approximately)
DELETE FROM `communityservice`;
/*!40000 ALTER TABLE `communityservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `communityservice` ENABLE KEYS */;

-- Dumping structure for table mageclean.craftingtables
CREATE TABLE IF NOT EXISTS `craftingtables` (
  `location` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.craftingtables: ~4 rows (approximately)
DELETE FROM `craftingtables`;
/*!40000 ALTER TABLE `craftingtables` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftingtables` ENABLE KEYS */;

-- Dumping structure for table mageclean.custom_ped
CREATE TABLE IF NOT EXISTS `custom_ped` (
  `identifier` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table mageclean.custom_ped: ~6 rows (approximately)
DELETE FROM `custom_ped`;
/*!40000 ALTER TABLE `custom_ped` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_ped` ENABLE KEYS */;

-- Dumping structure for table mageclean.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.datastore: ~7 rows (approximately)
DELETE FROM `datastore`;
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('kek_kristaly', 'Kék tároló', 1),
	('society_magiaugy', 'Mágiaügyi minisztérium', 1),
	('society_school', 'Roxfort Boszorkány- és Varázslóképző Szakiskola', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumping structure for table mageclean.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.datastore_data: ~0 rows (approximately)
DELETE FROM `datastore_data`;
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumping structure for table mageclean.dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table mageclean.dpkeybinds: ~121 rows (approximately)
DELETE FROM `dpkeybinds`;
/*!40000 ALTER TABLE `dpkeybinds` DISABLE KEYS */;
/*!40000 ALTER TABLE `dpkeybinds` ENABLE KEYS */;

-- Dumping structure for table mageclean.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `OwnerId` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `WarDate` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- Dumping data for table mageclean.groups: ~4 rows (approximately)
DELETE FROM `groups`;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table mageclean.haboruk
CREATE TABLE IF NOT EXISTS `haboruk` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `acsapatID` int NOT NULL,
  `bcsapatID` int DEFAULT NULL,
  `acsapat` json DEFAULT NULL,
  `bcsapat` json DEFAULT NULL,
  `hq` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `idopont` datetime NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- Dumping data for table mageclean.haboruk: ~0 rows (approximately)
DELETE FROM `haboruk`;
/*!40000 ALTER TABLE `haboruk` DISABLE KEYS */;
/*!40000 ALTER TABLE `haboruk` ENABLE KEYS */;

-- Dumping structure for table mageclean.hqs
CREATE TABLE IF NOT EXISTS `hqs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `item` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ownerClan` int DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Color` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- Dumping data for table mageclean.hqs: ~4 rows (approximately)
DELETE FROM `hqs`;
/*!40000 ALTER TABLE `hqs` DISABLE KEYS */;
INSERT INTO `hqs` (`ID`, `item`, `ownerClan`, `Name`, `Color`) VALUES
	(1, 'zold_kristaly', 37, 'Resurrectio Domus', '31, 185, 0, 0.726'),
	(2, 'voros_kristaly', 42, 'Vita Domus', '185, 0, 0, 0.726'),
	(3, 'kek_kristaly', 43, 'Magus Domus', '0, 0, 185, 0.726'),
	(4, 'sarga_kristaly', 37, 'Tempus Domus', '185, 185, 0, 0.726');
/*!40000 ALTER TABLE `hqs` ENABLE KEYS */;

-- Dumping structure for table mageclean.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(120) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int NOT NULL DEFAULT '1',
  `rare` tinyint NOT NULL DEFAULT '0',
  `can_remove` tinyint NOT NULL DEFAULT '1',
  `price` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.items: ~399 rows (approximately)
DELETE FROM `items`;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `price`) VALUES
	('advancedrifle', 'CTAR-21', -1, 0, 1, 0),
	('appistol', 'Colt SCAMP', -1, 0, 1, 0),
	('assaultrifle', 'AK 47', -1, 0, 1, 0),
	('assaultrifle_mk2', 'assaultrifle_mk2', -1, 0, 1, 0),
	('assaultshotgun', 'UTAS UTS-15', -1, 0, 1, 0),
	('assaultsmg', 'Magpul PDR', -1, 0, 1, 0),
	('autoshotgun', 'AA-12', -1, 0, 1, 0),
	('ball', 'ball', -1, 0, 1, 0),
	('ball_ammo', 'ball_ammo', 1, 0, 1, 0),
	('bat', 'Baseball Bat', -1, 0, 1, 0),
	('battleaxe', 'Battle Axe', -1, 0, 1, 0),
	('beer', 'Sör', 1, 0, 1, 0),
	('bird_crap_ammo', 'bird_crap_ammo', 1, 0, 1, 0),
	('bolcacahuetes', 'Mogyoró', 1, 0, 1, 0),
	('bolnoixcajou', 'Kesudió', 1, 0, 1, 0),
	('bottle', 'Bottle', -1, 0, 1, 0),
	('bread', 'Kenyér', 1, 0, 1, 0),
	('bullpuprifle', 'Type 86-S', -1, 0, 1, 0),
	('bullpuprifle_mk2', 'bullpuprifle_mk2', -1, 0, 1, 0),
	('bullpupshotgun', 'Kel-Tec KSG', -1, 0, 1, 0),
	('bzgas', 'bz gas', -1, 0, 1, 0),
	('B_0_ALOHOMORA_1', 'Alohomora - Alapok', 6, 0, 1, 80),
	('B_0_BLOWAROUND-SMOKE_1', 'Fumus Murum - Alapok', 6, 0, 1, 75),
	('B_0_INVITO_1', 'Invito Nimbus - Alapok', 6, 0, 1, 45),
	('B_0_LUMOS_1', 'Lumos - Alapok', 6, 0, 1, 40),
	('B_0_TELEPORT2_1', 'Movent Multa - Alapok', 6, 0, 1, 200),
	('B_0_TELEPORT_1', 'Permoveo - Alapok', 6, 0, 1, 120),
	('B_0_WALL_10', 'Defendo - Alapok', 0, 0, 1, 40),
	('B_10_BLOWAROUND-EXPLOSION_1', 'Circulus Crepitus - Alapok', 6, 0, 1, 250),
	('B_10_BLOWAROUND-FIRE_1', 'Murus Ignis - Alapok', 6, 0, 1, 200),
	('B_10_BLOW_1', 'Crepitus', 6, 0, 1, 110),
	('B_10_FIRE_1', 'Ignis - Alapok', 6, 0, 1, 100),
	('B_11_AVADAKEDABRA_1', 'Avada Kedavra - Alapok', 6, 0, 1, 20000),
	('B_11_BLACKBLOW_1', 'Crepito - Alapok', 6, 0, 1, 10000),
	('B_11_BLACKFIRE_1', 'Ignitio - Alapok', 6, 0, 1, 7500),
	('B_11_IMPERIO_1', 'Imperio - Alapok', 0, 0, 1, 30000),
	('B_11_PORTAL1_10', 'Átjáró', 6, 0, 1, 100000),
	('B_11_PORTAL2_10', 'Átjáró', 6, 0, 1, 200000),
	('B_11_PORTAL3_10', 'Átjáró', 6, 0, 1, 300000),
	('B_11_PORTAL4_10', 'Átjáró', 6, 0, 1, 400000),
	('B_11_PORTAL5_10', 'Átjáró', 6, 0, 1, 500000),
	('B_11_PORTAL6_10', 'Átjáró', 6, 0, 1, 600000),
	('B_1_STUN_1', 'Stupor  - Alapok', 6, 0, 1, 750),
	('B_1_WATER_1', 'Aqua', 6, 0, 1, 500),
	('B_2_REVIVE_1', 'Resurrectio', 6, 0, 1, 2500),
	('carbinerifle', 'M4A1', -1, 0, 1, 0),
	('carbinerifle_mk2', 'carbinerifle_mk2', -1, 0, 1, 0),
	('chips', 'NikNaks', 1, 0, 1, 0),
	('chocolate', 'Dairy Milk', 1, 0, 1, 0),
	('combatmg', 'M249E1', -1, 0, 1, 0),
	('combatmg_mk2', 'combatmg_mk2', -1, 0, 1, 0),
	('combatpdw', 'SIG Sauer MPX', -1, 0, 1, 0),
	('combatpistol', 'Sig Sauer P228', -1, 0, 1, 0),
	('compactlauncher', 'M79 GL', -1, 0, 1, 0),
	('compactrifle', 'Micro Draco AK Pistol', -1, 0, 1, 0),
	('craftingtable', 'Varázsló készlet', 1, 0, 1, 0),
	('crowbar', 'Crow Bar', -1, 0, 1, 0),
	('dagger', 'Dagger', -1, 0, 1, 0),
	('dbshotgun', 'Zabala short-barreled side-by-side shotgun', -1, 0, 1, 0),
	('digiscanner', 'digiscanner', -1, 0, 1, 0),
	('doubleaction', 'doubleaction', -1, 0, 1, 0),
	('enemy_laser_ammo', 'enemy_laser_ammo', 1, 0, 1, 0),
	('fireextinguisher', 'Fire Extinguisher', -1, 0, 1, 0),
	('fireextinguisher_ammo', 'fireextinguisher_ammo', 1, 0, 1, 0),
	('firework', 'Firework', -1, 0, 1, 0),
	('flare', 'Flare', -1, 0, 1, 0),
	('flaregun', 'Varázspálca - Főnix toll', -1, 0, 1, 0),
	('flare_ammo', 'Flares', 1, 0, 1, 0),
	('flashlight', 'Flashlight', -1, 0, 1, 0),
	('garbagebag', 'garbagebag', -1, 0, 1, 0),
	('golfclub', 'Golf Club', -1, 0, 1, 0),
	('gomba1', 'Fehér Gomba', 1, 0, 1, 0),
	('gomba2', 'Piros Gomba', 1, 0, 1, 0),
	('gomba3', 'Sárga Gomba', 1, 0, 1, 0),
	('gomba4', 'Zöld Gomba', 1, 0, 1, 0),
	('grapperaisin', 'Szőlő', 1, 0, 1, 0),
	('grenade', 'grenade', -1, 0, 1, 0),
	('grenadelauncher', 'Milkor MGL', -1, 0, 1, 0),
	('grenadelauncher_ammo', 'grenadelauncher_ammo', 1, 0, 1, 0),
	('grenadelauncher_smoke_ammo', 'grenadelauncher_smoke_ammo', 1, 0, 1, 0),
	('gusenberg', 'M1928A1 Thompson SMG', -1, 0, 1, 0),
	('gzgas_ammo', 'gzgas_ammo', 1, 0, 1, 0),
	('hamburger', 'Hamburger', 1, 0, 1, 0),
	('hammer', 'Hammer', -1, 0, 1, 0),
	('handcuffs', 'handcuffs', -1, 0, 1, 0),
	('hatchet', 'hatchet', -1, 0, 1, 0),
	('heavypistol', 'EWB 1911', -1, 0, 1, 0),
	('heavyshotgun', 'Saiga-12K', -1, 0, 1, 0),
	('heavysniper', 'M107', -1, 0, 1, 0),
	('heavysniper_mk2', 'heavysniper_mk2', -1, 0, 1, 0),
	('hominglauncher', 'SA-7 Grail', -1, 0, 1, 0),
	('jagerbomb', 'Jägerbomba', 1, 0, 1, 0),
	('jagercerbere', 'Jäger-Gyömbér', 1, 0, 1, 0),
	('jusfruit', 'Gyümölcslé', 1, 0, 1, 0),
	('kek_kristaly', 'Kék Kristály', 5, 0, 1, 0),
	('knife', 'Knife', -1, 0, 1, 0),
	('knuckle', 'Knuckledusters', -1, 0, 1, 0),
	('konnyito', 'Lux Onum', -50, 0, 1, 0),
	('machete', 'machete', -1, 0, 1, 0),
	('machinepistol', 'TEC-9', -1, 0, 1, 0),
	('marksmanpistol', 'Thompson-Center Contender G2', -1, 0, 1, 0),
	('marksmanrifle', 'M39 EMR', -1, 0, 1, 0),
	('marksmanrifle_mk2', 'marksmanrifle_mk2', -1, 0, 1, 0),
	('martini', 'Martini', 1, 0, 1, 0),
	('mcdonalds_burger', 'Dupla burger', 1, 0, 1, 0),
	('mg', 'PKP Pecheneg', -1, 0, 1, 0),
	('mg_ammo', 'MG Ammo', 1, 0, 1, 0),
	('microsmg', 'Micro SMG', -1, 0, 1, 0),
	('minigun', 'minigun', -1, 0, 1, 0),
	('minigun_ammo', 'Minigun Ammo', 1, 0, 1, 0),
	('minismg', 'Skorpion Vz. 61', -1, 0, 1, 0),
	('mixapero', 'Mix Apero', 1, 0, 1, 0),
	('mojito', 'Mojito', 1, 0, 1, 0),
	('molotov', 'Molotov Cocktail', -1, 0, 1, 0),
	('molotov_ammo', 'molotov_ammo', 1, 0, 1, 0),
	('musket', 'Brown Bess', -1, 0, 1, 0),
	('m_0_ALOHOMORA_1', 'Alohomora', 0, 0, 1, 0),
	('m_0_ALOHOMORA_10', 'Alohomora', 0, 0, 1, 0),
	('m_0_ALOHOMORA_2', 'Alohomora', 0, 0, 1, 0),
	('m_0_ALOHOMORA_3', 'Alohomora', 0, 0, 1, 0),
	('m_0_ALOHOMORA_4', 'Alohomora', 0, 0, 1, 0),
	('m_0_ALOHOMORA_5', 'Alohomora', 0, 0, 1, 0),
	('m_0_ALOHOMORA_6', 'Alohomora', 0, 0, 1, 0),
	('m_0_ALOHOMORA_7', 'Alohomora', 0, 0, 1, 0),
	('m_0_ALOHOMORA_8', 'Alohomora', 0, 0, 1, 0),
	('m_0_ALOHOMORA_9', 'Alohomora', 0, 0, 1, 0),
	('m_0_BLOWAROUND-SMOKE_1', 'Fumus Murum', 0, 0, 1, 0),
	('m_0_BLOWAROUND-SMOKE_10', 'Fumus Murum', 0, 0, 1, 0),
	('m_0_BLOWAROUND-SMOKE_2', 'Fumus Murum', 0, 0, 1, 0),
	('m_0_BLOWAROUND-SMOKE_3', 'Fumus Murum', 0, 0, 1, 0),
	('m_0_BLOWAROUND-SMOKE_4', 'Fumus Murum', 0, 0, 1, 0),
	('m_0_BLOWAROUND-SMOKE_5', 'Fumus Murum', 0, 0, 1, 0),
	('m_0_BLOWAROUND-SMOKE_6', 'Fumus Murum', 0, 0, 1, 0),
	('m_0_BLOWAROUND-SMOKE_7', 'Fumus Murum', 0, 0, 1, 0),
	('m_0_BLOWAROUND-SMOKE_8', 'Fumus Murum', 0, 0, 1, 0),
	('m_0_BLOWAROUND-SMOKE_9', 'Fumus Murum', 0, 0, 1, 0),
	('m_0_BLOWAROUND-WATER_1', 'Murum Aquarum', 0, 0, 1, 0),
	('m_0_CLONE_1', 'Duplicare', 0, 0, 1, 0),
	('m_0_CLONE_10', 'Duplicare', 0, 0, 1, 0),
	('m_0_CLONE_2', 'Duplicare', 0, 0, 1, 0),
	('m_0_CLONE_3', 'Duplicare', 0, 0, 1, 0),
	('m_0_CLONE_4', 'Duplicare', 0, 0, 1, 0),
	('m_0_CLONE_5', 'Duplicare', 0, 0, 1, 0),
	('m_0_CLONE_6', 'Duplicare', 0, 0, 1, 0),
	('m_0_CLONE_7', 'Duplicare', 0, 0, 1, 0),
	('m_0_CLONE_8', 'Duplicare', 0, 0, 1, 0),
	('m_0_CLONE_9', 'Duplicare', 0, 0, 1, 0),
	('m_0_CUFF_10', 'Decipio', 0, 0, 1, 0),
	('m_0_IMMOBILIZE_10', 'Immobiles', 0, 0, 1, 0),
	('m_0_INVITO_1', 'Invito Nimbus 1000', 0, 0, 1, 0),
	('m_0_INVITO_10', 'Invito Nimbus 8000', 0, 0, 1, 0),
	('m_0_INVITO_2', 'Invito Nimbus 1500', 0, 0, 1, 0),
	('m_0_INVITO_3', 'Invito Nimbus 2000', 0, 0, 1, 0),
	('m_0_INVITO_4', 'Invito Nimbus 2500', 0, 0, 1, 0),
	('m_0_INVITO_5', 'Invito Nimbus 3000', 0, 0, 1, 0),
	('m_0_INVITO_6', 'Invito Nimbus 4000', 0, 0, 1, 0),
	('m_0_INVITO_7', 'Invito Nimbus 5000', 0, 0, 1, 0),
	('m_0_INVITO_8', 'Invito Nimbus 6000', 0, 0, 1, 0),
	('m_0_INVITO_9', 'Invito Nimbus 7000', 0, 0, 1, 0),
	('m_0_LEVIOSA_1', 'Leviosa', 0, 0, 1, 0),
	('m_0_LEVIOSA_10', 'Leviosa', 0, 0, 1, 0),
	('m_0_LEVIOSA_2', 'Leviosa', 0, 0, 1, 0),
	('m_0_LEVIOSA_3', 'Leviosa', 0, 0, 1, 0),
	('m_0_LEVIOSA_4', 'Leviosa', 0, 0, 1, 0),
	('m_0_LEVIOSA_5', 'Leviosa', 0, 0, 1, 0),
	('m_0_LEVIOSA_6', 'Leviosa', 0, 0, 1, 0),
	('m_0_LEVIOSA_7', 'Leviosa', 0, 0, 1, 0),
	('m_0_LEVIOSA_8', 'Leviosa', 0, 0, 1, 0),
	('m_0_LEVIOSA_9', 'Leviosa', 0, 0, 1, 0),
	('m_0_LUMOS_1', 'Lumos', 0, 0, 1, 0),
	('m_0_LUMOS_10', 'Lumos', 0, 0, 1, 0),
	('m_0_LUMOS_2', 'Lumos', 0, 0, 1, 0),
	('m_0_LUMOS_3', 'Lumos', 0, 0, 1, 0),
	('m_0_LUMOS_4', 'Lumos', 0, 0, 1, 0),
	('m_0_LUMOS_5', 'Lumos', 0, 0, 1, 0),
	('m_0_LUMOS_6', 'Lumos', 0, 0, 1, 0),
	('m_0_LUMOS_7', 'Lumos', 0, 0, 1, 0),
	('m_0_LUMOS_8', 'Lumos', 0, 0, 1, 0),
	('m_0_LUMOS_9', 'Lumos', 0, 0, 1, 0),
	('m_0_MOMENTUM_1', 'Prohibere Momentum', 0, 0, 1, 0),
	('m_0_MOMENTUM_10', 'Prohibere Momentum', 0, 0, 1, 0),
	('m_0_MOMENTUM_2', 'Prohibere Momentum', 0, 0, 1, 0),
	('m_0_MOMENTUM_3', 'Prohibere Momentum', 0, 0, 1, 0),
	('m_0_MOMENTUM_4', 'Prohibere Momentum', 0, 0, 1, 0),
	('m_0_MOMENTUM_5', 'Prohibere Momentum', 0, 0, 1, 0),
	('m_0_MOMENTUM_6', 'Prohibere Momentum', 0, 0, 1, 0),
	('m_0_MOMENTUM_7', 'Prohibere Momentum', 0, 0, 1, 0),
	('m_0_MOMENTUM_8', 'Prohibere Momentum', 0, 0, 1, 0),
	('m_0_MOMENTUM_9', 'Prohibere Momentum', 0, 0, 1, 0),
	('m_0_TELEPORT2_1', 'Movent Multa', 0, 0, 1, 0),
	('m_0_TELEPORT2_10', 'Movent Multa', 0, 0, 1, 0),
	('m_0_TELEPORT2_2', 'Movent Multa', 0, 0, 1, 0),
	('m_0_TELEPORT2_3', 'Movent Multa', 0, 0, 1, 0),
	('m_0_TELEPORT2_4', 'Movent Multa', 0, 0, 1, 0),
	('m_0_TELEPORT2_5', 'Movent Multa', 0, 0, 1, 0),
	('m_0_TELEPORT2_6', 'Movent Multa', 0, 0, 1, 0),
	('m_0_TELEPORT2_7', 'Movent Multa', 0, 0, 1, 0),
	('m_0_TELEPORT2_8', 'Movent Multa', 0, 0, 1, 0),
	('m_0_TELEPORT2_9', 'Movent Multa', 0, 0, 1, 0),
	('m_0_TELEPORT_1', 'Permoveo', 0, 0, 1, 0),
	('m_0_TELEPORT_10', 'Permoveo', 0, 0, 1, 0),
	('m_0_TELEPORT_2', 'Permoveo', 0, 0, 1, 0),
	('m_0_TELEPORT_3', 'Permoveo', 0, 0, 1, 0),
	('m_0_TELEPORT_4', 'Permoveo', 0, 0, 1, 0),
	('m_0_TELEPORT_5', 'Permoveo', 0, 0, 1, 0),
	('m_0_TELEPORT_6', 'Permoveo', 0, 0, 1, 0),
	('m_0_TELEPORT_7', 'Permoveo', 0, 0, 1, 0),
	('m_0_TELEPORT_8', 'Permoveo', 0, 0, 1, 0),
	('m_0_TELEPORT_9', 'Permoveo', 0, 0, 1, 0),
	('m_0_WALL_10', 'Defendo', 0, 0, 1, 0),
	('m_10_BLOWAROUND-EXPLOSION_1', 'Circulus Crepitus', 0, 0, 1, 0),
	('m_10_BLOWAROUND-EXPLOSION_10', 'Circulus Crepitus', 0, 0, 1, 0),
	('m_10_BLOWAROUND-EXPLOSION_2', 'Circulus Crepitus', 0, 0, 1, 0),
	('m_10_BLOWAROUND-EXPLOSION_3', 'Circulus Crepitus', 0, 0, 1, 0),
	('m_10_BLOWAROUND-EXPLOSION_4', 'Circulus Crepitus', 0, 0, 1, 0),
	('m_10_BLOWAROUND-EXPLOSION_5', 'Circulus Crepitus', 0, 0, 1, 0),
	('m_10_BLOWAROUND-EXPLOSION_6', 'Circulus Crepitus', 0, 0, 1, 0),
	('m_10_BLOWAROUND-EXPLOSION_7', 'Circulus Crepitus', 0, 0, 1, 0),
	('m_10_BLOWAROUND-EXPLOSION_8', 'Circulus Crepitus', 0, 0, 1, 0),
	('m_10_BLOWAROUND-EXPLOSION_9', 'Circulus Crepitus', 0, 0, 1, 0),
	('m_10_BLOWAROUND-FIRE_1', 'Murus Ignis', 0, 0, 1, 0),
	('m_10_BLOWAROUND-FIRE_10', 'Murus Ignis', 0, 0, 1, 0),
	('m_10_BLOWAROUND-FIRE_2', 'Murus Ignis', 0, 0, 1, 0),
	('m_10_BLOWAROUND-FIRE_3', 'Murus Ignis', 0, 0, 1, 0),
	('m_10_BLOWAROUND-FIRE_4', 'Murus Ignis', 0, 0, 1, 0),
	('m_10_BLOWAROUND-FIRE_5', 'Murus Ignis', 0, 0, 1, 0),
	('m_10_BLOWAROUND-FIRE_6', 'Murus Ignis', 0, 0, 1, 0),
	('m_10_BLOWAROUND-FIRE_7', 'Murus Ignis', 0, 0, 1, 0),
	('m_10_BLOWAROUND-FIRE_8', 'Murus Ignis', 0, 0, 1, 0),
	('m_10_BLOWAROUND-FIRE_9', 'Murus Ignis', 0, 0, 1, 0),
	('m_10_BLOW_1', 'Crepitus', 0, 0, 1, 0),
	('m_10_BLOW_10', 'Crepitus', 0, 0, 1, 0),
	('m_10_BLOW_2', 'Crepitus', 0, 0, 1, 0),
	('m_10_BLOW_3', 'Crepitus', 0, 0, 1, 0),
	('m_10_BLOW_4', 'Crepitus', 0, 0, 1, 0),
	('m_10_BLOW_5', 'Crepitus', 0, 0, 1, 0),
	('m_10_BLOW_6', 'Crepitus', 0, 0, 1, 0),
	('m_10_BLOW_7', 'Crepitus', 0, 0, 1, 0),
	('m_10_BLOW_8', 'Crepitus', 0, 0, 1, 0),
	('m_10_BLOW_9', 'Crepitus', 0, 0, 1, 0),
	('m_10_FIRE_1', 'Ignis', 0, 0, 1, 0),
	('m_10_FIRE_10', 'Ignis', 0, 0, 1, 0),
	('m_10_FIRE_2', 'Ignis', 0, 0, 1, 0),
	('m_10_FIRE_3', 'Ignis', 0, 0, 1, 0),
	('m_10_FIRE_4', 'Ignis', 0, 0, 1, 0),
	('m_10_FIRE_5', 'Ignis', 0, 0, 1, 0),
	('m_10_FIRE_6', 'Ignis', 0, 0, 1, 0),
	('m_10_FIRE_7', 'Ignis', 0, 0, 1, 0),
	('m_10_FIRE_8', 'Ignis', 0, 0, 1, 0),
	('m_10_FIRE_9', 'Ignis', 0, 0, 1, 0),
	('m_11_AVADAKEDABRA_1', 'Avada Kedavra', 0, 0, 1, 0),
	('m_11_AVADAKEDABRA_10', 'Avada Kedavra', 0, 0, 1, 0),
	('m_11_AVADAKEDABRA_2', 'Avada Kedavra', 0, 0, 1, 0),
	('m_11_AVADAKEDABRA_3', 'Avada Kedavra', 0, 0, 1, 0),
	('m_11_AVADAKEDABRA_4', 'Avada Kedavra', 0, 0, 1, 0),
	('m_11_AVADAKEDABRA_5', 'Avada Kedavra', 0, 0, 1, 0),
	('m_11_AVADAKEDABRA_6', 'Avada Kedavra', 0, 0, 1, 0),
	('m_11_AVADAKEDABRA_7', 'Avada Kedavra', 0, 0, 1, 0),
	('m_11_AVADAKEDABRA_8', 'Avada Kedavra', 0, 0, 1, 0),
	('m_11_AVADAKEDABRA_9', 'Avada Kedavra', 0, 0, 1, 0),
	('m_11_BLACKBLOW_1', 'Crepito', 0, 0, 1, 0),
	('m_11_BLACKBLOW_10', 'Crepito', 0, 0, 1, 0),
	('m_11_BLACKBLOW_2', 'Crepito', 0, 0, 1, 0),
	('m_11_BLACKBLOW_3', 'Crepito', 0, 0, 1, 0),
	('m_11_BLACKBLOW_4', 'Crepito', 0, 0, 1, 0),
	('m_11_BLACKBLOW_5', 'Crepito', 0, 0, 1, 0),
	('m_11_BLACKBLOW_6', 'Crepito', 0, 0, 1, 0),
	('m_11_BLACKBLOW_7', 'Crepito', 0, 0, 1, 0),
	('m_11_BLACKBLOW_8', 'Crepito', 0, 0, 1, 0),
	('m_11_BLACKBLOW_9', 'Crepito', 0, 0, 1, 0),
	('m_11_BLACKFIRE_1', 'Ignitio', 0, 0, 1, 0),
	('m_11_BLACKFIRE_10', 'Ignitio', 0, 0, 1, 0),
	('m_11_BLACKFIRE_2', 'Ignitio', 0, 0, 1, 0),
	('m_11_BLACKFIRE_3', 'Ignitio', 0, 0, 1, 0),
	('m_11_BLACKFIRE_4', 'Ignitio', 0, 0, 1, 0),
	('m_11_BLACKFIRE_5', 'Ignitio', 0, 0, 1, 0),
	('m_11_BLACKFIRE_6', 'Ignitio', 0, 0, 1, 0),
	('m_11_BLACKFIRE_7', 'Ignitio', 0, 0, 1, 0),
	('m_11_BLACKFIRE_8', 'Ignitio', 0, 0, 1, 0),
	('m_11_BLACKFIRE_9', 'Ignitio', 0, 0, 1, 0),
	('m_11_IMPERIO_1', 'Imperio', 0, 0, 1, 0),
	('m_11_IMPERIO_10', 'Imperio', 0, 0, 1, 0),
	('m_11_IMPERIO_2', 'Imperio', 0, 0, 1, 0),
	('m_11_IMPERIO_3', 'Imperio', 0, 0, 1, 0),
	('m_11_IMPERIO_4', 'Imperio', 0, 0, 1, 0),
	('m_11_IMPERIO_5', 'Imperio', 0, 0, 1, 0),
	('m_11_IMPERIO_6', 'Imperio', 0, 0, 1, 0),
	('m_11_IMPERIO_7', 'Imperio', 0, 0, 1, 0),
	('m_11_IMPERIO_8', 'Imperio', 0, 0, 1, 0),
	('m_11_IMPERIO_9', 'Imperio', 0, 0, 1, 0),
	('m_11_PORTAL1_10', 'Átjáró', 0, 0, 1, 0),
	('m_11_PORTAL2_10', 'Átjáró', 0, 0, 1, 0),
	('m_11_PORTAL3_10', 'Átjáró', 0, 0, 1, 0),
	('m_11_PORTAL4_10', 'Átjáró', 0, 0, 1, 0),
	('m_11_PORTAL5_10', 'Átjáró', 0, 0, 1, 0),
	('m_11_PORTAL6_10', 'Átjáró', 0, 0, 1, 0),
	('m_1_STUN_1', 'Stupor', 0, 0, 1, 0),
	('m_1_STUN_10', 'Stupor', 0, 0, 1, 0),
	('m_1_STUN_2', 'Stupor', 0, 0, 1, 0),
	('m_1_STUN_3', 'Stupor', 0, 0, 1, 0),
	('m_1_STUN_4', 'Stupor', 0, 0, 1, 0),
	('m_1_STUN_5', 'Stupor', 0, 0, 1, 0),
	('m_1_STUN_6', 'Stupor', 0, 0, 1, 0),
	('m_1_STUN_7', 'Stupor', 0, 0, 1, 0),
	('m_1_STUN_8', 'Stupor', 0, 0, 1, 0),
	('m_1_STUN_9', 'Stupor', 0, 0, 0, 0),
	('m_1_WATER_1', 'Aqua', 0, 0, 1, 0),
	('m_1_WATER_10', 'Aqua', 0, 0, 1, 0),
	('m_1_WATER_2', 'Aqua', 0, 0, 1, 0),
	('m_1_WATER_3', 'Aqua', 0, 0, 1, 0),
	('m_1_WATER_4', 'Aqua', 0, 0, 1, 0),
	('m_1_WATER_5', 'Aqua', 0, 0, 1, 0),
	('m_1_WATER_6', 'Aqua', 0, 0, 1, 0),
	('m_1_WATER_7', 'Aqua', 0, 0, 1, 0),
	('m_1_WATER_8', 'Aqua', 0, 0, 1, 0),
	('m_1_WATER_9', 'Aqua', 0, 0, 1, 0),
	('m_2_REVIVE_1', 'Resurrectio', 0, 0, 0, 0),
	('m_2_REVIVE_10', 'Resurrectio', 0, 0, 1, 0),
	('m_2_REVIVE_2', 'Resurrectio', 0, 0, 1, 0),
	('m_2_REVIVE_3', 'Resurrectio', 0, 0, 1, 0),
	('m_2_REVIVE_4', 'Resurrectio', 0, 0, 1, 0),
	('m_2_REVIVE_5', 'Resurrectio', 0, 0, 1, 0),
	('m_2_REVIVE_6', 'Resurrectio', 0, 0, 1, 0),
	('m_2_REVIVE_7', 'Resurrectio', 0, 0, 1, 0),
	('m_2_REVIVE_8', 'Resurrectio', 0, 0, 1, 0),
	('m_2_REVIVE_9', 'Resurrectio', 0, 0, 1, 0),
	('nightstick', 'ASP Baton', -1, 0, 1, 0),
	('nightvision', 'Night Vision', -1, 0, 1, 0),
	('parachute', 'parachute', -1, 0, 1, 0),
	('petrolcan', 'Petrol Can', -1, 0, 1, 0),
	('pipebomb', 'pipe bomb', -1, 0, 1, 0),
	('pistachio', 'Pisztácia', 1, 0, 1, 0),
	('pistol', 'Colt M1911', -1, 0, 1, 0),
	('pistol50', 'Arany pálca', -1, 0, 1, 0),
	('pistol_ammo', 'Pistol Ammo', 1, 0, 1, 0),
	('pistol_mk2', 'Sig Sauer P226', -1, 0, 1, 0),
	('plane_rocket_ammo', 'plane_rocket_ammo', 1, 0, 1, 0),
	('player_laser_ammo', 'player_laser_ammo', 1, 0, 1, 0),
	('poolcue', 'pool cue', -1, 0, 1, 0),
	('proxmine', 'Proxmine Mine', -1, 0, 1, 0),
	('pumpshotgun', 'Remington 870', -1, 0, 1, 0),
	('pumpshotgun_mk2', 'pumpshotgun_mk2', -1, 0, 1, 0),
	('p_cica', 'Alakváltó bájital (Kitsune)', 10, 0, 1, 30),
	('p_coyote', 'Alakváltó bájital (Kojot)', 10, 0, 1, 30),
	('p_heal', 'Élet esszencia', 5, 0, 1, 10),
	('p_history', 'Felfedő bájital', 5, 0, 1, 20),
	('p_hollo', 'Alakváltó bájital (Hólló)', 10, 0, 1, 30),
	('p_invisible', 'Láthatatlanság bájital', 5, 0, 1, 50),
	('p_mana', 'Varázs esszencia', 5, 0, 1, 10),
	('p_solyom', 'Alakváltó bájital (Sárkány)', 10, 0, 1, 30),
	('p_vision', 'Átlátás bájital', 10, 0, 1, 20),
	('railgun', 'railgun', -1, 0, 1, 0),
	('remotesniper', 'Remote Sniper', -1, 0, 1, 0),
	('revolver', 'Taurus Raging Bull', -1, 0, 1, 0),
	('revolver_mk2', 'revolver_mk2', -1, 0, 1, 0),
	('rhum', 'Rum', 1, 0, 1, 0),
	('rhumcoca', 'Rum-Cola', 1, 0, 1, 0),
	('rhumfruit', 'Rum-Gyümölcs', 1, 0, 1, 0),
	('rifle_ammo', 'Rifle Ammo', 1, 0, 1, 0),
	('rpg', 'RPG-7', -1, 0, 1, 0),
	('rpg_ammo', 'RPG Ammo', 1, 0, 1, 0),
	('sandwich', 'Szendvics', 1, 0, 1, 0),
	('sarga_kristaly', 'Sárga Kristály', 5, 0, 1, 0),
	('sawnoffshotgun', 'Mossberg 500', -1, 0, 1, 0),
	('shotgun_ammo', 'Shotgun Ammo', 1, 0, 1, 0),
	('smg', 'MP5A3', -1, 0, 1, 0),
	('smg_ammo', 'SMG Ammo', 1, 0, 1, 0),
	('smg_mk2', 'smg_mk2', -1, 0, 1, 0),
	('smokegrenade', 'smoke grenade', -1, 0, 1, 0),
	('smokegrenade_ammo', 'smokegrenade_ammo', 1, 0, 1, 0),
	('sniperrifle', 'PSG-1', -1, 0, 1, 0),
	('sniper_ammo', 'Sniper Ammo', 1, 0, 1, 0),
	('sniper_remote_ammo', 'Sniper Remote Ammo', 1, 0, 1, 0),
	('snowball', 'Snow Ball', -1, 0, 1, 0),
	('snspistol', 'H&K P7', -1, 0, 1, 0),
	('snspistol_mk2', 'snspistol_mk2', -1, 0, 1, 0),
	('soda', 'Dr. Pepper', 1, 0, 1, 0),
	('space_rocket_ammo', 'space_rocket_ammo', 1, 0, 1, 0),
	('specialcarbine', 'H&K G36C', -1, 0, 1, 0),
	('specialcarbine_mk2', 'specialcarbine_mk2', -1, 0, 1, 0),
	('stickybomb', 'sticky bomb', -1, 0, 1, 0),
	('stickybomb_ammo', 'stickybomb_ammo', 1, 0, 1, 0),
	('stinger', 'stinger', -1, 0, 1, 0),
	('stinger_ammo', 'stinger_ammo', 1, 0, 1, 0),
	('stungun', 'X26 Taser', -1, 0, 1, 0),
	('stungun_ammo', 'Stungun Ammo', 1, 0, 1, 0),
	('switchblade', 'Switchblade', -1, 0, 1, 0),
	('tank_ammo', 'tank_ammo', 1, 0, 1, 0),
	('tequila', 'Tequila', 1, 0, 1, 0),
	('vintagepistol', 'FN Model 1910', -1, 0, 1, 0),
	('vodka', 'Vodka', 1, 0, 1, 0),
	('vodkaenergy', 'RedBull-Vodka', 1, 0, 1, 0),
	('vodkafruit', 'Vodka-Gyümölcs', 1, 0, 1, 0),
	('voros_kristaly', 'Vörös Kristály', 5, 0, 1, 0),
	('water', 'Víz', 1, 0, 1, 0),
	('whisky', 'Whisky', 1, 0, 1, 0),
	('whiskycoca', 'Whisky-Cola', 1, 0, 1, 0),
	('wrench', 'wrench', -1, 0, 1, 0),
	('zold_kristaly', 'Zöld Kristály', 5, 0, 1, 0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table mageclean.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.jobs: ~4 rows (approximately)
DELETE FROM `jobs`;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`, `enabled`) VALUES
	('ambulance', 'TEST', 1, 1),
	('magiaugy', 'Mágiaügyi minisztérium', 1, 1),
	('school', 'Roxfort Boszorkány- és Varázslóképző', 1, 1),
	('unemployed', 'Szabadúszó', 0, 0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table mageclean.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.job_grades: ~25 rows (approximately)
DELETE FROM `job_grades`;
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Vállalkozó', 12, '{}', '{}'),
	(16, 'ambulance', 0, 'ambulance', 'Ambulancier', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":54,"torso_2":1,"hair_color_2":0,"pants_1":24,"glasses_1":0,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":19,"helmet_1":-1,"helmet_2":0,"arms":88,"face":19,"decals_1":60,"torso_1":139,"hair_2":0,"skin":34,"pants_2":4}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(17, 'ambulance', 1, 'doctor', 'Medecin', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(18, 'ambulance', 2, 'chief_doctor', 'Medecin-chef', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(19, 'ambulance', 3, 'boss', 'Chirurgien', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(223, 'school', 0, 'diak1', 'Diák - Kezdő', 10, '{}', '{}'),
	(224, 'school', 1, 'diak2', 'Diák - Haladó', 15, '{}', '{}'),
	(225, 'school', 2, 'fonix1', 'Főnix Rendje - Kezdő', 20, '{}', '{}'),
	(226, 'school', 3, 'fonix2', 'Főnix Rendje - Haladó', 25, '{}', '{}'),
	(227, 'school', 4, 'fonix3', 'Főnix Rendje - Vezető', 30, '{}', '{}'),
	(228, 'school', 5, 'teacher', 'Tanár', 30, '{}', '{}'),
	(229, 'school', 6, 'suboss', 'Igazgató helyettes', 35, '{}', '{}'),
	(230, 'school', 7, 'boss', 'Igazgató', 40, '{}', '{}'),
	(231, 'magiaugy', 0, 'gyakornok', 'Segéd', 50, '{}', '{}'),
	(232, 'magiaugy', 1, 'jaror', 'Járőr', 90, '{}', '{}'),
	(233, 'magiaugy', 2, 'nyomozo', 'Nyomozó', 90, '{}', '{}'),
	(234, 'magiaugy', 3, 'burokrata', 'Hivatalnok', 90, '{}', '{}'),
	(235, 'magiaugy', 4, 'auror', 'Auror', 100, '{}', '{}'),
	(236, 'magiaugy', 5, 'foauror', 'Fő Auror', 120, '{}', '{}'),
	(237, 'magiaugy', 6, 'bunuldozo', 'Varázsbűn-üldözési Főosztály Vezetője', 130, '{}', '{}'),
	(238, 'magiaugy', 7, 'likvidacio', 'Veszélyes Lények Likvidálását Jóváhagyó Bizottság', 130, '{}', '{}'),
	(239, 'magiaugy', 8, 'kozlekedes', 'Mágikus Közlekedésügyi Főosztály', 130, '{}', '{}'),
	(240, 'magiaugy', 9, 'muglitargyak', 'Mugli Tárgyakkal Való Visszaélési Ügyosztály', 130, '{}', '{}'),
	(241, 'magiaugy', 10, 'suboss', 'Államtitkár', 180, '{}', '{}'),
	(242, 'magiaugy', 11, 'boss', 'Mágiaügyi miniszter', 200, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumping structure for table mageclean.known_recipes
CREATE TABLE IF NOT EXISTS `known_recipes` (
  `identifier` varchar(50) DEFAULT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.known_recipes: ~8 rows (approximately)
DELETE FROM `known_recipes`;
/*!40000 ALTER TABLE `known_recipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `known_recipes` ENABLE KEYS */;

-- Dumping structure for table mageclean.outfits
CREATE TABLE IF NOT EXISTS `outfits` (
  `owner` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `slot` tinyint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `clothes` mediumtext CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`owner`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- Dumping data for table mageclean.outfits: ~17 rows (approximately)
DELETE FROM `outfits`;
/*!40000 ALTER TABLE `outfits` DISABLE KEYS */;
/*!40000 ALTER TABLE `outfits` ENABLE KEYS */;

-- Dumping structure for table mageclean.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `plate` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `vehicle` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'car',
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- Dumping data for table mageclean.owned_vehicles: ~29 rows (approximately)
DELETE FROM `owned_vehicles`;
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumping structure for table mageclean.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `imglink` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123176 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.shops: ~0 rows (approximately)
DELETE FROM `shops`;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` (`id`, `store`, `item`, `price`, `imglink`) VALUES
	(1, 'TwentyFourSeven', 'water', 2, ''),
	(2, 'RobsLiquor', 'water', 2, ''),
	(3, 'LTDgasoline', 'water', 2, ''),
	(4, 'TwentyFourSeven', 'bread', 2, ''),
	(5, 'RobsLiquor', 'bread', 2, ''),
	(6, 'LTDgasoline', 'bread', 2, ''),
	(123125, 'Konyvtar_Varazslatok', 'B_0_INVITO_1', 110, ''),
	(123126, 'WeaponShop', 'flaregun', 10, ''),
	(123127, 'WeaponShop', 'pistol50', 1000, ''),
	(123128, 'AllInOne', 'water', 2, NULL),
	(123129, 'AllInOne', 'bread', 2, NULL),
	(123130, 'AllInOne', 'flaregun', 10, NULL),
	(123131, 'Konyvtar_Varazslatok', 'B_0_ALOHOMORA_1', 1000, ''),
	(123132, 'Konyvtar_Varazslatok', 'B_0_TELEPORT2_1', 2000, ''),
	(123133, 'Konyvtar_Varazslatok', 'B_0_TELEPORT_1', 1200, ''),
	(123134, 'Konyvtar_Varazslatok', 'B_0_WALL_10', 400, ''),
	(123135, 'Konyvtar_Varazslatok', 'B_10_BLOWAROUND-EXPLOSION_1', 2500, ''),
	(123136, 'Konyvtar_Varazslatok', 'B_10_BLOWAROUND-FIRE_1', 2000, ''),
	(123137, 'Konyvtar_Varazslatok', 'B_10_BLOW_1', 1100, ''),
	(123138, 'Konyvtar_Varazslatok', 'B_10_FIRE_1', 800, ''),
	(123139, 'Konyvtar_Varazslatok', 'B_11_AVADAKEDABRA_1', 40000, ''),
	(123140, 'Konyvtar_Varazslatok', 'B_11_BLACKBLOW_1', 30000, ''),
	(123141, 'Konyvtar_Varazslatok', 'B_11_BLACKFIRE_1', 15000, ''),
	(123142, 'Konyvtar_Varazslatok', 'B_11_IMPERIO_1', 60000, ''),
	(123143, 'Konyvtar_Varazslatok', 'B_11_PORTAL1_10', 100000, ''),
	(123144, 'Konyvtar_Varazslatok', 'B_11_PORTAL2_10', 200000, ''),
	(123145, 'Konyvtar_Varazslatok', 'B_11_PORTAL3_10', 300000, ''),
	(123146, 'Konyvtar_Varazslatok', 'B_11_PORTAL4_10', 400000, ''),
	(123147, 'Konyvtar_Varazslatok', 'B_11_PORTAL5_10', 500000, ''),
	(123148, 'Konyvtar_Varazslatok', 'B_11_PORTAL6_10', 600000, ''),
	(123149, 'Konyvtar_Varazslatok', 'B_1_STUN_1', 1500, ''),
	(123150, 'Konyvtar_Varazslatok', 'B_1_WATER_1', 1000, ''),
	(123151, 'Konyvtar_Varazslatok', 'B_2_REVIVE_1', 40000, ''),
	(123152, 'Konyvtar_Varazslatok', 'B_0_BLOWAROUND-SMOKE_1', 1500, ''),
	(123153, 'RobsLiquor', 'bolcacahuetes', 8, ''),
	(123154, 'RobsLiquor', 'bolnoixcajou', 8, ''),
	(123155, 'RobsLiquor', 'chips', 7, ''),
	(123156, 'RobsLiquor', 'chocolate', 5, ''),
	(123157, 'RobsLiquor', 'hamburger', 11, ''),
	(123158, 'RobsLiquor', 'jagerbomb', 8, ''),
	(123159, 'RobsLiquor', 'jagercerbere', 8, ''),
	(123160, 'RobsLiquor', 'jusfruit', 4, ''),
	(123161, 'RobsLiquor', 'metreshooter', 5, ''),
	(123162, 'RobsLiquor', 'mixapero', 5, ''),
	(123163, 'RobsLiquor', 'mojito', 6, ''),
	(123164, 'RobsLiquor', 'pistachio', 7, ''),
	(123165, 'RobsLiquor', 'rhum', 8, ''),
	(123166, 'RobsLiquor', 'rhumcoca', 6, ''),
	(123167, 'RobsLiquor', 'rhumfruit', 7, ''),
	(123168, 'RobsLiquor', 'sandwich', 9, ''),
	(123169, 'RobsLiquor', 'soda', 4, ''),
	(123170, 'RobsLiquor', 'tequila', 9, ''),
	(123171, 'RobsLiquor', 'vodka', 7, ''),
	(123172, 'RobsLiquor', 'vodkaenergy', 8, ''),
	(123173, 'RobsLiquor', 'vodkafruit', 8, ''),
	(123174, 'RobsLiquor', 'whisky', 9, ''),
	(123175, 'RobsLiquor', 'whiskycoca', 9, '');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Dumping structure for table mageclean.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.society_moneywash: ~0 rows (approximately)
DELETE FROM `society_moneywash`;
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumping structure for table mageclean.treasure
CREATE TABLE IF NOT EXISTS `treasure` (
  `identifier` varchar(50) NOT NULL,
  `treasurename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.treasure: ~0 rows (approximately)
DELETE FROM `treasure`;
/*!40000 ALTER TABLE `treasure` DISABLE KEYS */;
/*!40000 ALTER TABLE `treasure` ENABLE KEYS */;

-- Dumping structure for table mageclean.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(40) NOT NULL,
  `accounts` longtext,
  `ID` int NOT NULL AUTO_INCREMENT,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int DEFAULT '0',
  `loadout` longtext,
  `position` varchar(255) DEFAULT '{"x":-237.50,"y":-927.57,"z":32.31,"heading":333.2}',
  `skin` longtext,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `status` longtext,
  `last_property` varchar(255) DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT '0',
  `online` int NOT NULL DEFAULT '0',
  `timeplayed` varchar(255) NOT NULL DEFAULT '0',
  `phone_number` varchar(10) DEFAULT NULL,
  `lastdigits` varchar(255) DEFAULT NULL,
  `jail` int NOT NULL DEFAULT '0',
  `skills` longtext,
  `name` longtext,
  `last_name` varchar(32) DEFAULT NULL,
  `dob` varchar(10) DEFAULT NULL,
  `is_male` int DEFAULT '1',
  `accessories` mediumtext,
  `first_name` varchar(32) DEFAULT NULL,
  `hunger` int NOT NULL DEFAULT '100',
  `thirst` int NOT NULL DEFAULT '100',
  `time` bigint DEFAULT '0',
  `allampolgarsag` varchar(50) DEFAULT 'lossantos',
  `pet` varchar(50) DEFAULT '',
  `qb` longtext,
  `quests` json DEFAULT NULL,
  `groupId` int DEFAULT NULL,
  `frakcio` varchar(50) NOT NULL DEFAULT 'nincs',
  PRIMARY KEY (`identifier`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table mageclean.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `model` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `price` int NOT NULL,
  `category` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- Dumping data for table mageclean.vehicles: ~0 rows (approximately)
DELETE FROM `vehicles`;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Lamborghini Huracan Performante (2018)', '18performante', 6000, 'premium'),
	('Ferrari 412 (1985)', '412', 6000, 'premium'),
	('Alfa Romeo 4C', '4c', 6000, 'premium'),
	('Dodge Coronet', '70coronet', 6000, 'premium'),
	('Porsche 911 Turbo S', '911turbos', 6000, 'premium'),
	('Adder', 'adder', 16000, 'nomage'),
	('Audi Quattro', 'audquattros', 6000, 'premium'),
	('Baller', 'baller4', 13000, 'nomage'),
	('Blade', 'blade', 10000, 'mage'),
	('Bugatti Bolide', 'bolide', 6000, 'premium'),
	('Btype', 'btype', 18000, 'nomage'),
	('Btype Hotroad Fly', 'btype2', 40000, 'mage'),
	('Btype Luxe', 'btype3', 18000, 'nomage'),
	('Buccaneer Rider', 'buccaneer2', 12000, 'nomage'),
	('Bugatti Chiron', 'bugatti', 6000, 'premium'),
	('Cheburek Fly', 'cheburek', 20000, 'mage'),
	('Chino Luxe', 'chino2', 12000, 'nomage'),
	('Cognoscenti Cabrio Fly', 'cogcabrio', 26000, 'mage'),
	('Deveste', 'deveste', 16000, 'nomage'),
	('Deviant', 'deviant', 12000, 'nomage'),
	('Bugatti Divo', 'divo', 6000, 'premium'),
	('Dominator', 'dominator3', 15000, 'nomage'),
	('Dynasty Fly', 'dynasty', 28000, 'mage'),
	('Emperor', 'emperor', 8500, 'nomage'),
	('Entity', 'entity2', 16000, 'nomage'),
	('Lotus Evora GT', 'evora', 6000, 'premium'),
	('Faction Rider', 'faction2', 8000, 'nomage'),
	('Fagaloa Fly', 'fagaloa', 28000, 'mage'),
	('Felon GT', 'felon2', 12000, 'nomage'),
	('Furia Fly', 'furia', 38000, 'mage'),
	('Glendale', 'glendale2', 5000, 'nomage'),
	('Hermes Fly', 'hermes', 40000, 'mage'),
	('Hotknife Fly', 'hotknife', 40000, 'mage'),
	('Pagani Huayra', 'huayra', 6000, 'premium'),
	('Huntley S', 'huntley', 13000, 'nomage'),
	('Hustler', 'hustler', 18000, 'nomage'),
	('BMW i8', 'i8', 6000, 'premium'),
	('Infernus', 'infernus2', 16000, 'nomage'),
	('Issi Fly', 'issi3', 28000, 'mage'),
	('Itali GTO', 'italigto', 16000, 'nomage'),
	('Kuruma', 'kuruma', 12000, 'nomage'),
	('Locust Fly', 'locust', 38000, 'mage'),
	('Lynx', 'lynx', 15000, 'nomage'),
	('Manana', 'manana', 6000, 'nomage'),
	('Mercedes-Benz', 'mvisiongt', 6000, 'premium'),
	('Neon Fly', 'neon', 38000, 'mage'),
	('Nero 2', 'nero2', 16000, 'nomage'),
	('9F Cabrio', 'ninef2', 15000, 'nomage'),
	('Porsche Panamera Turbo', 'panamera17turbo', 6000, 'premium'),
	('Patriot Fly', 'patriot2', 39000, 'mage'),
	('Peyote', 'peyote', 12000, 'nomage'),
	('X80 Proto Fly', 'prototipo', 38000, 'mage'),
	('Audi R8 V10', 'r8v10', 6000, 'premium'),
	('Rolls-Royce Phantom', 'rrphantom', 6000, 'premium'),
	('Ruiner Fly', 'ruiner', 32000, 'mage'),
	('Ruston Fly', 'ruston', 38000, 'mage'),
	('Sabre GT', 'sabregt2', 11000, 'nomage'),
	('McLaren Senna', 'senna', 6000, 'premium'),
	('Sentinel XS', 'sentinel2', 12000, 'nomage'),
	('Singer 911 DLS', 'singerdls', 6000, 'premium'),
	('Slam Van', 'slamvan', 13000, 'nomage'),
	('Camara SS \'69', 'ss69', 6000, 'premium'),
	('Stafford Fly', 'stafford', 40000, 'mage'),
	('Stretch', 'stretch', 15500, 'nomage'),
	('Subaru Impreza WRX STI 2004', 'subwrx', 6000, 'premium'),
	('T20', 't20', 16000, 'nomage'),
	('Tempesta', 'tempesta', 16000, 'nomage'),
	('Lamborghini Terzo Millenio', 'terzo', 6000, 'premium'),
	('Tezeract Fly', 'tezeract', 38000, 'mage'),
	('Tornado', 'tornado4', 12000, 'nomage'),
	('Tornado Classic', 'tornado5', 12000, 'nomage'),
	('Tornado Hot Road', 'tornado6', 12000, 'nomage'),
	('Toros', 'toros', 15000, 'nomage'),
	('Lamborghini Urus 2018', 'urus2018', 6000, 'premium'),
	('Toyota Supra A80 MKIV \'94', 'variszupra', 6000, 'premium'),
	('Virgo', 'virgo2', 12000, 'nomage'),
	('Visione Fly', 'visione', 38000, 'mage'),
	('Voodoo Fly', 'voodoo', 26000, 'mage'),
	('Weevil Fly', 'weevil', 20000, 'mage'),
	('Windsor Fly', 'windsor', 35000, 'mage'),
	('Windsor Drop', 'windsor2', 15000, 'nomage'),
	('BMW X6', 'x6m', 6000, 'premium'),
	('Zentorno', 'zentorno', 16000, 'nomage'),
	('Zorrusso', 'zorrusso', 16000, 'nomage'),
	('Z-Type Fly', 'ztype', 40000, 'mage');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for table mageclean.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- Dumping data for table mageclean.vehicle_categories: ~0 rows (approximately)
DELETE FROM `vehicle_categories`;
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('mage', 'Elvarázsolt'),
	('nomage', 'Mugli'),
	('premium', 'Prémium');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumping structure for table mageclean.whitelist_jobs
CREATE TABLE IF NOT EXISTS `whitelist_jobs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `grade` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table mageclean.whitelist_jobs: ~0 rows (approximately)
DELETE FROM `whitelist_jobs`;
/*!40000 ALTER TABLE `whitelist_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist_jobs` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
