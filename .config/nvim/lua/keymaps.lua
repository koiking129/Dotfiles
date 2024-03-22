vim.g.mapleader = ' '

-- Remove highlights
vim.keymap.set('n', '<leader>nh', ':noh <CR>')

-- Windows navigation
vim.keymap.set('n', '<A-h>', '<CMD>wincmd h<CR>')
vim.keymap.set('n', '<A-j>', '<CMD>wincmd j<CR>')
vim.keymap.set('n', '<A-k>', '<CMD>wincmd k<CR>')
vim.keymap.set('n', '<A-l>', '<CMD>wincmd l<CR>')

-- Buffer switching
vim.keymap.set('n', '<a-[>', ':bp <CR>')
vim.keymap.set('n', '<a-]>', ':bn <CR>')

-- Line moving
vim.keymap.set("v", "J", ":m '>+1 <CR> gv=gv")
vim.keymap.set("v", "K", ":m '<-2 <CR> gv=gv")

-- Run the bash shell selected
vim.keymap.set('v', '<leader>r', ':w !bash <CR>')
vim.keymap.set('n', '<leader>yr', ':.w !bash <CR>')

-- Line wrap
vim.keymap.set('n', '<a-z>', ':set wrap! <CR>')

-- Stay in visual mode while indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
