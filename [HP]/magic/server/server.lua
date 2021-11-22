ESX = nil

TriggerEvent(
  "esx:getSharedObject",
  function(obj)
    ESX = obj
  end
)

local active_lumos = {}

local varazsCoordinatak = {}

RegisterServerEvent("Magic:SyncMomentum")
AddEventHandler(
  "Magic:SyncMomentum",
  function(coords, level)
    local _source = source
    TriggerClientEvent("Magic:SyncMomentum", -1, _source, coords, level)
  end
)

RegisterServerEvent("Magic:SyncImmobilio")
AddEventHandler(
  "Magic:SyncImmobilio",
  function(id)
    TriggerClientEvent("Magic:SyncImmobilio", id)
  end
)

RegisterServerEvent("Magic:SyncParticle")
AddEventHandler(
  "Magic:SyncParticle",
  function(pdict, pname, posx, posy, posz, time)
    TriggerClientEvent("Magic:CSyncParticle", -1, pdict, pname, posx, posy, posz, time)
  end
)

RegisterServerEvent("Magic:GetPlayerLevel")
AddEventHandler(
  "Magic:GetPlayerLevel",
  function()
    local _source = source
    local _level = 0
    local mage_count = 0
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer then
      local inventory = xPlayer.getInventory(true)
      local colors = {
        red = 0,
        blue = 0,
        green = 0,
        white = 0,
        black = 0
      }
      for k, v in pairs(inventory) do
        local name = Split(k, "_")
        if name[1] == "m" then
          local level_count = tonumber(name[4]) * 100 + v
          mage_count = mage_count + 1
          _level = _level + tonumber(name[4])
          if (tonumber(name[2]) == 0) then
            colors["white"] = colors["white"] + level_count
          elseif (tonumber(name[2]) == 11) then
            colors["black"] = colors["black"] + level_count
          elseif (tonumber(name[2]) == 1) then
            colors["blue"] = colors["blue"] + level_count
          elseif (tonumber(name[2]) == 2) then
            colors["green"] = colors["green"] + level_count
          elseif (tonumber(name[2]) == 10) then
            colors["red"] = colors["red"] + level_count
          end
        end
      end
      local sortedKeys =
        getKeysSortedByValue(
        colors,
        function(a, b)
          return a < b
        end
      )
      if (_source == 1) then
      end
      local dominant_color = sortedKeys[#sortedKeys]
      local dominant_value = colors[sortedKeys[#sortedKeys]]
      local all = 0
      for k, v in pairs(colors) do
        all = all + v
      end
      TriggerClientEvent("Magic:SetPlayerLevel", _source, _level, dominant_color, dominant_value, all)
    end
  end
)

function getKeysSortedByValue(tbl, sortFunction)
  local keys = {}
  for key in pairs(tbl) do
    table.insert(keys, key)
  end

  table.sort(
    keys,
    function(a, b)
      return sortFunction(tbl[a], tbl[b])
    end
  )

  return keys
end

function Split(s, delimiter)
  result = {}
  for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

RegisterServerEvent("Magic:SyncParticle2")
AddEventHandler(
  "Magic:SyncParticle2",
  function(pdict, pname, posx, posy, posz, r, g, b)
    local _source = source
    local sourceCoords = GetEntityCoords(GetPlayerPed(_source))
    TriggerClientEvent("Magic:CSyncParticle2", -1, pdict, pname, posx, posy, posz, r, g, b, _source, sourceCoords)
  end
)

RegisterServerEvent("Magic:MagicLeviosa")
AddEventHandler(
  "Magic:MagicLeviosa",
  function(entity, level)
    local _source = source
    TriggerClientEvent("Magic:MagicLeviosa", -1, entity, level)
  end
)

RegisterServerEvent("Magic:MagicTeleport2")
AddEventHandler(
  "Magic:MagicTeleport2",
  function(coords, entity, level)
    local _source = source
    local sourceCoords = GetEntityCoords(GetPlayerPed(_source))
    TriggerClientEvent("Magic:AddBlip", -1, sourceCoords, 1, 30)
    TriggerClientEvent("Magic:AddBlip", -1, coords, 3, 30)
    TriggerClientEvent("Magic:MagicTeleport2", _source, coords, _source, level)
    TriggerClientEvent("Magic:MagicTeleport2", entity, coords, entity, level)
  end
)

RegisterServerEvent("Magic:DespawnSync")
AddEventHandler(
  "Magic:DespawnSync",
  function(veh)
    local _source = source
    local plate = veh
    for k, vehicle in pairs(GetAllVehicles()) do
      local fplate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
      if fplate == plate then
        DeleteEntity(vehicle)
      end
    end
    --TriggerClientEvent('Magic:DespawnSync', -1, plate)
  end
)

AddEventHandler(
  "playerDropped",
  function(reason)
    for k, vehicle in pairs(GetAllVehicles()) do
      local fplate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
      if fplate == tostring(source) then
        DeleteEntity(vehicle)
      end
    end
    print("Player " .. GetPlayerName(source) .. " dropped (Reason: " .. reason .. ")")
  end
)

RegisterServerEvent("Magic:ActivateSkill")
AddEventHandler(
  "Magic:ActivateSkill",
  function(magic)
    local _source = source
    local name = Split(magic.image, "_")
    local xPlayer = ESX.GetPlayerFromId(_source)
    local _level = xPlayer.getInventoryItem(magic.image).count
    local newItem = name[1] .. "_" .. name[2] .. "_" .. name[3] .. "_" .. math.floor(name[4] + 1)
    local NextItem = xPlayer.getInventoryItem(newItem)
    local nexlevel = name[4] * 25
    if _level >= nexlevel and tonumber(name[4]) <= 10 then
      xPlayer.setInventoryItem(magic.image, 0)
      xPlayer.addInventoryItem(newItem, 1)
      TriggerClientEvent("Magic:SetQuickMagic", _source, newItem, magic.slot)
    else
      if NextItem == nil then
        --xPlayer.setInventoryItem(magic.image, 1)
      else
        xPlayer.addInventoryItem(magic.image, 1)
      end
    end
  end
)
RegisterServerEvent("Magic:AVADAKEDABRA")
AddEventHandler(
  "Magic:AVADAKEDABRA",
  function(entity)
    local _source = source
    local targetPlayer = ESX.GetPlayerFromId(entity)
    TriggerClientEvent("Magic:AVADAKEDABRA", targetPlayer.source)
  end
)

RegisterServerEvent("Magic:IMPERIO")
AddEventHandler(
  "Magic:IMPERIO",
  function(entity, level)
    local _source = source
    local targetPlayer = ESX.GetPlayerFromId(entity)
    print("SERVER IMPERIO")
    TriggerClientEvent("Magic:IMPERIO", targetPlayer.source, _source, nil, level)
    TriggerClientEvent("Magic:IMPERIO", _source, nil, targetPlayer.source, level)
  end
)

RegisterServerEvent("Magic:StopIMPERIO")
AddEventHandler(
  "Magic:StopIMPERIO",
  function(entity, level)
    local _source = source
    print("SERVER IMPERIO" .. entity)
    if entity > 0 then
      TriggerClientEvent("Magic:IMPERIO", entity, nil, nil, level)
      TriggerClientEvent("Magic:IMPERIO", _source, nil, nil, level)
    end
  end
)

RegisterServerEvent("Magic:STUN")
AddEventHandler(
  "Magic:STUN",
  function(entity, level)
    local _source = source
    local targetPlayer = ESX.GetPlayerFromId(entity)
    TriggerClientEvent("Magic:STUN", targetPlayer.source, level)
  end
)

RegisterServerEvent("Magic:MagicLumos")
AddEventHandler(
  "Magic:MagicLumos",
  function(level)
    local _source = source
    if active_lumos[_source] then
      active_lumos[_source] = nil
    else
      active_lumos[_source] = level
    end
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
      local senderCoords = GetEntityCoords(GetPlayerPed(_source))
      local receiverCoords = GetEntityCoords(GetPlayerPed(xPlayers[i]))
      if #(senderCoords - receiverCoords) < 300 then
        TriggerClientEvent("Magic:MagicLumos", xPlayers[i], active_lumos)
      end
    end
  end
)

RegisterServerEvent("Magic:SyncTeleport")
AddEventHandler(
  "Magic:SyncTeleport",
  function(pdict, pname, posx, posy, posz, from)
    local _source = source
    TriggerClientEvent("Magic:CSyncTeleport", -1, pdict, pname, posx, posy, posz, from)
  end
)


RegisterServerEvent("Magic:OpDefendo")
AddEventHandler("Magic:OpDefendo",function(coords,heading)
    local _source = source
    TriggerClientEvent("Magic:OpDefendo", -1, coords,heading)
  end
)

RegisterServerEvent("Magic:SaveQB")
AddEventHandler(
  "Magic:SaveQB",
  function(qb)
    UpdateQb(qb, source)
  end
)

function UpdateQb(qb, source)
  local xPlayer = ESX.GetPlayerFromId(source)
  MySQL.Async.execute(
    "UPDATE `users` SET `qb` = @qb WHERE identifier = @identifier",
    {
      ["@identifier"] = xPlayer.identifier,
      ["@qb"] = json.encode(qb)
    },
    function(rowsChanged)
    end
  )
end

RegisterServerEvent("Magic:LoadQB")
AddEventHandler(
  "Magic:LoadQB",
  function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    MySQL.Async.fetchAll(
      "SELECT qb FROM `users` WHERE `identifier` = @identifier",
      {
        ["@identifier"] = xPlayer.identifier
      },
      function(result)
        if result[1].qb ~= nil then
          local qb = json.decode(result[1].qb)
          for k, v in pairs(qb) do
            local count = xPlayer.getInventoryItem(v.image).count
            if count == 0 then
              qb[k] = nil
            end
          end
          TriggerClientEvent("InventoryHud:LoadQB", _source, qb)
          TriggerClientEvent("Magic:SetQuickbar", _source, qb)
        end
      end
    )
  end
)

RegisterServerEvent("Magic:SetQuickbar")
AddEventHandler(
  "Magic:SetQuickbar",
  function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    MySQL.Async.fetchAll(
      "SELECT qb FROM `users` WHERE `identifier` = @identifier",
      {
        ["@identifier"] = xPlayer.identifier
      },
      function(result)
        if result[1].qb ~= nil then
          local qb = json.decode(result[1].qb)
          for k, v in pairs(qb) do
            local count = xPlayer.getInventoryItem(v.image).count

            if count == 0 then
              qb[v.slot] = nil
              UpdateQb(qb, _source)
            end
          end
          TriggerClientEvent("Magic:SetQuickbar", _source, qb)
        end
      end
    )
  end
)

ESX.RegisterServerCallback(
  "Magic:HaveWand",
  function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.hasWeapon("WEAPON_FLAREGUN") then
      cb(true)
    else
      cb(false)
    end
  end
)

RegisterServerEvent("Magic:UpdateQuickbar")
AddEventHandler(
  "Magic:UpdateQuickbar",
  function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    MySQL.Async.fetchAll(
      "SELECT qb FROM `users` WHERE `identifier` = @identifier",
      {
        ["@identifier"] = xPlayer.identifier
      },
      function(result)
        if result[1].qb ~= nil then
          local qb = json.decode(result[1].qb)
          for k, v in pairs(qb) do
            local count = xPlayer.getInventoryItem(v.image).count

            if count == 0 then
              qb[v.slot] = nil
              UpdateQb(qb, _source)
              TriggerClientEvent("Magic:SetQuickbar", _source, qb)
            end
          end
        end
      end
    )
  end
)

ESX.RegisterServerCallback(
  "Magic:GetColorItems",
  function(source, cb)
    local _source = source
    local xPlayers = ESX.GetPlayers()
    local output = {}
    for i = 1, #xPlayers, 1 do
      local _level = 0
      local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
      local inventory = xPlayer.getInventory(true)

      output[xPlayers[i]] = {}
      local colors = {}
      for k, v in pairs(inventory) do
        --GET COLORS
        if string.find(k, "_kristaly") and v > 0 then
          colors[k] = 1
        end
        --GET LEVEL
        local name = Split(k, "_")
        if name[1] == "m" then
          _level = _level + tonumber(name[4])
        end
      end
      table.insert(
        output[xPlayers[i]],
        {
          colors = colors,
          level = _level
        }
      )
    end
    cb(output)
  end
)

ESX.RegisterUsableItem(
  "p_heal",
  function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    TriggerClientEvent("Magic:AddHealth", playerId, 20)
    xPlayer.removeInventoryItem("p_heal", 1)
    --xPlayer.showNotification('That was delicious.. right?')
  end
)

ESX.RegisterUsableItem(
  "p_mana",
  function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    TriggerClientEvent("Magic:AddMana", playerId, 20)
    xPlayer.removeInventoryItem("p_mana", 1)
    --xPlayer.showNotification('That was delicious.. right?')
  end
)

ESX.RegisterUsableItem(
  "p_vision",
  function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    TriggerClientEvent("Magic:ActivateHatas", playerId, "atlathatosag", 60)
    xPlayer.removeInventoryItem("p_vision", 1)
    --xPlayer.showNotification('That was delicious.. right?')
  end
)

ESX.RegisterUsableItem(
  "p_history",
  function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    TriggerClientEvent("Magic:ActivateHatas", playerId, "varazsmult", 60)
    xPlayer.removeInventoryItem("p_history", 1)
    --xPlayer.showNotification('That was delicious.. right?')
  end
)

ESX.RegisterUsableItem(
  "p_solyom",
  function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    TriggerClientEvent("Magic:ActivateHatas", playerId, "solyom", 120)
    xPlayer.removeInventoryItem("p_solyom", 1)
    --xPlayer.showNotification('That was delicious.. right?')
  end
)

ESX.RegisterUsableItem(
  "p_coyote",
  function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    TriggerClientEvent("Magic:ActivateHatas", playerId, "coyote", 120)
    xPlayer.removeInventoryItem("p_coyote", 1)
    --xPlayer.showNotification('That was delicious.. right?')
  end
)

ESX.RegisterUsableItem(
  "p_cica",
  function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    TriggerClientEvent("Magic:ActivateHatas", playerId, "cica", 120)
    xPlayer.removeInventoryItem("p_cica", 1)
    --xPlayer.showNotification('That was delicious.. right?')
  end
)

ESX.RegisterUsableItem(
  "p_hollo",
  function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    TriggerClientEvent("Magic:ActivateHatas", playerId, "hollo", 120)
    xPlayer.removeInventoryItem("p_hollo", 1)
    --xPlayer.showNotification('That was delicious.. right?')
  end
)

ESX.RegisterUsableItem(
  "p_invisible",
  function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    TriggerClientEvent("Magic:ActivateHatas", playerId, "lathatatlansag", 120)
    xPlayer.removeInventoryItem("p_invisible", 1)
    --xPlayer.showNotification('That was delicious.. right?')
  end
)

--KRISTALY KERESO
local kristalyok = {
  ["kek_kristaly"] = {
    exitcoords = vector3(365.44546508789, 29.782773971558, 91.830291748047),
    center = vector3(407.40814208984, -4.2447400093079, 99.645454406738),
    found = false,
    timer = 301,
    zone = 50.0
  },
  ["sarga_kristaly"] = {
    exitcoords = vector3(-1563.1804199219, 163.59083557129, 57.930732727051),
    center = vector3(-1580.0466308594, 209.75970458984, 68.650718688965),
    found = false,
    timer = 301,
    zone = 45.0
  },
  ["voros_kristaly"] = {
    exitcoords = vector3(2560.1110839844, -400.91107177734, 92.989814758301),
    center = vector3(2511.8254394531, -424.71063232422, 100.67918395996),
    found = false,
    timer = 301,
    zone = 45.0
  },
  ["zold_kristaly"] = {
    exitcoords = vector3(1003.2016601563, -686.33856201172, 57.21798324585),
    center = vector3(1078.7510986328, -688.69665527344, 57.616191864014),
    found = false,
    timer = 301,
    zone = 45.0
  }
}

ESX.RegisterServerCallback(
  "Magic:GetPickups",
  function(source, cb)
    cb(kristalyok)
  end
)

--[[
Citizen.CreateThread(function ()
  while true do

    for kristaly, _data in pairs(kristalyok) do 
      TriggerEvent('esx_addoninventory:getSharedInventory', kristaly, function(SH_inventory)
        local SharedInventory = SH_inventory.items
          local found = false
          local busy = true
          MySQL.Async.fetchAll('SELECT inventory FROM `users`', {}, function(result)
              if result[1] ~= nil then
                for k,v in pairs(result) do
                  local inventory = json.decode(result[1].inventory)
                  for k,v in pairs(inventory) do
                    if k == kristaly then
                      found = true
                      --print("OFFLINE INVENTORY")
                    end
                  end
                end
              end
              busy = false
          end)


          while busy or ESX.Pickups == nil do
            Wait(100)
          end
          for k,v in pairs(SharedInventory) do
            if v.name == kristaly and v.count > 0 then
              found = true
              --print("STORAGE" .. kristaly)
            end
          end
          for k,v in pairs(ESX.Pickups) do
            if(v.name == kristaly) then
              found = true
              --print("PICKUP")
            end
          end

          
          local xPlayers = ESX.GetPlayers()
          while not xPlayers do
            Wait(100)
          end
          
          
          for i=1, #xPlayers, 1 do
            local player = ESX.GetPlayerFromId(xPlayers[i]) 
            --print(ESX.DumpTable(player))
            local item = player.getInventoryItem(kristaly)
            if item.count > 0 then
              found = true
            end
          end
          --print(1)
          --found = false
          kristalyok[kristaly].found = found
          --print(ESX.DumpTable(kristalyok[kristaly]))
          if not found and kristalyok[kristaly].timer > 300 then
            kristalyok[kristaly].timer = 300
          end

          
      end)
    end
    TriggerClientEvent("Magic:ClearArea", -1, kristalyok)    
    Wait(10000)
  end
end)
]]
Citizen.CreateThread(
  function()
    while true do
      --KRISTALYOK
      local found = false
      for kristaly, _data in pairs(kristalyok) do
        if not kristalyok[kristaly].found then
          if kristalyok[kristaly].timer > 0 and kristalyok[kristaly].timer < 301 then
            kristalyok[kristaly].timer = kristalyok[kristaly].timer - 1
            found = true
          end
          if kristalyok[kristaly].timer == 0 then
            found = true
            kristalyok[kristaly].timer = 301
            local xPlayers = ESX.GetPlayers()
            for i = 1, #xPlayers, 1 do
              local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
              local pedCoords = GetEntityCoords(GetPlayerPed(xPlayer.source))
              if #(pedCoords - kristalyok[kristaly].center) < _data.zone then
                SetEntityCoords(GetPlayerPed(xPlayer.source), _data.exitcoords, 0.0, 0.0, 0.0, false)
              end
            end
            TriggerEvent(
              "esx_addoninventory:getSharedInventory",
              kristaly,
              function(SH_inventory)
                SH_inventory.addItem(kristaly, 50)
                TriggerEvent("esx_doorlock:CloseByItem", kristaly)
              end
            )
          end
        end
      end
      if found then
        TriggerClientEvent("Magic:ClearArea", -1, kristalyok)
      end

      --VARZSNYOMOK
      for k, v in pairs(varazsCoordinatak) do
        if v.time > 0 then
          v.time = v.time - 1
        else
          varazsCoordinatak[k] = nil
        end
      end
      Wait(1000)
    end
  end
)

RegisterServerEvent("Magic:RegisterNyom")
AddEventHandler(
  "Magic:RegisterNyom",
  function(coords, varazslat)
    local r, g, b = 0
    if (tonumber(varazslat.type) == 0) then
      r, g, b = 225, 255, 255
    elseif (tonumber(varazslat.type) == 11) then
      r, g, b = 0, 0, 0
    elseif (tonumber(varazslat.type) == 1) then
      r, g, b = 50, 50, 255
    elseif (tonumber(varazslat.type) == 2) then
      r, g, b = 0, 255, 0
    elseif (tonumber(varazslat.type) == 10) then
      r, g, b = 225, 0, 0
    end
    table.insert(
      varazsCoordinatak,
      {
        time = 255,
        coords = coords,
        level = varazslat.level,
        szin = {
          r = r,
          g = g,
          b = b
        }
      }
    )
  end
)

ESX.RegisterServerCallback(
  "Magic:GetNyomok",
  function(source, cb)
    cb(varazsCoordinatak)
  end
)

--HIVASOK

local HivasForgalom = {}

RegisterCommand(
  "call",
  function(source, args, rawCommand)
    TriggerClientEvent("Magic:CallMenu", source)
  end,
  false
)

ESX.RegisterServerCallback(
  "Magic:FindElme",
  function(source, cb, name)
    local _source = source
    local caller = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
      local target = ESX.GetPlayerFromId(xPlayers[i])
      if target.getName() == name then
        if not HivasForgalom[xPlayers[i]] then
          HivasForgalom[xPlayers[i]] = _source
        end
        if not HivasForgalom[_source] then
          HivasForgalom[_source] = xPlayers[i]
        end

        TriggerClientEvent(
          "chat:addMessage",
          xPlayers[i],
          {
            template = '<div style="padding: 0.5vw; margin: 0.5vw;color:white; background-color: rgba(255, 0, 0, 0.8); border-radius: 3px;"><i class="fas fa-bullhorn">&nbsp</i>Telepátia: <br> {0}</div>',
            args = {caller.getName()}
          }
        )

        cb(true)
      end
    end
    cb(false)
  end
)

RegisterServerEvent("Magic:AcceptCall")
AddEventHandler(
  "Magic:AcceptCall",
  function()
    local _source = source
    local hivas = HivasForgalom[_source]
    --exports['okokNotify']:Alert("SUCCESS", "Kapcsolat Létrehozva", 5000, 'success')
    TriggerClientEvent("okokNotify:Alert", _source, "TELEPÁTIA", "Kapcsolat Létrehozva.", 20000, "success")
    TriggerClientEvent("okokNotify:Alert", hivas, "TELEPÁTIA", "Kapcsolat Létrehozva.", 20000, "success")

    exports["pma-voice"]:setPlayerCall(_source, _source + 10)
    exports["pma-voice"]:setPlayerCall(hivas, _source + 10)
  end
)

RegisterServerEvent("Magic:EndCall")
AddEventHandler(
  "Magic:EndCall",
  function()
    local _source = source
    local hivas = HivasForgalom[_source]
    local hivas2 = HivasForgalom[hivas]
    exports["pma-voice"]:setPlayerCall(hivas2, 0)
    exports["pma-voice"]:setPlayerCall(hivas, 0)

    TriggerClientEvent("okokNotify:Alert", hivas, "TELEPÁTIA", "Kapcsolat megszakadt.", 20000, "error")
    TriggerClientEvent("okokNotify:Alert", hivas2, "TELEPÁTIA", "Kapcsolat megszakadt.", 20000, "error")

    HivasForgalom[hivas] = nil
    HivasForgalom[hivas2] = nil
  end
)

RegisterCommand(
  "giveallmage",
  function(source, args, rawCommand)
    if args[1] == "all" then
      local xPlayers = ESX.GetPlayers()
      for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        for k, v in pairs(xPlayer.getInventory()) do
          if v.count > 0 then
            xPlayer.setInventoryItem(v.name, 0)
          end
        end
        xPlayer.addInventoryItem("m_0_ALOHOMORA_10", 1)
        xPlayer.addInventoryItem("m_0_BLOWAROUND-SMOKE_1", 1)
        xPlayer.addInventoryItem("m_0_INVITO_10", 1)
        xPlayer.addInventoryItem("m_0_LUMOS_10", 1)
        xPlayer.addInventoryItem("m_0_TELEPORT2_10", 1)
        xPlayer.addInventoryItem("m_0_TELEPORT_4", 1)
        xPlayer.addInventoryItem("m_10_BLOWAROUND-EXPLOSION_3", 1)
        xPlayer.addInventoryItem("m_10_BLOWAROUND-FIRE_3", 1)
        xPlayer.addInventoryItem("m_10_BLOW_4", 1)
        xPlayer.addInventoryItem("m_10_FIRE_4", 1)
        xPlayer.addInventoryItem("m_1_STUN_3", 1)
        xPlayer.addInventoryItem("m_1_WATER_3", 1)
        xPlayer.addInventoryItem("m_2_REVIVE_5", 1)
        xPlayer.addInventoryItem("m_11_IMPERIO_1", 1)
        xPlayer.setMoney(50)
      end
    elseif args[1] then
      local xPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
      for k, v in pairs(xPlayer.getInventory()) do
        if v.count > 0 then
          xPlayer.setInventoryItem(v.name, 0)
        end
      end
      xPlayer.addInventoryItem("m_0_ALOHOMORA_10", 1)
      xPlayer.addInventoryItem("m_0_BLOWAROUND-SMOKE_1", 1)
      xPlayer.addInventoryItem("m_0_INVITO_10", 1)
      xPlayer.addInventoryItem("m_0_LUMOS_10", 1)
      xPlayer.addInventoryItem("m_0_TELEPORT2_10", 1)
      xPlayer.addInventoryItem("m_0_TELEPORT_4", 1)
      xPlayer.addInventoryItem("m_10_BLOWAROUND-EXPLOSION_3", 1)
      xPlayer.addInventoryItem("m_10_BLOWAROUND-FIRE_3", 1)
      xPlayer.addInventoryItem("m_10_BLOW_4", 1)
      xPlayer.addInventoryItem("m_10_FIRE_4", 1)
      xPlayer.addInventoryItem("m_1_STUN_3", 1)
      xPlayer.addInventoryItem("m_1_WATER_3", 1)
      xPlayer.addInventoryItem("m_2_REVIVE_5", 1)
      xPlayer.addInventoryItem("m_11_IMPERIO_1", 1)
      xPlayer.setMoney(50)
    else
    end
  end,
  true
)

RegisterCommand(
  "cars",
  function(source, args, rawCommand)
    TriggerClientEvent("SepruMenu:Open", source)
  end,
  false
)

local vehicleDatabase = {}

Citizen.CreateThread(
  function()
    MySQL.Async.fetchAll(
      "SELECT * FROM vehicles",
      {},
      function(icars)
        vehicleDatabase = icars
      end
    )
  end
)

ESX.RegisterServerCallback(
  "SepruMenu:GetCars",
  function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local cars = {}

    MySQL.Async.fetchAll(
      "SELECT * FROM owned_vehicles WHERE owner = @owner",
      {
        ["@owner"] = xPlayer.identifier
      },
      function(result)
        if result[1] then
          for k, v in pairs(result) do
            table.insert(
              cars,
              {
                rendszam = v.plate,
                vehicle = v.vehicle
              }
            )
          end
        end
        for k, v in pairs(vehicleDatabase) do
          for k2, v2 in pairs(cars) do
            local veh = json.decode(v2.vehicle)
            if GetHashKey(v.model) == veh.model then
              cars[k2].name = v.name
            end
          end
        end
        cb(cars)
      end
    )
  end
)
