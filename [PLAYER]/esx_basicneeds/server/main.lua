ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--ALKOHOLOK
ESX.RegisterUsableItem('whisky', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('whisky', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:remove', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 100000)
	TriggerClientEvent('esx_basicneeds:DrunkEffect', source, 0.6)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)


ESX.RegisterUsableItem('vodkafruit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('vodkafruit', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:remove', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 100000)
	TriggerClientEvent('esx_basicneeds:DrunkEffect', source, 0.6)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)

ESX.RegisterUsableItem('vodkaenergy', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('vodkaenergy', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:remove', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 100000)
	TriggerClientEvent('esx_basicneeds:DrunkEffect', source, 0.6)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)

ESX.RegisterUsableItem('vodka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('vodka', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:remove', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 100000)
	TriggerClientEvent('esx_basicneeds:DrunkEffect', source, 0.6)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)

ESX.RegisterUsableItem('tequila', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('tequila', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:remove', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 100000)
	TriggerClientEvent('esx_basicneeds:DrunkEffect', source, 0.6)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)

ESX.RegisterUsableItem('rhumfruit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('rhumfruit', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:remove', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 100000)
	TriggerClientEvent('esx_basicneeds:DrunkEffect', source, 0.6)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)


ESX.RegisterUsableItem('rhumcoca', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('rhumcoca', 1)

	--TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	--TriggerClientEvent('esx_status:remove', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 100000)
	TriggerClientEvent('esx_basicneeds:DrunkEffect', source, 0.3)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)

ESX.RegisterUsableItem('whiskycoca', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('whiskycoca', 1)

	--TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	--TriggerClientEvent('esx_status:remove', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 100000)
	TriggerClientEvent('esx_basicneeds:DrunkEffect', source, 0.3)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)

ESX.RegisterUsableItem('jagercerbere', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('jagercerbere', 1)

	--TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	--TriggerClientEvent('esx_status:remove', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 100000)
	TriggerClientEvent('esx_basicneeds:DrunkEffect', source, 0.4)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)

ESX.RegisterUsableItem('jagerbomb', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('jagerbomb', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	--TriggerClientEvent('esx_status:remove', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 150000)
	TriggerClientEvent('esx_basicneeds:DrunkEffect', source, 0.4)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)

ESX.RegisterUsableItem('rhum', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('rhum', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 100000)
	--TriggerClientEvent('esx_status:remove', source, 'hunger', 10000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 200000)
	TriggerClientEvent('esx_basicneeds:DrunkEffect', source, 0.6)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)

ESX.RegisterUsableItem('mojito', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('mojito', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 100000)
	--TriggerClientEvent('esx_status:remove', source, 'hunger', 10000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 200000)
	TriggerClientEvent('esx_basicneeds:DrunkEffect', source, 0.6)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)


ESX.RegisterUsableItem('metreshooter', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('metreshooter', 1)

	--TriggerClientEvent('esx_status:remove', source, 'thirst', 100000)
	--TriggerClientEvent('esx_status:remove', source, 'hunger', 10000)
	TriggerClientEvent('esx_status:remove', source, 'stress', 300000)
	TriggerClientEvent('esx_basicneeds:DrunkEffect', source, 0.9)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)


--ITALOK
ESX.RegisterUsableItem('soda', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('soda', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	
	--xPlayer.showNotification(_U('used_water'))
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_water'))
end)

ESX.RegisterUsableItem('jusfruit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('jusfruit', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_water'))
end)


--ETELEK

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	xPlayer.showNotification(_U('used_bread'))
end)

ESX.RegisterUsableItem('sandwich', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('sandwich', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--xPlayer.showNotification(_U('used_bread'))
end)

ESX.RegisterUsableItem('pistachio', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('pistachio', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--xPlayer.showNotification(_U('used_bread'))
end)

ESX.RegisterUsableItem('mixapero', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('mixapero', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--xPlayer.showNotification(_U('used_bread'))
end)

ESX.RegisterUsableItem('bolnoixcajou', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('bolnoixcajou', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--xPlayer.showNotification(_U('used_bread'))
end)

ESX.RegisterUsableItem('bolcacahuetes', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('bolcacahuetes', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--xPlayer.showNotification(_U('used_bread'))
end)

ESX.RegisterUsableItem('hamburger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('hamburger', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--xPlayer.showNotification(_U('used_bread'))
end)

ESX.RegisterUsableItem('chocolate', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('chocolate', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--xPlayer.showNotification(_U('used_bread'))
end)

ESX.RegisterUsableItem('chips', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('chips', 1)

	TriggerClientEvent('esx_status:remove', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	--xPlayer.showNotification(_U('used_bread'))
end)
































ESX.RegisterCommand('heal', 'admin', function(xPlayer, args, showError)
	args.playerId.triggerEvent('esx_basicneeds:healPlayer')
	args.playerId.triggerEvent('chat:addMessage', {args = {'^5HEAL', 'You have been healed.'}})
end, true, {help = 'Heal a player, or yourself - restores thirst, hunger and health.', validate = true, arguments = {
	{name = 'playerId', help = 'the player id', type = 'player'}
}})

ESX.RegisterCommand('loadStatus', 'admin', function(xPlayer, args, showError)
	args.playerId.triggerEvent('esx_status:ForceLoad')
end, true, {help = 'Heal a player, or yourself - restores thirst, hunger and health.', validate = true, arguments = {
	{name = 'playerId', help = 'the player id', type = 'player'}
}})
