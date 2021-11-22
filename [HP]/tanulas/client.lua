
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
	end
)

RegisterNetEvent('Tanulas:OpenBook')
AddEventHandler('Tanulas:OpenBook', function(book,test)
    Open(book,test)
end)

function Open(magic,_test)
    SetNuiFocus(true, true)
    ExecuteCommand('e book')
    Wait(500)
        SendNUIMessage({
            action = 'Display',
            magic = magic,
            test = _test
        })
    
end

RegisterNUICallback('Close',function()
    exports['dpemotes']:EmoteCancel()
    SetNuiFocus(false, false)
end)


RegisterNUICallback('Siker',function(data)
    print("GIVEITEM")
    TriggerServerEvent('Tanulas:GiveItem', data.item)
end)


RegisterCommand('tanulas', function(source, args, rawCommand)
    Open('B_1_STUN_1',false)
end)