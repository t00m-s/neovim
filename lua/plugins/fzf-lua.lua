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
    vim.keymap.set('n', '<leader><leader>', function()
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
    vim.keymap.set('n', '<leader>gd', function()
      fzf.lsp_definitions()
    end, { desc = '[G]oto [D]efinition' })

    vim.keymap.set('n', '<leader>gr', function()
      fzf.lsp_references()
    end, { desc = '[G]oto [R]eferences' })

    vim.keymap.set('n', '<leader>gI', function()
      fzf.lsp_implementations()
    end, { desc = '[G]oto [I]mplementation' })

    vim.keymap.set('n', '<leader>D', function()
      fzf.lsp_type_definitions()
    end, { desc = 'Type [D]efinition' })

    vim.keymap.set('n', '<leader>ds', function()
      fzf.lsp_document_symbols()
    end, { desc = '[D]ocument [S]ymbols' })

    vim.keymap.set('n', '<leader>ws', function()
      fzf.lsp_live_workspace_symbols()
    end, { desc = '[W]orkspace [S]ymbols' })

    vim.keymap.set('n', '<leader>rn', function()
      vim.lsp.buf.rename()
    end, { desc = '[R]e[n]ame' })

    vim.keymap.set({ 'n', 'x' }, '<leader>ca', function()
      vim.lsp.buf.code_action()
    end, { desc = '[C]ode [A]ction' })

    vim.keymap.set('n', '<leader>gD', function()
      vim.lsp.buf.declaration()
    end, { desc = '[G]oto [D]eclaration' })

    vim.keymap.set('n', 'K', function()
      vim.lsp.buf.hover()
    end, { desc = 'Hover Documentation' })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Help' })
  end,
}
