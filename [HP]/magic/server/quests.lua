ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



local _quests = {
    ["Ron"] = {
        Model = "a_m_y_mexthug_01",
        Text = "Volna egy feladatom számodra.",
        heading = 226.0,
        startCoords = vector3(-840.17376708984, 4182.6396484375, 214.2899017334), -- COORDS,
        Quests = {
            {
                Title = "Az elfelejtett csomag",
                Text = [[
                    Üdvözellek Varázsló!

                    A repülőtéren maradt az egyik csomagom!
                    Szeretnélek megkérni,hogy hozd el nekem, mert nagyon beteg a feleségem és nem akarom magára hagyni! 
                    Szeretném ha hoznál nekem még orvosságot is! Egy barátom mondta, hogy a hegytetőn található gombákból nagyon hatásos gyógyszert tudtok késziteni! 
                    Kérlek siess, mert nagy fájdalmai vannak!

                    Jutalmul 2db Defendo könyvet és 80 Galleont adok.
                ]],
                level = 1,
                Items = {
                    {item = "B_0_WALL_10", count = 2},
                    {item = "galleon", count = 80}
                },
                NeedToKill = {}, -- NOPE
                NeedToBring = {{item = "p_heal", count = 5}},
                NeedToFindInBox = {
                    [1] = {
                        Coords = vector3(150.61129760742, -3182.2487792969,
                                         5.8575911521912),
                        items = {{item = "p_heal", chance = 100, count = 5}}
                    }
                } -- NOPE
            }, 
            {
                Title = "Elveszett rakomány",
                Text = [[Üdvözöllek idegen!
                A seprűm megsérült az egyik utam során és elszórtam a rakományt. Kérlek hozd vissza.

                Jutalmul 2db Crepitus könyvet, 1 db Invito könyvet és 120 Galleont adok.
                ]],
                level = 2,
                Items = {
                    {item = "B_10_BLOW_1", count = 2},
                    {item = "B_0_INVITO_1", count = 1},
                    {item = "galleon", count =120}
                },
                NeedToKill = {}, -- NOPE
                NeedToBring = {
                    {item = "p_heal", count = 3}, {item = "p_mana", count = 2}
                },
                NeedToFindInBox = {
                    ["lada1"] = {
                        Coords = vector3(2503.4096679688, 6509.0141601563,
                                         22.251850128174),
                        items = {{item = "p_heal", chance = 100, count = 2}}
                    },
                    ["lada2"] = {
                        Coords = vector3(3478.6884765625, 2584.1979980469,
                                         14.850562095642),
                        items = {{item = "p_mana", chance = 100, count = 1}}
                    },
                    ["lada3"] = {
                        Coords = vector3(2141.1779785156, -2597.4509277344,
                                         5.4338488578796),
                        items = {{item = "p_mana", chance = 100, count = 1}}
                    },
                    ["lada4"] = {
                        Coords = vector3(3818.4384765625, 4477.4140625,
                                         3.5121624469757),
                        items = {{item = "p_heal", chance = 100, count = 1}}
                    }
                } -- NOPE
            },
            {
                Title = "Elsüllyedt fegyverek",
                Text = [[
                    Tudomás szereztem egy rakományról melynek nyoma veszett. Nem tudhatni, hogy szándékosan dobták a vízbe, 
                    vagy véletlenül került oda, de nekem szükségem volna rá. Szerezd meg nekem és    
                    jutalmul 80 Galleont fizetek.]],
                level = 3,
                Items = {
                    {item = "galleon", count = 150}
                },
                NeedToKill = {                                                                                                                                                                                        
                }, -- NOPE
                NeedToBring = {    
                    {item = "pistol", count = 10}, {item = "pistol_ammo", count = 20}         
                },
                NeedToFindInBox = {
                    ["lada1"] = {
                        Coords = vector3(783.96160888672,4114.5263671875,27.746606826782),
                        items = {{item = "pistol", chance = 100, count = 2}}
                    },
                    ["lada2"] = {
                        Coords = vector3(56.197681427002,7650.45703125,-4.2710218429565),
                        items = {{item = "pistol", chance = 100, count = 2}}
                    },
                    ["lada3"] = {
                        Coords = vector3(4171.4633789063,4359.1811523438,-5.3176507949829),
                        items = {{item = "pistol", chance = 100, count = 2}}
                    },
                    ["lada4"] = {
                        Coords = vector3(1830.1413574219,-2865.9609375,-9.4692735671997),
                        items = {{item = "pistol", chance = 100, count = 2}}
                    },
                    ["lada5"] = {
                        Coords = vector3(-992.67395019531,-1777.0528564453,-3.118067741394),
                        items = {{item = "pistol", chance = 100, count = 2}}
                    },
                    ["lada6"] = {
                        Coords = vector3(-2850.1806640625,2680.1411132813,-5.9038214683533),
                        items = {{item = "pistol_ammo", chance = 100, count = 20}}
                    },
                } -- NOPE
            },
            {
                Title = "A Gát",
                Text = [[A gáton található pár láda. Nem fontos, hogy hogyan kerültek oda, de a múlt lényei őrzik. 
                Kérlek pusztítsd el az entitásokat és hozd el a ládák tartalmát.
                
                Jutalmul 80 Galleont fizetek és adok 2db Aqua könyvet.
                ]],
                level = 4,
                Items = {
                    {item = "B_1_WATER_1", count = 2},
                    {item = "galleon", count = 150}
                },
                NeedToKill = {
                    {
                        coords = vector3(1659.7216796875,28.708312988281,168.61437988281),
                        heading = 97.9,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1656.9831542969,38.991123199463,172.88005065918),
                        heading = 97.9,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1663.8111572266,2.916802406311,173.77520751953),
                        heading = 97.9,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1662.8518066406,-53.496158599854,168.3291015625),
                        heading = 97.9,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1657.5299072266,-55.497665405273,167.16850280762),
                        heading = 97.9,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                }, -- NOPE
                NeedToBring = {
                    {item = "p_heal", count = 3}, {item = "p_mana", count = 2}
                },
                NeedToFindInBox = {
                    ["lada1"] = {
                        Coords = vector3(1658.1959228516,4.566867351532,166.11822509766),
                        items = {{item = "p_heal", chance = 100, count = 2}}
                    },
                    ["lada2"] = {
                        Coords = vector3(1664.8376464844,1.1551390886307,166.11820983887),
                        items = {{item = "p_mana", chance = 100, count = 1}}
                    },
                    ["lada3"] = {
                        Coords = vector3(1663.2706298828,-52.72917175293,168.32907104492),
                        items = {{item = "p_mana", chance = 100, count = 1}}
                    },
                    ["lada4"] = {
                        Coords = vector3(1651.3787841797,-62.244403839111,164.64601135254),
                        items = {{item = "p_heal", chance = 100, count = 1}}
                    }
                } -- NOPE
            },
            {
                Title = "Zsoldosok",
                Text = [[Kedves utazó,
                A zsoldosok megfosztottak a tulajdonomtól és vissza kell hogy szerezd. Vigyázz, mert nincsenek egyedül pár entitás is segít nekik.

                Jutalmul 150 Galleont és 2db Stupor könyvet adok.
                ]],
                level = 5,
                Items = {
                    {item = "B_1_STUN_1", count = 2},
                    {item = "galleon", count = 150}
                },
                NeedToKill = {
                    {
                        coords = vector3(566.01,-3122.14,18.77),
                        heading = 266.29,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(553.41,-3118.66,18.77),
                        heading = 255.78,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(543.08,-3119.12,18.71),
                        heading = 264.75,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                
                }, -- NOPE
                NeedToBring = {
                    {item = "p_heal", count = 3}, {item = "p_mana", count = 2}
                },
                NeedToFindInBox = {
                    ["lada1"] = {
                        Coords = vector3(574.97631835938,-3125.7795410156,18.768600463867),
                        items = {{item = "p_heal", chance = 100, count = 3}}
                    },
                    ["lada2"] = {
                        Coords = vector3(487.46487426758,-3215.0168457031,15.315886497498),
                        items = {{item = "p_mana", chance = 100, count = 1}}
                    },
                    ["lada3"] = {
                        Coords = vector3(590.52026367188,-3288.7131347656,6.0695610046387),
                        items = {{item = "p_mana", chance = 100, count = 1}}
                    },
                } -- NOPE
            },
            { --SZIGETEK
                Title = "Elveszett rakomány 2",
                Text = [[Üdvözöllek idegen!
                Az autóm megsérült az egyik utam során és elszórtam a rakományt. Kérlek hozd vissza.

                Jutalmul 320 Galleont adok.
                ]],
                level = 6,
                Items = {
                    {item = "galleon", count = 320}
                },
                NeedToKill = {
                    {
                        coords = vector3(53.00,7206.72,3.53),
                        heading = 174.25,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(66.25,7210.65,3.52),
                        heading = 315.60,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(-125.01,7278.20,17.95),
                        heading = 127.15,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(-107.43,7287.37,17.09),
                        heading = 295.02,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(260.61,7445.13,17.97),
                        heading = 150.77,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(250.85,7431.38,16.86),
                        heading = 142.30,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(236.21,7424.53,19.20),
                        heading = 114.85,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },                
                }, -- NOPE
                NeedToBring = {
                    {item = "switchblade", count = 3}, {item = "pistol", count = 2}
                },
                NeedToFindInBox = {
                    ["lada1"] = {
                        Coords = vector3(67.040954589844,7187.7744140625,2.338193655014  ),
                        items = {{item = "switchblade", chance = 100, count = 2}}
                    },
                    ["lada2"] = {
                        Coords = vector3(-118.069480896,7279.9345703125,17.480184555054),
                        items = {{item = "switchblade", chance = 100, count = 1}}
                    },
                    ["lada3"] = {
                        Coords = vector3(270.72119140625,7471.716796875,18.333303451538),
                        items = {{item = "pistol_ammo", chance = 100, count = 20}}
                    },
                    ["lada4"] = {
                        Coords = vector3(289.65118408203,7537.2700195313,5.1099152565002),
                        items = {{item = "pistol", chance = 100, count = 1}}
                    },
                    ["lada5"] = {
                        Coords = vector3(36.14416885376,7656.2104492188,2.3719716072083 ),
                        items = {{item = "pistol", chance = 100, count = 1}}
                    },
                } -- NOPE
            },
            { --CROSS PALYA
                Title = "Veszélyzóna",
                Text = [[
                    Van pár láda... 
                    Van pár entitás..
                    Szerintem már tudod mi a dolgod.
                
                Jutalmul 850 Galleont fizetek és adok 1db Machetet.
                ]],
                level = 7,
                Items = {
                    {item = "machete", count = 1},
                    {item = "galleon", count = 850}
                },
                NeedToKill = {
                    {
                        coords = vector3(938.19,2457.81,50.93),
                        heading = 124.74,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(941.12,2435.68,50.86),
                        heading = 53.32,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                
                    {
                        coords = vector3(924.12,2430.01,50.92),
                        heading = 15.40,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1031.58,2446.53,53.62),
                        heading = 46.33,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1030.74,2444.50,53.62),
                        heading = 138.00,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1031.70,2455.59,49.57),
                        heading = 59.04,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1029.19,2441.15,49.57),
                        heading = 111.57,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1097.86,2309.90,45.51),
                        heading = 90.15,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1075.70,2316.96,45.51),
                        heading = 87.42,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1072.23,2301.26,45.51),
                        heading = 93.08,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1039.36,2261.54,43.72),
                        heading = 92.74,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1044.51,2242.65,44.04),
                        heading = 92.13,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(1073.97,2245.95,44.26),
                        heading = 281.68,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },               
                    {
                        coords = vector3(1091.13,2253.53,45.71),
                        heading = 281.73,
                        health = 500,
                        weapon = "weapon_gusenberg",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                
                }, -- NOPE
                NeedToBring = {
                    {item = "specialcarbine", count = 14}, {item = "rifle_ammo", count = 20}
                },
                NeedToFindInBox = {
                    ["lada1"] = {
                        Coords = vector3(929.98321533203,2444.4755859375,49.430503845215),
                        items = {{item = "specialcarbine", chance = 100, count = 2}}
                    },
                    ["lada2"] = {
                        Coords = vector3(1026.3627929688,2458.7058105469,49.565376281738),
                        items = {{item = "specialcarbine", chance = 100, count = 2}}
                    },
                    ["lada3"] = {
                        Coords = vector3(1027.6817626953,2449.5437011719,53.615543365479),
                        items = {{item = "specialcarbine", chance = 100, count = 2}}
                    },
                    ["lada4"] = {
                        Coords = vector3(1029.216796875,2430.8435058594,53.615543365479),
                        items = {{item = "specialcarbine", chance = 100, count = 2}}
                    },
                    ["lada5"] = {
                        Coords = vector3(1010.2268676758,2434.5249023438,45.422092437744),
                        items = {{item = "specialcarbine", chance = 100, count = 2}}
                    },
                    ["lada6"] = {
                        Coords = vector3(1127.2833251953,2354.1538085938,50.275115966797),
                        items = {{item = "specialcarbine", chance = 100, count = 1}}
                    },
                    ["lada7"] = {
                        Coords = vector3(1018.549621582,2314.7485351563,44.868549346924),
                        items = {{item = "specialcarbine", chance = 100, count = 2}}
                    },
                    ["lada8"] = {
                        Coords = vector3(1033.4967041016,2325.7846679688,51.952877044678),
                        items = {{item = "specialcarbine", chance = 100, count = 2}}
                    },
                    ["lada9"] = {
                        Coords = vector3(1064.5126953125,2299.0075683594,45.507801055908),
                        items = {{item = "rifle_ammo", chance = 100, count = 30}}
                    },
                    ["lada10"] = {
                        Coords = vector3(1059.7591552734,2240.0773925781,43.175567626953),
                        items = {{item = "rifle_ammo", chance = 100, count = 30}}
                    },
                } -- NOPE
            },
            {
                Title = "Human Labs",
                Text = [[
                    Üdvözöllek, <br>
                    Entitások támadták meg a Human Labs épületét. Nincs más dolgot mint elpusztítani ezeket a lényeket.
                    Jutalmad 800 Galleon.
                ]],
                level = 8,
                Items = {
                    {item = "galleon", count = 800}
                },
                NeedToKill = {
                    {
                        coords = vector3(3596.12,3703.51,29.69),
                        heading = 275.87,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3599.57,3716.82,29.69),
                        heading = 183.39,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3605.22,3722.86,29.69),
                        heading = 31.90,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3597.22,3728.78,29.69),
                        heading = 178.19,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3596.09,3713.76,29.69),
                        heading = 97.06,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3594.39,3705.96,29.69),
                        heading = 39.54,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3585.29,3696.20,28.82),
                        heading = 224.70,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3597.77,3696.55,28.82),
                        heading = 155.14,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3583.75,3681.80,27.62),
                        heading = 339.59,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3577.02,3688.96,27.12),
                        heading = 335.99,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3567.95,3701.23,28.12),
                        heading = 61.24,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3563.32,3678.06,28.12),
                        heading = 74.37,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3561.41,3675.29,28.12),
                        heading = 161.97,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3553.66,3656.50,28.12),
                        heading = 55.35,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3548.87,3640.69,28.12),
                        heading = 72.32,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3539.84,3665.36,28.12),
                        heading = 112.32,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3526.13,3672.89,28.12),
                        heading = 249.90,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                    {
                        coords = vector3(3540.86,3675.95,28.12),
                        heading = 172.08,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {}
                    },
                                                                                                                                                                                         
                }, -- NOPE
                NeedToBring = {             
                },
                NeedToFindInBox = {
                } -- NOPE
            },
            
        }
    },
    ["Liam"] = {
        Model = "a_m_m_golfer_01",
        Text = "Volna egy feladatom számodra.",
        heading = 87.0,
        startCoords = vector3(-3422.1389160156,960.43688964844,10.910988807678), -- COORDS,
        Quests = {}
    },
}

