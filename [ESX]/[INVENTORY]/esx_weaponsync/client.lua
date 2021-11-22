ESX = nil

local Weapons = {}
local AmmoTypes = {}

local PlayerData = nil
local AmmoInClip = {}

local CurrentWeapon = nil

local IsShooting = false
local AmmoBefore = 0

for name,item in pairs(Config.Weapons) do
  Weapons[GetHashKey(name)] = item
end

for name,item in pairs(Config.AmmoTypes) do
  AmmoTypes[GetHashKey(name)] = item
end

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function GetAmmoItemFromHash(hash)
  for name,item in pairs(Config.Weapons) do
    if hash == GetHashKey(item.name) then
      if item.ammo then
        return item.ammo
      else
        return nil
      end
    end
  end
  return nil
end

function GetInventoryItem(name)
  while not PlayerData.inventory do
    Wait(50)
  end
  local inventory = PlayerData.inventory
  for i=1, #inventory, 1 do
    if inventory[i].name == name then
      return inventory[i]
    end
  end
  return nil
end

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
local ped = PlayerPedId()
    DisablePlayerVehicleRewards(ped)	
      if IsPedArmed(ped, 6) then
       DisableControlAction(1, 140, true)
          DisableControlAction(1, 141, true)
         DisableControlAction(1, 142, true)
      end
  end
end)



Citizen.CreateThread(function()
  while true do
  for k,v in pairs(Config.Weapons) do
   -- N_0x4757f00bc6323cfe(GetHashKey(k), 0.6) 
  end
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.3) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIFE"), 0.7) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.1) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HAMMER"), 0.1) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.1) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CROWBAR"), 10.1) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL50"), 5.1) 
  N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BZGAS"), 0.1) 
  Citizen.Wait(500)
  end
end)

Citizen.CreateThread(function ()
  while PlayerData == nil do
    PlayerData = ESX.GetPlayerData()
    Wait(10)
  end
  --RebuildLoadout()
end)

RegisterCommand('fix', function()
  RebuildLoadout()
end)

RegisterNetEvent("RebuildWeaponLayout")
AddEventHandler("RebuildWeaponLayout", function ()
  RebuildLoadout()
end)

function RebuildLoadout()
  
  while not PlayerData do
    Citizen.Wait(0)
  end
  
  local playerPed = GetPlayerPed(-1)

  for weaponHash,v in pairs(Weapons) do
    local item = GetInventoryItem(v.item)
    if item and item.count > 0 then
      local ammo = 0
      local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)

      if ammoType and AmmoTypes[ammoType] then
        local ammoItem = GetInventoryItem(AmmoTypes[ammoType].item)
        if ammoItem then
          ammo = ammoItem.count
        end
      end

      if item.name == "fireextinguisher" then
        ammo = 1000
      end

      
      if item.name == "petrolcan" then
        ammo = 4500
      end
      if item.name == "pipebomb" then
        ammo = item.count
      end
      if item.name == "stickybomb" then
        ammo = item.count
      end
      
      if item.name == "bzgas" then
        ammo = item.count
      end
      
      if HasPedGotWeapon(playerPed, weaponHash, false) then
        if GetAmmoInPedWeapon(playerPed, weaponHash) ~= ammo then
          SetPedAmmo(playerPed, weaponHash, ammo)
        end
      else
        -- Weapon is missing, give it to the player
        GiveWeaponToPed(playerPed, weaponHash, ammo, false, false)
      end
    elseif HasPedGotWeapon(playerPed, weaponHash, false) then
      -- Weapon doesn't belong in loadout
      RemoveWeaponFromPed(playerPed, weaponHash)
    end
  end

end

function RemoveUsedAmmo()  
  local playerPed = GetPlayerPed(-1)
  local AmmoAfter = GetAmmoInPedWeapon(playerPed, CurrentWeapon)
  local ammoType = AmmoTypes[GetPedAmmoTypeFromWeapon(playerPed, CurrentWeapon)]
  
  if ammoType and ammoType.item then
    local ammoDiff = AmmoBefore - AmmoAfter
    if ammoDiff > 0 then
      TriggerServerEvent('esx:discardInventoryItem', ammoType.item, ammoDiff)
    end
  end

  return AmmoAfter
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = ESX.GetPlayerData()
  while PlayerData == nil do
    Wait(10)
  end
  Wait(5000)
  RebuildLoadout()
end)

Citizen.CreateThread(function ()
  PlayerData = ESX.GetPlayerData()
  while PlayerData == nil do
    Wait(10)
  end
  Wait(5000)
  RebuildLoadout()
end)

AddEventHandler('skinchanger:modelLoaded', function()
  while PlayerData == nil do
    PlayerData = ESX.GetPlayerData()
    Wait(10)
  end
  RebuildLoadout()
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(name, count)
  Citizen.Wait(1) -- Wait a tick to make sure ESX has updated PlayerData
  PlayerData = ESX.GetPlayerData()
  RebuildLoadout()
  if CurrentWeapon then
    AmmoBefore = GetAmmoInPedWeapon(GetPlayerPed(-1), CurrentWeapon)
  end
end)


RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(name, count)
  Citizen.Wait(1) -- Wait a tick to make sure ESX has updated PlayerData
  PlayerData = ESX.GetPlayerData()
  RebuildLoadout()
  if CurrentWeapon then
    AmmoBefore = GetAmmoInPedWeapon(GetPlayerPed(-1), CurrentWeapon)
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    
   
    local playerPed = GetPlayerPed(-1)
    

    if CurrentWeapon ~= GetSelectedPedWeapon(playerPed) then
      IsShooting = false
      RemoveUsedAmmo()
      CurrentWeapon = GetSelectedPedWeapon(playerPed)
      AmmoBefore = GetAmmoInPedWeapon(playerPed, CurrentWeapon)
    end

    if IsPedShooting(playerPed) and not IsShooting then
      IsShooting = true
    elseif IsShooting and IsControlJustReleased(0, 24) then
      IsShooting = false
      AmmoBefore = RemoveUsedAmmo()
    elseif not IsShooting and IsControlJustPressed(0, 45) then
      AmmoBefore = GetAmmoInPedWeapon(playerPed, CurrentWeapon)
    end
  end
end)