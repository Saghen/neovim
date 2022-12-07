require'nvim-treesitter.configs'.setup {
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- Enable Tree Sitter for syntax highlighting
  highlight = {
    enable = true
  }
}
