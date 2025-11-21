return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  lazy = false,
  opts = {},
  keys = {
    {
      '<leader>ca',
      function() require('refactoring').select_refactor() end,
      desc = '[C]ode [A]ction',
    },
  },
}
