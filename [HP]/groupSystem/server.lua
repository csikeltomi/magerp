ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
  ESX = obj
end)



ESX.RegisterServerCallback("Group:GetGroupPlayers", function(source,cb,GroupId)
    MySQL.Async.fetchAll('SELECT * FROM `users` WHERE `groupId` = @groupId', {
		['@groupId'] = GroupId
	}, function(result)
        local members = {}
        if result[1] ~= nil then
            for k,player in pairs(result) do
                local _level = 0
                local inventory = json.decode(player.inventory)
                for k,v in pairs(inventory) do
                    local name = Split(k,'_')
                    if name[1] == 'm' then
                      _level = _level + tonumber(name[4])
                    end
                end
                local kplayer = ESX.GetPlayerFromIdentifier(player.identifier)
                local id = 0
                if kplayer then
                    id = kplayer.source
                end
                table.insert( members, {
                    firstname = player.firstname,
                    lastname = player.lastname,
                    level = _level,
                    ID = player.ID,
                    serverId = id
                })
            end
		end
        cb(members)
	end)
end)

ESX.RegisterServerCallback("Group:GetGroups", function(source,cb)
    MySQL.Async.fetchAll('SELECT * FROM `groups`', {}, function(result)
        local groups = {}
        if result[1] ~= nil then
            for k,player in pairs(result) do
                local _level = 0
                local owner = ESX.GetPlayerFromIdentifier(result.OwnerId)
                
                table.insert( groups, {
                    Name = result.Name,
                    Owner = owner.getName(),
                    ID = result.ID
                })
            end
		end
        cb(groups)
	end)
end)

