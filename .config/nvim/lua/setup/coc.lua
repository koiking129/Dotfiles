local M = {}


M.config = function ()
  -- Extensions installed
  -- vim.g.coc_global_extensions = {
  --   'coc-marketplace',  -- Extensions market
  --   'coc-rust-analyzer',
  --   'coc-clangd',
  --   'coc-sh',
  --   'coc-lua',
  --   'coc-pyright',
  --   'coc-tsserver',
  --   'coc-phpls',
  --   'coc-prettier',
  --   'coc-snippets',
  --   'coc-pairs',  -- Auto pair
  -- }

  -- Use Tab for trigger completion with characters ahead and navigate
  -- NOTE: There's always a completion item selected by default, you may want to enable
  -- no select by setting `"suggest.noselect": true` in your configuration file
  -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
  -- other plugins before putting this into your config
  local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
  vim.keymap.set('i', '<TAB>', "coc#pum#visible() ? coc#pum#next(1) : col('.') == 1 || getline('.')[col('.') - 2] =~# '\\s' ? \"\\<TAB>\" : coc#refresh()", opts)
  vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

  -- Make <CR> to accept selected completion item or notify coc.nvim to format
  -- <C-g>u breaks current undo, please make your own choice
  vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

  -- Prettier command
  vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument')
  -- Formatting code
  vim.keymap.set('x', '<leader>lf', '<Plug>(coc-format-selected)')
  vim.keymap.set('n', '<leader>lf', '<Plug>(coc-format-selected)')
  vim.keymap.set('n', '<leader>lff', '<Plug>(coc-format)')

  -- GoTo code navigation
  vim.keymap.set("n", "<leader>gd", "<Plug>(coc-definition)", {silent = true})
  vim.keymap.set("n", "<leader>gy", "<Plug>(coc-type-definition)", {silent = true})
  vim.keymap.set("n", "<leader>gi", "<Plug>(coc-implementation)", {silent = true})
  vim.keymap.set("n", "<leader>gr", "<Plug>(coc-references)", {silent = true})

  -- Show documentation in the float window
  function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
      vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
      vim.fn.CocActionAsync('doHover')
    else
      vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
  end
  vim.keymap.set("n", "<leader>lk", '<CMD>lua _G.show_docs()<CR>', { silent = true })

  -- Toggle the float window
  local tfw_key = "<C-w>f"
  function _G.toggle_fw()
    if vim.api.nvim_eval('coc#float#has_float()') ~= 0 then
      -- Switch to the float window
      vim.api.nvim_eval('coc#float#jump()')
      -- Bind keys for closing the focused float window
      local _opts = { buffer = true, silent = true }
      vim.keymap.set("n", tfw_key, ":call coc#float#close_all() <CR>", _opts)
      vim.keymap.set("n", "<ESC>", ":call coc#float#close_all() <CR>", _opts)
    end
  end
  vim.keymap.set("n", tfw_key, '<CMD>lua _G.toggle_fw()<CR>', { silent = true })

  -- Symbol renaming
  vim.keymap.set("n", "<leader>lr", "<Plug>(coc-rename)", {silent = true})

  -- Find symbol of current document
  vim.keymap.set("n", "<leader>lo", ":CocList outline<cr>", {silent = true, nowait = true})
end


return M
