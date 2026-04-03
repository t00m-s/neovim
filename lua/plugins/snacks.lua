vim.pack.add { { src = 'https://github.com/folke/snacks.nvim' } }

require('snacks').setup {
  bigfile = { enabled = true },
  image = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  lazygit = { enabled = true },
}
local keymap = vim.keymap.set
keymap('n', '<leader>lg', function() require('snacks').lazygit() end, { desc = '[L]azy [G]it' })
