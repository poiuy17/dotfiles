return {
  "danymat/neogen",
  keys = {
    {
      "<leader>nf",
      function()
        require("neogen").generate({})
      end,
      desc = "Neogen Comment",
    },
  },
  opts = { snippet_engine = "luasnip" },
}
