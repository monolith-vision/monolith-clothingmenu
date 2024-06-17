fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'monolith-vision'
version '1.0.3'

ui_page 'web/dist/index.html'
files {
  'locales/*.json',
  'web/dist/**'
}

shared_scripts {
  'config.lua',
  'lib/locales.lua',
  'lib/string.lua',
  'lib/console.lua',
}

client_scripts {
  'client/utils/main.lua',
  'client/utils/playerData.lua',

  'client/classes/command.lua',
  'client/classes/anim.lua',
  'client/classes/menu.lua',
  'client/classes/nui.lua',

  'client/main.lua'
}

server_script 'version.lua'