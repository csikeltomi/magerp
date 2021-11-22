Config = {}
Config.Locale = "en"

Config.DoorList = {
	--HORROR SULI
	{
		textCoords = vector3(-1551.6428222656, 209.93790588379, 58.866695404053),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 4,
		health = 800000,
		color = "~y~Sárga kristály \n",
		item = "sarga_kristaly",
		doors = {
			{objHash = 1702640059, objHeading = -65.0, objCoords = vector3(-1551.5123291016, 209.5110168457, 58.866691589355)},
			{objHash = 1404704311, objHeading = 115.0, objCoords = vector3(-1551.8205566406, 210.32264709473, 58.86674118042)}
		}
	},
	{
		textCoords = vector3(-1573.5236816406, 231.2837677002, 58.853733062744),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 4,
		health = 800000,
		color = "~y~Sárga kristály \n",
		item = "sarga_kristaly",
		doors = {
			{objHash = 1702640059, objHeading = 25.0, objCoords = vector3(-1573.3231201172, 232.3557434082, 58.854156494141)},
			{objHash = 1404704311, objHeading = -155.0, objCoords = vector3(-1574.6290283203, 231.55474853516, 58.854156494141)}
		}
	},
	{
		textCoords = vector3(-1579.3138427734, 185.45817565918, 58.853637695313),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 4,
		health = 800000,
		color = "~y~Sárga kristály \n",
		item = "sarga_kristaly",
		doors = {
			{objHash = 1702640059, objHeading = -155.0, objCoords = vector3(-1579.5865478516, 185.37283325195, 58.853637695313)},
			{objHash = 1404704311, objHeading = 25.0, objCoords = vector3(-1578.8939208984, 185.54446411133, 58.858253479004)}
		}
	},
	--FIB
	{
		objHash = 1122723068,
		objCoords = vector3(2520.5944824219, -415.43743896484, 94.124435424805),
		textCoords = vector3(2520.5944824219, -415.43743896484, 94.124435424805),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		color = "~r~Vörös kristály \n",
		item = "voros_kristaly",
		health = 800000
	},
	{
		objHash = -603547852,
		objCoords = vector3(2521.9067382812, -416.80960083008, 94.124382019043),
		textCoords = vector3(2521.9067382812, -416.80960083008, 94.124382019043),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		color = "~r~Vörös kristály \n",
		item = "voros_kristaly",
		health = 800000
	},
	-- HOTEL
	{
		textCoords = vector3(390.88012695312, 0.83111649751663, 91.935348510742),
		authorizedJobs = {"police"},
		locked = true,
		maxDistance = 4,
		health = 800000,
		color = "~b~Kék kristály \n",
		item = "kek_kristaly",
		doors = {
			{objHash = 607720026, objHeading = 60.0, objCoords = vector3(391.4440612793, 1.2097333669662, 91.935394287109)},
			{
				objHash = 607720026,
				objHeading = -120.0,
				objCoords = vector3(390.74420166016, -0.0096006570383906, 91.935348510742)
			}
		}
	},
	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = {"police"},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey("v_ilev_ph_gendoor005"), objHeading = 180.0, objCoords = vector3(443.9, -989.0, 30.6)},
			{objHash = GetHashKey("v_ilev_ph_gendoor005"), objHeading = 0.0, objCoords = vector3(445.3, -988.7, 30.6)}
		}
	},
	--TOVIZE
	{
		objHash = -1032171637,
		objCoords = vector3(1071.6428222656, -666.17572021484, 57.493095397949),
		textCoords = vector3(1071.6428222656, -666.17572021484, 57.493095397949),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		color = "~g~Zöld kristály \n",
		item = "zold_kristaly",
		health = 800000
	},
	{
		objHash = -1032171637,
		objCoords = vector3(1058.4874267578, -674.71984863281, 57.3005027771),
		textCoords = vector3(1058.4874267578, -674.71984863281, 57.3005027771),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		color = "~g~Zöld kristály \n",
		item = "zold_kristaly",
		health = 800000
	},
	{
		objHash = -1032171637,
		objCoords = vector3(1082.4144287109, -666.56115722656, 57.40225982666),
		textCoords = vector3(1082.4144287109, -666.56115722656, 57.40225982666),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		color = "~g~Zöld kristály \n",
		item = "zold_kristaly",
		health = 800000
	},
	--HOTEL1
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.6729736328, -775.66290283203, 59.058673858643),
		textCoords = vector3(-1002.6729736328, -775.66290283203, 59.058673858643),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.7681884766, -768.21447753906, 59.090339660645),
		textCoords = vector3(-1002.7681884766, -768.21447753906, 59.090339660645),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.6967773438, -760.76123046875, 59.067943572998),
		textCoords = vector3(-1002.6967773438, -760.76123046875, 59.067943572998),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1003.0344848633, -753.62615966797, 59.086948394775),
		textCoords = vector3(-1003.0344848633, -753.62615966797, 59.086948394775),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.9025268555, -746.04705810547, 59.090343475342),
		textCoords = vector3(-1002.9025268555, -746.04705810547, 59.090343475342),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.8005981445, -738.51281738281, 59.090301513672),
		textCoords = vector3(-1002.8005981445, -738.51281738281, 59.090301513672),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.7857666016, -731.28411865234, 59.089176177979),
		textCoords = vector3(-1002.7857666016, -731.28411865234, 59.089176177979),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	--HOTEL2
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.6729736328, -775.66290283203, 55.327575683594),
		textCoords = vector3(-1002.6729736328, -775.66290283203, 55.327575683594),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.7681884766, -768.21447753906, 55.327575683594),
		textCoords = vector3(-1002.7681884766, -768.21447753906, 55.327575683594),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.6967773438, -760.76123046875, 55.327575683594),
		textCoords = vector3(-1002.6967773438, -760.76123046875, 55.327575683594),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1003.0344848633, -753.62615966797, 55.327575683594),
		textCoords = vector3(-1003.0344848633, -753.62615966797, 55.327575683594),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.9025268555, -746.04705810547, 55.327575683594),
		textCoords = vector3(-1002.9025268555, -746.04705810547, 55.327575683594),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.8005981445, -738.51281738281, 55.327575683594),
		textCoords = vector3(-1002.8005981445, -738.51281738281, 55.327575683594),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.7857666016, -731.28411865234, 55.327575683594),
		textCoords = vector3(-1002.7857666016, -731.28411865234, 55.327575683594),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	--HOTEL3
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.6729736328, -775.66290283203, 51.59939956665),
		textCoords = vector3(-1002.6729736328, -775.66290283203, 51.59939956665),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.7681884766, -768.21447753906, 51.59939956665),
		textCoords = vector3(-1002.7681884766, -768.21447753906, 51.59939956665),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.6967773438, -760.76123046875, 51.59939956665),
		textCoords = vector3(-1002.6967773438, -760.76123046875, 51.59939956665),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1003.0344848633, -753.62615966797, 51.59939956665),
		textCoords = vector3(-1003.0344848633, -753.62615966797, 51.59939956665),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.9025268555, -746.04705810547, 51.59939956665),
		textCoords = vector3(-1002.9025268555, -746.04705810547, 51.59939956665),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.8005981445, -738.51281738281, 51.59939956665),
		textCoords = vector3(-1002.8005981445, -738.51281738281, 51.59939956665),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.7857666016, -731.28411865234, 51.59939956665),
		textCoords = vector3(-1002.7857666016, -731.28411865234, 51.59939956665),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	--HOTEL4
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.6729736328, -775.66290283203, 48.968837738037),
		textCoords = vector3(-1002.6729736328, -775.66290283203, 48.968837738037),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.7681884766, -768.21447753906, 48.968837738037),
		textCoords = vector3(-1002.7681884766, -768.21447753906, 48.968837738037),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.6967773438, -760.76123046875, 48.968837738037),
		textCoords = vector3(-1002.6967773438, -760.76123046875, 48.968837738037),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1003.0344848633, -753.62615966797, 48.968837738037),
		textCoords = vector3(-1003.0344848633, -753.62615966797, 48.968837738037),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.9025268555, -746.04705810547, 48.968837738037),
		textCoords = vector3(-1002.9025268555, -746.04705810547, 48.968837738037),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.8005981445, -738.51281738281, 48.968837738037),
		textCoords = vector3(-1002.8005981445, -738.51281738281, 48.968837738037),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.7857666016, -731.28411865234, 48.968837738037),
		textCoords = vector3(-1002.7857666016, -731.28411865234, 48.968837738037),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	--HOTEL5
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.6729736328, -775.66290283203, 43.968841552734),
		textCoords = vector3(-1002.6729736328, -775.66290283203, 43.968841552734),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.7681884766, -768.21447753906, 43.968841552734),
		textCoords = vector3(-1002.7681884766, -768.21447753906, 43.968841552734),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.6967773438, -760.76123046875, 43.968841552734),
		textCoords = vector3(-1002.6967773438, -760.76123046875, 43.968841552734),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1003.0344848633, -753.62615966797, 43.968841552734),
		textCoords = vector3(-1003.0344848633, -753.62615966797, 43.968841552734),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.9025268555, -746.04705810547, 43.968841552734),
		textCoords = vector3(-1002.9025268555, -746.04705810547, 43.968841552734),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.8005981445, -738.51281738281, 43.968841552734),
		textCoords = vector3(-1002.8005981445, -738.51281738281, 43.968841552734),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.7857666016, -731.28411865234, 43.968841552734),
		textCoords = vector3(-1002.7857666016, -731.28411865234, 43.968841552734),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	--HOTEL6
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.6729736328, -775.66290283203, 39.911029815674),
		textCoords = vector3(-1002.6729736328, -775.66290283203, 39.911029815674),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.7681884766, -768.21447753906, 39.911029815674),
		textCoords = vector3(-1002.7681884766, -768.21447753906, 39.911029815674),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.6967773438, -760.76123046875, 39.911029815674),
		textCoords = vector3(-1002.6967773438, -760.76123046875, 39.911029815674),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1003.0344848633, -753.62615966797, 39.911029815674),
		textCoords = vector3(-1003.0344848633, -753.62615966797, 39.911029815674),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.9025268555, -746.04705810547, 39.911029815674),
		textCoords = vector3(-1002.9025268555, -746.04705810547, 39.911029815674),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.8005981445, -738.51281738281, 39.911029815674),
		textCoords = vector3(-1002.8005981445, -738.51281738281, 39.911029815674),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	{
		objHash = 1398355146,
		objCoords = vector3(-1002.7857666016, -731.28411865234, 39.911029815674),
		textCoords = vector3(-1002.7857666016, -731.28411865234, 39.911029815674),
		authorizedJobs = {"mum"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		health = 80000
	},
	--VOROS
	{
		objHash = -1686014385,
		objCoords = vector3(-815.97, 178.28, 71.93),
		textCoords = vector3(-815.97, 178.28, 71.93),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "voros",
		color = "~r~Védelmezők\n",
		health = 800000
	},
	{
		objHash = 159994461,
		objCoords = vector3(-816.27, 178.67, 72.15),
		textCoords = vector3(-816.27, 178.67, 72.15),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "voros",
		color = "~r~Védelmezők\n",
		health = 800000
	},
	{
		objHash = 1245831483,
		objCoords = vector3(-794.14, 181.74, 72.83),
		textCoords = vector3(-794.14, 181.74, 72.83),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "voros",
		color = "~r~Védelmezők\n",
		health = 800000
	},
	{
		objHash = -1454760130,
		objCoords = vector3(-793.29, 181.11, 72.84),
		textCoords = vector3(-793.29, 181.11, 72.84),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "voros",
		color = "~r~Védelmezők\n",
		health = 800000
	},
	{
		objHash = 1245831483,
		objCoords = vector3(-794.98, 177.57, 72.84),
		textCoords = vector3(-794.98, 177.57, 72.84),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "voros",
		color = "~r~Védelmezők\n",
		health = 800000
	},
	{
		objHash = -1454760130,
		objCoords = vector3(-795.82, 177.22, 72.84),
		textCoords = vector3(-795.82, 177.22, 72.84),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "voros",
		color = "~r~Védelmezők\n",
		health = 800000
	},
	{
		objHash = -1563640173,
		objCoords = vector3(-806.62, 185.42, 72.36),
		textCoords = vector3(-806.62, 185.42, 72.36),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "voros",
		color = "~r~Védelmezők\n",
		health = 800000
	},
	--SARGA HAZA
	{
		objHash = 1100960097,
		objCoords = vector3(-1788.82, 435.42, 128.31),
		textCoords = vector3(-1788.82, 435.42, 128.31),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	{
		objHash = 1100960097,
		objCoords = vector3(-1788.60, 434.35, 128.31),
		textCoords = vector3(-1788.60, 434.35, 128.31),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	{
		objHash = 1558415341,
		objCoords = vector3(-1805.19, 435.92, 128.84),
		textCoords = vector3(-1805.19, 435.92, 128.84),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	{
		objHash = 1558415341,
		objCoords = vector3(-1804.69, 436.26, 128.84),
		textCoords = vector3(-1804.69, 436.26, 128.84),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	{
		objHash = -1327429222,
		objCoords = vector3(-1815.31, 424.07, 128.31),
		textCoords = vector3(-1815.31, 424.07, 128.31),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	{
		objHash = -1327429222,
		objCoords = vector3(-1816.64, 423.77, 128.32),
		textCoords = vector3(-1816.64, 423.77, 128.32),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	{
		objHash = -627047580,
		objCoords = vector3(-1804.51, 429.34, 128.73),
		textCoords = vector3(-1804.51, 429.34, 128.73),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	{
		objHash = -627047580,
		objCoords = vector3(-1804.93, 429.26, 128.73),
		textCoords = vector3(-1804.93, 429.26, 128.73),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	{
		objHash = 1314286287,
		objCoords = vector3(-1815.31, 423.91, 128.31),
		textCoords = vector3(-1815.31, 423.91, 128.31),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	{
		objHash = 1314286287,
		objCoords = vector3(-1816.60, 423.46, 128.31),
		textCoords = vector3(-1816.60, 423.46, 128.31),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	{
		objHash = 1100960097,
		objCoords = vector3(-1816.03, 429.09, 132.31),
		textCoords = vector3(-1816.03, 429.09, 132.31),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	{
		objHash = 1100960097,
		objCoords = vector3(-1816.90, 428.70, 132.41),
		textCoords = vector3(-1816.90, 428.70, 132.41),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	{
		objHash = 1100960097,
		objCoords = vector3(-1813.47, 447.46, 128.51),
		textCoords = vector3(-1813.47, 447.46, 128.51),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	{
		objHash = 1100960097,
		objCoords = vector3(-1812.89, 446.48, 128.51),
		textCoords = vector3(-1812.89, 446.48, 128.51),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "sarga",
		color = "~y~Idö mágus\n",
		health = 800000
	},
	--VINE
	{
		objHash = 534758478,
		objCoords = vector3(-1879.1531982422, 2056.4060058594, 141.13409423828),
		textCoords = vector3(-1879.1531982422, 2056.4060058594, 141.13409423828),
		locked = true,
		authorizedJobs = {"none"},
		maxDistance = 3,
		size = 0.3,
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000
	},
	{
		textCoords = vector3(-1863.97265625, 2060.7236328125, 141.14002990723),
		faction = "kek",
		authorizedJobs = {"none"},
		color = "~b~Ösök\n",
		health = 800000,
		locked = true,
		maxDistance = 3,
		size = 0.1,
		doors = {
			{objHash = 988364535, objHeading = -90.0, objCoords = vector3(-1864.2130126953, 2061.2651367188, 141.14559936523)},
			{objHash = -1141522158, objHeading = -90.0, objCoords = vector3(-1864.1999511719, 2059.8989257812, 141.14520263672)}
		}
	},
	{
		textCoords = vector3(-1874.3605957031, 2069.8107910156, 141.00791931152),
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000,
		locked = true,
		authorizedJobs = {"none"},
		maxDistance = 3,
		size = 0.3,
		doors = {
			{objHash = 1077118233, objHeading = 160.0, objCoords = vector3(-1875.6140136719, 2070.0678710938, 141.3125)},
			{objHash = 1077118233, objHeading = -20.0, objCoords = vector3(-1873.2939453125, 2069.2197265625, 141.30850219727)}
		}
	},
	{
		textCoords = vector3(-1886.0, 2073.9272460938, 141.00793457031),
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000,
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.3,
		doors = {
			{objHash = 1077118233, objHeading = 160.0, objCoords = vector3(-1887.2430419922, 2074.3078613281, 141.3125)},
			{objHash = 1077118233, objHeading = -20.0, objCoords = vector3(-1884.9210205078, 2073.4619140625, 141.30850219727)}
		}
	},
	{
		textCoords = vector3(-1893.4749755859, 2075.5454101562, 140.99743652344),
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000,
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.3,
		doors = {
			{objHash = 1077118233, objHeading = 140.0, objCoords = vector3(-1894.7299804688, 2075.9670410156, 141.3125)},
			{objHash = 1077118233, objHeading = -40.0, objCoords = vector3(-1892.8330078125, 2074.380859375, 141.30850219727)}
		}
	},
	{
		textCoords = vector3(-1899.2791748047, 2083.4990234375, 140.4012298584),
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000,
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.3,
		doors = {
			{objHash = 1843224684, objHeading = 140.0, objCoords = vector3(-1900.4060058594, 2084.4467773438, 140.91459655762)},
			{objHash = 1843224684, objHeading = -40.0, objCoords = vector3(-1898.5140380859, 2082.8520507812, 140.91525268555)}
		}
	},
	{
		textCoords = vector3(-1901.6809082031, 2085.8876953125, 140.40097045898),
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000,
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.3,
		doors = {
			{objHash = 1843224684, objHeading = 140.0, objCoords = vector3(-1902.8820800781, 2086.544921875, 140.91679382324)},
			{objHash = 1843224684, objHeading = -40.0, objCoords = vector3(-1900.9938964844, 2084.947265625, 140.91883850098)}
		}
	},
	{
		textCoords = vector3(-1910.9283447266, 2074.9338378906, 140.40838623047),
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000,
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.3,
		doors = {
			{objHash = 1843224684, objHeading = -40.0, objCoords = vector3(-1910.208984375, 2073.9689941406, 140.91310119629)},
			{objHash = 1843224684, objHeading = 140.0, objCoords = vector3(-1912.1010742188, 2075.5600585938, 140.9149017334)}
		}
	},
	{
		textCoords = vector3(-1908.7192382812, 2072.4760742188, 140.40286254883),
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000,
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.3,
		doors = {
			{objHash = 1843224684, objHeading = -40.0, objCoords = vector3(-1907.7320556641, 2071.8779296875, 140.91310119629)},
			{objHash = 1843224684, objHeading = 140.0, objCoords = vector3(-1909.6240234375, 2073.4719238281, 140.91519165039)}
		}
	},
	{
		textCoords = vector3(-1907.0532226562, 2084.78515625, 140.39570617676),
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000,
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.3,
		doors = {
			{objHash = 1843224684, objHeading = -130.0, objCoords = vector3(-1907.5960693359, 2083.7438964844, 140.91149902344)},
			{objHash = 1843224684, objHeading = 50.0, objCoords = vector3(-1905.9940185547, 2085.626953125, 140.91149902344)}
		}
	},
	{
		textCoords = vector3(-1910.9509277344, 2079.7041015625, 140.39569091797),
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000,
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.3,
		doors = {
			{objHash = 1843224684, objHeading = -130.0, objCoords = vector3(-1911.8100585938, 2078.794921875, 140.91149902344)},
			{objHash = 1843224684, objHeading = 50.0, objCoords = vector3(-1910.2020263672, 2080.6789550781, 140.91149902344)}
		}
	},
	{
		textCoords = vector3(-1889.2314453125, 2051.5883789062, 141.00569152832),
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000,
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.3,
		doors = {
			{objHash = 1077118233, objHeading = -20.0, objCoords = vector3(-1887.9030761719, 2051.3869628906, 141.3115234375)},
			{objHash = 1077118233, objHeading = 160.0, objCoords = vector3(-1890.2250976562, 2052.2358398438, 141.3125)}
		}
	},
	{
		textCoords = vector3(-1886.7399902344, 2050.8479003906, 141.00776672363),
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000,
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.3,
		doors = {
			{objHash = 1077118233, objHeading = -20.0, objCoords = vector3(-1885.2110595703, 2050.3798828125, 141.30850219727)},
			{objHash = 1077118233, objHeading = 160.0, objCoords = vector3(-1887.5340576172, 2051.2338867188, 141.3125)}
		}
	},
	{
		textCoords = vector3(-1860.2254638672, 2054.0112304688, 141.0189666748),
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000,
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.3,
		doors = {
			{objHash = 1077118233, objHeading = 0.0, objCoords = vector3(-1859.2139892578, 2054.1179199219, 141.35350036621)},
			{objHash = 1077118233, objHeading = 180.0, objCoords = vector3(-1861.6889648438, 2054.1159667969, 141.35359191895)}
		}
	},
	{
		textCoords = vector3(-1880.5601806641, 2061.6879882812, 145.5792388916),
		faction = "kek",
		color = "~b~Ösök\n",
		health = 800000,
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.3,
		doors = {
			{objHash = 534758478, objHeading = 70.0, objCoords = vector3(-1880.4650878906, 2062.7849121094, 145.72944641113)},
			{objHash = 534758478, objHeading = -110.0, objCoords = vector3(-1881.3580322266, 2060.3469238281, 145.73313903809)}
		}
	},
	--ZOLD

	{
		objHash = 827574885,
		objCoords = vector3(-874.18, -1460.22, 7.53),
		textCoords = vector3(-874.18, -1460.22, 7.53),
		authorizedJobs = {"none"},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "zold",
		color = "~g~Gyógyítók\n",
		health = 800000
	},
	{
		objHash = -725970636,
		objCoords = vector3(-873.52,-1460.98,7.53),
		textCoords = vector3(-873.52,-1460.98,7.53),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "zold",
		color = "~g~Gyógyítók\n",
		health = 800000
	},		
	{
		objHash = 272205552,
		objCoords = vector3(-876.22,-1455.04,7.53),
		textCoords = vector3(-876.22,-1455.04,7.53),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "zold",
		color = "~g~Gyógyítók\n",
		health = 800000
	},
	{
		objHash = 1888438146,
		objCoords = vector3(-876.20,-1454.03,7.53),
		textCoords = vector3(-876.20,-1454.03,7.53),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "zold",
		color = "~g~Gyógyítók\n",
		health = 800000
	},
	{
		objHash = 1888438146,
		objCoords = vector3(-879.80,-1444.28,7.53),
		textCoords = vector3(-879.80,-1444.28,7.53),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "zold",
		color = "~g~Gyógyítók\n",
		health = 800000
	},
	{
		objHash = 272205552,
		objCoords = vector3(-879.18,-1445.09,7.53),
		textCoords = vector3(-879.18,-1445.09,7.53),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "zold",
		color = "~g~Gyógyítók\n",
		health = 800000
	},
	{
		objHash = 272205552,
		objCoords = vector3(-894.42,-1463.67,7.53),
		textCoords = vector3(-894.42,-1463.67,7.53),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "zold",
		color = "~g~Gyógyítók\n",
		health = 800000
	},
	{
		objHash = 1888438146,
		objCoords = vector3(-893.63,-1463.27,7.53),
		textCoords = vector3(-893.63,-1463.27,7.53),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "zold",
		color = "~g~Gyógyítók\n",
		health = 800000
	},
	{
		objHash = 272205552,
		objCoords = vector3(-899.06,-1449.11,7.53),
		textCoords = vector3(-899.06,-1449.11,7.53),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "zold",
		color = "~g~Gyógyítók\n",
		health = 800000
	},
	{
		objHash = 1888438146,
		objCoords = vector3(-900.20,-1449.04,7.53),
		textCoords = vector3(-900.20,-1449.04,7.53),
		authorizedJobs = {'none'},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		faction = "zold",
		color = "~g~Gyógyítók\n",
		health = 800000
	},
--MINISZTERIUM
	{
		objHash = 114775988,
		objCoords = vector3(-582.79,-195.46,38.39),
		textCoords = vector3(-582.79,-195.46,38.39),
		authorizedJobs = {'magiaugy'},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		color  = "~s~Mágiaügyi minisztérium\n",
		health = 800000
	},
	{
		objHash = 114775988,
		objCoords = vector3(-582.47,-195.31,38.38),
		textCoords = vector3(-582.47,-195.31,38.38),
		authorizedJobs = {'magiaugy'},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		color  = "~s~Mágiaügyi minisztérium\n",
		health = 800000
	},
	{
		objHash = 2537604,
		objCoords = vector3(-544.91,-203.58,38.21),
		textCoords = vector3(-544.91,-203.58,38.21),
		authorizedJobs = {'magiaugy'},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		color  = "~s~Mágiaügyi minisztérium\n",
		health = 800000
	},
	{
		objHash = 2537604,
		objCoords = vector3(-545.93,-203.81,38.22),
		textCoords = vector3(-545.93,-203.81,38.22),
		authorizedJobs = {'magiaugy'},
		locked = true,
		maxDistance = 3,
		size = 0.5,
		color  = "~s~Mágiaügyi minisztérium \n",
		health = 800000
	},




}
