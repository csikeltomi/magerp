Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0) -- prevent crashing

		-- These natives have to be called every frame.
		SetVehicleDensityMultiplierThisFrame(0.0) -- set traffic density to 0 
		SetPedDensityMultiplierThisFrame(1.0) -- set npc/ai peds density to 0
		SetRandomVehicleDensityMultiplierThisFrame(0.0) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
		SetParkedVehicleDensityMultiplierThisFrame(0.0) -- set random parked vehicles (parked car scenarios) to 0
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0) -- set random npc/ai peds or scenario peds to 0
		SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
		SetRandomBoats(false) -- Stop random boats from spawning in the water.
		SetCreateRandomCops(true) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(true) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(true) -- stop random cops (in a scenario) from spawning.
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
	end
end)


function SetWeaponDrops()
	local handle, ped = FindFirstPed()
	local finished = false

	repeat
		if not IsEntityDead(ped) then
			SetPedDropsWeaponsWhenDead(ped, false)
		end
		finished, ped = FindNextPed(handle)
	until not finished

	EndFindPed(handle)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		SetWeaponDrops()
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local id = PlayerId()
		DisablePlayerVehicleRewards(id)	
	end
end)


--[[Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		local PlayerPed = GetPlayerPed(-1)
		if IsPedSittingInAnyVehicle(PlayerPed) then
			local vehicle = GetVehiclePedIsIn(PlayerPed, false)
			local speed = GetEntitySpeed(vehicle) * 3.6
			if speed > 10 then

			end
		end
	end
end)]]