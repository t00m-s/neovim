return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  lazy = false,
  config = function()
    local opts = {
      columns = {
        'icon',
        'permissions',
        'size',
      },
      watch_for_changes = true,
      use_default_keymaps = false,
      view_options = { show_hidden = true },
    }
    require('oil').setup(opts)
    vim.keymap.set('n', '<leader>pv', '<CMD>Oil<CR>', { desc = '[P]roject [V]iew' })
  end,
}
