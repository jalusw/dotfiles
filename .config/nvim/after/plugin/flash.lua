require("flash").setup({})

vim.api.nvim_set_keymap(
	"n",
	"<leader>]",
	"<cmd>lua require('flash').jump({ search = { forward = true, wrap = false, multi_window=false}})<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>[",
	"<cmd>lua require('flash').jump({ search = { forward = false, wrap = false, multi_window=false}})<CR>",
	{ noremap = true, silent = true }
)
