if vim.g.vscode then
  -- VSCode Neovim
  require "config.vscode_keymaps"
else
  -- Ordinary Neovim
  require("config.keymaps")
  require("config.options")
  require("config.autocmds")

  require("config.lazy")

  vim.o.background = "dark"
  vim.cmd.colorscheme 'tokyonight-night'
  -- vim.cmd.colorscheme("gruvbox")
end
