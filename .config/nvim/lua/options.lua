-- Line number
vim.o.number = true
-- [Use relative line numbers when entering visual mode](https://neovim.io/doc/user/autocmd.html#ModeChanged)
vim.cmd("au ModeChanged [vV\x16]*:* let &l:rnu = mode() =~# '^[vV\x16]'")
vim.cmd("au ModeChanged *:[vV\x16]* let &l:rnu = mode() =~# '^[vV\x16]'")
vim.cmd("au WinEnter,WinLeave * let &l:rnu = mode() =~# '^[vV\x16]'")
-- `\x16`: refer to [this](https://en.wikipedia.org/wiki/List_of_Unicode_characters#Control_codes)

-- The length of tab
vim.o.tabstop = 4
-- The length of indent (0 means following 'tabstop')
vim.o.shiftwidth = 0
-- Use white spaces instead of the tab for indent
vim.o.expandtab = true

-- Highlight the current line
vim.o.cursorline = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable wrap
vim.o.wrap = true

-- Color
vim.o.termguicolors = true

-- Inhibit the intro message
vim.o.shortmess = 'I'

-- Statusline
vim.o.laststatus = vim.g.started_by_firenvim and 0 or 3;

-- Firenvim
vim.g.firenvim_config = {
  globalSettings = { alt = "all" },
  localSettings = {
    [".*"] = {
      cmdline  = "neovim",
      content  = "text",
      priority = 0,
      selector = "textarea",
      takeover = "never"  -- Triggered manually
    }
  }
}

-- Always keep the sign column
vim.o.signcolumn = "yes"

-- Remove the tilde symbols
vim.opt.fillchars = { eob = " " }
