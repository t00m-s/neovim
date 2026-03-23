-- ~/.config/nvim/lua/keymaps.lua
local keymap = vim.keymap.set
local s = { silent = true }
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

keymap('n', '<space>', '<Nop>')

keymap(
  'n',
  'j',
  function() return tonumber(vim.api.nvim_get_vvar 'count') > 0 and 'j' or 'gj' end,
  { expr = true, silent = true }
) -- Move down, but use 'gj' if no count is given
keymap(
  'n',
  'k',
  function() return tonumber(vim.api.nvim_get_vvar 'count') > 0 and 'k' or 'gk' end,
  { expr = true, silent = true }
) -- Move up, but use 'gk' if no count is given
keymap('n', '<C-d>', '<C-d>zz') -- Scroll down and center the cursor
keymap('n', '<C-u>', '<C-u>zz') -- Scroll up and center the cursor
keymap('n', '<Leader>|', '<cmd>vsplit<CR>', s) -- Split the window vertically
keymap('n', '<Leader>-', '<cmd>split<CR>', s) -- Split the window horizontally
keymap('x', 'y', [["+y]], s) -- Yank to the system clipboard in visual mode
keymap('n', 'x', [["_x]], s) -- Yank to the system clipboard in visual mode
keymap('n', 'p', 'p==', opts)
keymap('t', '<Esc>', '<C-\\><C-N>') -- Exit terminal mode
keymap('n', '<C-a>', 'ggVG', { desc = 'Select all' })
-- Center view when jumping between search results
keymap('n', 'n', 'nzzzv', s)
keymap('n', 'N', 'Nzzzv', s)
-- Keep cursor centered when joining lines
keymap('n', 'J', 'mzJ`z', s)

-- Plugin keymaps
keymap('n', '<leader>qf', '<cmd>Trouble diagnostics toggle<CR>', opts)
keymap('n', '<leader>pv', function() require('oil').toggle_float() end)

keymap('n', '<leader>a', function() require('harpoon'):list():add() end)
keymap(
  'n',
  '<C-e>',
  function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end
)

keymap('n', '<leader>sf', function()
  local is_git_project = vim.fn.systemlist('git rev-parse --is-inside-work-tree')[1] == true
  if is_git_project then
    require('fzf-lua').git_files()
  else
    require('fzf-lua').files()
  end
end)

keymap('n', '<leader><leader>', function() require('fzf-lua').history() end)
keymap('n', '<leader>sw', function() require('fzf-lua').live_grep_native() end)
keymap('n', '<leader>ut', function() require('fzf-lua').undotree() end)
