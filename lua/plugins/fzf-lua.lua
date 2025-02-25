return {
  'ibhagwan/fzf-lua',
  dependencies = { 'echasnovski/mini.icons' },
  config = function()
    local fzf = require 'fzf-lua'
    fzf.setup { 'fzf-native', 'hide' }
    vim.keymap.set('n', '<leader>sf', function()
      fzf.files()
    end, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sg', function()
      fzf.git_files()
    end, { desc = '[S]earch [G]it Files' })
    vim.keymap.set('n', '<leader>sb', function()
      fzf.buffers()
    end, { desc = '[S]earch [B]uffers' })
    vim.keymap.set('n', '<leader>so', function()
      fzf.oldfiles()
    end, { desc = '[S]earch [O]ld Files' })
    vim.keymap.set('n', '<leader>sw', function()
      fzf.grep_project()
    end, { desc = '[S]earch [W]ord' })
    vim.keymap.set('n', '<leader>ch', function()
      fzf.command_history()
    end, { desc = '[C]ommand [H]istory' })
    vim.keymap.set('n', '<leader>cs', function()
      fzf.colorschemes()
    end, { desc = '[C]olor [S]chemes' })
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('LspKeymaps', {}),
      callback = function(ev)
        local map_opts = { buffer = ev.buf }

        vim.keymap.set('n', '<leader>gd', function()
          fzf.lsp_definitions()
        end, vim.tbl_extend('force', map_opts, { desc = '[G]oto [D]efinition' }))

        vim.keymap.set('n', '<leader>gr', function()
          fzf.lsp_references()
        end, vim.tbl_extend('force', map_opts, { desc = '[G]oto [R]eferences' }))

        vim.keymap.set('n', '<leader>gI', function()
          fzf.lsp_implementations()
        end, vim.tbl_extend('force', map_opts, { desc = '[G]oto [I]mplementation' }))

        vim.keymap.set('n', '<leader>D', function()
          fzf.lsp_type_definitions()
        end, vim.tbl_extend('force', map_opts, { desc = 'Type [D]efinition' }))

        vim.keymap.set('n', '<leader>ds', function()
          fzf.lsp_document_symbols()
        end, vim.tbl_extend('force', map_opts, { desc = '[D]ocument [S]ymbols' }))

        vim.keymap.set('n', '<leader>ws', function()
          fzf.lsp_live_workspace_symbols()
        end, vim.tbl_extend('force', map_opts, { desc = '[W]orkspace [S]ymbols' }))

        vim.keymap.set('n', '<leader>rn', function()
          vim.lsp.buf.rename()
        end, vim.tbl_extend('force', map_opts, { desc = '[R]e[n]ame' }))

        vim.keymap.set({ 'n', 'x' }, '<leader>ca', function()
          vim.lsp.buf.code_action()
        end, vim.tbl_extend('force', map_opts, { desc = '[C]ode [A]ction' }))

        vim.keymap.set('n', '<leader>gD', function()
          vim.lsp.buf.declaration()
        end, vim.tbl_extend('force', map_opts, { desc = '[G]oto [D]eclaration' }))

        -- Additional useful LSP keymaps
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', map_opts, { desc = 'Hover Documentation' }))

        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, vim.tbl_extend('force', map_opts, { desc = 'Signature Help' }))

        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, vim.tbl_extend('force', map_opts, { desc = '[W]orkspace [A]dd Folder' }))

        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, vim.tbl_extend('force', map_opts, { desc = '[W]orkspace [R]emove Folder' }))

        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, vim.tbl_extend('force', map_opts, { desc = '[W]orkspace [L]ist Folders' }))
      end,
    })
  end,
}
