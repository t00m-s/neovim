return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'echasnovski/mini.nvim' },
    event = 'VimEnter',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
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
    },
    keys = {
      {
        '<leader>pv',
        function() require('oil').toggle_float() end,
        desc = '[P]roject [V]iew',
      },
    },
  },
  {
    'refractalize/oil-git-status.nvim',

    dependencies = {
      'stevearc/oil.nvim',
    },
    opts = {},
  },
  {
    'JezerM/oil-lsp-diagnostics.nvim',
    dependencies = { 'stevearc/oil.nvim' },
    opts = {},
  },
}
