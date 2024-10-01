local opts = { noremap = true, silent = true }

-- remap leader key
vim.keymap.set("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', opts)

-- paste from system clipboard
vim.keymap.set({"n", "v"}, "<leader>p", '"+p', opts)

-- Navigate line
vim.keymap.set("n", "H", "^", opts)
vim.keymap.set("n", "L", "$", opts)
vim.keymap.set("v", "H", "^", opts)
vim.keymap.set("v", "L", "$", opts)

-- better indent handling
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- paste preserves primal yanked piece
vim.keymap.set("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- call vscode commands from neovim
-- general keymaps
vim.keymap.set({"n", "v"}, "<leader>z", "<cmd>lua require('vscode').action('workbench.action.toggleZenMode')<CR>")
