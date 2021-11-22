-- Menu state
local showMenu = false

-- Keybind Lookup table
local keybindControls = {
	["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["Backspace"] = 177, ["Tab"] = 37, ["q"] = 44, ["w"] = 32, ["e"] = 38, ["r"] = 45, ["t"] = 245, ["y"] = 246, ["u"] = 303, ["p"] = 199, ["["] = 39, ["]"] = 40, ["Enter"] = 18, ["CapsLock"] = 137, ["a"] = 34, ["s"] = 8, ["d"] = 9, ["f"] = 23, ["g"] = 47, ["h"] = 74, ["k"] = 311, ["l"] = 182, ["Shift"] = 21, ["z"] = 20, ["x"] = 73, ["c"] = 26, ["v"] = 0, ["b"] = 29, ["n"] = 249, ["m"] = 244, [","] = 82, ["."] = 81, ["Home"] = 213, ["PageUp"] = 10, ["PageDown"] = 11, ["Delete"] = 178
}

local engineon = true

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
    while ESX.PlayerData.job == nil and ESX == nil do
        Citizen.Wait(0)
    end
end)

-- Main thread
Citizen.CreateThread(function()
    -- Update every frame
    while true do
        Citizen.Wait(0)

        -- Loop through all menus in config
        for _, menuConfig in pairs(menuConfigs) do
            -- Check if menu should be enabled
            if menuConfig:enableMenu() then
                --AddJobs
               --[[ if ESX.PlayerData.job ~= nil then
				  if ESX.PlayerData.job.name == 'police' and _ == 'functions' then
					if menuConfig.data.wheels[1].commands[2] ~= 's_police' then
						print(menuConfig.data.wheels[1].commands[2])
						table.insert(menuConfig.data.wheels[1].labels, 2, 'POLICE')
						table.insert(menuConfig.data.wheels[1].commands, 2, 's_police')

						end 
					end 
                end ]]
                -- When keybind is pressed toggle UI
                local keybindControl = keybindControls[menuConfig.data.keybind]
                if IsControlPressed(0, keybindControl) then
                    -- Init UI
                    showMenu = true
                    SendNUIMessage({
                        type = 'init',
                        data = menuConfig.data,
                        resourceName = GetCurrentResourceName()
                    })

                    -- Set cursor position and set focus
                    SetCursorLocation(0.5, 0.5)
                    SetNuiFocus(true, true)

                    -- Play sound
                    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)

                    -- Prevent menu from showing again until key is released
                    while showMenu == true do Citizen.Wait(100) end
                    Citizen.Wait(100)
                    while IsControlPressed(0, keybindControl) do Citizen.Wait(100) end
                end
            end
        end
    end
end)

-- Callback function for closing menu
RegisterNUICallback('closemenu', function(data, cb)
    -- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'destroy'
    })

    -- Play sound
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)

    -- Send ACK to callback function
    cb('ok')
end)

RegisterCommand("r_emotes", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    showMenu = true
    SendNUIMessage({
        type = 'init',
        data = subMenuConfigs["emotes"].data,
        resourceName = GetCurrentResourceName()
    })
    SetNuiFocus(true, true)
end, false)

RegisterCommand("r_walks", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    showMenu = true
    SendNUIMessage({
        type = 'init',
        data = subMenuConfigs["walks"].data,
        resourceName = GetCurrentResourceName()
    })
    SetNuiFocus(true, true)
end, false)


RegisterCommand("s_police", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    showMenu = true
    SendNUIMessage({
        type = 'init',
        data = subMenuConfigs["s_police"].data,
        resourceName = GetCurrentResourceName()
    })
    SetNuiFocus(true, true)
end, false)


RegisterCommand("r_vehiclelock", function(source, args, rawCommand)
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
	-- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'destroy'
    })
	exports.esx_vehiclelock:ToggleVehicleLock()
	
	
end, false)

RegisterCommand("r_engine", function(source, args, rawCommand)
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
	-- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'destroy'
    })

local ped = PlayerPedId()
local vehicle = GetVehiclePedIsIn(ped, false)
local engineStatus = GetIsVehicleEngineRunning(vehicle)

if vehicle ~= 0 then
	if not engineStatus then
		SetVehicleEngineOn(vehicle, true, false, true)
		ShowNotification("You've turned the key into the ~g~on ~w~position.")
	else 
		SetVehicleEngineOn(vehicle, false, false, true)
		ShowNotification("You've turned the key into the ~r~off ~w~position.")
	end 
