fx_version 'cerulean'
games { 'gta5' }
author 'Ice Core'
client_scripts {
    'src/client/*.lua'
}

server_scripts {
    'src/server/*.lua'
}

shared_scripts {
    'src/shared/*.lua'
}

ui_page 'src/ui/index.html'

files {
    'src/ui/css/*.css',
    'src/ui/js/*.js',
    'src/ui/index.html',
    'src/ui/sound.ogg',
    'src/ui/*.ttf'
}