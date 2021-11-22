----------------------------------------
--- Discord Whitelist, Made by FAXES ---
----------------------------------------

-- Documentation: https://docs.faxes.zone/docs/discord-whitelist-setup
--- Config ---
--notWhitelistedMessage = "Nincs engedélyed csatlakozni a szerverre. Elöször csatlakoznod kell a MadRolePlay Discord szerverére (discord.link/madroleplay), el kell fogadnod az összes szobában levö feltételt, majd ki kell töltened a Whitelist jelentkezést (https://forms.gle/p8siyqn2J3Z6Jsz57). (Amennyiben problémába ütközöl kövesd a videókat, vagy keress fel egy moderátot/admint PÜ-ben)" -- Message displayed when they are not whitelist with the role
notWhitelistedMessage = "Nincs engedélyed csatlakozni a szerverre." -- Message displayed when they are not whitelist with the role

whitelistRoles = { -- Role IDs needed to pass the whitelist
    --"894038994575327272", -- Whitelist
    "894039051072593940", -- Beta
}

--- Code ---

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
    local src = source
    local passAuth = false
    deferrals.defer()

    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end

    if identifierDiscord then
        usersRoles = exports.discord_perms:GetRoles(src)
        local function has_value(table, val)
            if table then
                for index, value in ipairs(table) do
                    if value == val then
                        return true
                    end
                end
            end
            return false
        end
        for index, valueReq in ipairs(whitelistRoles) do 
            if has_value(usersRoles, valueReq) then
                passAuth = true
            end
            if next(whitelistRoles,index) == nil then
                if passAuth == true then
                    deferrals.done()
                else
                    deferrals.done(notWhitelistedMessage)
                end
            end
        end
    else
        deferrals.done("Nem talájuk a Discord-ot. Ellenörizd, hogy telepítve van és fut. Egyéb információk: docs.faxes.zone/docs/debugging-discord")
    end
end)