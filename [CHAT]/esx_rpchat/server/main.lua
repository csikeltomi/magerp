--[[

  ESX RP Chat

--]]

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function getIdentity(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    local identifier =xPlayer.identifier
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]
		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			job = identity['job'],
			group = identity['group']
		}
	else
		return nil
	end
end

 AddEventHandler('chatMessage', function(source, name, message)
    CancelEvent()
      if string.sub(message, 1, string.len("/")) ~= "/" then
          local name = getIdentity(source)
		TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, message)
      end
      
  end)
  
  -- TriggerEvent('es:addCommand', 'me', function(source, args, user)
  --    local name = getIdentity(source)
  --    TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, table.concat(args, " "))
  -- end) 



  --- TriggerEvent('es:addCommand', 'me', function(source, args, user)
  ---    local name = getIdentity(source)
  ---    TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, table.concat(args, " "))
  -- end) 
  TriggerEvent('es:addCommand', 'me', function(source, args, user)
    local name = getIdentity(source)
    table.remove(args, 2)
    TriggerClientEvent('esx-qalle-chat:me', -1, source, name.firstname, table.concat(args, " "))
end)

--[[
 RegisterCommand('tweet', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(6)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @{0}:<br> {1}</div>',
        args = { fal, msg }
    })
end, false)
]]

 RegisterCommand('hks', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(9)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    if name.job == 'mechanic2' then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 175, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i> Autószerviz:<br> {1}<br></div>',
            args = { fal, msg }
        })
    end
end, false)

 RegisterCommand('hks2', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(9)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    if name.job == 'mechanic' then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 175, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i> Autószerviz:<br> {1}<br></div>',
            args = { fal, msg }
        })
    end
end, false)

    RegisterCommand('ooc', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)
    print(name.group)
    if name.group == 'superadmin' or  name.group == "admin" or name.group =='moderator' then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw;color:white; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i>ADMIN ({0}):<br> {1}</div>',
            args = { name.firstname, msg }
        })
    end
    end, false)

RegisterCommand('orfk', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)
    if name.job == 'police' then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 175, 0.8); border-radius: 3px;"><i class="fas fa-bullhorn">&nbsp</i>Rendőrség: <br> {1}</div>',
            args = { name.firstname, msg }
        })
    end

end, false)

RegisterCommand('omsz', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(10)
    local name = getIdentity(source)
    if name.job == 'ambulance2' or name.job == 'ambulance' then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw;color:white; background-color: rgba(255, 0, 0, 0.8); border-radius: 3px;"><i class="fas fa-hospital">&nbsp</i>Mentőszolgálat: <br> {1}</div>',
            args = { name.firstname, msg }
        })
    end

end, false)

--[[Citizen.CreateThread(function()
    while true do
        local msg = 'Amennyiben Admin segítségre volna szükségetek, használjátok a /report parancsot. Kérlek röviden írjátok le a problémát.'
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw;color:black; background-color: rgba(175, 175, 175, 0.6); border-radius: 3px;"><i class="fas fa-bullhorn">&nbsp</i>MadRolePlay:<br> {0}</div>',
            args = { msg }
        })
        Citizen.Wait(10 * 60 * 1000)
	end
end)]]


function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
