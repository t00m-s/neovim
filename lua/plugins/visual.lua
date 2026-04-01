-- ~/.config/nvim/lua/plugins/visual.lua
-- UI/UX
vim.pack.add {
  { src = 'https://github.com/nvim-mini/mini.icons' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/rcarriga/nvim-notify' },
  { src = 'https://github.com/nickkadutskyi/jb.nvim' },
}

vim.cmd [[colorscheme jb]]
vim.notify = require 'notify'
require('mini.icons').setup {}
require('lualine').setup {}
