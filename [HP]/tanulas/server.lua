ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
  ESX = obj
end)

RegisterServerEvent('Tanulas:GiveItem')
AddEventHandler('Tanulas:GiveItem', function(item)
    print('GIVEITEM SERVER ' .. item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem(item).count <= 0 then
      xPlayer.addInventoryItem(item, 1)
    end
end)