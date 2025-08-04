-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Your custom keymaps
vim.keymap.set("n", "<c-w>t", ":tabnew<CR>", { noremap = true, silent = true })
