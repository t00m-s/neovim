return {
  filetypes = { 'python' },
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
}