ESX.RegisterServerCallback("Group:GetActiveMyGroupID", function(source,cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    MySQL.Async.fetchAll('SELECT groupId FROM `users` where identifier = @identifier', {
        ["@identifier"] = xPlayer.getIdentifier()
    }, function(result)
        if result[1]then
            MySQL.Async.fetchAll('SELECT item FROM `hqs` where ownerClan = @GroupID', {
                ["@GroupID"] = result[1].groupId
            }, function(result2)

                cb(result2)
            end)
        end
    end)
end)

ESX.RegisterServerCallback("Group:GetMyGroup", function(source,cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local group = {}
    local onlinePlayers = {}


    MySQL.Async.fetchAll('SELECT groupId FROM `users` where identifier = @identifier', {
        ["@identifier"] = xPlayer.getIdentifier()
    }, function(result)
        if result[1] then
            local _result = result[1]
            MySQL.Async.fetchAll('SELECT * FROM `groups` where ID = @groudId', {
                ["@groudId"] = tonumber(_result.groupId),
            }, function(result2)
                if result2[1] then
                    local _result2 = result2[1]
                    local isAdmin = false
                    
                   
                    if xPlayer.getIdentifier() == _result2.OwnerId then
                        isAdmin = true
                    end
                    group = {
                        Name = _result2.Name,
                        WarDate = _result2.WarDate,
                        GroupID = _result2.ID,
                        onlinePlayers = onlinePlayers,
                        isAdmin = isAdmin
                    }

                end

                local xPlayers = ESX.GetPlayers()
                for i=1, #xPlayers, 1 do
                    local OnlinePlayer = ESX.GetPlayerFromId(xPlayers[i])
                    local fullname = OnlinePlayer.getName()
                    table.insert( onlinePlayers, {
                        firstname = Split(fullname, " ")[1],
                        lastname = Split(fullname, " ")[2], 
                    })
                end
                group['onlinePlayers'] = onlinePlayers 
                GetHQs(function (hqs)
                    group["HQS"] = hqs
                    IsInWar(function(CurrentWar)
                        if CurrentWar ~= nil then
                            group["War"] = CurrentWar
                        end
                        --print(ESX.DumpTable(group))
                        cb(group)
                    end,_result.groupId)
                    
                end,_result.groupId)
            end)
        end
	end)
end)

function IsInWar(cb,clanId)
    MySQL.Async.fetchAll('SELECT * FROM `haboruk` WHERE acsapatID = @clanId OR bcsapatID = @clanId', {
        ["@clanId"] = clanId
    }, function(result)
        if result[1] then
            if result[1].acsapatID == clanId then
                cb({
                    csapat = result[1].acsapat,
                    hq = result[1].hq
                } or {})
            end
            if result[1].bcsapatID == clanId then
                cb({
                    csapat = result[1].bcsapat,
                    hq = result[1].hq
                }  or {})
            end
        else
            cb(nil)
        end
    end)
end

function GetHQs(cb,clanid)
    local res = {}

    MySQL.Async.fetchAll('SELECT * FROM `hqs`', {}, function(result2)
        if result2[1] then
            for k,v in pairs(result2) do
                local busy = true
                local owner = nil
                local owned = false
                if v.ownerClan ~= nil then
                    MySQL.Async.fetchAll('SELECT * FROM `groups` where ID = @ID', {
                        ["@ID"] = v.ownerClan,
                    }, function(result3)
                        if result3[1] then
                            owner = result3[1].Name
                        end
                        if result3[1].ID == clanid then
                            owned = true
                        end
                        busy = false
                    end)
                    while busy do
                        Wait(10)
                    end
                end
               
                
                table.insert(res,{
                    Name = v.Name,
                    OwnerName = owner,
                    ID = v.ID,
                    color = v.Color,
                    item = v.item,
                    owned = owned
                })
            end
            cb(res)
        end
    end)
end


RegisterServerEvent("Group:CreateClan")
AddEventHandler("Group:CreateClan", function(name, date)
    local _source = source
    local identif = ESX.GetPlayerFromId(_source).getIdentifier()
    MySQL.Async.execute('INSERT INTO `groups` (`Name`, `OwnerId`, `WarDate`) VALUES (@Name, @OwnerId, @WarDate);',
	{
        ["@Name"] = name,
        ["@OwnerId"] = identif,
        ["@WarDate"] = date,

	}, function(rowsChanged)
		--callback()

        MySQL.Async.fetchAll('SELECT * FROM `groups` where OwnerId = @OwnerId', {
            ["@OwnerId"] = identif,
        }, function(result2)
            if result2[1] then
                MySQL.Async.execute('UPDATE `users` SET groupId = @groupId WHERE identifier = @identifier',
                {
                    ["@groupId"] = result2[1].ID,
                    ["@identifier"] = ESX.GetPlayerFromId(_source).getIdentifier(),
                }, function(rowsChanged)
                    TriggerClientEvent("Group:UpdateClan", _source)
                end)
            end
        end)
        

	end)
end)

RegisterServerEvent("Group:InviteClan")
AddEventHandler("Group:InviteClan", function(name, clan)
    local _source = source
    local identif = ESX.GetPlayerFromId(_source).getIdentifier()
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local OnlinePlayer = ESX.GetPlayerFromId(xPlayers[i])
        local fullname = OnlinePlayer.getName()
        if name == fullname then
            TriggerClientEvent('chat:addMessage', xPlayers[i], {
                template = [[<div style="padding: 0.5vw; margin: 0.5vw;color:white; background-color: rgba(255, 0, 0, 0.8); border-radius: 3px;"><i class="fas fa-bullhorn">&nbsp</i>
                Klánmeghívó: <br> 
                A következő klán meghívót küldött: {0} <br>
                Elfogadni a /elfogad parancssal tudod
                </div>]],
                args = { clan.Name }
              })
              TriggerClientEvent("Group:ClanInvite", xPlayers[i], clan.GroupID)
        end
    end
end)

RegisterServerEvent("Group:JoinClan")
AddEventHandler("Group:JoinClan", function(clanId)
    local _source = source
    if clanId then
        MySQL.Async.execute('UPDATE `users` SET groupId = @groupId WHERE identifier = @identifier',
        {
            ["@groupId"] = clanId,
            ["@identifier"] = ESX.GetPlayerFromId(_source).getIdentifier(),
        }, function(rowsChanged)
            TriggerClientEvent("Group:UpdateClan", _source)
        end)
    end
end)




function DeclareWar(attackerClan,hq)
    local wardate = nil

    MySQL.Async.fetchAll('SELECT * FROM `hqs` where item = @item', {
        ["@item"] = hq,
    }, function(result)
        if result[1] then
            if result[1].ownerClan then
                MySQL.Async.fetchAll('SELECT * FROM `groups` where ID = @ID', {
                    ["@ID"] = result[1].ownerClan,
                }, function(clan)
                    if clan[1] then
                        wardate = clan[1].WarDate
                        --local date = os.date('*t')
                        local now = os.time()
                        local date = os.date("*t",now+ 1 * 24 * 3600)
                        local outWarDate = string.format("%s-%s-%s %s:00",date.year,date.month,date.day,wardate)
                        MySQL.Async.fetchAll('SELECT DATE_FORMAT(idopont, "%Y-%m-%d %H:%i") as timeresult FROM `haboruk` ORDER BY idopont ASC', {}, 
                        function(haboruk)
                            local found = false
                            for k,v in pairs(haboruk) do
                                if v.timeresult == outWarDate then
                                    found = true
                                end
                            end
                            if not found then
                                MySQL.Async.execute('INSERT INTO `haboruk` (`acsapatID`, `bcsapatID`, `idopont`, `hq`) VALUES (@acsapatID,@bcsapatID, @idopont, @hq);',
                                {
                                    ["@acsapatID"] = attackerClan,
                                    ["@bcsapatID"] = result[1].ownerClan,
                                    ["@hq"] = hq,
                                    ["@idopont"] = outWarDate,
                            
                                }, function(rowsChanged)
                                    local splitted = Split(result[1].Color," ")
                                    local color = tonumber(ConvertToHex(string.format("%s,%s,%s",splitted[1],splitted[2],splitted[3])), 16) 
                                    sendToDiscord(result[1].Name,outWarDate,color)
                                    MySQL.Async.fetchAll('SELECT * FROM `groups` where ID = @ID', {
                                        ["@ID"] = attackerClan,
                                    }, function(attackCLAN)
                                        print('rgba('.. splitted[1].. splitted[2] .. splitted[3] ..' 1)')
                                        TriggerClientEvent('chat:addMessage', -1, {
                                            template = '<div style="padding: 0.5vw; font-size: larger;    font-weight: bold; margin: 0.5vw; background-color: rgba('.. splitted[1].. splitted[2] .. splitted[3] ..' 1); border-radius: 3px;"><i class="fas fa-ad"></i>Közelgő háború:<br> {0} VS {1}</div>',
                                            args = { attackCLAN[1].Name, clan[1].Name }
                                        })
                                    end)
                                   
                                end)
                            end
                        end)
                       
                    end
                end)
            end
        end
    end)
end

function ConvertToHex(color) -- Converts RGB colors to HEX
	local hex = {}

	for rgb in color:gmatch('%d+') do
		table.insert(hex, ('%02X'):format(tonumber(rgb)))
	end

	return table.concat(hex)
end




RegisterServerEvent("Group:DeclareHQWar")
AddEventHandler("Group:DeclareHQWar", function(attackerClan,hq)
    DeclareWar(attackerClan,hq)
    
end)

local DISCORD_WEBHOOK = "" -- Ez a webhúkja, ezt ki kell cserélned -- Itt egy Tutorial: https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks
local DISCORD_NAME = "TÁMADÁS" -- ez a neve a cuccmónak, ami beküldi az üzeneteket Discordon

function sendToDiscord(name, date, color)

    local connect = {
          {
              ["color"] = color,
              ["title"] = "**Szentély támadás alatt**",
              ["description"] = "",
              ["fields"] = {
                  {
                      ['name'] = "Szentély",
                      ['value'] = name
                  },
                  {
                      ['name'] = "Háború időpontja",
                      ['value'] = date
                  },
              },
              ["footer"] = {
                  ["text"] = "",
              },
          }
      }
      print("SEND")
      
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds =connect, avatar_url = nil}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("Group:HQWarTeamSetup")
AddEventHandler("Group:HQWarTeamSetup", function(attackerClan,team)
    local data = json.encode(team)
    MySQL.Async.execute('UPDATE `haboruk` SET acsapat = @csapat WHERE acsapatID = @clanId;UPDATE `haboruk` SET bcsapat = @csapat WHERE bcsapatID = @clanId;',
    {
        ["@clanId"] = attackerClan,
        ["@csapat"] = data,
    }, function(rowsChanged)
        --TriggerClientEvent("Group:UpdateClan", _source)
    end)   
end)

function isOwner(source,groupId,cb)
    local xPlayer  = ESX.GetPlayerFromId(source)
    local isAdmin = false   
    MySQL.Async.fetchAll('SELECT * FROM `groups` where ID = @groudId', {
        ["@groudId"] = groupId,
    }, function(result2)
        if result2[1] then
            local _result2 = result2[1]
            
            if xPlayer.getIdentifier() == _result2.OwnerId then
                isAdmin = true
            end       
        end
        cb(isAdmin)
    end)
end

ESX.RegisterServerCallback("Group:GetFaction", function(source,cb)
    local xPlayer  = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT frakcio FROM `users` where identifier = @identifier', {
        ["@identifier"] = xPlayer.getIdentifier(),
    }, function(result2)
        cb(result2[1].frakcio)
    end)
