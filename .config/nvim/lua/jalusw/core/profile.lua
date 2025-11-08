vim.api.nvim_create_autocmd("FocusGained", {
  command = "checktime"
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank({ timeout = 200 }) end
})

vim.cmd.colorscheme("rose-pine")
