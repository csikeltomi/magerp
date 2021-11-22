ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


local dungeons = {
    ["Morgue"] = {
        Model = "Revenant",
        Name = "Törvényszéki megszállás (5+)",
        Text = "Ajánlott varázsló szint: 5+",
        heading = 133.6,
        innerPlayers = 0,
        radius = 25.0,
        startCoords = vector3(307.59320068359,-1433.6478271484,28.941171646118), -- COORDS,
        entryCoords = vector3(235.04782104492,-1373.3798828125,21.974063873291), 
        exitCoords = vector3(275.4772644043,-1361.3546142578,24.537811279297), 
        center = vector3(249.1275177002,-1372.36328125,30.212677001953), 
        Quest = {
                Title = "Test Title",
                Text = [[
                    Üdvözellek Varázsló!

                    A repülőtéren maradt az egyik csomagom!
                    Szeretnélek megkérni,hogy hozd el nekem, mert nagyon beteg a feleségem és nem akarom magára hagyni! 
                    Szeretném ha hoznál nekem még orvosságot is! Egy barátom mondta, hogy a hegytetőn található gombákból nagyon hatásos gyógyszert tudtok késziteni! 
                    Kérlek siess, mert nagy fájdalmai vannak!
                ]],
                level = 1,
                NeedToKill = {
                    {
                        coords = vector3(235.14828491211,-1373.9029541016,39.534351348877),
                        heading = 97.9,
                        health = 500,
                        weapon = "weapon_pistol50",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {
                            {item = "p_heal", chance = 100, count = 5},
                            {item = "p_mana", chance = 50, count = 5},
                            {item = "flaregun", chance = 10, count = 1},
                        }
                    },
                    {
                        coords = vector3(235.14828491211,-1373.9029541016,39.534351348877),
                        heading = 97.9,
                        health = 500,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "firedemon",
                        area = 10.0,
                        loot = {
                            {item = "p_heal", chance = 100, count = 5},
                            {item = "p_mana", chance = 50, count = 5},
                        }
                    },
                }, -- NOPE
                NeedToFindInBox = {
                    [1] = {
                        Coords = vector3(239.16773986816,-1359.5562744141,24.537788391113),
                        items = {
                            {item = "p_heal", chance = 100, count = 5},
                            {item = "p_mana", chance = 50, count = 5},
                            {item = "galleon", chance = 50, count = 5},
                        }
                    }
                } -- NOPE
        }
    },
    ["Yacht"] = {
        Model = "a_m_m_afriamer_01",
        Name = "Yacht megszállás (30+)",
        Text = "Ajánlott varázsló szint: 30+",
        radius = 65.0,
        heading = 320.6,
        innerPlayers = 0,
        startCoords = vector3(-1857.0389404297,-1224.1979980469,12.01720905304), -- COORDS,
        entryCoords = vector3(-2121.8359375,-1006.4393310547,8.020188331604), 
        exitCoords = vector3(-2027.8111572266,-1036.689453125,6.7075848579407), 
        center = vector3(-2069.33203125,-1023.0354003906,8.2353916168213), 
        Quest = {
                Title = "Test Title",
                Text = [[
                    Üdvözellek Varázsló!

                    A repülőtéren maradt az egyik csomagom!
                    Szeretnélek megkérni,hogy hozd el nekem, mert nagyon beteg a feleségem és nem akarom magára hagyni! 
                    Szeretném ha hoznál nekem még orvosságot is! Egy barátom mondta, hogy a hegytetőn található gombákból nagyon hatásos gyógyszert tudtok késziteni! 
                    Kérlek siess, mert nagy fájdalmai vannak!
                ]],
                level = 1,
                NeedToKill = {
                    {
                        coords = vector3(-2026.9877929688,-1043.9249267578,2.5614385604858),
                        heading = 62.9,
                        health = 300,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 10, count = 1},
                        }
                    },
                    {
                        coords = vector3(-2043.9898681641,-1031.3139648438,11.980710983276),
                        heading = 62.9,
                        health = 300,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 10, count = 1},
                        }
                    },
                    {
                        coords = vector3(-2056.642578125,-1030.8562011719,8.9714908599854),
                        heading = 62.9,
                        health = 300,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 10, count = 1},
                        }
                    },
                    {
                        coords = vector3(-2033.9265136719,-1041.3916015625,2.5883920192719),
                        heading = 62.9,
                        health = 300,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 10, count = 1},
                        }
                    },
                    {
                        coords = vector3(-2057.2294921875,-1034.0832519531,3.0115792751312),
                        heading = 62.9,
                        health = 300,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 10, count = 1},
                        }
                    },
                    {
                        coords = vector3(-2067.0395507813,-1027.8548583984,3.061461687088),
                        heading = 62.9,
                        health = 300,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 10, count = 1},
                        }
                    },
                    {
                        coords = vector3(-2070.9406738281,-1018.7426757813,3.0514469146729),
                        heading = 62.9,
                        health = 300,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 10, count = 1},
                        }
                    },
                    {
                        coords = vector3(-2060.4970703125,-1019.2174682617,3.061464548111),
                        heading = 62.9,
                        health = 300,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 20.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 10, count = 1},
                        }
                    },
                    {
                        coords = vector3(-2083.9499511719,-1017.1955566406,12.781910896301),
                        heading = 97.9,
                        health = 500,
                        weapon = "weapon_railgun",
                        accuary = 20.0,
                        model = "firedemon",
                        area = 10.0,
                        loot = {
                            {item = "p_heal", chance = 100, count = 5},
                            {item = "p_mana", chance = 50, count = 5},
                        }
                    },
                }, -- NOPE
                NeedToFindInBox = {
                    [1] = {
                        Coords = vector3(-2069.9165039063,-1018.3006591797,3.0675194263458),
                        items = {
                            {item = "p_heal", chance = 100, count = 5},
                            {item = "p_mana", chance = 50, count = 5},
                            {item = "galleon", chance = 100, count = 100},
                        }
                    },
                    [2] = {
                        Coords = vector3(-2055.0168457031,-1027.5555419922,2.5923149585724),
                        items = {
                            {item = "p_heal", chance = 100, count = 5},
                            {item = "p_mana", chance = 50, count = 5},
                            {item = "galleon", chance = 100, count = 100},
                        }
                    },
                    [3] = {
                        Coords = vector3(-2061.4956054688,-1025.5798339844,3.061466217041),
                        items = {
                            {item = "p_heal", chance = 100, count = 5},
                            {item = "p_mana", chance = 50, count = 5},
                            {item = "galleon", chance = 100, count = 100},
                        }
                    },
                } -- NOPE
        }
    },
    ["FIB"] = {
        Model = "a_m_m_afriamer_01",
        Name = "FIB megszállás (80+)",
        Text = "Ajánlott varázsló szint: 80+",
        radius = 65.0,
        heading = 320.6,
        innerPlayers = 0,
        startCoords = vector3(104.34781646729,-747.55493164063,44.754737854004), -- COORDS,
        entryCoords = vector3(126.36488342285,-728.65325927734,242.15190124512), 
        exitCoords = vector3(126.36488342285,-728.65325927734,242.15190124512), 
        center = vector3(-2069.33203125,-1023.0354003906,8.2353916168213), 
        Quest = {
                Title = "Test Title",
                Text = [[
                    Üdvözellek Varázsló!

                    A repülőtéren maradt az egyik csomagom!
                    Szeretnélek megkérni,hogy hozd el nekem, mert nagyon beteg a feleségem és nem akarom magára hagyni! 
                    Szeretném ha hoznál nekem még orvosságot is! Egy barátom mondta, hogy a hegytetőn található gombákból nagyon hatásos gyógyszert tudtok késziteni! 
                    Kérlek siess, mert nagy fájdalmai vannak!
                ]],
                level = 1,
                NeedToKill = {
                    {
                        coords = vector3(113.25243377686,-735.58361816406,242.15211486816),
                        heading = 62.9,
                        health = 400,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 40.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 10, count = 1},
                        }
                    },
                    {
                        coords = vector3(108.61294555664,-753.10296630859,242.15199279785),
                        heading = 62.9,
                        health = 400,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 40.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 1, count = 1},
                        }
                    },
                    {
                        coords = vector3(121.62535858154,-753.87170410156,242.15202331543),
                        heading = 62.9,
                        health = 400,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 40.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 1, count = 1},
                        }
                    },
                    {
                        coords = vector3(127.2859954834,-761.833984375,242.15202331543),
                        heading = 62.9,
                        health = 400,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 40.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 1, count = 1},
                        }
                    },
                    {
                        coords = vector3(123.76477813721,-768.77423095703,242.15203857422),
                        heading = 62.9,
                        health = 400,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 40.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 1, count = 1},
                        }
                    },
                    {
                        coords = vector3(132.65162658691,-769.48400878906,242.15202331543),
                        heading = 62.9,
                        health = 400,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 40.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 1, count = 1},
                        }
                    },
                    {
                        coords = vector3(144.82855224609,-761.02172851563,242.1520690918),
                        heading = 62.9,
                        health = 400,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 40.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 1, count = 1},
                        }
                    },
                    {
                        coords = vector3(152.60171508789,-750.34533691406,242.15185546875),
                        heading = 62.9,
                        health = 400,
                        weapon = "weapon_raypistol",
                        accuary = 20.0,
                        model = "Revenant",
                        area = 40.0,
                        loot = {
                            {item = "p_heal", chance = 20, count = 5},
                            {item = "p_mana", chance = 20, count = 5},
                            {item = "flaregun", chance = 1, count = 1},
                        }
                    },
                    {
                        coords = vector3(136.29016113281,-744.40863037109,242.15213012695),
                        heading = 97.9,
                        health = 500,
                        weapon = "weapon_railgun",
                        accuary = 20.0,
                        model = "firedemon",
                        area = 40.0,
                        loot = {
                            {item = "p_heal", chance = 100, count = 5},
                            {item = "p_mana", chance = 1, count = 5},
                        }
                    },
                }, -- NOPE
                NeedToFindInBox = {
                    [1] = {
                        Coords = vector3(126.354347229,-744.44580078125,242.15194702148),
                        items = {
                            {item = "p_heal", chance = 100, count = 5},
                            {item = "p_mana", chance = 50, count = 5},
                            {item = "galleon", chance = 100, count = 100},
                        }
                    },
                    [2] = {
                        Coords = vector3(123.95401763916,-768.52972412109,242.15208435059),
                        items = {
                            {item = "p_heal", chance = 100, count = 5},
                            {item = "p_mana", chance = 50, count = 5},
                            {item = "galleon", chance = 100, count = 100},
                        }
                    },
                    [3] = {
                        Coords = vector3(131.65037536621,-744.20581054688,242.15213012695),
                        items = {
                            {item = "p_heal", chance = 100, count = 5},
                            {item = "p_mana", chance = 50, count = 5},
                            {item = "galleon", chance = 100, count = 100},
                        }
                    },
                } -- NOPE
        }
    },
}

