return {
  'ibhagwan/fzf-lua',
  dependencies = { 'echasnovski/mini.icons' },
  event = { 'VeryLazy' },
  opts = {
    oldfiles = { include_current_session = true },
    previewers = { builtin = { syntax_limit_b = 1024 * 100 } },
    grep = { rg_glob = true, glob_flag = '--iglob' },
  },
  keys = {
    {
      '<leader>sf',
      function()
        local is_git_project = vim.fn.systemlist('git rev-parse --is-inside-work-tree')[1] == true
        if is_git_project then
          require('fzf-lua').git_files()
        else
          require('fzf-lua').files()
        end
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
    {
      '<leader>b',
      function()
        require('fzf-lua').buffers()
      end,
      desc = '[B]uffers',
    },
    {
      '<leader><leader>',
      function()
        require('fzf-lua').oldfiles()
      end,
      desc = 'Recent files',
    },
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
  },
}
