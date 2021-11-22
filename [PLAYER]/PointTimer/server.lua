ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
  ESX = obj
end)

RegisterServerEvent('Timer:UpdateTime')
AddEventHandler('Timer:UpdateTime', function ()
    local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT time FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
        if result[1].time ~= nil then
            local _time = tonumber(result[1].time) + 1
			MySQL.Async.execute('UPDATE `users` SET `time` = @time WHERE identifier = @identifier', {
                ['@identifier'] = xPlayer.identifier,
				['@time']		= _time
			}, function(rowsChanged)
			end)
		end
	end)
end)

