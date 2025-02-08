-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>qf', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uick[F]ix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- Display diagnostics as virtual text only if not in insert mode
vim.api.nvim_create_autocmd('InsertEnter', {
  pattern = '*',
  callback = function()
    vim.diagnostic.config {
      virtual_text = false,
    }
  end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  callback = function()
    vim.diagnostic.config {
      virtual_text = true,
    }
  end,
})

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
vim.keymap.set('v', '<TAB>', '>gv')
vim.keymap.set('v', '<S-TAB>', '<gv')

-- Oil
vim.keymap.set('n', '<leader>pv', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Split management
vim.keymap.set('n', '<leader>sv', '<CMD>vsp<CR>', { noremap = true, silent = true, desc = '[S]plit [V]ertical' })
vim.keymap.set('n', '<leader>sh', '<CMD>sp<CR>', { noremap = true, silent = true, desc = '[S]plit [H]orizontal' })
vim.keymap.set('n', '<C-s>', '<CMD>w<CR>', { noremap = true, silent = true, desc = 'Save file.' })
-- Move chunks of text
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
-- vim: ts=2 sts=2 sw=2 et
