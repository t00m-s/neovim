return {
  'ibhagwan/fzf-lua',
  dependencies = { 'echasnovski/mini.icons' },
  opts = {},
  keys = {
    {
      '<leader>sf',
      function()
        require('fzf-lua').files()
      end,
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>sc',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[S]earch NeoVim [C]onfig',
    },
    {
      '<leader>sgf',
      function()
        require('fzf-lua').git_files()
      end,
      desc = '[S]earch [G]it [F]iles',
    },
    {
      '<leader>sw',
      function()
        require('fzf-lua').grep()
      end,
      desc = '[S]earch [W]ord',
    },
    {
      '<leader>ch',
      function()
        require('fzf-lua').command_history()
      end,
      desc = '[C]ommand [H]istory',
    },
    {
      '<leader>cs',
      function()
        require('fzf-lua').colorschemes()
      end,
      desc = '[C]olor [S]chemes',
    },
    -- LSP related keybindings (converted from the first block)
    {
      '<leader>gd',
      function()
        require('fzf-lua').lsp_definitions()
      end,
      desc = 'LSP: [G]oto [D]efinition',
    },
    {
      '<leader>gr',
      function()
        require('fzf-lua').lsp_references()
      end,
      desc = 'LSP: [G]oto [R]eferences',
    },
    {
      '<leader>gD',
      function()
        require('fzf-lua').lsp_declarations()
      end,
      desc = 'LSP: [G]oto [D]eclaration',
    },
    {
      '<leader>gI',
      function()
        require('fzf-lua').lsp_implementations()
      end,
      desc = 'LSP: [G]oto [I]mplementations',
    },
    {
      '<leader>D',
      function()
        require('fzf-lua').lsp_type_definitions()
      end,
      desc = 'LSP: Type [D]efinitions',
    },
    {
      '<leader>ws',
      function()
        require('fzf-lua').lsp_live_workspace_symbols()
      end,
      desc = 'LSP: [W]orkspace [S]ymbols',
    },
    {
      '<leader>rn',
      function()
        vim.lsp.buf.rename()
      end,
      desc = 'LSP: [R]e[N]ame',
    },
    {
      '<leader>ca',
      function()
        require('fzf-lua').lsp_code_actions()
      end,
      desc = 'LSP: [C]ode [A]ctions',
    },
    {
      '<C-k>',
      function()
        vim.lsp.buf.signature_help()
      end,
      desc = 'LSP: Signature Help',
    },
  },
}
