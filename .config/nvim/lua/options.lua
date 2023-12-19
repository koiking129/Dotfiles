-- Line number
vim.o.number = true
-- [Use relative line numbers when entering visual mode](https://neovim.io/doc/user/autocmd.html#ModeChanged)
vim.cmd("au ModeChanged [vV\x16]*:* let &l:rnu = mode() =~# '^[vV\x16]'")
vim.cmd("au ModeChanged *:[vV\x16]* let &l:rnu = mode() =~# '^[vV\x16]'")
vim.cmd("au WinEnter,WinLeave * let &l:rnu = mode() =~# '^[vV\x16]'")
-- `\x16`: refer to [this](https://en.wikipedia.org/wiki/List_of_Unicode_characters#Control_codes)

-- Indent
vim.o.tabstop = 4  -- tab character
vim.o.shiftwidth = 0  -- indent, 0 means following 'tabstop'
vim.o.expandtab = true

-- Misc
vim.o.cursorline = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Wrap
vim.o.wrap = true

-- Color
vim.o.termguicolors = true

-- Intro message
vim.o.shortmess = 'I'

-- Statusline
vim.o.laststatus = 3  -- global statusline

