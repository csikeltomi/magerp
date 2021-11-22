INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_school','Roxfort Boszorkány- és Varázslóképző Szakiskola',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_school','Roxfort Boszorkány- és Varázslóképző Szakiskola',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_school', 'Roxfort Boszorkány- és Varázslóképző Szakiskola', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('school', 'Roxfort Boszorkány- és Varázslóképző Szakiskola', 1);

--
-- Déchargement des données de la table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('school', 0, 'diak1', 'Diák - Kezdő', 10, '{}', '{}'),
('school', 0, 'diak2', 'Diák - Haladó', 15, '{}', '{}'),
('school', 0, 'fonix1', 'Főnix Rendje - Kezdő', 20, '{}', '{}'),
('school', 0, 'fonix2', 'Főnix Rendje - Haladó', 25, '{}', '{}'),
('school', 0, 'fonix3', 'Főnix Rendje - Vezető', 30, '{}', '{}'),
('school', 1, 'teacher', 'Tanár', 30, '{}', '{}'),
('school', 2, 'suboss', 'Igazgató helyettes', 35, '{}', '{}'),
('school', 3, 'boss', 'Igazgató', 40, '{}', '{}');