return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    icons = {
      mappings = false
    },
    win = {
      border = "none", -- none, single, double, shadow
      title = false
    },
  },
}
