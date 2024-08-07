vim.g.mapleader =  ' '

vim.keymap.set('n', '<leader>e' , '<cmd>Ex<cr>',{ noremap = true })
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })
vim.keymap.set('n', '<leader>t', '<cmd>Grapple toggle<cr>', { noremap = true })
vim.keymap.set('n', '<leader><tab>', '<cmd>Grapple open_tags<cr>', { noremap = true })
