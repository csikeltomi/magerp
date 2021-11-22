ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_lscustom:buyMod')
AddEventHandler('esx_lscustom:buyMod', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	price = tonumber(price)
	if price > xPlayer.getMoney() then
		TriggerClientEvent('esx_lscustom:cancelInstallMod', _source)
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
	else
		xPlayer.removeMoney(price)
		TriggerClientEvent('esx_lscustom:installMod', _source)
		TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
	end
end)

function TableMatch(table1, table2)
	for k,v in pairs(table1) do
		local diffs = 0
		print("FIND " .. k)
		if table2[k] and k == 'plate' then
			if table2[k] == v then
				--found = true
			else
				diffs = diffs + 1
			end
		else
			
		end
		if diffs > 2 then
			return false
		end
	end
	return true
end

RegisterServerEvent("esx_lscustom:SaveMods")
AddEventHandler("esx_lscustom:SaveMods", function(Invehicle,modified,plate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', {
		['@owner'] = xPlayer.identifier,
	}, function (result)
		local found = false
		if result[1] then -- does the owner match?
			for k,val in pairs(result) do
				local vehicle = json.decode(val.vehicle)
				print(vehicle.model .." == " .. Invehicle.model)
				
				if vehicle.model ==  Invehicle.model then
					print("MODEL MATCH")
					if TableMatch( vehicle, Invehicle)  then
						MySQL.Async.execute('UPDATE owned_vehicles SET `vehicle` = @vehicle WHERE plate = @plate', {
							['@vehicle'] = json.encode(modified),
							['@plate'] = val.plate,
						}, function(rowsChanged)
							print(ESX.DumpTable(rowsChanged))
							--print("UPDATE")
							
						end)
						break
					end
				end
				
			end
		end
		if not found then
			
		end
	end)

	
end)
