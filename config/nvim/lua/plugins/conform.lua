return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        elixir = { 'mix' },
        heex = { 'mix' },
        eelixir = { 'mix' },
        lua = { 'stylua' },
        sh = { 'beautysh' },
        vue = { 'oxfmt', 'prettier' },
        javascript = { 'oxfmt', 'prettier' },
        javascriptreact = { 'oxfmt', 'prettier' },
        typescript = { 'oxfmt', 'prettier' },
        typescriptreact = { 'oxfmt', 'prettier' },
        json = { 'oxfmt', 'prettier' },
        jsonc = { 'oxfmt', 'prettier' },
        css = { 'oxfmt', 'prettier' },
        scss = { 'oxfmt', 'prettier' },
        less = { 'oxfmt', 'prettier' },
      },
      format_on_save = {
        timeout_ms = 10000,
        lsp_format = 'fallback',
      },
    }
  end,
}
