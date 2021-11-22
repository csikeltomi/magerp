-- Written by @vjuton#2137 --
-- Set ped to user script --

-- Version: 1.0.2

-- Requirements:

-- Mythic_Notify
-- https://github.com/mythicrp/mythic_notify

--[[

PEDS

s_m_y_cop_01
s_m_y_swat_01
a_m_y_musclbeac_01
s_m_m_movspace_01
s_m_m_movalien_01

--]]
local currentped = nil

ESX = nil
local PlayerData = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)



AddEventHandler('esx:onPlayerSpawn', function(xPlayer)
	PlayerData = xPlayer
	--Wait(30000)
	TriggerServerEvent("ped:PlayerLoad")
	Wait(1000)
	TriggerEvent("RebuildWeaponLayout")
end)


RegisterNetEvent('ped:SetModel')
AddEventHandler('ped:SetModel', function(model)
currentped = model
SetPed(currentped)
end)


function hintToDisplay(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local place = {
    ['homie'] = {
		pos = vector3(-239.24771118164,-924.89868164062,31.4),
		animal = nil,
		label = 'Allatok',
		job = nil
	},
    ['mechanic'] = {
		pos = vector3(-223.62522888184,-1328.8864746094,39.3),
		animal = 'a_c_crow',
		label = 'Varjú',
		job = 'mechanic2'
	},
    ['yakuza'] = {
		pos = vector3(-2014.9654541016,1994.9293212891,186.07464599609),
		animal = 'a_c_chickenhawk',
		label = 'Sólyom',
		job = 'yakuza'
	},
	['swat'] = {
		pos = vector3(-2014.9654541016,1994.9293212891,186.07464599609),
		animal = 's_m_y_swat_01',
		label = 'SWAT',
		job = 'swat'
	}
}
--[[
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(place) do
            DrawMarker(27, place[k].pos.x, place[k].pos.y, place[k].pos.z, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 0, 255, 50, 200, 0, 0, 0, 0)
        end
    end
end)]]
local open = false
local ispremium = false
local currentZone = nil

Citizen.CreateThread(function()
	while ESX == nil do
		Citizen.Wait(20)
	end
	local playerdata = ESX.GetPlayerData()
	while playerdata.job == nil do
		Citizen.Wait(20)
	end
    while true do
        Citizen.Wait(0)

        for k in pairs(place) do
			
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, place[k].pos.x, place[k].pos.y, place[k].pos.z-1)

			if dist <= 4 then
				currentZone = k
                --doesnt spam notifcations only shows top corner
                hintToDisplay('Nyomj ~INPUT_CONTEXT~-t az átváltozáshoz')
                
				if IsControlJustPressed(0, 38) then -- "E"
					ESX.TriggerServerCallback('ped:getPremium', function(premium)
						local _premium = premium
						if _premium then
							if place[k].job == nil then
								OpenHomieMenu(nil,nil)
							elseif playerdata.job.name == place[k].job then
								OpenHomieMenu(place[k].job,place[k].animal,place[k].label)
							else
								exports['b1g_notify']:Notify('false', 'Nem vagy frakciótag')
							end
						else
							exports['b1g_notify']:Notify('false', 'Nincs megfelelö Patreon-od')
						end
					end)
                    
				end            
			else
				if open and currentZone == k then
					ESX.UI.Menu.CloseAll()
					open = false
				end
			end
			
			
        end
    end
end)

RegisterCommand("resetped", function(source --[[ this is the player ID (on the server): a number ]], args --[[ this is a table of the arguments provided ]], rawCommand --[[ this is what the user entered ]])
	print("CURRENT" .. currentped)
	if(currentped == nil) then
		SetPed('RESET')
		local playerPed = PlayerPedId()
		FreezeEntityPosition(playerPed, false)
		SetEntityVisible(playerPed, true)
	else
		SetPed(currentped)
	end	

end, false) -- this true bool means that the user cannot execute the command unless they have the 'command.commandName' ACL object allowed to one of their identifiers.

