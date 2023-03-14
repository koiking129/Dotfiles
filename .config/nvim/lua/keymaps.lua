vim.g.mapleader = ' '

-- Remove highlights
vim.keymap.set('n', '<leader>nh', ':noh<cr>')

-- Windows navigation
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- Buffer switching
vim.keymap.set('n', '<a-j>', ':bp<cr>')
vim.keymap.set('n', '<a-k>', ':bn<cr>')

-- Line moving
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Run code
vim.g.run_cmd = {
    bash = 'bash',
    zsh = 'bash',
    sh = 'bash',
    python = 'python',
    javascript = 'node',
    php = 'php',
    lua = 'lua'
}
vim.keymap.set('n', '<F5>', ':exec "!" run_cmd[&ft] "%"<cr>')

-- Copy
vim.keymap.set('v', '<leader>c', '"+y')

