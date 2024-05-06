-- Change mode from terminal to normal
local mode_t2n = function ()
  local keys = vim.api.nvim_replace_termcodes([[<C-\><C-n>]], true, false, true)
  vim.api.nvim_feedkeys(keys, "t", false)
end


-- vim.keymap.set('t', '<C-R>', insert_register, {noremap = true, expr = true})
local insert_register = function ()
  local reg = vim.fn.nr2char(vim.fn.getchar())
  local cmd = string.format([[<C-\><C-N>"%spi]], reg)
  vim.cmd(cmd)
end


-- Toggle the wintype of current floaterm between float and split
local toggle_float_split = function ()
  local wintype = vim.b.floaterm_wintype
  if wintype == 'float' then
    vim.cmd('FloatermUpdate --wintype=split --position=bottom --height=0.4')
  elseif wintype == 'split' then
    vim.cmd('FloatermUpdate --wintype=float --position=center --height=0.9 --width=0.9')
  end
end


-- Run the code in a split floaterm window
local code_runner = function ()
  -- Define commands to run the code
  local cmd = {
    sh = 'bash %',
    zsh = 'zsh %',
    lua = 'lua %',
    php = 'php %',
    python = 'python %',
    javascript = 'node %',
    rust = 'cargo run',
    cs = 'csc %; mono %:r.exe',
  }

  -- The filetype of the current buffer
  local ft = vim.api.nvim_eval("&ft")
  if cmd[ft] ~= nil then
    -- Run the command
    vim.cmd('FloatermNew --wintype=split --position=bottom --height=0.5 --autoclose=0 ' .. cmd[ft])
    -- Remove the line number
    vim.wo.number = false
    vim.wo.relativenumber = false
  else
    print('[Code Runner] Error: invalid filetype')
  end
end

return {
  "voldikss/vim-floaterm",
  dependencies = 'voldikss/fzf-floaterm',
  init = function ()
    require("which-key").add({ "<leader>q", group = "Terminal" })
  end,
  keys = {
    { "<leader>ql", desc = "List floaterm buffers" },
    { "<leader>qq", desc = "Float terminal" },
    { "<leader>qt", desc = "Bottom terminal" },
    { "<leader>qr", desc = "Run code" },
    { "<leader>qf", desc = "Ranger" },
    { "<leader>qg", desc = "Lazygit" },
    "<A-q>",
  },
  config = function ()
    -- The relative size of floaterm
    vim.g.floaterm_width = 0.9
    vim.g.floaterm_height = 0.9

    -- Open file in the current vim
    vim.g.floaterm_opener = 'edit'

    -- Always hide the previous floaterm (only one floaterm can be displayed)
    vim.g.floaterm_autohide = 2

    -- Unify the padding color of the border
    vim.cmd("hi FloatermBorder ctermfg=none ctermbg=none")

    -- Keymaps
    vim.keymap.set('n', '<leader>ql', '<CMD>Floaterms<CR>', {desc = 'List floaterm buffers'})
    vim.keymap.set('n', '<leader>qq', '<CMD>FloatermNew --name=FTERM<CR>', {desc = 'Float terminal'})
    vim.keymap.set('n', '<leader>qt', '<CMD>FloatermNew --wintype=split --position=bottom --height=0.4<CR><CMD>set nonu norun<CR>', {desc = 'Bottom terminal'})
    vim.keymap.set('n', '<leader>qr', code_runner, {desc = 'Run code'})
    vim.keymap.set('n', '<leader>qf', '<CMD>FloatermHide<CR><CMD>FloatermNew --name=RANGER --cwd=<buffer-root> --disposable ranger<CR>', {desc = 'Ranger'})
    vim.keymap.set('n', '<leader>qg', '<CMD>FloatermNew --name=LAZYGIT --disposable lazygit<CR>', {desc = 'Lazygit'})

    vim.keymap.set({'n', 't'}, '<A-q>', '<CMD>FloatermToggle<CR>')
    vim.keymap.set('t', '<A-ESC>', [[<C-\><C-n>]])  -- Go to the normal mode
    vim.cmd([[tnoremap <expr> <C-A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi']])  -- Insert register in the terminal mode
    vim.keymap.set('t', '<A-,>', '<CMD>FloatermPrev<CR>')  -- Floaterm buffer switching
    vim.keymap.set('t', '<A-.>', '<CMD>FloatermNext<CR>')
    vim.keymap.set('t', '<A-/>', toggle_float_split)

    -- Windows navigation in the terminal mode
    vim.keymap.set('t', '<A-h>', '<CMD>wincmd h<CR>')
    vim.keymap.set('t', '<A-j>', '<CMD>wincmd j<CR>')
    vim.keymap.set('t', '<A-k>', '<CMD>wincmd k<CR>')
    vim.keymap.set('t', '<A-l>', '<CMD>wincmd l<CR>')
  end,
}
