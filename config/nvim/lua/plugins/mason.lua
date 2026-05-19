return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    -- ensure_installed = { 'elixirls', 'eslint', 'prettier', 'gopls', 'lua_ls', 'bashls', 'tailwindcss', 'vue_ls', 'ts_ls' },
    -- elixir LSP (`expert`) is installed manually to ~/.local/bin/expert; not available via Mason
    ensure_installed = { 'bashls', 'emmet_language_server', 'eslint', 'gopls', 'graphql', 'lua_ls', 'vtsls', 'vue_ls', 'tailwindcss' }
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
}
