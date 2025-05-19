return {
  filetypes = { 'python' },
  settings = {
    basedpyright = {
      typeCheckingMode = 'standard',
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { '*' },
      },
    },
  },
}
