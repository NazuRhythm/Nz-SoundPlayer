fx_version 'cerulean'
games {"gta5"}

author 'NazuRhythm'
version '1.0.0'
lua54 'yes'

----------
-- CLIENT 
------
client_scripts {
    'RageUI/RageUI.lua',
    'RageUI/Menu.lua',
    'RageUI/MenuController.lua',
    'RageUI/components/*.lua',
    'RageUI/elements/*.lua',
    'RageUI/items/*.lua',

    'client/**/*.lua',
}

-----------
-- SHARED
-------
shared_script {
    'config.lua',
    'locales/*.lua',
}

-----------
-- FILES
-------
files {
    'json/**/*.json'
}
