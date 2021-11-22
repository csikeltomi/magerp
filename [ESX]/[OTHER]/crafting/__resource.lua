resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page 'html/index.html'

client_scripts {
  'utils.lua',
  'recipes.lua',
  'config.lua',
  'client.lua',
}

server_scripts {  
  '@mysql-async/lib/MySQL.lua',
  'utils.lua',
  'recipes.lua',
  'config.lua',
  'server.lua',
}

files {
 "html/index.html",
 "html/img/*.png",
}

dependencies {
	'progressBars',
}