fx_version 'adamant'

game 'gta5'

description 'Enc0ded Persistent Vehicles: https://github.com/enc0ded/enc0ded-persistent-vehicles'

version '1.0.0'

ui_page 'nui/index.html'

files {
	'nui/index.html',
	'nui/styles.css',
	'nui/NoWizard.ttf',
	'nui/images/*.png',
	'nui/images/items/*.png',
	'icon.png'
}

client_scripts {
	'client/client.lua',
	'client/jatekok.lua',
	'@esx_doorlock/config.lua',
	'@default-blips/blips.lua',
	'client/portal.lua',
	'client/pickups.lua',
	'client/enumerate.lua',
	--'client/allatok.lua',
	'client/quest.lua',
	'client/dungeon.lua',
	'client/call.lua',
	'client/sepruvalaszto.lua',
	'client/haboru.lua',
	'client/vehicle.lua',
}

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/server.lua',
	'server/portal.lua',
	--'server/allatok.lua',
	'server/jatekok.lua',
	'server/quests.lua',
	'server/dungeon.lua',
	'server/haboru.lua',
	'client/enumerate.lua',
}