RegisterServerEvent('Quest:ExchangeItems')
AddEventHandler('Quest:ExchangeItems',
                function(_activeQuesterKey, _activeQuest, updateOnly)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local activeQuest = _activeQuest
    local activeQuesterKey = _activeQuesterKey
    if activeQuesterKey == nil then
        return
    end
    for k, v in pairs(quests()[activeQuesterKey].Quests) do
        if v.level == activeQuest.level then
            -- NEEDTOBRING
            if not updateOnly then
            print("ADD1")
            print(ESX.DumpTable(activeQuest.NeedToBring))
              for _, _item in pairs(activeQuest.NeedToBring) do
                  for k2,v2 in pairs(v.NeedToBring) do
                    print("ADD")
                    if v2.item == _item.item then
                        print("FOUND")
                      local invitem = xPlayer.getInventoryItem(v2.item)
                      if invitem.count >= _item.count then
                        xPlayer.removeInventoryItem(_item.item, _item.count)
                        table.remove( activeQuest.NeedToBring, _)
                      elseif invitem.count > 0  then
                        xPlayer.setInventoryItem(_item.item, 0)
                        activeQuest.NeedToBring[_].count = activeQuest.NeedToBring[_].count - invitem.count
                        if activeQuest.NeedToBring[_].count <= 0 then
                            table.remove(activeQuest.NeedToBring, _)
                        end
                      end
                    end
                  end                 
              end
            end
            -- NEEDTOFIND
            for i, value in pairs(activeQuest.NeedToFindInBox) do
                for _, box in pairs(v.NeedToFindInBox) do
                    if i == _ and value.delete then
                        for k, item in pairs(box.items) do
                            if item.chance >= math.random(1, 100) then
                                local esxItem = xPlayer.getInventoryItem(item.item)
                                xPlayer.addInventoryItem(item.item, item.count)
                                TriggerClientEvent('okokNotify:Alert', source, "KÜLDETÉS", "Kaptál " .. item.count .. " " .. esxItem.label .. " tárgyat.", 20000, 'info')
                            end
                        end
                        activeQuest.NeedToFindInBox[i] = nil
                        
                        --table.remove(activeQuest.NeedToFindInBox, i)
                    end
                end
            end
            -- NEED TO KILL
            for _, enemy in pairs(v.NeedToKill) do
                for k2, v2 in pairs(activeQuest.NeedToKill) do
                    -- print(v2.coords .. " " .. enemy.coords)
                    if v2.deathPosition then
                        for _i, loot in pairs(enemy.loot) do
                            if loot.chance >= math.random(1, 100) then
                                ESX.CreateLootPickup("item_standard", loot.item,
                                                     1, loot.label,
                                                     v2.deathPosition)
                            end
                        end
                        table.remove(activeQuest.NeedToKill, k2)
                    end
                end
            end
            -- CHECK END
            if #activeQuest.NeedToFindInBox == 0 and #activeQuest.NeedToBring ==
                0 and #activeQuest.NeedToKill == 0 then
                TriggerClientEvent("Quest:UpdateQuest", _source, nil)
                SaveLastLevel(_activeQuesterKey, activeQuest.level, _source, true)
                local CurrentQuest = nil
                for k, v in pairs(quests()[activeQuesterKey].Quests) do
                    if v.level == activeQuest.level then
                        CurrentQuest = v
                    end
                end
                for k, v in pairs(CurrentQuest.Items) do
                    if v.item == "galleon" then
                        local moneyCount = tonumber(v.count)
                        xPlayer.addMoney(moneyCount)
                        TriggerClientEvent('okokNotify:Alert', source, "KÜLDETÉS", "Kaptál " .. moneyCount .. " Galleont.", 20000, 'info')
                    else
                        --local esxItem = xPlayer.getInventoryItem(v.item)
                        xPlayer.addInventoryItem(v.item, v.count)
                        --TriggerClientEvent('okokNotify:Alert', source, "KÜLDETÉS", "Kaptál " .. v.count .. " " .. esxItem.label .. " tárgyat.", 20000, 'info')
                    end
                   
                end
                TriggerClientEvent('okokNotify:Alert', source, "KÜLDETÉS", "Sikeresen befejezted küldetést", 20000, 'info')
            else
                TriggerClientEvent("Quest:UpdateQuest", _source, activeQuest)
            end
        end
    end

end)

