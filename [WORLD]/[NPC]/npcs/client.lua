---------------------------------------------------------------------
                --[[SCRIPT MADE BY : ALEXMIHAI04]]--
               --[[DO NOT SELL OR COPY THIS SCRIPT]]--
                   --[[github.com/ItsAlexYTB]]--
        --[[ENJOY THE SCRIPT , DO NOT MAKE 1000 NPCS :))))) ]]
---------------------------------------------------------------------

--[[EXPLANATION [EN]: 

-1,2,3 : Coordonates
-4 : Name for the drawtext
-5 : Ped heading
-6 : Ped hash
-7: Ped model

]]--

--[[DO NOT TOUCH IF YOU DON'T KNOW WHAT YOU DO]]--

--[[EXPLANATION [RO]
-1,2,3 : sunt coordonatele de la npc
-4 : Numele care apare deasupra npc-ului
-5 : Heading (partea in care sta orientat)
-6 : Hash de la ped , se poate lua de pe net
-7 : Modelul de la ped , asemenea , il gasiti pe net


]]--

ESX = nil
local spawned = false
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

local coordonate = {
    {501.7516784668,5605.349609375,796.91021728516,"Astoria",171.7,GetHashKey("a_f_m_fatcult_01"),"a_f_m_fatcult_01", "Van eladnivaló portékád?", ped = nil},
    {85.224342346191,-1972.3342285156,19.793598175049,"Sam",316.9,GetHashKey("a_m_o_tramp_01"),"a_m_o_tramp_01", "Van valami jó cuccod?", ped = nil},
    {129.21446228027,-1283.6579589844,28.273559570313,"Tracy",121.44,GetHashKey("s_f_y_stripper_02"),"s_f_y_stripper_02", "Szolgálhatok valamivel drágám?", ped = nil},
    {-1391.0579833984,-607.34429931641,29.319244384766,"George",23.98,GetHashKey("s_m_y_barman_01"),"s_m_y_barman_01", "Szolgálhatok valamivel?", ped = nil},
    {-1388.9001464844,-612.96130371094,29.319242477417,"Eric",207.79,GetHashKey("s_m_y_barman_01"),"s_m_y_barman_01", "Szolgálhatok valamivel?", ped = nil},
    {-1384.2268066406,-591.18194580078,29.319660186768,"Even",41.39,GetHashKey("s_m_y_clubbar_01"),"s_m_y_clubbar_01", "Üdvözlöm a Bahamas-ban!", ped = nil},
    {-1385.2121582031,-592.83312988281,29.319375991821,"Eve",88.36,GetHashKey("s_f_y_clubbar_01"),"s_f_y_clubbar_01", "Üdvözlöm a Bahamas-ban!", ped = nil},
    {-1390.3592529297,-586.9609375,29.229496002197,"John",26.32,GetHashKey("s_m_m_bouncer_01"),"s_m_m_bouncer_01", "", ped = nil},
    {-1387.4060058594,-585.22509765625,29.210117340088,"Jack",26.32,GetHashKey("s_m_y_devinsec_01"),"s_m_y_devinsec_01", "", ped = nil},
    {-1371.6619873047,-607.73132324219,29.718334197998,"Jason",76.62,GetHashKey("s_m_y_devinsec_01"),"s_m_y_devinsec_01", "", ped = nil},
}

RegisterNetEvent("NPCs:CreateNPC")
AddEventHandler("NPCs:CreateNPC", function (Coords,Heading,Name,Model,Text)
    while not spawned do
        Wait(100)
    end
    print("CREATE" .. Text)
    local found = false
    for k,v in pairs(coordonate) do
        if v[4] == Name then
            found = true
            coordonate[k][8] = Text
        end
    end
    if not found then
        table.insert(coordonate,{Coords.x, Coords.y, Coords.z, Name, Heading, GetHashKey(Model), Model, Text, ped = nil})
        CreatePeds()
    end
    
end)

Citizen.CreateThread(function()
    CreatePeds()
    spawned = true
end)

function CreatePeds()
    for _,v in pairs(coordonate) do
        if v.ped == nil then
            RequestModel(GetHashKey(v[7]))
            while not HasModelLoaded(GetHashKey(v[7])) do
              Wait(1)
            end
        
            RequestAnimDict("mini@strip_club@idles@bouncer@base")
            while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
              Wait(1)
            end
            local ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
            Wait(100)
            coordonate[_].ped = ped
            SetEntityHeading(coordonate[_].ped, v[5])
            FreezeEntityPosition(coordonate[_].ped, true)
            SetEntityInvincible(coordonate[_].ped, true)
            SetBlockingOfNonTemporaryEvents(coordonate[_].ped, true)
            TaskPlayAnim(coordonate[_].ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
        end
      end
end

Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        Citizen.Wait(0)
        local found = false
        for _,v in pairs(coordonate) do
            x = v[1]
            y = v[2]
            z = v[3]
            if v.ped and (Vdist(pos.x, pos.y, pos.z, x, y, z) < 10.0) and HasEntityClearLosToEntity(PlayerPedId(), v.ped, 17)then
                DrawText3D(x,y,z+2.10, "~g~"..v[4], 1.2, 1)
                DrawText3D(x,y,z+1.95, "~w~"..v[8], 1.0, 1)
                found = true
            end
        end

        if not found then
            Wait(1000)
        end
    end
end)


function DrawText3D(x,y,z, text, scl, font) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end




--[[ENJOY]]--