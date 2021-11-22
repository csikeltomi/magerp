ESX = nil

TriggerEvent(
    "esx:getSharedObject",
    function(obj)
        ESX = obj
    end
)

local haboruID = 0

local TeamA = {
}
local TeamB = {
}

local tickets= {
}

local zones = {
    ["A"] = {
        center = vector3(4516.5561523438, -4530.1215820313, 4.1206254959106),
        points = 0,
        radius = 10.0,
        blip = 76
    },
    ["B"] = {
        center = vector3(5130.0747070313,-4657.591796875,-20.2438864707947),
        text = vector3(5130.0747070313,-4657.591796875,10.2438864707947),
        points = 0,
        radius = 60.0,
        blip = 106,
    },
    ["C"] = {
        center = vector3(4892.0278320313,-4922.8549804688,-24.0054383277893),
        text = vector3(4891.275390625,-4922.2036132813,12.38484287262),
        points = 0,
        radius = 50.0,
        blip = 89,
    },
    ["D"] = {
        center = vector3(5023.1044921875,-5755.1318359375,-26.314291000366),
        text = vector3(5023.1044921875,-5755.1318359375,16.314291000366),
        points = 0,
        radius = 90.0,
        blip = 355
    },
}

Citizen.CreateThread(
    function()
        while true do
            for id, identity in pairs(TeamA) do
                local entity = GetPlayerPed(id)
                if DoesEntityExist(entity) then
                    local position = GetEntityCoords(entity)
                    for zone, data in pairs(zones) do
                        local distance = #(position - data.center)
                        if distance <= data.radius and GetEntityHealth(entity) > 1 and data.points < 100 then
                            zones[zone].points = zones[zone].points + 1
                        end
                    end
                end
                TriggerClientEvent("Haboru:SyncZones", id, zones, tickets)
            end
            for id, identity in pairs(TeamB) do
                local entity = GetPlayerPed(id)
                if DoesEntityExist(entity) then
                    local position = GetEntityCoords(entity)
                    for zone, data in pairs(zones) do
                        local distance = #(position - data.center)
                        if distance <= data.radius and GetEntityHealth(entity) > 1 and data.points > -100 then
                            zones[zone].points = zones[zone].points - 1
                        end
                    end
                end
                TriggerClientEvent("Haboru:SyncZones", id, zones, tickets)
            end
            Wait(1000)
        end
    end
)

Citizen.CreateThread(function()
    while true do
        ScanID()
        Wait(15000)
    end
end)

function ScanID()
    for id, identity in pairs(TeamA) do
        local xPlayer = ESX.GetPlayerFromIdentifier(identity)
        if xPlayer then
            if id ~= xPlayer.source and xPlayer then
                TeamA[xPlayer.source] = identity
                TeamA[id] = nil
            end
        end
    end
    for id, identity in pairs(TeamB) do
        local xPlayer = ESX.GetPlayerFromIdentifier(identity)
        if xPlayer then
            if id ~= xPlayer.source then
                TeamB[xPlayer.source] = identity
                TeamB[id] = nil
            end
        end
        
    end
end

local ATeam = {
    coords = vector3(3376.5270996094,-5690.6469726563,326.6408996582),
    heading = 305.0
}

local BTeam = {
    coords = vector3(6488.8955078125,-4691.6015625,326.6408996582),
    heading = 100.0
}

RegisterCommand('haboru', function(source, args, rawCommand)
    ScanID()
    for id, identity in pairs(TeamA) do
       TriggerClientEvent("Haboru:Start", id, ATeam)
    end
    for id, identity in pairs(TeamB) do
        TriggerClientEvent("Haboru:Start", id, BTeam)
    end
end, true)

ESX.RegisterServerCallback("Haboru:IsInWar", function(source,cb)
    local _source = source
    ScanID()
    cb(TeamA[_source] or TeamB[_source])
end)




