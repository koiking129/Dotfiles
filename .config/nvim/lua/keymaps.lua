vim.g.mapleader = ' '

-- Windows navigation
vim.keymap.set('n', '<A-h>', '<CMD>wincmd h<CR>')
vim.keymap.set('n', '<A-j>', '<CMD>wincmd j<CR>')
vim.keymap.set('n', '<A-k>', '<CMD>wincmd k<CR>')
vim.keymap.set('n', '<A-l>', '<CMD>wincmd l<CR>')

-- Buffer switching
vim.keymap.set('n', '<a-[>', '<CMD>bp<CR>')
vim.keymap.set('n', '<a-]>', '<CMD>bn<CR>')

-- Line moving
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Run the bash shell selected
vim.keymap.set('v', '<leader>r', '<CMD>w !bash<CR>', { desc = "Run selected lines in bash" })
vim.keymap.set('n', '<leader>yr', '<CMD>.w !bash<CR>', { desc = "Run current line in bash" })

-- Line wrap
vim.keymap.set('n', '<a-z>', '<CMD>set wrap!<CR>')

-- Stay in visual mode while indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
