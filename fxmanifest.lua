-- Resource Metadata
fx_version 'cerulean'
games { 'gta5', 'rdr3' }

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

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
