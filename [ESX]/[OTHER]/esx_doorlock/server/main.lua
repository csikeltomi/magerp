ESX = nil
local doorState = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_doorlock:updateState')
AddEventHandler('esx_doorlock:updateState', function(doorIndex, state, force)
	local xPlayer = ESX.GetPlayerFromId(source)
	doorState[doorIndex] = state
	TriggerClientEvent('esx_doorlock:setDoorState', -1, doorIndex, state)
	if xPlayer and type(doorIndex) == 'number' and type(state) == 'boolean' and Config.DoorList[doorIndex] and (isAuthorized(xPlayer.job.name, Config.DoorList[doorIndex]) or force) then
		
	end
end)

RegisterNetEvent("esx_doorlock:CloseByItem")
AddEventHandler("esx_doorlock:CloseByItem", function (item_name)
	for k,v in pairs(Config.DoorList) do
		if v.item and v.item == item_name then
			TriggerClientEvent('esx_doorlock:setDoorState', -1, k, true)
		end
	end
end)

ESX.RegisterServerCallback('esx_doorlock:getDoorState', function(source, cb)
	cb(doorState)
end)

function isAuthorized(jobName, doorObject)
	for k,job in pairs(doorObject.authorizedJobs) do
		if job == jobName then
			return true
		end
	end

	return false
end
