vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- Better indentation
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Move lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Better paste (don't overwrite register)
map("x", "p", '"_dP', { desc = "Paste without yanking" })
map("x", "P", '"_dP', { desc = "Paste without yanking" })

-- Keep cursor centered when jumping
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })
map("n", "*", "*zzzv", { desc = "Search word forward (centered)" })
map("n", "#", "#zzzv", { desc = "Search word backward (centered)" })
map("n", "g*", "g*zzzv", { desc = "Search partial forward (centered)" })
map("n", "g#", "g#zzzv", { desc = "Search partial backward (centered)" })

-- Quickfix list navigation
map("n", "]q", vim.cmd.cnext, { desc = "Quickfix: next" })
map("n", "[q", vim.cmd.cprev, { desc = "Quickfix: prev" })
map("n", "]l", vim.cmd.lnext, { desc = "Loclist: next" })
map("n", "[l", vim.cmd.lprev, { desc = "Loclist: prev" })

-- Better escape from terminal
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("t", "<C-/>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- LSP code action menu (rename, extract, etc.)
map({ "n", "x" }, "<F4>", vim.lsp.buf.code_action, { desc = "LSP code action" })

-- Quick save and quit
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Force quit" })

-- Folding (treesitter)
map("n", "<leader>z", "za", { desc = "Toggle fold under cursor" })
map("n", "<leader>zR", "zR", { desc = "Open all folds" })
map("n", "<leader>zM", "zM", { desc = "Close all folds" })
