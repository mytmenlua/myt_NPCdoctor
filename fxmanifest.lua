fx_version 'adamant'
game "gta5"
lua54 "yes"
author "mytmen"
version '1.0.0'

client_scripts {
	'config.lua',
	"client.lua",
	"menu.lua"
}

server_scripts {
	'server.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
}