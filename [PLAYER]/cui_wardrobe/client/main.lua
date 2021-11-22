ESX = exports['es_extended']:getSharedObject() or nil

local isVisible = false
local isOpening = false
local isLoading = false
local outfits = {}

function setVisible(visible)
    SetNuiFocus(visible, visible)
    SendNUIMessage({
        action = 'setVisible',
        value = visible
    })
    isVisible = visible

    if Config.HideMinimapOnOpen then
        DisplayRadar(not visible)
    end
end

local cast = nil
local klanRuha= {
    ['kek'] = {
        ferfi = json.decode('{"mask_1":0,"decals_2":0,"bproof_1":0,"pants_2":7,"decals_1":0,"glasses_1":-1,"tshirt_2":0,"helmet_1":-1,"lefthand_2":0,"lefthand_1":-1,"righthand_1":-1,"tshirt_1":15,"neckarm_1":0,"sex":0,"ears_1":-1,"mask_2":0,"pants_1":27,"torso_1":348,"arms":4,"ears_2":0,"shoes_2":4,"arms_2":0,"bproof_2":0,"bags_2":0,"righthand_2":0,"bags_1":0,"helmet_2":0,"shoes_1":34,"glasses_2":0,"torso_2":5,"neckarm_2":0}'), 
        no = json.decode('{"bproof_2":0,"glasses_1":28,"pants_1":146,"bags_1":0,"lefthand_2":2,"neckarm_2":0,"neckarm_1":66,"sex":1,"decals_1":0,"arms_2":0,"tshirt_2":0,"decals_2":0,"helmet_1":-1,"shoes_1":47,"arms":7,"glasses_2":10,"righthand_2":0,"helmet_2":0,"torso_2":9,"shoes_2":11,"ears_1":21,"mask_1":-1,"bproof_1":0,"lefthand_1":4,"righthand_1":-1,"bags_2":0,"torso_1":301,"pants_2":0,"tshirt_1":-1,"mask_2":0,"ears_2":2}') 
    }
}


function refreshUI()
    local html = ''
    local emptyName = 'Empty slot'

    local model = 'unknown'
    if GetEntityModel(PlayerPedId()) == GetHashKey('mp_m_freemode_01') then
        model = 'male'
        if cast ~= nil and klanRuha[cast] then
            outfits[1] = {
                data = klanRuha[cast].ferfi,
                name = "Hagyományos öltözet"
            }
        end
        
    elseif GetEntityModel(PlayerPedId()) == GetHashKey('mp_f_freemode_01') then
        model = 'female'
        if cast ~= nil and klanRuha[cast] then
            outfits[1] = {
                data = klanRuha[cast].no,
                name = "Hagyományos öltözet"
            }
        end
    end

    for i = 1, Config.SlotsNumber do
        if outfits[i] ~= nil then
            -- existing outfit
            local gender = nil
            if outfits[i].data.sex == 0 then
                gender = 'male'
            else
                gender = 'female'
            end
            if i==1 then
                html = html .. '<div class="slot" data-number="' .. i .. '" data-gender="' .. gender .. '"><span class="slot-text">' .. outfits[i].name ..'</span><div class="controls"></button></div></div>'
            else
                html = html .. '<div class="slot" data-number="' .. i .. '" data-gender="' .. gender .. '"><span class="slot-text">' .. outfits[i].name ..'</span><div class="controls"><button class="edit"></button><button class="clear"></button></div></div>'
            end
            
        else
            -- empty slot
            html = html .. '<div class="slot empty" data-number="' .. i .. '"><span class="slot-text">' .. emptyName ..'</span><div class="controls"><button class="edit"></button></div></div>'
        end
    end

    

    SendNUIMessage({
        action = 'refresh',
        html = html,
        model = model
    })
end

RegisterNetEvent('cui_wardrobe:open')
AddEventHandler('cui_wardrobe:open', function()
    if not isOpening then
        isOpening = true
        isDataLoaded = false
        RequestStreamedTextureDict('shared')

        ESX.TriggerServerCallback('cui_wardrobe:getPlayerOutfits', function(data)
            if data ~= nil then
                outfits = data
            else
                outfits = {}
            end
            isDataLoaded = true
        end)

        while not HasStreamedTextureDictLoaded('shared') or not isDataLoaded do
            Wait(100)
        end

        ESX.TriggerServerCallback("Group:GetFaction", function(_faction) 
			cast = _faction
            refreshUI()
		end)
        
        setVisible(true)
        isOpening = false
    end
end)

RegisterNetEvent('cui_wardrobe:close')
AddEventHandler('cui_wardrobe:close', function()
    SetStreamedTextureDictAsNoLongerNeeded('shared')
    setVisible(false)
end)

RegisterNUICallback('close', function(data, cb)
    TriggerEvent('cui_wardrobe:close')
end)

