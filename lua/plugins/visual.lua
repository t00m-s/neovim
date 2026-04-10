-- ~/.config/nvim/lua/plugins/visual.lua
-- UI/UX
vim.pack.add {
  { src = 'https://github.com/nvim-mini/mini.icons' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/nickkadutskyi/jb.nvim' },
}

vim.cmd [[colorscheme jb]]
require('mini.icons').setup {}
require('lualine').setup {}
require('vim._core.ui2').enable {}
