-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<CMD>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set(
  'n',
  '<leader>qf',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uick[F]ix list' }
)

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<CMD>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<CMD>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<CMD>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<CMD>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
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

-- Move chunks of text
vim.keymap.set('v', '<A-j>', "<CMD>move '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', "<CMD>move '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-h>', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '<A-l>', '>gv', { noremap = true, silent = true })
-- Unsetting default LSP keymaps
vim.cmd [[nnoremap <nowait> gr gr]]

-- Switching buffers in a easy way
vim.keymap.set(
  'n',
  '<S-l>',
  '<CMD>bnext<CR>',
  { noremap = true, silent = true, desc = 'Next buffer' }
)
vim.keymap.set(
  'n',
  '<S-h>',
  '<CMD>bprevious<CR>',
  { noremap = true, silent = true, desc = 'Previous buffer' }
)

-- Delete buffer
vim.keymap.set(
  'n',
  '<leader>bd',
  '<CMD>bdelete<CR>',
  { noremap = true, silent = true, desc = '[B]uffer [D]elete' }
)

-- Resize windows with arrow keys
vim.keymap.set('n', '<C-Up>', '<CMD>resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Down>', '<CMD>resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Left>', '<CMD>vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Right>', '<CMD>vertical resize +2<CR>', { noremap = true, silent = true })
-- vim: ts=2 sts=2 sw=2 et
