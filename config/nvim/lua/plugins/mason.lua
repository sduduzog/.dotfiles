return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    -- ensure_installed = { 'elixirls', 'eslint', 'prettier', 'gopls', 'lua_ls', 'bashls', 'tailwindcss', 'vue_ls', 'ts_ls' },
    ensure_installed = { 'elixirls', 'eslint', 'gopls', 'graphql', 'lua_ls', 'vtsls', 'vue_ls', 'tailwindcss' }
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
}
