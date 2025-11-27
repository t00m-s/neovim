return {
  'folke/trouble.nvim',
  opts = {
    warn_no_results = false,
    modes = {
      lsp_base = {
        params = { include_current = true },
      },
    },
  },
  cmd = 'Trouble',
  keys = {
    {
      '<leader>qf',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
  },
}
