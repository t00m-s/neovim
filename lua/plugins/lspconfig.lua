return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'saghen/blink.cmp' },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
        ---@param client vim.lsp.Client
        ---@param method vim.lsp.protocol.Method
        ---@param bufnr? integer some lsp support methods only in specific files
        ---@return boolean
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if
          client
          and client_supports_method(
            client,
            vim.lsp.protocol.Methods.textDocument_documentHighlight,
            event.buf
          )
        then
          local highlight_augroup =
            vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds {
                group = 'kickstart-lsp-highlight',
                buffer = event2.buf,
              }
            end,
          })
        end
      end,
    })

    -- Diagnostic Config
    -- See :help vim.diagnostic.Opts
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }

    local servers = {
      lua_ls = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = {
          'lua',
          '.luarc.json',
          '.luarc.jsonc',
          '.luacheckrc',
          '.stylua.toml',
          'stylua.toml',
        },
        settings = {
          Lua = {
            hint = { enable = true },
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              },
            },
            completion = { callSnippet = 'Replace' },
          },
        },
      },
      ruff = {
        filetypes = { 'python' },
        init_options = {
          settings = {
            lineLength = 80,
          },
        },
      },
      basedpyright = {
        settings = {
          basedpyright = {
            typeCheckingMode = 'standard',
            disableOrganizeImports = true, -- Using Ruff
          },
          python = {
            analysis = {
              ignore = { '*' }, -- Using Ruff
            },
          },
        },
      },
      clangd = {
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto', 'hpp' },
      },
      bashls = {},
    }
    for server_name, server_config in pairs(servers) do
      server_config.capabilites = require('blink.cmp').get_lsp_capabilities(server_config)
      require('lspconfig')[server_name].setup(server_config)
    end
  end,
}
