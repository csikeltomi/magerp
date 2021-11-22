local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                           = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

local vaultType = {}

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

function OpenVaultInventoryMenu(data)
		vaultType = data
		ESX.TriggerServerCallback(
			"monster_vault:getVaultInventory",
			function(inventory)
				if not inventory then
					exports['b1g_notify']:Notify('false', 'Not have license card')
				else
					TriggerEvent("monster_inventoryhud:openVaultInventory", inventory)
				end
			end,
			data
		)
end


local hackingdata
function mycb(success, timeremaining)
	if success then
		OpenVaultInventoryMenu(hackingdata)
		TriggerEvent('mhacking:hide')
	else
		print('Failure')
		TriggerEvent('mhacking:hide')
		PlaySoundFrontend(-1, "Bed", "WastedSounds", 1)
		ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)
		Citizen.Wait(500)
		PlaySoundFrontend(-1, "TextHit", "WastedSounds", 1)
		if(hackingdata.secured == true) then
		TriggerServerEvent('esx_phone:send', 'police', 'Rabálás folyamatban a kövezketö helszínen: ' .. hackingdata.Label, false, hackingdata.entry)
		end
	end
	hackingdata = nil
end


-- Key controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.Vault) do
			local dist = GetDistanceBetweenCoords(coords, v.coords, true)
		    if dist < 50 then
			DrawMarker(22, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5 ,1.5 , 1.0, 50, 50, 204, 100, false, true, 2, false, false, false, false)
			end
			if dist < 2 then
				if (v.job == ESX.PlayerData.job.name and ESX.PlayerData.job.grade >= v.grade) then
					ESX.ShowHelpNotification("Nyomd le az E bill. a tároló megnyitásához: ".. v.label)
					if IsControlJustReleased(0, Keys['E']) then
						OpenVaultInventoryMenu({job = v.job, grade = v.grade, inventory = v.inventory, needItemLicense = v.needItemLicense, InfiniteLicense = v.InfiniteLicense, Label = v.label, secured = v.secured, entry = v.entry})
					else
						break
					end
				else
					if v.hackable then
					if hackingdata == nil then
					ESX.ShowHelpNotification("Nyomd le az E bill. a tároló feltöréséhez: ".. v.label)
					end
					if IsControlJustReleased(0, Keys['E']) then
						hackingdata = {job = v.job, grade = v.grade, inventory = v.inventory, needItemLicense = v.needItemLicense, InfiniteLicense = v.InfiniteLicense, Label = v.label, secured = v.secured, entry = v.entry}
						TriggerEvent("mhacking:show")
						TriggerEvent("mhacking:start",7,35,mycb)
					else
						break
					end
				end
				end
			end
		end
	end
end)

function getMonsterVaultLicense()
	return vaultType
end
