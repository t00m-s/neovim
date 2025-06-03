return {
  'nvim-orgmode/orgmode',
  dependencies = {
    'lukas-reineke/headlines.nvim',
    'nvim-orgmode/org-bullets.nvim',
    'danilshvalov/org-modern.nvim',
  },
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    local Menu = require 'org-modern.menu'
    local opts = {
      org_agenda_files = '~/notes/**/*',
      org_default_notes_file = '~/notes/default.org',
      ui = {
        menu = {
          handler = function(data) Menu:new():open(data) end,
        },
      },
    }
    require('orgmode').setup(opts)

    require('org-bullets').setup()
    require('headlines').setup()
  end,
}
