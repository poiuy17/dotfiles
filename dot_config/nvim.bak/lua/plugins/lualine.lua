return {
"nvim-lualine/lualine.nvim",
    enabled = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "arkav/lualine-lsp-progress",
    },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "filename",
              path = 1, -- 0: Just the filename
              -- 1: Relative path
              -- 2: Absolute path
              -- 3: Absolute path, with tilde as the home directory
              -- 4: Filename and parent dir, with tilde as the home directory
            },
            "lsp_progress",
          },
          lualine_x = {
            --[[ 'diff', ]]
            "diagnostics",
            "encoding",
            {
              function()
                local tabstop = vim.opt.tabstop:get() 
                return "Tab:" .. tabstop
              end,
            },
            "fileformat",
          },
          lualine_y = {},
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {
          -- lualine_c = {
          --   "navic",
          --   -- Component specific options
          --   color_correction = nil, -- Can be nil, "static" or "dynamic". This option is useful only when you have highlights enabled.
          --   -- Many colorschemes don't define same backgroud for nvim-navic as their lualine statusline backgroud.
          --   -- Setting it to "static" will perform a adjustment once when the component is being setup. This should
          --   --   be enough when the lualine section isn't changing colors based on the mode.
          --   -- Setting it to "dynamic" will keep updating the highlights according to the current modes colors for
          --   --   the current section.
          --   navic_opts = nil -- lua table with same format as setup's option. All options except "lsp" options take effect when set here.
          -- },
        },
        inactive_winbar = {},
        extensions = {},
      })
    end,
}
