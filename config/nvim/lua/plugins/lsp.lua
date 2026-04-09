return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
        '/vue-language-server' .. '/node_modules/@vue/language-server'

    local vue_plugin = {
      name = '@vue/typescript-plugin',
      location = vue_language_server_path,
      languages = { 'vue' },
      configNamespace = 'typescript',
    }

    vim.lsp.config('vtsls', {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              vue_plugin
            }
          }
        }
      },
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
    })
    vim.lsp.config('elixirls', {
      settings = {
        elixirLS = {
          dialyzerEnabled = false,
        },
      },
    })
    vim.lsp.config('vue_ls', {})
    vim.lsp.config('tailwindcss', {
      root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        local root = vim.fs.dirname(vim.fs.find({
          'tailwind.config.js',
          'tailwind.config.cjs',
          'tailwind.config.mjs',
          'tailwind.config.ts',
          'postcss.config.js',
          'postcss.config.cjs',
          'postcss.config.mjs',
          'postcss.config.ts',
        }, { path = fname, upward = true })[1])
        if root then
          on_dir(root)
        end
      end,
      settings = {
        tailwindCSS = {
          includeLanguages = {
            elixir = 'phoenix-heex',
            eelixir = 'html-eex',
            heex = 'phoenix-heex',
          },
          experimental = {
            classRegex = {
              'class[:\\s]*"([^"]*)"',
            },
          },
        },
      },
    })
    vim.lsp.config('gopls', {})
    vim.lsp.config('graphql', {
      cmd = { 'graphql-lsp', 'server', '-m', 'stream' },
      filetypes = { 'graphql', 'typescriptreact', 'javascriptreact' },
      root_markers = { '.graphqlrc', '.graphqlrc.json', '.graphqlrc.yaml', '.graphqlrc.yml',
        '.graphqlrc.js', '.graphqlrc.ts', 'graphql.config.*' },
    })
  end,
}