local tempQuest = {}

RegisterServerEvent("Dungeon:StartDungeon")
AddEventHandler("Dungeon:StartDungeon", function(_dungeonKey)
    local _source = source
    local dungeonKey=_dungeonKey
    
    local limit = 4
    if dungeons[dungeonKey].innerPlayers > 0 then
        return
    end
    tempQuest[dungeonKey] = {}
    local xPlayers = ESX.GetPlayers()
    local playerCount = 1
    local levelAmount = 0
    TriggerEvent("esx:RemovePickupsFromZone", dungeons[dungeonKey].entryCoords, 100.0 )
    for i=1, #xPlayers, 1 do
        local Coords = GetEntityCoords(GetPlayerPed(xPlayers[i]))
        if #(Coords - dungeons[dungeonKey].startCoords) < 10.0 and i <= limit and _source ~= xPlayers[i] then
            TriggerClientEvent("Dungeon:JoinDungeon", xPlayers[i], dungeons[dungeonKey],dungeonKey)
            SetEntityCoords(GetPlayerPed(xPlayers[i]),dungeons[dungeonKey].entryCoords)
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            table.insert(tempQuest[dungeonKey], {
                serverId = xPlayers[i],
                identifier = xPlayer.getIdentifier()
            })
            levelAmount = levelAmount + GetLevel(xPlayer.getInventory(true))
            dungeons[dungeonKey].innerPlayers = dungeons[dungeonKey].innerPlayers + 1
            playerCount = playerCount + 1
        end
    end

    dungeons[dungeonKey].innerPlayers = dungeons[dungeonKey].innerPlayers + 1
    SetEntityCoords(GetPlayerPed(_source),dungeons[dungeonKey].entryCoords)
    local xPlayer = ESX.GetPlayerFromId(_source)
    table.insert(tempQuest[dungeonKey], {
        serverId = _source,
        identifier = xPlayer.getIdentifier()
    })
    levelAmount = levelAmount + GetLevel(xPlayer.getInventory(true))
    bossPower = levelAmount / playerCount
    if bossPower > 10 then
        for k,v in pairs(dungeons[dungeonKey].Quest.NeedToKill) do
            dungeons[dungeonKey].Quest.NeedToKill[k].health = math.floor(dungeons[dungeonKey].Quest.NeedToKill[k].health * bossPower / 10)
        end
    end
    print(ESX.DumpTable(dungeons[dungeonKey].Quest.NeedToKill))
    TriggerClientEvent("Dungeon:CreateDungeon", _source, dungeons[dungeonKey],dungeonKey)
    TriggerClientEvent("Dungeon:UpdateDungeons", dungeons)
    
end)