RegisterNUICallback('save', function(data, cb)
    data['clothes'] = nil

    TriggerEvent('cui_character:getCurrentClothes', function(currentClothes)
        data['clothes'] = currentClothes
    end)

    while not data['clothes'] do
        Wait(100)
    end

    ESX.TriggerServerCallback('cui_wardrobe:saveOutfit', function(callback)
        if callback then
            -- TODO: save success
            local gender = nil
            if data['sex'] == 0 then
                gender = 'male'
            else
                gender = 'female'
            end
            SendNUIMessage({
                action = 'completeEdit',
                slot = tonumber(data['slot']),
                gender = gender,
                name = data['name']
            })
        else
            -- TODO: save failure
            print('error: failed saving to the database.')
        end
    end, data)
end)

RegisterNUICallback('clear', function(data, cb)
    ESX.TriggerServerCallback('cui_wardrobe:deleteOutfit', function(callback)
        if callback then
            SendNUIMessage({
                action = 'completeDeletion',
                slot = tonumber(data['slot'])
            })
        else
            SendNUIMessage({
                action = 'abortDeletion',
            })
        end
    end, tonumber(data['slot']))
end)

RegisterNUICallback('load', function(data, cb)
    if not isLoading then
        isLoading = true
        if  tonumber(data['slot']) == 1 then
            if outfits[1] then
                -- Outfit data exists
                TriggerEvent('cui_character:updateClothes', outfits[1].data, true, true, function()
                    isLoading = false
                end)
            else
                --Failure
                isLoading = false
            end
        else
            ESX.TriggerServerCallback('cui_wardrobe:getOutfitInSlot', function(outfit)
                if outfit and outfit['data'] then
                    -- Outfit data exists
                    TriggerEvent('cui_character:updateClothes', outfit['data'], true, true, function()
                        isLoading = false
                    end)
                else
                    --Failure
                    isLoading = false
                end
            end, tonumber(data['slot']))
        end
        
    end
end)

RegisterNUICallback('playSound', function(data, cb)
    local sound = data['sound']
    if sound == 'changeoutfit' then
        PlaySoundFrontend(-1, 'Continue_Appears', 'DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    elseif sound == 'smallbuttonclick' then
        PlaySoundFrontend( -1, 'HACKING_MOVE_CURSOR', 0, 1 )
    elseif sound == 'panelbuttonclick' then
        PlaySoundFrontend(-1, 'Reset_Prop_Position', 'DLC_Dmod_Prop_Editor_Sounds', 0)
    elseif sound == 'error' then
        PlaySoundFrontend(-1, 'ERROR', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
    end
end)

-- Map Locations
if not Config.UseAnywhere then
    local closestCoords = nil
    local distToClosest = 1000.0
    local inMarkerRange = false

    function DisplayTooltip(suffix)
        SetTextComponentFormat('STRING')
        AddTextComponentString('Press ~INPUT_PICKUP~ to ' .. suffix)
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
    end

    function UpdateClosestLocation(locations)
        local pedPosition = GetEntityCoords(PlayerPedId())
        for i = 1, #locations do
            local loc = locations[i]
            local distance = GetDistanceBetweenCoords(pedPosition.x, pedPosition.y, pedPosition.z, loc[1], loc[2], loc[3], true)
            if (distToClosest == nil or closestCoords == nil) or (distance < distToClosest) or (closestCoords == loc) then
                distToClosest = distance
                closestCoords = vector3(loc[1], loc[2], loc[3])
            end

            if (distToClosest < 20.0) and (distToClosest > 1.0) then
                inMarkerRange = true
            else
                inMarkerRange = false
            end
        end
    end

    local waitTime = 2000
    Citizen.CreateThread(function()
        while true do
            if distToClosest > 500.0 then
                waitTime = 5000
            elseif distToClosest > 100.0 then
                waitTime = 2000
            else
                waitTime = 500
            end

            UpdateClosestLocation(Config.Locations)
            Citizen.Wait(waitTime)
        end
    end)

    Citizen.CreateThread(function()
        while true do
            if inMarkerRange then
                DrawMarker(
                    20,
                    closestCoords.x, closestCoords.y, closestCoords.z,
                    0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0,
                    1.0, 1.0, 1.0,
                    45, 110, 185, 128,
                    true,   -- move up and down
                    false,
                    2,
                    true,  -- rotate
                    nil,
                    nil,
                    false
                )
            end

            if distToClosest < 1.0 and (not isVisible) then
                DisplayTooltip('use wardrobe.')
                if IsControlJustPressed(1, 38) then
                    TriggerEvent('cui_wardrobe:open')
                end
            end

            Citizen.Wait(0)
        end
    end)

    if Config.DisplayBlips then
        Citizen.CreateThread(function()
            for k, v in ipairs(Config.Locations) do
                local blip = AddBlipForCoord(v)
                SetBlipSprite(blip, 366)
                SetBlipColour(blip, 84)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName('STRING')
                AddTextComponentString('Wardrobe')
                EndTextCommandSetBlipName(blip)
            end
        end)
    end
end

-- Default controls
Citizen.CreateThread(function()
    while true do
        if isVisible then
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
        end
        Citizen.Wait(0)
    end
end)