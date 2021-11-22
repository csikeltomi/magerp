Citizen.CreateThread( function()
	while true do
		Citizen.Wait(3)
		local player = PlayerPedId()
		if (IsControlJustPressed(0,104)) then
	
			print('Handsup')
			TriggerServerEvent('esx_thief:update', true)

			if ( DoesEntityExist( player ) and not IsEntityDead( player ) ) then
	
				
					loadAnimDict( "random@mugging3" )
					TaskPlayAnim(player, "random@mugging3", "handsup_standing_base", 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
					RemoveAnimDict("random@mugging3")
				
			end
		elseif (IsControlJustReleased(0,104)) then
			ClearPedSecondaryTask(player)
			TriggerServerEvent('esx_thief:update', false)			
		end
	end
end)

function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(500)
	end
end