function GetLevel(inventory)
    local _level = 0
    for k,v in pairs(inventory) do
        local name = Split(k,'_')
        if name[1] == 'm' then
          _level = _level + tonumber(name[4])
        end
    end
    return _level
end

RegisterServerEvent('Dungeon:ExchangeItems')
AddEventHandler('Dungeon:ExchangeItems', function(_activeQuesterKey, _activeQuest)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local activeQuest = _activeQuest
    local activeQuesterKey = _activeQuesterKey
    local quest = dungeons[activeQuesterKey].Quest
    if activeQuesterKey == nil then
        return
    end
            -- NEEDTOFIND
            for i, value in pairs(activeQuest.NeedToFindInBox) do
                for _, box in pairs(quest.NeedToFindInBox) do
                    if i == _ and value.delete then
                        for k, item in pairs(box.items) do
                            if item.chance >= math.random(1, 100) then
                                if item.item == "galleon" then
                                    local maxMoney = tonumber(item.count)
                                    local moneyCount = math.random(10,maxMoney)
                                    xPlayer.addMoney(moneyCount)
                                    TriggerClientEvent('okokNotify:Alert', source, "DUNGEON", "Kaptál " .. moneyCount .. " Galleont.", 20000, 'info')
                                else
                                    local esxItem = xPlayer.getInventoryItem(item.item)
                                    xPlayer.addInventoryItem(item.item, item.count)
                                    TriggerClientEvent('okokNotify:Alert', source, "DUNGEON", "Kaptál " .. item.count .. " " .. esxItem.label .. " tárgyat.", 20000, 'info')
                                end
                            end
                        end
                        activeQuest.NeedToFindInBox[i] = nil
                        
                        table.remove(activeQuest.NeedToFindInBox, i)
                    end
                end
            end
            -- NEED TO KILL
            for _, enemy in pairs(quest.NeedToKill) do
                for k2, v2 in pairs(activeQuest.NeedToKill) do
                    -- print(v2.coords .. " " .. enemy.coords)
                    if v2.deathPosition then
                        for _i, loot in pairs(enemy.loot) do
                            if loot.chance >= math.random(1, 100) then
                                local esxItem = xPlayer.getInventoryItem(loot.item)
                                ESX.CreateLootPickup("item_standard", loot.item, loot.count, esxItem.label, v2.deathPosition)
                                print("SPAWN LOOT")
                            end
                        end
                        table.remove(activeQuest.NeedToKill, k2)
                    end
                end
            end

            -- CHECK END
            if #activeQuest.NeedToKill == 0 then
                for k,v in pairs(tempQuest[_activeQuesterKey]) do
                    TriggerClientEvent("Dungeon:CreateExit",v.serverId)
                end
            else
                TriggerClientEvent("Dungeon:UpdateQuest", _source, activeQuest)
                --TriggerClientEvent("Quest:UpdateQuest", _source, activeQuest)
            end
        
   
end)

