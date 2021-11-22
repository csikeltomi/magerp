ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)


RegisterServerEvent('esx_pawnshop:sellItem')
AddEventHandler('esx_pawnshop:sellItem', function(itemName)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local sellitem = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == itemName then
			sellitem = item
		end
	end
    print(sellitem.price)
    if sellitem.count > 0 then
        xPlayer.removeInventoryItem(itemName, 1)
        xPlayer.addMoney(sellitem.price)
		TriggerClientEvent('okokNotify:Alert', source, "ÁRUS", "Kaptál " .. sellitem.price .. " " .. " Galleont.", 20000, 'info')

    else 
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Nincs nálad elegendö mennyiség!')
    end
end)

ESX.RegisterServerCallback("esx_pawnshop:GetItemList", function(source,cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local returnItems = {}

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
		print(ESX.DumpTable(item))
		if item.price > 0 and item.count > 0 then
			table.insert( returnItems, {
				label = item.label .. " (" .. item.price ..")",
				value = item.name
			})
		end
	end
	cb(returnItems)
 end)


function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end