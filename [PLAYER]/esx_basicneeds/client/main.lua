ESX          = nil
local IsDead = false
local IsAnimated = false
local currentZone = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 500000)
	TriggerEvent('esx_status:set', 'thirst', 500000)
end)

RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)

	-- restore hp
	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('esx:onPlayerSpawn', function(spawn)
	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end
	IsDead = false
	Wait(1000)
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

local EnergyZone = {
	{title="Bahama Mamas",safe = true, colour=2, id=93,radius =30,coords = vector3(-1385.9697265625,-615.46630859375,29.927030563354)},
}

Citizen.CreateThread(function()
	while true do
		if currentZone ~= nil then
			local data = string.format("STRESSZ MENTES ZÓNA: %s", currentZone)
			SetTextFont(0)
			SetTextProportional(1)
			SetTextScale(0.0, 0.4)
			SetTextColour(255, 255, 255, 255)
			SetTextDropshadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			SetTextJustification(0)
			SetTextEntry("STRING")
			AddTextComponentString(data)
			DrawText(0.50, 0.2)
		end
		Wait(0)
	end
	
	
end)

local Hunger = 0
local Thirst = 0

AddEventHandler('esx_status:loaded', function(_status)
	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#CFAD0F', function(status)
		return Config.Visible
	end, function(status)
		status.remove(100)
	end)

	TriggerEvent('esx_status:registerStatus', 'stress', 0, '#CFAD0F', function(status)
		return Config.Visible
	end, function(status)
		local _EnergyZone = EnergyZone
		for k,v in pairs(_EnergyZone) do
			if #(GetEntityCoords(PlayerPedId()) - v.coords) > v.radius then
				status.add(100)
			else
				status.remove(3000)
			end
		end
	end)

	TriggerEvent('esx_status:registerStatus', 'energy', 1000000, '#CFAD0F', function(status)
		return Config.Visible
	end, function(status)
		status.remove(100)
	end)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0C98F1', function(status)
		return Config.Visible
	end, function(status)
		status.remove(170)
	end)

	TriggerEvent("esx_basicneeds:Loaded", _status)
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1000)

			local playerPed  = PlayerPedId()
			local prevHealth = GetEntityHealth(playerPed)
			local health     = prevHealth
			local randomity  = 1
			local _Thirst = 0
			local _Hunger = 0

			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				_Hunger = status.val
			end)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				_Thirst = status.val
			end)

			TriggerEvent('esx_status:getStatus', 'stress', function(status)
				local chance = math.random(1,100)
				if status.val == 1000000 then
					if randomity >= chance then
						TriggerEvent("Mage:Attack")
					end
				end
			end)
			

			if health ~= prevHealth then
				SetEntityHealth(playerPed, health)
			end

			for k,v in pairs(EnergyZone) do
				if #(GetEntityCoords(PlayerPedId()) - v.coords) > v.radius then
					currentZone = nil
				else
					currentZone = v.title
				end
			end
			Thirst = _Thirst
			Hunger = _Hunger
			
		end
	end)
end)

AddEventHandler('esx_basicneeds:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_burger_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_ld_flow_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.13, 0.028, 0.001, -115.0, 255.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)


--EFFECTS
local drunk = 0.0
local HungerEffect = 0
local ThirstEffect = 0
local active = false

AddEventHandler('esx:onPlayerSpawn', function(xPlayer)
	ShakeGameplayCam('DRUNK_SHAKE', drunk)
end)

--0 TICK
Citizen.CreateThread(function ()
	while true do
		Wait(0)
	end
end)

--SHAKE
Citizen.CreateThread(function ()
	while true do
		if drunk > 0 then
			drunk = drunk - 0.005
		else
			ShakeGameplayCam('DRUNK_SHAKE', 0.0)
		end
		if Hunger <= 100000 then
			SetExtraTimecycleModifier("hud_def_blur")
			SetExtraTimecycleModifierStrength(1.0 - (Hunger/100000))
		else
			ClearExtraTimecycleModifier()
		end

		if Thirst <= 100000 then
			SetExtraTimecycleModifier("hud_def_blur")
			SetExtraTimecycleModifierStrength(1.0 - (Thirst/100000))
		else
			ClearExtraTimecycleModifier()
		end
		Wait(5000)
	end
end)

RegisterNetEvent('esx_basicneeds:DrunkEffect')
AddEventHandler('esx_basicneeds:DrunkEffect', function(amount)
	drunk = drunk + amount
	ShakeGameplayCam('DRUNK_SHAKE', drunk)
end)


RegisterNetEvent('esx_basicneeds:ResetEffects')
AddEventHandler('esx_basicneeds:ResetEffects', function()
	drunk = 0
end)