function quests()
    _quests['Liam'].Quests = _quests['Ron'].Quests
    return _quests
end

Citizen.CreateThread(function()
    
end)

function copy(obj, seen)
    if type(obj) ~= 'table' then return obj end
    if seen and seen[obj] then return seen[obj] end
    local s = seen or {}
    local res = setmetatable({}, getmetatable(obj))
    s[obj] = res
    for k, v in pairs(obj) do res[copy(k, s)] = copy(v, s) end
    return res
end

ESX.RegisterServerCallback("Quest:GetQuests", function(source, cb)
    local _source = source

    local xPlayer = ESX.GetPlayerFromId(_source)
    for key, value in pairs(quests()) do
        for k, v in ipairs(value.Quests) do
            for _, item in pairs(v.NeedToBring) do
                local _item = xPlayer.getInventoryItem(item.item)
                quests()[key].Quests[k].NeedToBring[_]["label"] = _item.label
            end
            for _, loot in pairs(v.NeedToKill) do
                for k2, item in pairs(loot.loot) do
                    local _item = xPlayer.getInventoryItem(item.item)
                    quests()[key].Quests[k].NeedToKill[_].loot[k2]["label"] =
                        _item.label
                end
            end
        end
    end

    local sendQuest = copy(quests())
    local xPlayer = ESX.GetPlayerFromId(_source)
    MySQL.Async.fetchAll(
        'SELECT quests FROM `users` WHERE `identifier` = @identifier',
        {['@identifier'] = xPlayer.identifier}, function(result)
            local dbquests = {}
            if result[1].quests ~= nil then
                dbquests = json.decode(result[1].quests)
            else
                for k, v in pairs(quests()) do
                    sendQuest[k].Quests = {}
                    table.insert(sendQuest[k].Quests, v.Quests[1])
                end
            end
            for k, v in pairs(dbquests) do
                sendQuest[k].Quests = {}
                for k2, v2 in pairs(quests()[k].Quests) do
                    if v2.level > v and #sendQuest[k].Quests == 0 then
                        table.insert(sendQuest[k].Quests, v2)
                    end
                end
            end
            cb(sendQuest)
        end)

end)

function GetLevels(source) end

RegisterServerEvent("Quest:SkipQuest")
AddEventHandler("Quest:SkipQuest", function (quester,quest)
    SaveLastLevel(quester,quest.level,source,false)
end)

function SaveLastLevel(quester, level, _source, update)
    local xPlayer = ESX.GetPlayerFromId(_source)
    MySQL.Async.fetchAll(
        'SELECT quests FROM `users` WHERE `identifier` = @identifier',
        {['@identifier'] = xPlayer.identifier}, function(result)
            if result[1] ~= nil then
                local dbquests = {}
                if result[1].quests ~= nil then
                    dbquests = json.decode(result[1].quests)
                end

                dbquests[quester] = level
                MySQL.Async.execute(
                    'UPDATE `users` SET `quests` = @quests WHERE identifier = @identifier',
                    {
                        ['@identifier'] = xPlayer.identifier,
                        ['@quests'] = json.encode(dbquests)
                    }, function(rowsChanged)
                        TriggerClientEvent("Quest:UpdateFromServer", _source)
                        if update then
                           
                        end
                    end)
            end
        end)

end