RegisterCommand("component", function(source --[[ this is the player ID (on the server): a number ]], args --[[ this is a table of the arguments provided ]], rawCommand --[[ this is what the user entered ]])
	print("CURRENT" .. currentped)
	

end, false)

function OpenHomieMenu(job,animal,label)
	open = true
	local  elements = {
		{label = 'RESET',    value = 'RESET'}
	}
	if job == nil then
		elements = {
			{label = 'RESET',    value = 'RESET'},
			{label = 'a_c_westy', value = 'a_c_westy'},
			{label = 'a_c_cat_01', value = 'a_c_cat_01'},
			{label = 'a_c_poodle', value = 'a_c_poodle'},
			{label = 'a_c_pug', value = 'a_c_pug'},
	}
	else
	table.insert(elements,{label = label, value = animal})
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gateway', {
		title    = 'PED',
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		
		SetPed(data.current.value)
		currentped = data.current.value
	end, function(data, menu)
		open = false
		menu.close()
	end)
	
end

function SetPed(ped)
	local current_health = GetEntityHealth(PlayerPedId())
	if ped == 'a_c_pug' then
		local ped = 'a_c_pug'
		local hash = GetHashKey(ped)
		RequestModel(hash)
		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end	
		SetPlayerModel(PlayerId(), hash)
		TriggerServerEvent("ped:SetPed",ped)
		
	elseif ped == 'a_c_poodle' then
		local ped = 'a_c_poodle'
		local hash = GetHashKey(ped)
		RequestModel(hash)
		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end	
		SetPlayerModel(PlayerId(), hash)
		TriggerServerEvent("ped:SetPed",ped)
	elseif ped == 'a_c_cat_01' then
		local ped = 'a_c_cat_01'
		local hash = GetHashKey(ped)
		RequestModel(hash)
		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end	
		SetPlayerModel(PlayerId(), hash)
		TriggerServerEvent("ped:SetPed",ped)
	elseif ped == 'a_c_westy' then
		local ped = 'a_c_westy'
		local hash = GetHashKey(ped)
		RequestModel(hash)
		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end	
		SetPlayerModel(PlayerId(), hash)
		TriggerServerEvent("ped:SetPed",ped)
	elseif ped == 'RESET' then
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			local model = nil
  
			if skin.sex == 0 then
			  model = GetHashKey("mp_m_freemode_01")
			else
			  model = GetHashKey("mp_f_freemode_01")
			end
  
			RequestModel(model)
			while not HasModelLoaded(model) do
			  RequestModel(model)
			  Citizen.Wait(1)
			end
  
			SetPlayerModel(PlayerId(), model)
			SetModelAsNoLongerNeeded(model)
  
			TriggerEvent('skinchanger:loadSkin', skin)
			local playerPed = GetPlayerPed(-1)
			SetPedArmour(playerPed, 0)
			ClearPedBloodDamage(playerPed)
			ResetPedVisibleDamage(playerPed)
			ClearPedLastWeaponDamage(playerPed)
		  end)
		  TriggerServerEvent("ped:SetPed",ped)
		else
			local hash = GetHashKey(ped)
			RequestModel(hash)
			while not HasModelLoaded(hash) do
				RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
			TriggerServerEvent("ped:SetPed",ped) 
	end
	if ped ~= "RESET" then
		local pP = GetPlayerPed(-1)
		SetCurrentPedWeapon(pP, GetHashKey('WEAPON_UNARMED'), true)
		DisablePlayerFiring(pP, true)
	else
		local pP = GetPlayerPed(-1)
		SetCurrentPedWeapon(pP, GetHashKey('WEAPON_UNARMED'), true)
		DisablePlayerFiring(pP, false)
	end
	SetEntityHealth(PlayerPedId(), current_health)
end