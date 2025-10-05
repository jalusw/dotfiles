-- Neovim keymaps configuration 

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<c-w>t", ":tabnew<CR>", { noremap = true, silent = true })

-- Quickfix navigation (F4 alternatives)
vim.keymap.set("n", "<leader>qf", ":copen<CR>", { noremap = true, silent = true, desc = "Open quickfix" })
vim.keymap.set("n", "<leader>qc", ":cclose<CR>", { noremap = true, silent = true, desc = "Close quickfix" })
vim.keymap.set("n", "<leader>qn", ":cnext<CR>", { noremap = true, silent = true, desc = "Next quickfix" })
vim.keymap.set("n", "<leader>qp", ":cprev<CR>", { noremap = true, silent = true, desc = "Previous quickfix" })
vim.keymap.set("n", "]q", ":cnext<CR>", { noremap = true, silent = true, desc = "Next quickfix" })
vim.keymap.set("n", "[q", ":cprev<CR>", { noremap = true, silent = true, desc = "Previous quickfix" })

-- Location list navigation
vim.keymap.set("n", "<leader>lf", ":lopen<CR>", { noremap = true, silent = true, desc = "Open location list" })
vim.keymap.set("n", "<leader>lc", ":lclose<CR>", { noremap = true, silent = true, desc = "Close location list" })
vim.keymap.set("n", "<leader>ln", ":lnext<CR>", { noremap = true, silent = true, desc = "Next location" })
vim.keymap.set("n", "<leader>lp", ":lprev<CR>", { noremap = true, silent = true, desc = "Previous location" })
vim.keymap.set("n", "]l", ":lnext<CR>", { noremap = true, silent = true, desc = "Next location" })
vim.keymap.set("n", "[l", ":lprev<CR>", { noremap = true, silent = true, desc = "Previous location" })
