-- CONFIG --

-- Zombies have a 1 in 150 chance to spawn with guns
-- It will choose a gun in this list when it happens
-- Weapon list here: https://www.se7ensins.com/forums/threads/weapon-and-explosion-hashes-list.1045035/


local pedModels = {
	"csb_mweather",
	"csb_ramp_marine",
	"g_m_m_chicold_01",
	"g_m_y_lost_03",
	"mp_m_bogdangoon",
	"mp_s_m_armoured_01",
	"s_m_y_blackops_01",
	"s_m_y_dealer_01",
	"s_m_y_swat_01",
	"ig_hunter",
}

local accuracy = math.random(10,40)

local loot = {
	"WEAPON_PISTOL",
	"WEAPON_MG",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_COMBATMG",
	"WEAPON_HATCHET",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_CARBINERIFLE",
}

local randomweapons = {
	"WEAPON_PISTOL",
	"WEAPON_MG",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_MACHETE",
	"WEAPON_CROWBAR",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_COMBATMG",
	"WEAPON_BAT",
	"WEAPON_HATCHET",
	"WEAPON_CARBINERIFLE",
	"WEAPON_RPG",
}

local walkStyles = {
	"move_m@drunk@verydrunk",
	"move_m@drunk@moderatedrunk",
	"move_m@drunk@a",
	"anim_group_move_ballistic",
	"move_lester_CaneUp",
}

-- CODE --

-- Spawn Settings
local maxZombies = 4
local maxSpawnradius = 100
local minSpawnDistance = 70
local despawnDistance = 100

-- Misc variables
--playingsound = false
--spawned = false
infected = false
hasBeenHit = false
hasNotBeenHit = true
experienceEarned = false
--zombieCountAdd = false
fingerCount = 0
zombieCount = 0
hitCount = 0
local bool = false
players = {}


Citizen.CreateThread(function()
	local inside = false
	local inint = 0
    while true do
		local intid = GetInteriorFromEntity(GetPlayerPed(-1))
		if intid == 0 then
			inside = false
		else
			inside = false
		end

		if inint ~= intid and intid > 0 then
			local intx,inty,intz = GetInteriorPosition(intid)
			for i, ped in pairs(peds) do
				TaskCombatHatedTargetsInArea(ped,intx,inty,intz,150.0,false)
			end

		end

		if not inside then
			inint = intid
		else
			inint = 0
		end

        Wait(1000)
    end

end)

RegisterNetEvent("Z:playerUpdate")
AddEventHandler("Z:playerUpdate", function(mPlayers)
	players = mPlayers
end)

peds = {}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)
		local hours = GetClockHours()
		if hours < 5 or hours > 23 then
			--print(hours .. ' NIGHT' )
			for i, ped in pairs(peds) do
				SetPedSeeingRange(ped, 50.0)
			end
		else
			for i, ped in pairs(peds) do
				SetPedSeeingRange(ped, 100.0)
			end
		end

		for i, ped in pairs(peds) do
			if GetEntityHealth(ped) <= 0 then
				DeleteEntity(ped)
				maxZombies  = maxZombies - 1
			end
		end
	end
end)

local zones = {
	{
		coords = vector3(1695.0706787109,2609.0844726563,46.347373962402),
	 	radius = 200,
		weapons = {
			"WEAPON_PISTOL50",
			"weapon_raypistol",
		},
		limit = 10,
		health = 500,
		interior = true,
		--ped = "firedemon"
	}
}

