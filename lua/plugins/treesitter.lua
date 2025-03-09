return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },

    -- Incremental selection configuration
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-space>',
        node_incremental = '<C-space>',
        scope_incremental = '<C-s>',
        node_decremental = '<C-backspace>',
      },
    },

    -- Text object configuration
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          ['ai'] = '@conditional.outer',
          ['ii'] = '@conditional.inner',
          ['ab'] = '@block.outer',
          ['ib'] = '@block.inner',
          ['as'] = '@statement.outer',
          ['is'] = '@statement.inner',
          ['aC'] = '@comment.outer',
          ['iC'] = '@comment.inner',
        },
      },

      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
          [']b'] = '@block.outer',
          [']a'] = '@parameter.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
          [']B'] = '@block.outer',
          [']A'] = '@parameter.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
          ['[b'] = '@block.outer',
          ['[a'] = '@parameter.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
          ['[B'] = '@block.outer',
          ['[A'] = '@parameter.outer',
        },
      },

      swap = {
        enable = true,
        swap_next = {
          ['<leader>a>'] = '@parameter.inner',
          ['<leader>f>'] = '@function.outer',
        },
        swap_previous = {
          ['<leader>a<'] = '@parameter.inner',
          ['<leader>f<'] = '@function.outer',
        },
      },
    },
  },

  config = function(opts)
    require('nvim-treesitter.configs').setup(opts)

    -- Treesitter Context setup
    require('treesitter-context').setup {
      enable = true,
      max_lines = 3,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = 'outer',
      mode = 'cursor',
    }

    -- Treesitter Context keymaps
    vim.keymap.set('n', '[c', function()
      require('treesitter-context').go_to_context()
    end, { desc = 'Jump to context (upwards)' })

    -- Additional TreeSitter related keymaps
  end,
}
-- vim: ts=2 sts=2 sw=2 et