end 

end, false)

-- Callback function for when a slice is clicked, execute command
RegisterNUICallback('sliceclicked', function(data, cb)
    -- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'destroy'
    })

    -- Play sound
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)

    -- Run command
    ExecuteCommand(data.command)

    -- Send ACK to callback function
    cb('ok')
end)

-- Callback function for testing
RegisterNUICallback('testprint', function(data, cb)
    -- Print message
    TriggerEvent('chatMessage', "[test]", {255,0,0}, data.message)

    -- Send ACK to callback function
    cb('ok')
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if IsControlJustPressed(1, 177) then
        showMenu = false
        SetNuiFocus(false, false)
        SendNUIMessage({
            type = 'destroy'
        })
         end
      end
  end)
  local run = 1
  function setUniform(value, plyPed)
  
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)

		TriggerEvent('skinchanger:getSkin', function(skina)
            print(run)
            run = run + 1
			if value == 'torso' then
				if skin.torso_1 ~= skina.torso_1 then
                    skina['torso_1'] = skin['torso_1']
                    skina['torso_2'] = skin['torso_2']
                    skina['tshirt_1'] = skin['tshirt_1']
                    skina['tshirt_2'] = skin['tshirt_2']
                    skina['arms'] = skin['arms']
                    print("EGY")
					TriggerEvent('skinchanger:loadClothes',nil, skina)
				else
                    print("KETTO")
                    skina['torso_1'] = 15
                    skina['torso_2'] = 0
                    skina['tshirt_1'] = 15 
                    skina['tshirt_2'] = 0
                    skina['arms'] = 15
					TriggerEvent('skinchanger:loadClothes',nil, skina)
				end
			elseif value == 'pants' then
				if skin.pants_1 ~= skina.pants_1 then
                    skina['pants_1'] = skin['pants_1']
                    skina['pants_2'] = skin['pants_2']
					TriggerEvent('skinchanger:loadClothes',nil, skina)
				else
					if skin.sex == 0 then
                        skina['pants_1'] = 61
                        skina['pants_2'] = 1
						TriggerEvent('skinchanger:loadClothes',nil, skina)
					else
                        skina['pants_1'] = 15
                        skina['pants_2'] = 0
						TriggerEvent('skinchanger:loadClothes',nil, skina, {['pants_1'] = 15, ['pants_2'] = 0})
					end
				end
			elseif value == 'shoes' then
				if skin.shoes_1 ~= skina.shoes_1 then
                    skina['shoes_1'] = skin['shoes_1']
                    skina['shoes_2'] = skin['shoes_2']
					TriggerEvent('skinchanger:loadClothes', nil, skina)
				else
					if skin.sex == 0 then
                        skina['shoes_1'] = -1
                        skina['shoes_2'] = -1
						TriggerEvent('skinchanger:loadClothes',nil, skina)
					else
                        skina['shoes_1'] = -1
                        skina['shoes_2'] = -1
						TriggerEvent('skinchanger:loadClothes',nil, skina)
					end
				end
			elseif value == 'bag' then
				if skin.bags_1 ~= skina.bags_1 then
                    skina['bags_1'] = skin['bags_1']
                    skina['bags_2'] = skin['bags_2']
					TriggerEvent('skinchanger:loadClothes',nil, skina)
				else
                    skina['bags_1'] = 0
                    skina['bags_2'] = 0
					TriggerEvent('skinchanger:loadClothes',nil, skina)
				end
			elseif value == 'bproof' then
				startAnimAction('clothingtie', 'try_tie_neutral_a')
				Citizen.Wait(1000)
				Player.handsup, Player.pointing = false, false
				ClearPedTasks(plyPed)

				if skin.bproof_1 ~= skina.bproof_1 then
                    skina['bproof_1'] = skin['bproof_1']
                    skina['bproof_2'] = skin['bproof_2']
					TriggerEvent('skinchanger:loadClothes', skina)
				else
                    skina['bproof_1'] = 0
                    skina['bproof_2'] = 0
					TriggerEvent('skinchanger:loadClothes', skina, {['bproof_1'] = 0, ['bproof_2'] = 0})
				end
			end
		end)
	end)
end

