local is_windows = vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1

if is_windows then
  local shell
  if vim.fn.executable('pwsh') == 1 then
    shell = 'pwsh'
  elseif vim.fn.executable('powershell') == 1 then
    shell = 'powershell'
  end

  if shell then
    local command_prefix = table.concat {
      '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command ',
      '[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();',
      "$PSDefaultParameterValues['Out-File:Encoding']='utf8';",
    }

    if shell == 'pwsh' then
      command_prefix = command_prefix .. "$PSStyle.OutputRendering='PlainText';"
    end

    vim.opt.shell = shell
    vim.opt.shellcmdflag = command_prefix
    vim.opt.shellpipe = '> %s 2>&1'
    vim.opt.shellquote = ''
    vim.opt.shellxquote = ''
    vim.opt.shelltemp = false
  end
end

local lazypath = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy', 'lazy.nvim')
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

local opt = vim.opt

vim.cmd([[
    filetype plugin indent on
]])

opt.updatetime = 250
-- line number
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.swapfile = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- hightligth active line
opt.cursorline = true

-- true color terminal settings
opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes' -- enable specific highlights in debug mode

-- backspace settings
opt.backspace = 'indent,eol,start'
-- enable native clipboard instead of vim default clipboard behavior
-- opt.clipboard:append "unnamedplus"
vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }

-- split windows
opt.splitright = true
opt.splitbelow = true

-- set dash as normal letter instead of divide behavior
opt.iskeyword:append('-')

opt.showmode = false

-- auto completion menu height
vim.opt.pumheight = 10

require('lazy').setup({
  { import = 'plugins' },
}, {
  rocks = { enabled = false },
})

require('keymaps')

local signs = {
  Error = '✘',
  Warn = '▲',
  Hint = '⚑',
  Info = '»',
}
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config {
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  virtual_text = false,
}

vim.lsp.log.set_level('error')

vim.lsp.document_color.enable(true, nil, { style = 'virtual' })
