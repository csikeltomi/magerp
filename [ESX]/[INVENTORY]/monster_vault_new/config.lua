Config                        = {}
Config.Locale                 = 'en'

Config.VaultBox = 'p_v_43_safe_s'
Config.Vault = {
	police = {
		coords = vector3(451.3785, -979.9033, 30.68),
		heading = 246.09,
		job = 'police',
		grade = 0,
		secured = true,
		hackable = false,
		inventory = 'police',
		label = 'ORFK Fegyvertár',
		entry = vector3(451.3785, -979.9033, 30.68)
	},
	--[[swat = {
		coords = vector3(-1694.9700927734,-753.94818115234,10.861246109009),
		heading = 246.09,
		job = 'swat',
		grade = 0,
		secured = true,
		hackable = false,
		inventory = 'swat',
		label = 'SWAT Fegyvertár',
		entry = vector3(-1694.9700927734,-753.94818115234,10.861246109009)
	},-]]
	police_storage = {
		coords = vector3(476.96765136719,-982.130859375,24.914995193481),
		heading = 246.09,
		job = 'police',
		grade = 0,
		secured = true,
		hackable = false,
		inventory = 'police_storage',
		label = 'ORFK Lefoglalt tároló',
		entry = vector3(476.96765136719,-982.130859375,24.914995193481)
	},
	police_laboratory = {
		coords = vector3(458.63659667969,-973.54797363281,24.914987564087),
		heading = 246.09,
		job = 'police',
		grade = 0,
		secured = true,
		hackable = false,
		inventory = 'police_laboratory',
		label = 'ORFK Laboratórium tároló',
		entry = vector3(458.63659667969,-973.54797363281,24.914987564087)
	},
	nightclub = {
		coords = vector3(-1615.98, -3015.18, -75.20),
		heading = 246.09,
		job = 'nightclub',
		grade = 0,
		secured = true,
		hackable = true,
		inventory = 'nightclub_depo',
		label = 'Nightclub széf',
		entry = vector3(194.96, -3167.39, -78.14)
		
	},
	nightclub_depo = {
		coords = vector3(-1634.04, -2996.90, -78.14),
		heading = 246.09,
		job = 'nightclub',
		grade = 0,
		secured = true,
		hackable = true,
		inventory = 'nightclub',
		label = 'Nightclub raktár',
		entry = vector3(194.96, -3167.39, -78.14)
	},
	nightclub_fridge2 = {
		coords = vector3(-1582.80, -3014.05, -76.14),
		heading = 246.09,
		job = 'nightclub',
		grade = 0,
		secured = false,
		hackable = false,
		inventory = 'nightclub_fridge',
		label = 'Nightclub hütö',
		entry = vector3(194.96, -3167.39, -78.14)
	},
	nightclub_fridge = {
		coords = vector3(-1579.56, -3018.32, -79.00),
		heading = 246.09,
		job = 'nightclub',
		grade = 0,
		secured = false,
		hackable = false,
		inventory = 'nightclub_fridge2',
		label = 'Nightclub hütö',
		entry = vector3(194.96, -3167.39, -78.14)
	},
	anonymous = {
		coords = vector3(-2070.8439941406,-1018.8838500977,3.0519392490387),
		job = 'anonymous',
		grade = 0,
		secured = false,
		hackable = true,
		inventory = 'anonymous',
		heading = 160.07,
		label = 'Anonymous széf'
	},
	fbi = {
		coords = vector3(118.9657, -728.8032, 242.1),
		job = 'fbi',
		inventory = 'fbi',
		grade = 0,
		secured = false,
		hackable = false,
		heading = 160.07,
		label = 'FBI fegyvertár'
	},
	unicorn = {
		coords = vector3(93.59, -1291.43, 29.26),
		heading = 246.09,
		job = 'unicorn',
		grade = 0,
		secured = true,
		hackable = true,
		inventory = 'unicorn',
		label = 'Unicorn széf',
		entry = vector3(93.59, -1291.43, 29.26)
	},
	comdey_fridge = {
		coords = vector3(-433.44967651367,272.57855224609,83.422019958496),
		heading = 246.09,
		job = 'comedy',
		grade = 0,
		secured = true,
		hackable = false,
		inventory = 'comdey_fridge',
		label = 'Slpit Sides széf',
		entry = vector3(-433.44967651367,272.57855224609,83.422019958496),
	},
	bahama = {
		coords = vector3(-1391.95,-603.407,30.31),
		heading = 246.09,
		job = 'bahama_mamas',
		grade = 0,
		secured = true,
		hackable = true,
		inventory = 'bahama_mamas',
		label = 'Bahama Mamas raktár',
		entry = vector3(-1391.49,-601.106,30.31),
	},
	bahama_fridge = {
		coords = vector3(-1386.59,-608.46,30.31),
		heading = 246.09,
		job = 'bahama_mamas',
		grade = 0,
		secured = false,
		hackable = true,
		inventory = 'bahama_mamas_fridge',
		label = 'Bahama Mamas hütö',
		entry = vector3(-1386.59,-608.46,30.31),
	},
	bahama_fridge2 = {
		coords = vector3(-1378.23,-630.61,30.81),
		heading = 246.09,
		job = 'bahama_mamas',
		grade = 0,
		secured = false,
		hackable = true,
		inventory = 'bahama_mamas_fridge2',
		label = 'Bahama Mamas hütö',
		entry =  vector3(-1378.23,-630.61,30.81),
	},
	lotus = {
		coords = vector3(8.147011756897,529.39038085938,170.63500976562),
		job = 'lotus',
		grade = 0,
		secured = false,
		hackable = false,
		inventory = 'lotus',
		heading = 160.07,
		label = 'Violent Lotus széf'
	},
	jail_armory = {
		coords = vector3(1777.4157714844,2542.2978515625,45.797836303711),
		job = 'jail',
		grade = 0,
		secured = true,
		hackable = false,
		inventory = 'jail',
		heading = 160.07,
		label = 'Fegyvertár'
	},
	jail_storage = {
		coords = vector3(1831.5059814453,2591.529296875,45.952304840088),
		job = 'jail',
		grade = 0,
		secured = true,
		hackable = false,
		inventory = 'jail_storage',
		heading = 160.07,
		label = 'Tároló'
	},
	arja = {
		coords = vector3(-156.51626586914,406.5651550293,111.43324279785),
		job = 'arja',
		grade = 0,
		secured = false,
		hackable = false,
		inventory = 'arja',
		heading = 160.07,
		label = 'Tároló'
	},
	yakuza = {
		coords = vector3(-1875.9771728516,2063.8930664062,135.91510009766),
		job = 'yakuza',
		grade = 0,
		secured = false,
		hackable = true,
		inventory = 'yakuza',
		heading = 160.07,
		label = 'Tároló'
	},
	yakuza2 = {
		coords = vector3(-1866.1982421875,2065.6872558594,135.4344329834),
		job = 'yakuza',
		grade = 0,
		secured = false,
		hackable = true,
		inventory = 'yakuza',
		heading = 160.07,
		label = 'Tároló'
	},
	yakuza3 = {
		coords = vector3(-1876.2799072266,2062.7094726562,145.57376098633),
		job = 'yakuza',
		grade = 0,
		secured = false,
		hackable = true,
		inventory = 'yakuza',
		heading = 160.07,
		label = 'Tároló'
	},
	mechanic2 = {
		coords = vector3(-196.13098144531,-1339.9626464844,34.894584655762),
		job = 'mechanic2',
		grade = 0,
		secured = false,
		hackable = false,
		inventory = 'mechanic2',
		heading = 160.07,
		label = 'Tároló'
	},
	mechanic = {
		coords = vector3(474.80197143555,-1308.4750976562,29.206604003906),
		job = 'mechanic',
		grade = 0,
		secured = false,
		hackable = false,
		inventory = 'mechanic',
		heading = 160.07,
		label = 'Tároló'
	},
	cartel1 = {
		coords = vector3(5010.65234375,-5757.2465820312,15.484445571899),
		job = 'cartel',
		grade = 0,
		secured = false,
		hackable = false,
		inventory = 'cartel',
		heading = 160.07,
		label = 'Széf'
	},
	cartel2 = {
		coords = vector3(5000.658203125,-5754.0278320312,14.840489387512),
		job = 'cartel',
		grade = 0,
		secured = false,
		hackable = false,
		inventory = 'cartel2',
		heading = 160.07,
		label = 'Fegyvertár'
	},
}