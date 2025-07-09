fx_version 'cerulean'
game 'gta5'

author 'Ay-eye'
description 'WhereAmI - Location-based zone notifications'
version '1.0.0'

window_nui = true

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/cl_whereami.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/dist/**/*'
} 
