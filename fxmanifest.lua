fx_version 'cerulean'
game 'gta5'

author 'Rocco'
description 'RT-polaroid'
version '2.0.0'

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

shared_script '@ox_lib/init.lua'

dependencies {
    'screenshot-basic',
    'ox_lib'
}

lua54 'yes'