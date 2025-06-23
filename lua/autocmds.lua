-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

-- Creates a minimal LSP status notification system
local lsp_notify = vim.api.nvim_create_augroup('LspNotifications', { clear = true })

local active_clients = {}

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_notify,
  callback = function(args)
    local client_id = args.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    if client and not active_clients[client.name] then
      active_clients[client.name] = true
      vim.notify('LSP started: ' .. client.name, vim.log.levels.INFO)
    end
  end,
})
