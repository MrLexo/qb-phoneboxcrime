fx_version 'cerulean'
game 'gta5'

author 'Lexo'
description 'Phone Box Crime Activity.'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

dependencies {
    'qb-core',
    'qb-target',
    'glow_minigames'
}
