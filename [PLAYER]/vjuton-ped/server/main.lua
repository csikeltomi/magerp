ESX = nil
local Webhook = 'YOUR WEBHOOK HERE'

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("changeped", function(source, args, rawCommand)
    -- If the source is > 0, then that means it must be a player.
    local _source = source
    if args[2] then
        local model = args[1]
        print("CHANGE PED TO " .. model )
        TriggerClientEvent("ped:SetModel",args[2],model)
    -- If it's not a player, then it must be RCON, a resource, or the server console directly.
    else
        print("This command was executed by the server console, RCON client, or a resource.")
    end
end, true --[[this command is not restricted, everyone can use this.]])




RegisterServerEvent('ped:SetPed')
AddEventHandler('ped:SetPed', function(ped)
		local xPlayer = ESX.GetPlayerFromId(source)
		local defaultMaxWeight = ESX.GetConfig().MaxWeight

        if ped ~= 'RESET' then
            local inventory = xPlayer.getInventory(true)
            --for k,v in pairs(inventory) do
                --xPlayer.removeInventoryItem(k, v)
            --end
            --xPlayer.setMaxWeight(1)
            
		else
			xPlayer.setMaxWeight(defaultMaxWeight)
		end

end)


RegisterServerEvent('ped:PlayerLoad')
AddEventHandler('ped:PlayerLoad', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    MySQL.Async.fetchAll('SELECT * FROM `custom_ped` WHERE identifier = @identifier AND active = true',
    {
        ['@identifier'] 			= xPlayer.identifier,
    }, function (ped)
        if ped[1] then
            TriggerClientEvent("ped:SetModel",_source,ped[1].model)
        end
    end)
end)

ESX.RegisterServerCallback('ped:getPremium', function(source, cb)
	local src = source
    local passAuth = false

    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end

    if identifierDiscord then
        usersRoles = exports.discord_perms:GetRoles(src)
        local function has_value(table, val)
            if table then
                for index, value in ipairs(table) do
                    if value == val then
                        return true
                    end
                end
            end
            return false
        end
		print(ESX.DumpTable(usersRoles))
            if has_value(usersRoles, '765498497302003742') then
                passAuth = true
            end
            
        
    else
    end
	cb(passAuth)
end)