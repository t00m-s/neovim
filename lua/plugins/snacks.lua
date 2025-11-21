return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'echasnovski/mini.nvim' },
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    lazygit = { enabled = true },
    dashboard = {
      enabled = true,
      examples = 'doom',
    },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    terminal = { enabled = true },
    picker = { enabled = true },
  },
  keys = {
    {
      '<leader>tt',
      function() Snacks.terminal.toggle() end,
      desc = '[T]oggle [T]erminal',
    },
    {
      '<leader>lg',
      function() Snacks.lazygit() end,
      desc = '[L]azy[G]it',
    },
    {
      '<leader>gl',
      function() Snacks.lazygit.log() end,
      desc = '[G]it [L]og',
    },
    {
      '<leader>sf',
      function()
        local is_git_project = vim.fn.systemlist('git rev-parse --is-inside-work-tree')[1] == true
        if is_git_project then
          Snacks.picker.git_files()
        else
          Snacks.picker.files()
        end
      end,
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>sc',
      function() Snacks.picker.files { cwd = vim.fn.stdpath 'config' } end,
      desc = '[S]earch NeoVim [C]onfig',
    },
    {
      '<leader>sw',
      function() Snacks.picker.grep() end,
      desc = '[S]earch [W]ord',
    },
    {
      '<leader><leader>',
      function() Snacks.picker.smart() end,
      desc = 'Recent files',
    },
    {
      '<leader>b',
      function() Snacks.picker.buffers() end,
      desc = '[B]uffers',
    },
    {
      '<leader>gd',
      function() Snacks.picker.lsp_definitions() end,
      desc = 'LSP: [G]oto [D]efinition',
    },
    {
      '<leader>gr',
      function() Snacks.picker.lsp_references() end,
      nowait = true,
      desc = 'LSP: [G]oto [R]eferences',
    },
    {
      '<leader>gD',
      function() Snacks.picker.lsp_declarations() end,
      desc = 'LSP: [G]oto [D]eclaration',
    },
    {
      '<leader>gI',
      function() Snacks.picker.lsp_implementations() end,
      desc = 'LSP: [G]oto [I]mplementations',
    },
    {
      '<leader>D',
      function() Snacks.picker.lsp_type_definitions() end,
      desc = 'LSP: Type [D]efinitions',
    },
    {
      '<leader>ws',
      function() Snacks.picker.lsp_workspace_symbols() end,
      desc = 'LSP: [W]orkspace [S]ymbols',
    },
    {
      '<leader>rn',
      function() vim.lsp.buf.rename() end,
      desc = 'LSP: [R]e[N]ame',
    },
    {
      '<leader>sP',
      function() Snacks.picker.projects() end,
      desc = '[P]rojects',
    },
    {
      '<leader>sU',
      function() Snacks.picker.undo() end,
      desc = '[S]earch [U]ndo',
    },
  },
}
