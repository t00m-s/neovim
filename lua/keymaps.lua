-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<CMD>nohlsearch<CR>')

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<CMD>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<CMD>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<CMD>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<CMD>echo "Use j to move!!"<CR>')

--  See `:help wincmd` for a list of all window commands

-- X deletion does not save to register
vim.keymap.set('n', 'x', '"_x')
-- Format pasted line
vim.keymap.set('n', 'p', 'p==', { noremap = true, silent = true })

-- Space is now only used as a leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { noremap = true, silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Select all
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select all' })

-- Split management
vim.keymap.set(
  'n',
  '<leader>sv',
  '<CMD>vsp<CR>',
  { noremap = true, silent = true, desc = '[S]plit [V]ertical' }
)
vim.keymap.set(
  'n',
  '<leader>sh',
  '<CMD>sp<CR>',
  { noremap = true, silent = true, desc = '[S]plit [H]orizontal' }
)

-- Unsetting default LSP keymaps
vim.cmd [[nnoremap <nowait> gr gr]]

-- Delete buffer
vim.keymap.set(
  'n',
  '<leader>bd',
  '<CMD>bdelete<CR>',
  { noremap = true, silent = true, desc = '[B]uffer [D]elete' }
)

vim.keymap.set(
  'n',
  '<S-h>',
  '<CMD>bprevious<CR>',
  { noremap = true, silent = true, desc = 'Left buffer' }
)
vim.keymap.set(
  'n',
  '<S-l>',
  '<CMD>bnext<CR>',
  { noremap = true, silent = true, desc = 'Right buffer' }
)

-- Center view when jumping between search results
vim.keymap.set('n', 'n', 'nzzzv', { silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { silent = true })

-- Keep cursor centered when joining lines
vim.keymap.set('n', 'J', 'mzJ`z', { silent = true })

-- Keep cursor position when using page up/down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('i', '<C-s>', '<ESC><CMD>w<CR>i', { desc = 'Save file' })

-- Fix typo for :wq and :w
vim.cmd 'command! W w'
vim.cmd 'command! Wq wq'
vim.cmd 'command! WQ wq'

vim.keymap.set({ 'n', 'v' }, '<F11>', function()
  if vim.g.neovide_fullscreen ~= true then
    vim.g.neovide_fullscreen = true
  else
    vim.g.neovide_fullscreen = false
  end
end)
-- vim: ts=2 sts=2 sw=2 et
