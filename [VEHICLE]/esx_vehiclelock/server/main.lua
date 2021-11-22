ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_vehiclelock:requestPlayerCars', function(source, cb, plate)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE (owner = @user AND plate = @plate) OR (owner = @user AND plate = @plate)', {
		['@user'] = xPlayer.identifier,
		['@plate'] = plate
	}, function(result)
		print(xPlayer.identifier)
		print(ESX.DumpTable(result[1]))
		cb(result[1] ~= nil)
	end)
end)

RegisterNetEvent('persistent-vehicles:changeKey')
AddEventHandler('persistent-vehicles:changeKey', function(plate)
  MySQL.Async.execute('UPDATE owned_vehicles SET user = NULL WHERE plate = @plate', {
    ['@plate'] = plate,
  }, function(rowsChanged)
    print("TrunkDeleted ".. plate)
  end)
end)

--[[
RegisterNetEvent('persistent-vehicles:setOwner')
AddEventHandler('persistent-vehicles:setOwner', function(plate, model)
	local xPlayer = ESX.GetPlayerFromId(source)
  print("StartSet")
  MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE type = @type AND job = @job AND plate =  @plate', {
		['@owner'] = xPlayer.identifier,
    ['@type'] = 'car',
    ['@plate'] = plate,
		['@job'] = xPlayer.job.name
	}, function(result)
    if result == nil then
      MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)', {
        ['@owner'] = xPlayer.identifier,
        ['@plate'] = plate,
        ['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate}),
        ['@type'] = 'car'
      }, function(rowsChanged)
        print("Owner ".. plate)
      end)
    else
      MySQL.Async.execute('UPDATE owned_vehicles SET user = @user WHERE plate = @plate', {
        ['@user'] = xPlayer.identifier,
        ['@plate'] = plate,
      }, function(rowsChanged)
        print("Owner ".. plate)
      end)
    end
	end)

end)
]]
