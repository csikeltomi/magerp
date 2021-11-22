ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
  ESX = obj
end)

local aktivVerseny = {}

RegisterCommand('race', function(source, args, rawCommand)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
      local senderCoords = GetEntityCoords(GetPlayerPed(source))
      local receiverCoords = GetEntityCoords(GetPlayerPed(xPlayers[i]))
      if #(senderCoords - receiverCoords) < 20.0 then
        TriggerClientEvent("MagicGame:Race", xPlayers[i], args[1])
      end
    end
end, false)

RegisterServerEvent("MagicGame:RaceWon")
AddEventHandler("MagicGame:RaceWon", function(raceid)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addMoney(aktivVerseny[raceid].nyeremeny)
    TriggerClientEvent("MagicGame:RaceWon", -1, raceid, xPlayer.getName() , aktivVerseny[raceid].nyeremeny)
    TriggerClientEvent('okokNotify:Alert', _source, "VERSENY", "Nyertél " .. aktivVerseny[raceid].nyeremeny .. " Galleont", 20000, 'info')
    aktivVerseny[raceid] = nil
end)

RegisterServerEvent("MagicGame:Register")
AddEventHandler("MagicGame:Register", function(raceid)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local pmoney = xPlayer.getMoney() 

    if tonumber(pmoney) >= tonumber(aktivVerseny[raceid].beugro) then
        xPlayer.removeMoney(aktivVerseny[raceid].beugro)
        aktivVerseny[raceid].nyeremeny = aktivVerseny[raceid].nyeremeny + aktivVerseny[raceid].beugro
        table.insert( aktivVerseny[raceid].registraltak, _source ) 
        TriggerClientEvent('okokNotify:Alert', _source, "VERSENY", "Sikeresen regisztráltál", 20000, 'info')
    else
        TriggerClientEvent('okokNotify:Alert', _source, "VERSENY", "Nincs nálad elengedő Galleon", 20000, 'error')
    end
    
end)

ESX.RegisterServerCallback("MagicGame:GetIsActive", function(source,cb,raceid)
    cb(aktivVerseny[raceid])
end)

RegisterServerEvent("MagicGame:RaceActive")
AddEventHandler("MagicGame:RaceActive", function(raceid, beugro, nev)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local pmoney = xPlayer.getMoney() 
    if tonumber(pmoney) >= tonumber(beugro) then
        xPlayer.removeMoney(beugro)
        aktivVerseny[raceid] = {
            beugro = beugro,
            nyeremeny = beugro,
            timer = 180,
            nev = nev,
            registraltak = {}
        }
        print(ESX.DumpTable(aktivVerseny[raceid]))
        table.insert( aktivVerseny[raceid].registraltak, _source ) 
        TriggerClientEvent('okokNotify:Alert', _source, "VERSENY", "Sikeresen meghirdetted a versenyt", 20000, 'info')
    else
        TriggerClientEvent('okokNotify:Alert', _source, "VERSENY", "Nincs nálad elengedő Galleon", 20000, 'error')
    end
    
end)

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(aktivVerseny) do
            if v.timer > 0 then
                aktivVerseny[k].timer = v.timer - 60
                TriggerClientEvent('chat:addMessage', -1, {
                    template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 175, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i> VERSENY: {0}<br>{1} másodper múlva <br> Beugró: {2} Galleon <br> Nyeremény: {3} Galleon</div>',
                    args = {  v.nev, v.timer, v.beugro, v.nyeremeny }
                })
            end
           
            if v.timer <= 0 then
                for k2,v2 in pairs(aktivVerseny[k].registraltak) do
                    TriggerClientEvent("MagicGame:Race", v2, k)
                end
            end
        end
        Wait(60000)
    end
end)