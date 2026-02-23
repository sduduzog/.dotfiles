return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-context',
  },
  build = ':TSUpdate',
  main = 'nvim-treesitter',
  opts = {
    ensure_installed = { 'c', 'bash', 'css', 'eex', 'elixir', 'graphql', 'heex', 'lua', 'go', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline', 'vue', 'javascript', 'typescript' },
  },
}
