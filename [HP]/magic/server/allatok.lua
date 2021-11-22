ESX = nil
local active_lumos = {}


TriggerEvent('esx:getSharedObject', function(obj) 
  ESX = obj
end)

local npc = {
  {a = nil, x= 253.89120483398, y=228.89898681641, z=101.68328857422, h = 239.42, m = GetHashKey('Troll'), r = 6, w = "weapon_crowbar"},
  {a = nil, x= 266.12731933594, y=215.37091064453, z=101.68334960938, h = 100.42, m = GetHashKey('Troll'), r = 6, w = "weapon_crowbar"},
  {a = nil, x= 265.17556762695, y=212.11915588379, z=101.68335723877, h = 51.42, m = GetHashKey('Troll'), r = 6, w = "weapon_crowbar"},
  {a = nil, x= 261.60992431641, y=217.23626708984, z=101.68335723877, h = 112.42, m = GetHashKey('Troll'), r = 6, w = "weapon_crowbar"},
}

local npcs = {}

local AnimalCoords={
  [1] = {coords = vector3(-854.12335205078,4868.5375976562,293.77688598633), area = 200.0, range = 200.0, aggressive_range = 10.0, default = 80, count = 80},
  [2] = {coords = vector3(-445.73327636719,2013.3983154297,123.5786895752), range = 1, area = 200.0, aggressive_range = 20.0,default = 8,count = 5},
  [3] ={coords = vector3(-472.69839477539,2087.4748535156,120.1076965332), range = 1, area = 200.0, aggressive_range = 20.0,default = 8,count = 3},
  [4] = {coords = vector3(-423.73959350586,2065.5112304688,120.16944122314), range = 1, area = 200.0, aggressive_range = 20.0,default = 8,count = 3},
  [5] ={coords = vector3(-486.05197143555,1894.7996826172,119.52042388916), range = 1, area = 200.0, aggressive_range = 20.0,default = 8,count = 3},
  [6] = {coords = vector3(-564.29571533203,1886.4788818359,123.03505706787), range = 1, area = 200.0, aggressive_range = 20.0,default = 8,count = 3},
  [7] = {coords = vector3(1484.1982421875,1065.1275634766,114.33400726318), area = 10.0, range = 5, aggressive_range = 20.0,count = 3,default = 8, fixAnimal = 1},
  [8] = {coords = vector3(1691.6661376953,2596.5031738281,70.927558898926), area = 100.0, range = 100.0, aggressive_range = 20.0,count = 50,default = 8, fixAnimal = 1},
}

RegisterServerEvent('MagicAllatok:StartSpawn')
AddEventHandler('MagicAllatok:StartSpawn',function ()
  local _source = source
  --TriggerClientEvent('MagicAllatok:StartSpawn',_source,AnimalCoords[1],1)
  for k,v in pairs(AnimalCoords) do
    local Player = GetEntityCoords(GetPlayerPed(_source))
    --print(Player)
    if #(Player - v.coords) < 100 then
      TriggerClientEvent('MagicAllatok:StartSpawn',_source,v,k)
    end
    
    Wait(1000)
  end
  
end)

Citizen.CreateThread(function ()
  while true do
    local xPlayers = ESX.GetPlayers()
    if #xPlayers == 0 then
      for k,v in pairs(AnimalCoords) do
        AnimalCoords[k].count = AnimalCoords[k].default
        Wait(10)
      end
    end
    for i=1, #xPlayers, 1 do
      local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
      local pedCoords = GetEntityCoords(GetPlayerPed(xPlayer.source)) 
      for k,v in pairs(AnimalCoords) do
        if #(pedCoords - v.coords ) < 300 and v.count > 0 then
          for k,v in pairs(AnimalCoords) do
            local Player = GetEntityCoords(GetPlayerPed(xPlayer.source))
            --print(Player)
            if #(Player - v.coords) then
              TriggerClientEvent('MagicAllatok:StartSpawn',xPlayer.source,v,k)
            end
            
            Wait(1000)
          end
        end
        Wait(1000)
      end
      
    end
    Wait(10000)
  end
end)


RegisterServerEvent('MagicAllatok:AddToArray')
AddEventHandler('MagicAllatok:AddToArray',function (animal,key,count)
  local _source = source
  AnimalCoords[key].count = AnimalCoords[key].count - count
  print(AnimalCoords[key].count)
 --[[  for k,v in pairs(animal) do
    table.insert(npcs,v)
    print("ADD ANIMAL")
  end]]
  table.insert(npcs,animal)
  TriggerClientEvent('MagicAllatok:SyncNpcs',_source,npcs)
  TriggerClientEvent('MagicAllatok:SyncSpawns',_source,AnimalCoords[key])
end)

RegisterServerEvent('MagicAllatok:SyncNpcs')
AddEventHandler('MagicAllatok:SyncNpcs',function ()
  local _source = source
  TriggerClientEvent('MagicAllatok:SyncNpcs',_source,npcs)
end)

ESX.RegisterServerCallback("MagicAllatok:CanSpawn", function(source,cb, key)
  cb(AnimalCoords[key])
end)

RegisterServerEvent('MagicAllatok:SyncSpawns')
AddEventHandler('MagicAllatok:SyncSpawns',function (k)
  local _source = source
  TriggerClientEvent('MagicAllatok:SyncSpawns',_source,AnimalCoords[k])
end)