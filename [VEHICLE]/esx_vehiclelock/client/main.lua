ESX = nil

local isRunningWorkaround = false
local lightMultiplier = 5.0
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function StartWorkaroundTask()
	if isRunningWorkaround then
		return
	end

	local timer = 0
	local playerPed = PlayerPedId()
	isRunningWorkaround = true

	while timer < 100 do
		Citizen.Wait(0)
		timer = timer + 1

		local vehicle = GetVehiclePedIsTryingToEnter(playerPed)

		if DoesEntityExist(vehicle) then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)
			
			if lockStatus == 4 then
				ClearPedTasks(playerPed)
			end
		end
	end

	isRunningWorkaround = false
end

function ToggleVehicleLock()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end
	local plate = GetVehicleNumberPlateText(vehicle)
	plate = ESX.Math.Trim(plate)
	if plate == tostring(GetPlayerServerId(PlayerId()))  then
		local lockStatus = GetVehicleDoorLockStatus(vehicle)
		print('Lock status: ' .. lockStatus)
		if lockStatus == 1 then -- unlocked
			SetVehicleDoorsLocked(vehicle, 2)
			--SetVehicleDoorsLockedForAllPlayers(vehicle,2)

			Blink(vehicle)
			PlayVehicleDoorCloseSound(vehicle, 1)
			TriggerServerEvent('InteractSound_SV:PlayWithinDistanceCoords',10.0, 'car_lock', 1.0, coords)
			exports['okokNotify']:Alert("JÁRMŰ", _U('message_locked'), 2000, 'error')
		elseif lockStatus == 2 then -- locked
			SetVehicleDoorsLocked(vehicle, 1)
			--SetVehicleDoorsLockedForAllPlayers(vehicle,1)
			PlayVehicleDoorOpenSound(vehicle, 0)
			Blink(vehicle)
			TriggerServerEvent('InteractSound_SV:PlayWithinDistanceCoords',10.0, 'car_lock', 1.0, coords)
			exports['okokNotify']:Alert("JÁRMŰ", _U('message_unlocked'), 2000, 'success')
		end
	end

	ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerCars', function(isOwnedVehicle)

		

	end, ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)))
end

function Blink(vehicle)
	Citizen.CreateThread(function ()
		for i=1,3 do
		SetVehicleLights(vehicle, 2)
		SetVehicleLightMultiplier(vehicle, lightMultiplier)
		Citizen.Wait(500)
		SetVehicleLights(vehicle, 0)
		SetVehicleLightMultiplier(vehicle, 1.0)
		Citizen.Wait(500)
		end
	end)
end

exports("ToggleVehicleLock", ToggleVehicleLock);


