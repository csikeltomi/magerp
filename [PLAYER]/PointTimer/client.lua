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


Citizen.CreateThread(
	function()
		while true do
            TriggerServerEvent('Timer:UpdateTime')
			Citizen.Wait(10 * 60 * 1000)
		end
	end
)
