fx_version 'adamant'

game 'gta5'

description 'Enc0ded Persistent Vehicles: https://github.com/enc0ded/enc0ded-persistent-vehicles'

version '1.0.0'

client_scripts {
	'client.lua',
}

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'server.lua',
}
