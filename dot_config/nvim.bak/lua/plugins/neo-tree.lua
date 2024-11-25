-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim"
	},
	cmd = "Neotree",
	keys = {
		{
			"<leader>e",
			"<cmd>Neotree toggle<cr>",
			desc = "[E]xplorer NeoTree",
		},
	},
	opts = {
		-- If you want icons for diagnostic errors, you'll need to define them somewhere:
		-- vim.fn.sign_define("DiagnosticSignError",
		--   { text = " ", texthl = "DiagnosticSignError" }),
		-- vim.fn.sign_define("DiagnosticSignWarn",
		--   { text = " ", texthl = "DiagnosticSignWarn" }),
		-- vim.fn.sign_define("DiagnosticSignInfo",
		--   { text = " ", texthl = "DiagnosticSignInfo" }),
		-- vim.fn.sign_define("DiagnosticSignHint",
		--   { text = "󰌵", texthl = "DiagnosticSignHint" }),

		filesystem = {
			close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
			enable_git_status = false,
			enable_diagnostics = false,
			open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
			sort_case_insensitive = false,
			window = {
				position = "left",
				width = 40,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["<cr>"] = "open",
					["o"] = "open",
					["l"] = "open",
					["<esc>"] = "cancel", -- close preview or floating neo-tree window
					["h"] = "close_node",
					["a"] = {
						"add",
						-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
						-- some commands may take optional config options, see `:h neo-tree-mappings` for details
						config = {
							show_path = "none", -- "none", "relative", "absolute"
						},
					},
					["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
					["d"] = "delete",
					["r"] = "rename",
					["q"] = "close_window",
					["i"] = "show_file_details",
					["H"] = "toggle_hidden",
				},
			},
		},
	},
}
