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

-- Create a minimal LSP status notification system
local lsp_notify = vim.api.nvim_create_augroup('LspNotify', { clear = true })

-- Track active clients
local active_clients = {}

-- When an LSP attaches
vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_notify,
  callback = function(args)
    local client_id = args.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    if client then
      active_clients[client_id] = client.name
      vim.notify('LSP started: ' .. client.name, vim.log.levels.INFO)
    end
  end,
})

-- When an LSP detaches
vim.api.nvim_create_autocmd('LspDetach', {
  group = lsp_notify,
  callback = function(args)
    local client_id = args.data.client_id
    local client_name = active_clients[client_id] or 'Unknown'
    active_clients[client_id] = nil
    vim.notify('LSP stopped: ' .. client_name, vim.log.levels.INFO)
  end,
})
