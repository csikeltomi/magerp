ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('monster_vault:getItem')
AddEventHandler('monster_vault:getItem', function(--[[owner,--]] job, type, item, count, society)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
	if type == 'item_standard' then

		local sourceItem = xPlayer.getInventoryItem(item)


			TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
				local inventoryItem = inventory.getItem(item)
				if count > 0 and inventoryItem.count >= count then
					if not xPlayer.canCarryItem(item, count) then
						TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = _U('player_cannot_hold'), length = 5500})
					else
						inventory.removeItem(item, count)
						xPlayer.addInventoryItem(item, count)
						TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'success', text = _U('have_withdrawn', count, inventoryItem.label), length = 7500})
					end
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = _U('not_enough_in_vault'), length = 5500})
				end
			end)
		
	elseif type == 'item_money' then
		
		TriggerEvent('esx_addonaccount:getSharedAccount', society..'_money', function(account)
			local policeAccountMoney = account.money
			if policeAccountMoney >= count then
				account.removeMoney(count)
				xPlayer.addAccountMoney('money', count)
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = _U('amount_invalid'), length = 5500})
			end
		end)
	
	
	elseif type == 'item_account' then

			TriggerEvent('esx_addonaccount:getSharedAccount', society..'_'..item, function(account)
				local policeAccountMoney = account.money
				if policeAccountMoney >= count then
					account.removeMoney(count)
					xPlayer.addAccountMoney(item, count)
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = _U('amount_invalid'), length = 5500})
				end
			end)

	elseif type == 'item_weapon' then
	
			TriggerEvent('esx_datastore:getSharedDataStore', society, function(store)
				local storeWeapons = store.get('weapons') or {}
				local weaponName   = nil
				local ammo         = nil
	
				for i=1, #storeWeapons, 1 do
					if storeWeapons[i].name == item then
						weaponName = storeWeapons[i].name
						ammo       = storeWeapons[i].ammo
	
						table.remove(storeWeapons, i)
						break
					end
				end
	
				store.set('weapons', storeWeapons)
				xPlayer.addWeapon(weaponName, ammo)
			end)
	end

end)

RegisterServerEvent('monster_vault:putItem')
AddEventHandler('monster_vault:putItem', function(--[[owner,--]] job, type, item, count,society)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(xPlayer.identifier)


	if type == 'item_standard' then

		local playerItemCount = xPlayer.getInventoryItem(item).count

		if playerItemCount >= count and count > 0 then
			
				TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
					xPlayer.removeInventoryItem(item, count)
					inventory.addItem(item, count)
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'success', text = _U('have_deposited', count, inventory.getItem(item).label), length = 7500})
				end)

		else
			TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = "error", text = _U('invalid_quantity'), length = 5500})
		end

	elseif type == 'item_account' then

		local playerAccountMoney = xPlayer.getAccount(item).money
		

		if playerAccountMoney >= count and count > 0 then
			xPlayer.removeAccountMoney(item, count)
				TriggerEvent('esx_addonaccount:getSharedAccount', society..'_'..item, function(account)
					account.addMoney(count)
				end)

			
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = _U('amount_invalid'), length = 5500})
		end

	elseif type == 'item_money' then
		

		local playerAccountMoney = xPlayer.getAccount('money').money

		if playerAccountMoney >= count and count > 0 then
			xPlayer.removeAccountMoney('money', count)
				TriggerEvent('esx_addonaccount:getSharedAccount', society..'_money', function(account)
					account.addMoney(count)
				end)

			
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = _U('amount_invalid'), length = 5500})
		end


	elseif type == 'item_weapon' then
	
			TriggerEvent('esx_datastore:getSharedDataStore', society, function(store)
				local storeWeapons = store.get('weapons') or {}
	
				table.insert(storeWeapons, {
					name = item,
					count = count
				})
	
				xPlayer.removeWeapon(item)
				store.set('weapons', storeWeapons)
				
			end)
	
	end

end)

ESX.RegisterServerCallback('monster_vault:getVaultInventory', function(source, cb, item, refresh)
	-- local xPlayer    = ESX.GetPlayerFromIdentifier(owner)
	local xPlayer = ESX.GetPlayerFromId(source)
	local refresh = refresh or false

	local blackMoney = 0
	local money = 0
	local items      = {}
	local weapons    = {}

	-- if item.job == xPlayer.job.name then
	-- 	print('u job: '..xPlayer.job.name)
	-- end


	local typeVault = ''
	typeVault = "society_"..item.inventory

	local typeItems ="society_"..item.inventory
	local society = true

	if item.inventory == 'vault' then
		society = false
		typeVault = 'vault'
	end
	
	if society then
		TriggerEvent('esx_addonaccount:getSharedAccount', typeVault..'_black_money', function(account)
			blackMoney = account.money
		end)

		TriggerEvent('esx_addonaccount:getSharedAccount', typeVault.. '_money', function(account)
			money = account.money
		end)

		TriggerEvent('esx_addoninventory:getSharedInventory', typeItems, function(inventory)
			items = inventory.items
		end)
		TriggerEvent('esx_datastore:getSharedDataStore', typeVault, function(store)
			weapons = store.get('weapons') or {}
		end)

		cb({
			blackMoney = blackMoney,
			money = money,
			items      = items,
			weapons    = {},
			job = item.job,
			inventory = typeItems
		})
	else
		TriggerEvent('esx_addonaccount:getAccount', typeVault..'_black_money', xPlayer.identifier, function(account)
			blackMoney = account.money
		end)

		TriggerEvent('esx_addonaccount:getAccount', typeVault..'_money', xPlayer.identifier, function(account)
			money = account.money
		end)

		TriggerEvent('esx_addoninventory:getInventory', typeVault, xPlayer.identifier, function(inventory)
			items = inventory.items
		end)

		TriggerEvent('esx_datastore:getDataStore', typeVault, xPlayer.identifier, function(store)
			weapons = store.get('weapons') or {}
		end)

		cb({
			blackMoney = blackMoney,
			money 	   = money,
			items      = items,
			weapons    = weapons,
			job = item.job
		})
	end
end)