end)

RegisterServerEvent("Group:LeavenClan")
AddEventHandler("Group:LeavenClan", function(clan)
    local _source = source

    MySQL.Async.execute('UPDATE `users` SET groupId = @groupId WHERE identifier = @identifier',
    {
        ["@groupId"] = nil,
        ["@identifier"] = ESX.GetPlayerFromId(_source).getIdentifier(),
    }, function(rowsChanged)
        TriggerClientEvent("Group:UpdateClan", _source)
    end)

    

    isOwner(_source,clan.GroupID, function(result)
        DeleteClan(_source,clan)
    end)

end)


RegisterServerEvent("Group:SelectCast")
AddEventHandler("Group:SelectCast", function(cast)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    MySQL.Async.execute('UPDATE `users` SET frakcio = @frakcio WHERE identifier = @identifier',
    {
        ["@frakcio"] = cast,
        ["@identifier"] = ESX.GetPlayerFromId(_source).getIdentifier(),
    }, function(rowsChanged)
        if cast == 'kek' then
            xPlayer.addInventoryItem('m_0_TELEPORT_10', 1)
        elseif cast == 'voros' then
            xPlayer.addInventoryItem('m_0_WALL_10', 1)
        elseif cast == 'zold' then
            xPlayer.addInventoryItem('m_2_REVIVE_10', 1)
        elseif cast == 'sarga' then
            xPlayer.addInventoryItem('m_0_MOMENTUM_10', 1)
        end
        
    end)
end)


