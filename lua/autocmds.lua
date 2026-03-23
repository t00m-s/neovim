-- ~/.config/nvim/lua/autocmds.lua
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yanked text
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  pattern = '*',
  callback = function() vim.highlight.on_yank { timeout = 150 } end,
  group = highlight_group,
})

-- Creates a minimal LSP status notification system
local lsp_notify = augroup('LspNotifications', { clear = true })

local active_clients = {}

autocmd('LspAttach', {
  group = lsp_notify,
  callback = function(args)
    -- Uses treesitter features
    vim.treesitter.start()
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    vim.api.nvim_feedkeys('zR', 'n', true)

    -- Notification system
    local client_id = args.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    if client and not active_clients[client.name] then
      active_clients[client.name] = true
      vim.notify('LSP started: ' .. client.name, vim.log.levels.INFO)
    end
  end,
})

autocmd('PackChanged', { callback = function() require('nvim-treesitter').update() end })
