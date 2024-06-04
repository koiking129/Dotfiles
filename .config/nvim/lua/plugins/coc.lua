-- Show documentation in the float window
local function show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end


-- Toggle the float window
local function focus_fw()
  if vim.api.nvim_eval('coc#float#has_float()') ~= 0 then
    -- Switch to the float window
    vim.api.nvim_eval('coc#float#jump()')
    -- Bind keys for closing the focused float window
    local _opts = { buffer = true, silent = true }
    vim.keymap.set("n", "<ESC>", "<CMD>call coc#float#close_all()<CR>", _opts)
  end
end


return {
  'neoclide/coc.nvim',
  branch = 'release',
  init = function ()
    require("which-key").add({
      { "<leader>l", desc = "LSP" },
      { "<leader>g", desc = "Code jump" },
    })
  end,
  config = function()
    -- Extensions installed
    -- vim.g.coc_global_extensions = {
    --   'coc-marketplace',  -- Extensions market
    --   'coc-rust-analyzer',
    --   'coc-clangd',
    --   'coc-sumneko-lua',
    --   'coc-pyright',
    --   'coc-tsserver',
    --   'coc-phpls',
    --   'coc-diagnostic',
    --   'coc-prettier',
    --   'coc-snippets',
    --   'coc-pairs',  -- Auto pair
    -- }

    -- Use Tab for trigger completion with characters ahead and navigate
    local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
    vim.keymap.set('i', '<TAB>', "coc#pum#visible() ? coc#pum#next(1) : col('.') == 1 || getline('.')[col('.') - 2] =~# '\\s' ? \"\\<TAB>\" : coc#refresh()", opts)
    vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

    -- Make <CR> to accept selected completion item
    vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

    -- Formatting code
    -- TODO: vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument')
    vim.api.nvim_create_user_command("Prettier", "CocCommand prettier.forceFormatDocument", {nargs = 0})
    vim.keymap.set('x', '<leader>lf', '<Plug>(coc-format-selected)', { desc = "Format" })
    vim.keymap.set('n', '<leader>lf', '<Plug>(coc-format-selected)', { desc = "Format" })
    vim.keymap.set('n', '<leader>lff', '<Plug>(coc-format)', { desc = "Format file" })

    -- GoTo code navigation
    vim.keymap.set("n", "<leader>gd", "<Plug>(coc-definition)", { desc = "Definition" })
    vim.keymap.set("n", "<leader>gy", "<Plug>(coc-type-definition)", { desc = "Type definition" })
    vim.keymap.set("n", "<leader>gi", "<Plug>(coc-implementation)", { desc = "Implementation" })
    vim.keymap.set("n", "<leader>gr", "<Plug>(coc-references)", { desc = "References" })

    -- Show documentation in the float window
    vim.keymap.set("n", "<leader>lk", show_docs, { desc = "Show docs" })

    -- Focus the float window
    vim.keymap.set("n", "<C-w>f", focus_fw)

    -- Symbol renaming
    vim.keymap.set("n", "<leader>lr", "<Plug>(coc-rename)", { desc = "Rename" })

    -- Find symbol of current document
    vim.keymap.set("n", "<leader>lo", "<CMD>CocList outline<CR>", { desc = "Outline" })

    -- Diagnostic
    vim.keymap.set("n", "<leader>ld", "<CMD>CocDiagnostic<CR>", { desc = "Diagnostic" })
  end
}
