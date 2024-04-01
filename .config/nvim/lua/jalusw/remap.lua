vim.g.mapleader = " "

vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>')
vim.keymap.set('n', '<C-g>', ':Telescope live_grep<CR>')

vim.keymap.set("n","<leader>r",vim.cmd.Neoformat)
vim.keymap.set("n","<leader>s",vim.cmd.SymbolsOutline)

vim.keymap.set("n","<leader>t",':Grapple tag<CR>')
vim.keymap.set("n","<leader>T",':Grapple untag<CR>')
vim.keymap.set("n","<leader>v",':Grapple toggle_tags<CR>', {noremap = true})

vim.keymap.set("n","<leader>f",vim.cmd.Ex)
