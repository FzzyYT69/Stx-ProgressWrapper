-- Resource Metadata
fx_version 'cerulean'
games { 'gta5' }

author '_fzzy'
description 'ProgressBar Selector v2'
version '2.0.0'

-- What to run
shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua'
}
client_scripts {
    'client/*.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

exports {
    'StxProgress'
}

lua54 'yes'