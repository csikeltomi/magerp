ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('esx:discardInventoryItem')
AddEventHandler('esx:discardInventoryItem', function(item, count)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	--TriggerEvent('esx:removeInventoryItemSilent', item, count, true)

    xPlayer.removeInventoryItem(item, count)
end)

ESX.RegisterServerCallback('weaponsync:sync', function(source, cb)
    local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
    cb(xPlayer.getInventory(true))
end)


RegisterServerEvent('weaponsync:AddInventoryItem')
AddEventHandler('weaponsync:AddInventoryItem', function(item,weapon)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	print(item)

  xPlayer.addInventoryItem(item, 1)

  print(weapon)
end)

RegisterServerEvent('weaponsync:clear')
AddEventHandler('weaponsync:clear', function()
  ExecuteCommand("clearloadout ".. source)
end)

RegisterServerEvent('esx:modelChanged')
AddEventHandler('esx:modelChanged', function(id)
	TriggerClientEvent('esx:modelChanged', id)
end)

ESX.RegisterUsableItem('pistol_ammo_box', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('pistol_ammo_box', 1)
	xPlayer.addInventoryItem('pistol_ammo', 24)
end)

ESX.RegisterUsableItem('smg_ammo_box', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('smg_ammo_box', 1)
	xPlayer.addInventoryItem('smg_ammo', 30)
end)

ESX.RegisterUsableItem('rifle_ammo_box', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('rifle_ammo_box', 1)
	xPlayer.addInventoryItem('rifle_ammo', 30)
end)

ESX.RegisterUsableItem('shotgun_ammo_box', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('shotgun_ammo_box', 1)
	xPlayer.addInventoryItem('shotgun_ammo', 16)
end)