function setAccessory(accessory)
	ESX.TriggerServerCallback('esx_newaccessories:get', function(hasAccessory, accessorySkin)
		local _accessory = (accessory):lower()

		if hasAccessory then
			TriggerEvent('skinchanger:getSkin', function(skin)
				local mAccessory = -1
				local mColor = 0

				if _accessory == 'ears' then
					startAnimAction('mini@ears_defenders', 'takeoff_earsdefenders_idle')
					Citizen.Wait(250)
					Player.handsup, Player.pointing = false, false
					ClearPedTasks(plyPed)
				elseif _accessory == 'glasses' then
					mAccessory = 0
				elseif _accessory == 'helmet' then
					startAnimAction('missfbi4', 'takeoff_mask')
					Citizen.Wait(1000)
					Player.handsup, Player.pointing = false, false
					ClearPedTasks(plyPed)
				elseif _accessory == 'mask' then
					mAccessory = 0
					startAnimAction('missfbi4', 'takeoff_mask')
					Citizen.Wait(850)
					Player.handsup, Player.pointing = false, false
					ClearPedTasks(plyPed)
				end

				if skin[_accessory .. '_1'] == mAccessory then
					mAccessory = accessorySkin[_accessory .. '_1']
					mColor = accessorySkin[_accessory .. '_2']
				end

				local accessorySkin = {}
				accessorySkin[_accessory .. '_1'] = mAccessory
				accessorySkin[_accessory .. '_2'] = mColor
				TriggerEvent('skinchanger:loadClothes',nil, accessorySkin)
			end)
		else
			if _accessory == 'ears' then
				ESX.ShowNotification(_U('accessories_no_ears'))
			elseif _accessory == 'glasses' then
				ESX.ShowNotification(_U('accessories_no_glasses'))
			elseif _accessory == 'helmet' then
				ESX.ShowNotification(_U('accessories_no_helmet'))
			elseif _accessory == 'mask' then
				ESX.ShowNotification(_U('accessories_no_mask'))
			end
		end
	end, accessory)
end

function SetUnsetAccessory(accessory)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)

	TriggerEvent('skinchanger:getSkin', function(skina)

        if skin[accessory..'_1'] ~= skina[accessory..'_1'] then
            skina[accessory..'_1'] = skin[accessory..'_1']
            skina[accessory..'_2'] = skin[accessory..'_2']
            TriggerEvent('skinchanger:loadClothes',nil, skina)
        else
            skina[accessory..'_1'] = -1
            skina[accessory..'_2'] = 0
            TriggerEvent('skinchanger:loadClothes',nil, skina)
        end
        end)
    end)
end

RegisterCommand("clothes", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    setUniform(args[1],source)
end, false)
RegisterCommand("hood", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    capot()
end, false)
RegisterCommand("rdoors", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    toute()
end, false)

function toute()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
       if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then 
          SetVehicleDoorShut(playerVeh, 5, false)        
          SetVehicleDoorShut(playerVeh, 4, false)
          SetVehicleDoorShut(playerVeh, 3, false)
          SetVehicleDoorShut(playerVeh, 2, false)
          SetVehicleDoorShut(playerVeh, 1, false)
          SetVehicleDoorShut(playerVeh, 0, false)         
        else
          SetVehicleDoorOpen(playerVeh, 5, false)        
          SetVehicleDoorOpen(playerVeh, 4, false)
          SetVehicleDoorOpen(playerVeh, 3, false)
          SetVehicleDoorOpen(playerVeh, 2, false)
          SetVehicleDoorOpen(playerVeh, 1, false)
          SetVehicleDoorOpen(playerVeh, 0, false)  
          frontleft = true        
       end
    end
 end

function capot()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
       if GetVehicleDoorAngleRatio(playerVeh, 4) > 0.0 then 
          SetVehicleDoorShut(playerVeh, 4, false)
        else
          SetVehicleDoorOpen(playerVeh, 4, false)
          frontleft = true        
       end
    end
 end
 
 function coffre()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
       if GetVehicleDoorAngleRatio(playerVeh, 5) > 0.0 then 
          SetVehicleDoorShut(playerVeh, 5, false)
        else
          SetVehicleDoorOpen(playerVeh, 5, false)
          frontleft = true        
       end
    end
 end

RegisterCommand("trunk", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    coffre()
end, false)


RegisterCommand("inventory", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    TriggerEvent("esx_inventoryhud:ForceOpenInventory")
end, false)

RegisterCommand("accessiories", function(source, args, rawCommand)
    -- Wait for next frame just to be safe
    Citizen.Wait(0)

    -- Init UI and set focus
    SetUnsetAccessory(args[1],source)
end, false)

