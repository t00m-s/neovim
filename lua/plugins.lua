-- ~/.config/nvim/lua/plugins.lua
vim.pack.add {
  { src = 'https://github.com/nvim-mini/mini.icons' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '^1' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/rcarriga/nvim-notify' },
  { src = 'https://github.com/folke/trouble.nvim' },
  { src = 'https://github.com/stevearc/conform.nvim' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
  { src = 'https://github.com/craftzdog/solarized-osaka.nvim' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },
}

require('mini.icons').setup {}
require('mason').setup {}
require('blink.cmp').setup {
  keymap = { preset = 'enter' },

  appearance = {
    nerd_font_variant = 'mono',
  },

  completion = {
    documentation = { auto_show = false },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  fuzzy = {
    implementation = 'prefer_rust_with_warning',
  },
}
require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath 'data' .. '/site',
}
require('nvim-treesitter').install {
  'bash',
  'c',
  'diff',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'vim',
  'vimdoc',
  'rust',
  'javascript',
}

vim.notify = require 'notify'

require('trouble').setup {
  warn_no_results = false,
  modes = {
    lsp_base = {
      params = { include_current = true },
    },
  },
}

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff_format', 'ruff_organize_imports' },
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    sh = { 'shfmt' },
    go = { 'gofmt' },
    rust = { 'rustfmt' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}

require('oil').setup {
  columns = {
    'icon',
    'permissions',
    'size',
  },
  watch_for_changes = true,
  use_default_keymaps = false,
  keymaps = {
    ['<CR>'] = 'actions.select',
  },
  view_options = { show_hidden = true },
  default_file_explorer = true,
  win_options = {
    signcolumn = 'yes:2',
  },
}

require('harpoon'):setup()

vim.cmd [[colorscheme solarized-osaka]]

require('fzf-lua').setup { 'fzf-native' }
require('fzf-lua').register_ui_select()