function DeleteClan(_source,clan)
    MySQL.Async.execute('DELETE FROM `groups` WHERE ID = @groupId AND OwnerId = @identifier',
    {
        ["@groupId"] = clan.GroupID,
        ["@identifier"] = ESX.GetPlayerFromId(_source).getIdentifier(),
    }, function(rowsChanged)
        MySQL.Async.execute('UPDATE `users` SET groupId = @groupId WHERE groupId = @groupId',
        {
            ["@groupId"] = clan.GroupID,
        }, function(rowsChanged)
        end)
        TriggerClientEvent("Group:UpdateClan", _source)
    end)
end

RegisterServerEvent("Group:KickClan")
AddEventHandler("Group:KickClan", function(name,clan)
    local _source = source    
    local xPlayer = ESX.GetPlayerFromId(_source)
    isOwner(_source,clan.GroupID, function(result)
        if result then
            local splittedName = Split(name," ")
            MySQL.Async.execute('UPDATE `users` SET groupId = @groupId WHERE firstname = @firtsname AND lastname = @lastname',
            {
                ["@groupId"] = nil,
                ["@firtsname"] = splittedName[1],
                ["@lastname"] = splittedName[2],
            }, function(rowsChanged)
                TriggerClientEvent("Group:UpdateClan", _source)
            end)

            if name == xPlayer.getName() then
                DeleteClan(_source,clan)
            end
        end
    end)

end)

Citizen.CreateThread(function() 
    while true do
        MySQL.Async.fetchAll('SELECT *, DATE_FORMAT(idopont, "%Y-%m-%d %H:%i") as timeresult FROM `haboruk` WHERE active = false', {}, function(result2)
            if result2[1] then
                local _result2 = result2[1]
                local now = os.time()
                local date = os.date("*t",now)
                if string.format("%s-%s-%s %02d:%02d",date.year,date.month,date.day,date.hour,date.min) == _result2.timeresult then
                    if _result2.acsapat == nil and _result2.bcsapat ~= nil then
                        print("WINNER B")
                        TriggerEvent("Haboru:PickWinner","B", _result2.ID)                    
                    elseif _result2.bcsapat == nil and _result2.acsapat ~= nil then
                        print("WINNER A")
                        TriggerEvent("Haboru:PickWinner","A",_result2.ID)
                    elseif  _result2.acsapat ~= nil and _result2.bcsapat ~= nil then
                        local acsapat = json.decode(_result2.acsapat)
                        local bcsapat = json.decode(_result2.bcsapat)
                        MySQL.Async.execute('UPDATE `haboruk` SET active = true WHERE ID = @ID',
                        {
                            ["@ID"] = _result2.ID,
                        }, function(rowsChanged)
                            print("HABORU")
                            CreateTeams(acsapat,bcsapat, _result2.acsapatID, _result2.bcsapatID,_result2.ID)
                        end)
                    else
                        print("DELETE")
                        DeleteHaboru(_result2.ID)
                    end
                    
                end
            end
        end)
       
        Wait(5000)
    end
end)

function DeleteHaboru(haboru)
    MySQL.Async.execute('DELETE FROM `haboruk` WHERE ID = @ID',
    {
        ["@ID"] = haboru,
    }, function(rowsChanged)
    end)
end

function CreateTeams(acsapat,bcsapat, aID,bID,haboruID)
    local teamA = {}
    local teamB = {}
    MySQL.Async.fetchAll('SELECT * FROM `users`', {}, function(result)
        for k,v in pairs(acsapat) do
            local splittedName = Split(v," ")

            for k2,player in pairs(result) do
                local groupID = player.groupId or -1
                
                if player.firstname == splittedName[1] and player.lastname == splittedName[2] and groupID == aID then
                    table.insert(teamA,player.identifier)
                end
            end
        end
        for k,v in pairs(bcsapat) do
            local splittedName = Split(v," ")
            for k2,player in pairs(result) do
                if player.firstname == splittedName[1] and player.lastname == splittedName[2] and player.groupId == bID then
                    table.insert(teamB,player.identifier)
                end
            end
        end
        TriggerEvent("Haboru:StartByTimer",teamA,teamB,haboruID)
    end)
 
end

function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
  end