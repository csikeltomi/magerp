fx_version 'cerulean'
games { 'gta5' }

ui_page('nui/index.html')

files{
    'nui/assets/*.js',
    'nui/assets/*.css',
    'nui/assets/*.ttf',
    'nui/assets/images/bg.png',
    'nui/assets/images/Items/*.png',
    'nui/index.html',
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
    'usable.lua'
}