RegisterServerEvent("Haboru:StartByTimer")
AddEventHandler("Haboru:StartByTimer", function (teamA,teamB, _haboruID)
    TeamA = teamA
    TeamB = teamB
    local ticketCount = math.floor((#TeamA + #TeamB) /2) * 10
    tickets["A"] = ticketCount
    tickets["B"] = ticketCount
    haboruID = _haboruID

    ScanID()
    for id, identity in pairs(TeamA) do
       TriggerClientEvent("Haboru:Start", id, ATeam)
    end
    for id, identity in pairs(TeamB) do
        TriggerClientEvent("Haboru:Start", id, BTeam)
    end
end)


RegisterServerEvent("Haboru:PlayerDeath")
AddEventHandler("Haboru:PlayerDeath", function ()
    local _source = source
    local team = nil
    local TicketCost = 4
    ScanID()
    if TeamA[_source] then
        team = ATeam
        for k,v in pairs(zones) do
            if v.points > 0 then
                TicketCost = TicketCost - 1
            end
        end
        tickets["A"] = tickets["A"] - TicketCost
    end
    if TeamB[_source] then
        team = BTeam
        for k,v in pairs(zones) do
            if v.points < 0 then
                TicketCost = TicketCost - 1
            end
        end
        tickets["B"] = tickets["B"] - TicketCost
    end
    
    if tickets["B"] <= 0 then
        TeamA = {}
        TeamB = {}
        TriggerClientEvent("Haboru:SyncZones", -1, {},{})
        PickWinner("A",haboruID)
        print("GYOZTES AZ A")
    end

    if tickets["A"] <= 0 then
        TeamA = {}
        TeamB = {}
        TriggerClientEvent("Haboru:SyncZones", -1, {},{})
        PickWinner("B",haboruID)
        print("GYOZTES A B")
    end

    print("RESPAWN PLAYER")
    TriggerClientEvent("Haboru:awaitRespawn", _source, team) 
end)

RegisterServerEvent("Haboru:PickWinner")
AddEventHandler("Haboru:PickWinner", function (Winner,_haboruID)
    PickWinner(Winner,_haboruID)
end)

function PickWinner(Winner,_haboruID)

    MySQL.Async.fetchAll('SELECT * FROM `haboruk` WHERE ID = @ID', {
        ["@ID"] = _haboruID,
    }, function(result2)
        local winnerid = 0
        if Winner == "A" then
            winnerid = result2[1].acsapatID
        end
        if Winner == "B" then
            winnerid = result2[1].bcsapatID
        end
        MySQL.Async.execute('UPDATE `hqs` SET ownerClan = @ownerID WHERE item = @item',
        {
            ["@ownerID"] = winnerid,
            ["@item"] = result2[1].hq,
        }, function(rowsChanged)
            MySQL.Async.execute('DELETE FROM `haboruk` WHERE ID = @ID',
            {
                ["@ID"] = _haboruID,
            }, function(rowsChanged)
                haboruID = 0
                GiveAllKristaly(result2[1].hq)
                for k,v in pairs(zones) do
                    zones[k].points = 0
                end
            end)
        end)
    end)
   
end

local kristalyok = {
    ['kek_kristaly'] = {
      
    },
    ['sarga_kristaly'] = {
     
    },
    ['voros_kristaly'] = {
    
    },
    ['zold_kristaly'] = {
     
    },
  }


function GiveAllKristaly(kristaly)

    local busy = true
    MySQL.Async.fetchAll('SELECT identifier,inventory FROM `users`', {}, function(result)
        if result[1] ~= nil then
            for k,v in pairs(result) do
                local inventory = json.decode(v.inventory)
                for k,inv in pairs(inventory) do
                    if k == kristaly then
                        inventory[k] = nil
                        MySQL.Async.execute('UPDATE `users` SET inventory = @inventory WHERE identifier = @identifier',
                        {
                            ["@inventory"] = json.encode(inventory),
                            ["@identifier"] = v.identifier,
                        }, function(rowsChanged)
                        end)
                    end
                end
                TriggerEvent('esx_addoninventory:getInventory', "vault", v.identifier, function(SH_inventory) 
                    if SH_inventory then
                        SH_inventory.setItem(kristaly, 0)
                    end
                end)
            end
        end
        busy = false
    end)

    while busy do
        Wait(100)
    end
    
    local xPlayers = ESX.GetPlayers()
    while not xPlayers do
    Wait(100)
    end

    for i=1, #xPlayers, 1 do
        local player = ESX.GetPlayerFromId(xPlayers[i]) 
        player.setInventoryItem(kristaly, 0)
    end


    for k,v in pairs(kristalyok) do
        TriggerEvent('esx_addoninventory:getSharedInventory', k, function(SH_inventory) 
            SH_inventory.setItem(k, 0)
        end)
    end
    
    TriggerEvent('esx_addoninventory:getSharedInventory', kristaly, function(SH_inventory) 
        SH_inventory.setItem(kristaly, 50)
        TriggerEvent("esx_doorlock:CloseByItem", kristaly)
      end)
end