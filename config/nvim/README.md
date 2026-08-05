# Neovim config

One config for macOS and native Windows. Windows uses PowerShell 7 (`pwsh`)
when it is available and falls back to Windows PowerShell. Other platforms keep
Neovim's default shell.

## Extend the configuration

Create a file:

- `lua/options.lua` or
- `lua/options/init.lua`

This will be automatically picked up after restarting Neovim.

## Add plugins

Create any `.lua` file in `lua/plugins/` with the structure:

```lua
return {
  -- your plugins here
  { "someplugin" },
}
```

## Prerequisites

Install Neovim and Git. These optional tools enable more of the config:

- `rg` for Telescope live grep
- `fd` for faster file discovery
- `lazygit` for `<leader>lg`
- Node.js for JavaScript and TypeScript language servers
- A Nerd Font for icons

Language runtimes and formatters are only needed for the languages you use.

## Install on macOS

```sh
git clone <repository-url> ~/.dotfiles
mkdir -p ~/.config
ln -s ~/.dotfiles/config/nvim ~/.config/nvim
```

## Install on Windows

Run these commands in PowerShell:

```powershell
git clone <repository-url> "$env:USERPROFILE\.dotfiles"

New-Item `
  -ItemType Junction `
  -Path "$env:LOCALAPPDATA\nvim" `
  -Target "$env:USERPROFILE\.dotfiles\config\nvim"
```

Start `nvim` and let lazy.nvim install the plugins. Then run `:checkhealth` to
find any optional executables that are unavailable on that machine.

To keep a separate client profile, use `nvim-client` as the junction name and
set the app name before starting Neovim:

```powershell
$env:NVIM_APPNAME = "nvim-client"
nvim
```

I tried to keep keymap settings colocated with where the plugin is being setup.
All plugins will either be found in `lua/plugins/<plugin name>.lua` or
`lua/plugins/init.lua`.

## Golang prerequisites

Install golangci on your local machine https://golangci-lint.run/usage/install
