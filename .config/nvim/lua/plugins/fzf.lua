return {
  'junegunn/fzf.vim', -- Provide preset commands (e.g. `:Files`)
  dependencies = 'junegunn/fzf',  -- The basic wrapper of fzf
  init = function()
    vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git' --glob '!node_modules'"
  end,
  keys = {
    { '<leader>ff', ':Files <CR>' }, -- runs $FZF_DEFAULT_COMMAND
    { '<leader>fa', ':Ag <CR>' },
    { '<leader>fb', ':Buffers <CR>' },
    { '<leader>fg', ':GFiles? <CR>' },
  },
}
