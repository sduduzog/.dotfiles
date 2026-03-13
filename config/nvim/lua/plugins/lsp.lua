return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'nvim-lua/plenary.nvim',
    'L3MON4D3/LuaSnip',
    'onsails/lspkind-nvim',

  },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
    vim.lsp.config('elixirls', {})
    vim.lsp.config('vue_ls', {})
    vim.lsp.config('gopls', {})
    vim.lsp.config('graphql', {
      cmd = { 'graphql-lsp', 'server', '-m', 'stream' },
      filetypes = { 'graphql', 'typescriptreact', 'javascriptreact' },
      root_markers = { '.graphqlrc', '.graphqlrc.json', '.graphqlrc.yaml', '.graphqlrc.yml',
        '.graphqlrc.js', '.graphqlrc.ts', 'graphql.config.*' },
    })

    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup {
      preselect = 'item',
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
      },
      formatting = {
        format = require('lspkind').cmp_format {
          mode = 'symbol'
        },
      },
    }
  end,
}
