ESX = nil
local active_portal = nil


TriggerEvent('esx:getSharedObject', function(obj) 
  ESX = obj
end)

RegisterServerEvent('Magic:SetMana')
AddEventHandler('Magic:SetMana', function (mana)
    if active_portal.mana >= active_portal.maxmana and mana > 0 then
        active_portal.mana = active_portal.maxmana
    else
        active_portal.mana = active_portal.mana + mana
    end
    if active_portal.mana < 0 then
        active_portal = nil
        TriggerClientEvent('TELEPORT:RemovePortal',-1,'DARK')
        TriggerClientEvent('Magic:SetPortals', -1, active_portal)
    end
end)


RegisterServerEvent('Magic:CreatePortal')
AddEventHandler('Magic:CreatePortal', function (coords,type)
    local portalcoords = nil
    if type == 1 then
        portalcoords = vector3(-1011.3216552734,-756.92749023438,59.058689117432)
    elseif type == 2 then
        portalcoords = vector3(-1012.2603759766,-756.53308105469,55.327575683594)
    elseif type == 3 then
        portalcoords = vector3(-1011.5006103516,-756.91455078125,51.59939956665)
    elseif type == 4 then
        portalcoords = vector3(-1011.2823486328,-756.82153320312,48.968837738037)
    elseif type == 5 then
        portalcoords = vector3(-1011.4914550781,-756.66668701172,43.968841552734)
    elseif type == 6 then
        portalcoords = vector3(-1011.9752197266,-756.93688964844,39.911029815674)
    end

    active_portal = {
        coords = coords,
        target = portalcoords,
        type = type,
        maxmana = 6000,
        mana = 4000,
        time = 60,
        maxtime = 60,
        open = false
    }
    TriggerClientEvent('Magic:SetPortals', -1, active_portal)
end)

Citizen.CreateThread(function()
    while true do
        if active_portal then
            if active_portal.mana == active_portal.maxmana then
                active_portal.open = true
            end
            print('SYNC PORTALS')
            TriggerClientEvent('Magic:SetPortals', -1, active_portal)
            Wait(1000)
        else
            Wait(5000)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        if active_portal and active_portal.open then
            active_portal.time = active_portal.time - 1
            active_portal.mana =  (active_portal.time * active_portal.maxmana / active_portal.maxtime)
            print("PORTAL TIME: " .. active_portal.time)
            print("PORTAL MANA: " .. active_portal.mana)
            if active_portal.time == 0 then
                active_portal = nil
                TriggerClientEvent('TELEPORT:RemovePortal',-1,'DARK')
                TriggerClientEvent('Magic:SetPortals', -1, active_portal)
            end
        end

        Wait(60000)
        --Wait(1000)
    end
end)


Citizen.CreateThread(function()
    while true do
        if active_portal then
            print("PORTAL TIME: " .. active_portal.time)
            print("PORTAL MANA: " .. active_portal.mana)
          
        end
        Wait(1000)
    end
end)