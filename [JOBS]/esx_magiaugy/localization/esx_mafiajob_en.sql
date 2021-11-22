INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_magiaugy','Mágiaügyi minisztérium',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_magiaugy','Mágiaügyi minisztérium',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_magiaugy', 'Mágiaügyi minisztérium', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('magiaugy', 'Mágiaügyi minisztérium', 1);

--
-- Déchargement des données de la table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('magiaugy', 0, 'gyakornok', 'Segéd', 50, '{}', '{}'),
('magiaugy', 1, 'jaror', 'Járőr', 90, '{}', '{}'),
('magiaugy', 2, 'nyomozo', 'Nyomozó', 90, '{}', '{}'),
('magiaugy', 3, 'burokrata', 'Hivatalnok', 90, '{}', '{}'),
('magiaugy', 4, 'auror', 'Auror', 100, '{}', '{}'),
('magiaugy', 5, 'foauror', 'Fő Auror', 120, '{}', '{}'),
('magiaugy', 6, 'bunuldozo', 'Varázsbűn-üldözési Főosztály Vezetője', 130, '{}', '{}'),
('magiaugy', 7, 'likvidacio', 'Veszélyes Lények Likvidálását Jóváhagyó Bizottság', 130, '{}', '{}'),
('magiaugy', 8, 'kozlekedes', 'Mágikus Közlekedésügyi Főosztály', 130, '{}', '{}'),
('magiaugy', 9, 'muglitargyak', 'Mugli Tárgyakkal Való Visszaélési Ügyosztály', 130, '{}', '{}'),
('magiaugy', 10, 'suboss', 'Államtitkár', 180, '{}', '{}'),
('magiaugy', 11, 'boss', 'Mágiaügyi miniszter', 200, '{}', '{}');