local M = {}


M.config = function ()
  vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git' --glob '!node_modules'"
  vim.keymap.set('n', '<leader>ff', ':Files <CR>')  -- runs $FZF_DEFAULT_COMMAND

  vim.keymap.set('n', '<leader>fa', ':Ag <CR>')
  vim.keymap.set('n', '<leader>fb', ":Buffers <CR>")

  vim.keymap.set('n', '<leader>fg', ':GFiles? <CR>')
end


return M

