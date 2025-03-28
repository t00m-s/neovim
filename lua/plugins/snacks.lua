return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'echasnovski/mini.icons' },
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    lazygit = { enabled = true },
    scope = { enabled = true },
    dashboard = {
      enabled = true,
      examples = 'advanced',
    },
    input = { enabled = true },
    animate = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    terminal = { enabled = true },
  },
  keys = {
    {
      '<leader>tt',
      function()
        Snacks.terminal.toggle()
      end,
      desc = '[T]oggle [T]erminal',
    },
    {
      '<leader>lg',
      function()
        Snacks.lazygit()
      end,
      desc = '[L]azy[G]it',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = '[G]it [L]og',
    },
  },
}