Citizen.CreateThread(function()
	AddRelationshipGroup("zombeez")
	SetRelationshipBetweenGroups(5, GetHashKey("zombeez"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("zombeez"))

	SetAiMeleeWeaponDamageModifier(1.0)
	SetPedRelationshipGroupHash(GetPlayerPed(-1), GetHashKey("PLAYER"))
	while true do
		Wait(1)

		local isInZone = false
		local health = 100
		local interior = true
		local zone = 0
		choosenPed = pedModels[math.random(1, #pedModels)]
		choosenPed = string.upper(choosenPed)
		for k,v in pairs(zones) do
			if #(GetEntityCoords(PlayerPedId()) - v.coords) < v.radius then
				--maxSpawnradius = math.floor(v.radius - #(GetEntityCoords(PlayerPedId()) - v.coords),0)
				--print(maxSpawnradius)
				zone = v.radius
				isInZone = true
				maxZombies = v.limit
				health = v.health
				randomweapons = v.weapons
				if v.ped ~= nil then
					choosenPed = v.ped
				end
				interior = v.interior
			end
		end

		if #peds < maxZombies and isInZone then
			x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))

		
			RequestModel(GetHashKey(choosenPed))
			while not HasModelLoaded(GetHashKey(choosenPed)) or not HasCollisionForModelLoaded(GetHashKey(choosenPed)) do
				Wait(1)
			end

			local newX = x
			local newY = y
			local newZ = z + 999.0

			repeat
				Wait(1)

				newX = x + math.random(-maxSpawnradius, maxSpawnradius)
				newY = y + math.random(-maxSpawnradius , maxSpawnradius)
				_,newZ = GetGroundZFor_3dCoord(newX+.0,newY+.0,z, 1)

				for i = 0, 1024 do
					--Wait(1)
					if NetworkIsPlayerActive(i) then
						playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
						if newX > playerX - minSpawnDistance and newX < playerX + minSpawnDistance or newY > playerY - minSpawnDistance and newY < playerY + minSpawnDistance then
							canSpawn = false
							break
						else
							if not interior and GetInteriorAtCoords(newX, newY, newZ) > 0 then
								canSpawn = false
							else
								canSpawn = true
							end
						end
					end
				end
			until canSpawn
			print("spawn")
			local ped = CreatePed(4, GetHashKey(choosenPed), newX, newY, newZ, 0.0, true, true)
			SetEntityHealth(ped, health)
			SetPedArmour(ped, 100)
			SetPedAccuracy(ped, accuracy)
			SetPedSeeingRange(ped, 50.0)
			SetPedHearingRange(ped, 100.0)
			TaskCombatHatedTargetsInArea(ped,newX, newY, newZ, zone, 0)
			CanPedHearPlayer(PlayerId(), ped)
			--SetPedAsCop(ped ,true)
			SetPedFleeAttributes(ped, 0, 1)
			SetPedCombatAttributes(ped, 16, 1)
			SetPedCombatAttributes(ped, 17, 1)
			SetPedCombatAttributes(ped, 46, 1)
			SetPedCombatAttributes(ped, 1424, 1)
			SetPedCombatAttributes(ped, 292, 0)
			SetPedCombatAttributes(ped, 1, 1)
			SetPedCombatAttributes(ped, 2, 1)
			SetPedCombatAttributes(ped, 5, 1)
			SetPedCombatAttributes(ped, 3, 1)
			SetPedCombatAttributes(ped, 0, 1)
			SetPedCanRagdollFromPlayerImpact(ped,false)
			SetPedCanRagdoll(ped,false)
			SetPedConfigFlag(ped, 430, true)
			SetPedConfigFlag(ped, 456, false)
			SetPedConfigFlag(ped, 294, true)
			SetPedDiesWhenInjured(ped,false)
			local weapon = randomweapons[math.random(1,#randomweapons)]
			GiveWeaponToPed(ped, GetHashKey(weapon), 99999, false, true)
			GiveWeaponToPed(ped, GetHashKey("WEAPON_BOTTLE"), 1, false, true)
			SetCurrentPedWeapon(ped,GetHashKey(weapon),true)
			--setped
			SetPedDropsWeaponsWhenDead(ped,false)
			SetPedCombatRange(ped,2)
			SetPedAlertness(ped,3)
			SetAmbientVoiceName(ped, "ALIENS")
			--SetPedEnableWeaponBlocking(ped, false)
			SetPedRelationshipGroupHash(ped,  GetHashKey("zombeez"))

			walkStyle = walkStyles[math.random(1, #walkStyles)]
				
			RequestAnimSet(walkStyle)
			while not HasAnimSetLoaded(walkStyle) do
				Citizen.Wait(1)
			end
			
			--SetPedMovementClipset(ped, walkStyle, 1.0)
			TaskWanderStandard(ped, 10.0, 10)
			local pspeed = math.random(20,70)
			local pspeed = pspeed/10
			local pspeed = pspeed+0.01
			--SetEntityMaxSpeed(ped, 5.0)

			if not NetworkGetEntityIsNetworked(ped) then
				NetworkRegisterEntityAsNetworked(ped)
			end

			table.insert(peds, ped)
		end

		for i, ped in pairs(peds) do
			if DoesEntityExist(ped) == false then
				table.remove(peds, i)
			end
				
			playerX, playerY, playerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			pedX, pedY, pedZ = table.unpack(GetEntityCoords(ped, true))
			-- Delete far away unlooted dead zombies after 60 seconds
			if IsPedDeadOrDying(ped, 1) == 1 then
				if(Vdist(playerX, playerY, playerZ, pedX, pedY, pedZ) > 80.0)then
					-- Set ped as no longer needed for despawning
					--local dropChance = math.random(0,100)
					--Citizen.Trace("Delete unlooted dead Zombie")
					--RemoveBlip(blip)
					local model = GetEntityModel(ped)
					SetEntityAsNoLongerNeeded(ped)
					SetModelAsNoLongerNeeded(model)
					DeleteEntity(ped)
					table.remove(peds, i)
				end			
			else
				playerX, playerY = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				SetPedArmour(ped, 100)
				SetPedAccuracy(ped, accuracy)
				--SetPedSeeingRange(ped, 50.0)
				SetPedHearingRange(ped, 100.0)
				
				--SetPedAsCop(ped ,true)
				SetPedFleeAttributes(ped, 0, 1)
				SetPedCombatAttributes(ped, 16, 1)
				SetPedCombatAttributes(ped, 17, 1)
				SetPedCombatAttributes(ped, 46, 1)
				SetPedCombatAttributes(ped, 1424, 1)
				SetPedCombatAttributes(ped, 292, 0)
				SetPedCombatAttributes(ped, 1, 1)
				SetPedCombatAttributes(ped, 2, 1)
				SetPedCombatAttributes(ped, 5, 1)
				SetPedCombatAttributes(ped, 3, 1)
				SetPedCombatAttributes(ped, 0, 1)
				SetPedCombatRange(ped,2)
				SetPedAlertness(ped,3)
				if pedX < playerX - despawnDistance or pedX > playerX + despawnDistance or pedY < playerY - despawnDistance or pedY > playerY + despawnDistance then
					-- Set ped as no longer needed for despawning
					local model = GetEntityModel(ped)
					SetEntityAsNoLongerNeeded(ped)
					SetModelAsNoLongerNeeded(model)
					table.remove(peds, i)
				end
			end
		end
	end
end)

-- Handles all the other shit


AddEventHandler('onClientResourceStop', function (resourceName)
	for i, ped in pairs(peds) do
		-- Set ped as no longer needed for despawning
		local model = GetEntityModel(ped)
		SetEntityAsNoLongerNeeded(ped)
		SetModelAsNoLongerNeeded(model)
		DeleteEntity(ped)
		table.remove(peds, i)
	end
  end)
  
  

RegisterNetEvent("Z:cleanup")
AddEventHandler("Z:cleanup", function()
	for i, ped in pairs(peds) do
		-- Set ped as no longer needed for despawning
		local model = GetEntityModel(ped)
		SetEntityAsNoLongerNeeded(ped)
		SetModelAsNoLongerNeeded(model)
		
		table.remove(peds, i)
	end
end)
