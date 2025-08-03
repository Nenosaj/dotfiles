vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = ";" 


vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })

vim.keymap.set('n', '<C-v>', '"+p', { noremap = true, silent = true })

vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })


