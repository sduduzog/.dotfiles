return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-context',
  },
  build = ':TSUpdate',
  config = function()
    local ensure_installed = { 'c', 'bash', 'css', 'eex', 'elixir', 'graphql', 'heex', 'lua', 'go', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline', 'vue', 'javascript', 'typescript', 'tsx' }
    local installed = require('nvim-treesitter').get_installed()
    local to_install = vim.tbl_filter(function(lang)
      return not vim.list_contains(installed, lang)
    end, ensure_installed)
    if #to_install > 0 then
      require('nvim-treesitter').install(to_install)
    end

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        if pcall(vim.treesitter.start, args.buf) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
