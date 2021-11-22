ESX = nil

Citizen.CreateThread(
	function()
		while ESX == nil do
			TriggerEvent(
				"esx:getSharedObject",
				function(obj)
					ESX = obj
				end
			)
			Citizen.Wait(0)
		end

		while not ESX.GetPlayerData().job do
			Citizen.Wait(10)
		end

		ESX.PlayerData = ESX.GetPlayerData()

		-- Update the door list
		ESX.TriggerServerCallback(
			"esx_doorlock:getDoorState",
			function(doorState)
				for index, state in pairs(doorState) do
					Config.DoorList[index].locked = state
				end
			end
		)
	end
)

RegisterNetEvent("esx:setJob")
AddEventHandler(
	"esx:setJob",
	function(job)
		ESX.PlayerData.job = job
	end
)

RegisterNetEvent("esx_doorlock:setDoorState")
AddEventHandler(
	"esx_doorlock:setDoorState",
	function(index, state)
		Config.DoorList[index].locked = state
	end
)

Citizen.CreateThread(
	function()
		while true do
			local playerCoords = GetEntityCoords(PlayerPedId())

			for k, v in ipairs(Config.DoorList) do
				v.isAuthorized = isAuthorized(v)
				if v.doors then
					for k2, v2 in ipairs(v.doors) do
						if v2.object and DoesEntityExist(v2.object) then
							if k2 == 1 then
								v.distanceToPlayer = #(playerCoords - GetEntityCoords(v2.object))
							end

							if v.locked and v2.objHeading and ESX.Math.Round(GetEntityHeading(v2.object)) ~= v2.objHeading then
								SetEntityHeading(v2.object, v2.objHeading)
							end
						else
							v.distanceToPlayer = nil
							v2.object = GetClosestObjectOfType(v2.objCoords, 1.0, v2.objHash, false, false, false)
							if not v.health then
								SetEntityMaxHealth(v2.object, 2000)
								SetEntityHealth(v2.object, 2000)
							else
								SetEntityMaxHealth(v2.object, v.health)
								SetEntityHealth(v2.object, v.health)
							end
						end
					end
				else
					if v.object and DoesEntityExist(v.object) then
						v.distanceToPlayer = #(playerCoords - GetEntityCoords(v.object))

						if v.locked and v.objHeading and ESX.Math.Round(GetEntityHeading(v.object)) ~= v.objHeading then
							SetEntityHeading(v.object, v.objHeading)
						end
					else
						v.distanceToPlayer = nil
						v.object = GetClosestObjectOfType(v.objCoords, 1.0, v.objHash, false, false, false)
						if not v.health then
							SetEntityMaxHealth(v.object, 2000)
							SetEntityHealth(v.object, 2000)
						else
							SetEntityMaxHealth(v.object, v.health)
							SetEntityHealth(v.object, v.health)
						end
					end
				end
			end

			Citizen.Wait(1000)
		end
	end
)

Citizen.CreateThread(
	function()
		while true do
			Citizen.Wait(10000)
			for k, v in ipairs(Config.DoorList) do
				local health = -1
				if v.doors then
					for k2, v2 in ipairs(v.doors) do
						if v.health then
							health = GetEntityHealth(v2.object)
							if health > 0 then
								if (GetEntityHealth(v2.object) < v.health and v.locked) then
									local newHealth = GetEntityHealth(v2.object) + health / 600
									SetEntityHealth(v2.object, math.floor(newHealth))
									if newHealth > GetEntityMaxHealth(v2.object) then
										SetEntityHealth(v2.object, GetEntityMaxHealth(v2.object))
									end
								end
							end
						end
					end
				else
					if v.health then
						if health == -1 then
							health = GetEntityHealth(v.object)
							if health > 0 then
								if (GetEntityHealth(v.object) < v.health and v.locked) then
									local newHealth = GetEntityHealth(v.object) + health / 600
									SetEntityHealth(v.object, math.floor(newHealth))
									if newHealth > GetEntityMaxHealth(v.object) then
										SetEntityHealth(v.object, GetEntityMaxHealth(v.object))
									end
								end
							end
						end
					end
				end
			end
		end
	end
)

Citizen.CreateThread(
	function()
		while true do
			Citizen.Wait(0)
			local letSleep = true

			for k, v in ipairs(Config.DoorList) do
				local health = -1
				if v.distanceToPlayer and v.distanceToPlayer < 30 then
					letSleep = false

					if v.doors then
						for k2, v2 in ipairs(v.doors) do
							if v.health then
								if health == -1 then
									health = GetEntityHealth(v2.object)
								end
							end
							if (GetEntityHealth(v2.object) < 10 and v.locked) then
								print(GetEntityHealth(v2.object))
								v.locked = not v.locked
								--SetEntityHealth(v2.object, 1000)
								TriggerServerEvent("esx_doorlock:updateState", k, v.locked, true)
							end
							FreezeEntityPosition(v2.object, v.locked)
						end
					else
						if v.health then
							if health == -1 then
								health = GetEntityHealth(v.object)
							end
						end
						if (GetEntityHealth(v.object) < 10 and v.locked) then
							v.locked = not v.locked
							--SetEntityHealth(v.object, 1000)
							TriggerServerEvent("esx_doorlock:updateState", k, v.locked, true)
						end
						FreezeEntityPosition(v.object, v.locked)
					end
					--print(health)
					if v.health and health ~= -1 then
						Config.DoorList[k].healt = tonumber(health)
					end
				end

				if v.distanceToPlayer and v.distanceToPlayer < v.maxDistance then
					local size, displayText = 0.5, _U("unlocked")
					letSleep = false
					if v.size then
						size = v.size
					end
					if v.locked then
						displayText = _U("locked")
					end
					if v.isAuthorized then
						displayText = _U("press_button", displayText)
					end
					if v.color then
						displayText = v.color .. "~s~" .. displayText
					end
					ESX.Game.Utils.DrawText3D(v.textCoords, displayText .. "\n" .. tostring(health), size)
					--ESX.Game.Utils.DrawText3D(vector3(v.textCoords.x,v.textCoords.y,v.textCoords.z-0.1), tostring(health), size)

					if IsControlJustReleased(0, 38) then
						if v.isAuthorized then
							v.locked = not v.locked

							TriggerServerEvent("esx_doorlock:updateState", k, v.locked, true) -- broadcast new state of the door to everyone
						end
					end
				end
			end

			if letSleep then
				Citizen.Wait(1000)
			end
		end
	end
)

Citizen.CreateThread(
	function()
		while true do
			ESX.PlayerData = ESX.GetPlayerData()
			Citizen.Wait(5000)
		end
	end
)

function GetInventoryItem(name)
	local inventory = ESX.PlayerData.inventory
	for i = 1, #inventory, 1 do
		if inventory[i].name == name then
			return inventory[i]
		end
	end
	return nil
end

local clanItems = {}
local faction = 'nincs'
Citizen.CreateThread(function()
	while true do
		ESX.TriggerServerCallback(
			"Group:GetActiveMyGroupID",
			function(cb)
				clanItems = cb
			end
		)
		ESX.TriggerServerCallback("Group:GetFaction", function(_faction) 
			faction = _faction
		end)
		Wait(10000)
	end
end)

function isAuthorized(door)
	if not ESX or not ESX.PlayerData.job then
		return false
	end

	for k, job in pairs(door.authorizedJobs) do
		if job == ESX.PlayerData.job.name then
			return true
		end
	end
	if door.item then
		for k, v in pairs(clanItems) do
			if v.item == door.item then
				return true
			end
		end
	end
	if door.faction then
		if door.faction == faction then
			return true
		end
	end

	return false
end
