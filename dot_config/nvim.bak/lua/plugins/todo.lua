return {
  'folke/todo-comments.nvim',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = false
  },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search Todos" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
}
    