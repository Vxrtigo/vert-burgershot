fx_version 'cerulean'
game 'gta5'

description 'Burgershot Script'
author 'Vertigo'

client_scripts {
    'client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

shared_scripts {
    'shared/*.lua',
    '@ox_lib/init.lua',
}

lua54 'yes'
