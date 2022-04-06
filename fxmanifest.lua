fx_version 'cerulean'
game 'gta5'

author 'Rocco'
description 'RT-polaroid'
version '1.0.0'

ui_page 'html/index.html'

files {
    'html/*.html',
    'html/js/*.js',
    'html/css/*.css',
    'html/img/*.png',
}

client_scripts {
	'client/*.lua',
} 

server_scripts {
	'server/*.lua',
}


dependencies {
    'screenshot-basic'
}

escrow_ignore {
    'server/sv_configable.lua',
    'client/cl_configable.lua',
    'config.lua',
    'README.md',
}

lua54 'yes'