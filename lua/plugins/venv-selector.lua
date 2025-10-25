return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  ft = 'python',
  keys = {
    { '<leader>v', '<cmd>VenvSelect<cr>' }, -- Open picker on keymap
  },
  opts = {},
}
