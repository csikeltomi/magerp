
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

	
end)

RegisterCommand('coords', function(source, args, rawCommand)
	local playerped = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerped)
    local handle, ped = FindFirstObject()
    local success
    local rped = nil
    local distanceFrom
	local coords
    repeat
        local pos = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
        if distance < 10.0 then
            distanceFrom = distance
            rped = ped
            --FreezeEntityPosition(ped, inFreeze)
	    	if IsEntityTouchingEntity(GetPlayerPed(-1), ped) then
				coords = pos
	    	end

            if lowGrav then
            	--ActivatePhysics(ped)
            	SetEntityCoords(ped,pos["x"],pos["y"],pos["z"]+0.1)
            	FreezeEntityPosition(ped, false)
            end
        end

        success, ped = FindNextObject(handle)
    until not success
    EndFindObject(handle)
	SendNUIMessage({
		coords = ""..coords.x..","..coords.y..","..coords.z..""
	})
end)

RegisterCommand('coords2', function(source, args, rawCommand)
	local coords = GetEntityCoords(PlayerPedId())
	SendNUIMessage({
		coords = ""..coords.x..","..coords.y..","..coords.z..""
	})
end)

RegisterCommand('coords3', function(source, args, rawCommand)
	local coords = GetEntityCoords(PlayerPedId())
	SendNUIMessage({
		coords = "{x = "..coords.x..",   y = "..coords.y..", z = "..coords.z.."}"
	})
end)

RegisterCommand('coords4', function(source, args, rawCommand)
	local coords = GetEntityCoords(PlayerPedId())
	SendNUIMessage({
		coords = "x = "..coords.x..",   y = "..coords.y..", z = "..coords.z..""
	})
end)

RegisterCommand('coordsNPC', function(source, args, rawCommand)
	local coords = GetEntityCoords(PlayerPedId())
	local output = string.format([[
		{
			coords = vector3(%.2f,%.2f,%.2f),
			heading = %.2f,
			health = 500,
			weapon = "weapon_gusenberg",
			accuary = 20.0,
			model = "Revenant",
			area = 20.0,
			loot = {}
		},
	]],coords.x,coords.y,coords.z, GetEntityHeading(GetPlayerPed(-1)))
	print(output)
	SendNUIMessage({
		coords = output
	})
end)

RegisterCommand('coordsDOOR', function(source, args, rawCommand)
	local coords = GetEntityCoords(PlayerPedId())
	local filter = {}
	filter[args[1]] = true
	local output = string.format([[
		{
			objHash = %s,
			objCoords = vector3(%.2f,%.2f,%.2f),
			textCoords = vector3(%.2f,%.2f,%.2f),
			authorizedJobs = {'none'},
			locked = true,
			maxDistance = 3,
			size = 0.5,
			color  = "~r~Vörös kristály \n",
			health = 800000
		},
	]], args[1],coords.x,coords.y,coords.z,coords.x,coords.y,coords.z)
	print(output)
	SendNUIMessage({
		coords = output
	})
end)

RegisterCommand('tpc', function(source, args, rawCommand)
	local coords = {}
	for coord in string.gmatch(args[1] or "0,0,0","[^,]+") do
		table.insert(coords,tonumber(coord))
	end

	local x,y,z = 0,0,0
	if coords[1] ~= nil then x = coords[1] end
	if coords[2] ~= nil then y = coords[2] end
	if coords[3] ~= nil then z = coords[3] end

	SetEntityCoords(GetPlayerPed(-1), x,y,z, false)
end)