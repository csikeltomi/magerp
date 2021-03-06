fx_version 'bodacious'

game 'gta5'

description 'Inventory HUD for ESX'

version '2.4.0'

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  "@es_extended/locale.lua",
  "server/main.lua",
  "locales/hu.lua",
  "config.lua"
}

client_scripts {
  "@es_extended/locale.lua",
  "client/main.lua",
  "client/shop.lua",	
  "client/trunk.lua",
  "client/glovebox.lua",
  "client/beds.lua",
  "client/motels.lua",
  "client/vault.lua",
  "client/property.lua",
  "client/player.lua",
  "locales/hu.lua",
  "config.lua"
}

ui_page {
	'html/ui.html'
}

files {
  "html/ui.html",
  "html/css/ui.css",
  "html/css/NoWizard.ttf",
  "html/css/jquery-ui.css",
  "html/js/inventory.js",
  "html/js/config.js",
  -- JS LOCALES
  "html/locales/en.js",
  "html/locales/nl.js",
  "html/locales/fr.js",
  "html/locales/hu.js",
  -- IMAGES
  "html/img/*.png",
  "html/img/items/*.png",
}

dependencies {
	'es_extended'
}
