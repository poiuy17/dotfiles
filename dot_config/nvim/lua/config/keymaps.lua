vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Navigate line
vim.keymap.set("n", "H", "^", opts)
vim.keymap.set("n", "L", "$", opts)
vim.keymap.set("v", "H", "^", opts)
vim.keymap.set("v", "L", "$", opts)

-- better indent handling
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Select all
vim.keymap.set("n", "==", "gg<S-v>G", opts)

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP', opts)

-- Make Y behave like C or D
vim.keymap.set("n", "Y", "y$", opts)

-- Split window
-- vim.keymap.set("n", "ss", ":split<Return>", opts)
-- vim.keymap.set("n", "sv", ":vsplit<Return>", opts)

vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