RegisterServerEvent("Dungeon:LeaveDungeon")
AddEventHandler("Dungeon:LeaveDungeon", function(_dungeonKey)
    local _source = source
    local dungeonKey = _dungeonKey
    
    for k,v in pairs(tempQuest[dungeonKey]) do
        if v.serverId == _source then
            table.remove(tempQuest[dungeonKey], k)
            dungeons[dungeonKey].innerPlayers = dungeons[dungeonKey].innerPlayers - 1
        end
    end
    if #tempQuest[dungeonKey] == 0 then
        dungeons[dungeonKey].innerPlayers = 0
        tempQuest[dungeonKey] = nil
    end
    SetEntityCoords(GetPlayerPed(_source),dungeons[dungeonKey].startCoords)
end)

local NeedToExit = {}

Citizen.CreateThread(function()
    while true do
        local xPlayers = ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            for k,v in pairs(NeedToExit) do
                print("REJOINED " .. v)
                local identy = xPlayer.getIdentifier()
                print("LOOKING FOR " .. identy)
                if identy == v and DoesEntityExist(GetPlayerPed(xPlayers[i])) then
                    print("FOUND AND SPAWN")
                    SetEntityCoords(GetPlayerPed(xPlayers[i]),dungeons[k].startCoords)
                    NeedToExit[k] = nil
                end
            end
        end
        
        for k,v in pairs(tempQuest) do
            for k2,v2 in pairs(v) do
                if not DoesEntityExist(GetPlayerPed(v2.serverId)) then
                    NeedToExit[k] = v2.identifier
                    table.remove( tempQuest[k], k2) 
                    dungeons[k].innerPlayers = dungeons[k].innerPlayers - 1
                end
            end
        end
        Wait(10000)
    end
end)

ESX.RegisterServerCallback("Dungeon:GetDungeons", function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    cb(dungeons)
end)