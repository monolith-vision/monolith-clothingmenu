fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'monolith-vision'

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

escrow_ignore {
  'web/dist/**',
  'locales/*.json',
  'config.lua'
}
