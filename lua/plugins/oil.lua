return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {}, lazy = true } },
  event = 'VeryLazy',
  config = function()
    ---@type oil.SetupOpts
    local opts = {
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
    }
    require('oil').setup(opts)
    vim.keymap.set('n', '<leader>pv', '<CMD>Oil<CR>', { desc = '[P]roject [V]iew' })
  end,
}
