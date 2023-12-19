local M = {}


M.config = function ()
  vim.keymap.set('n', '<Leader>ft', ':FloatermNew <CR>')
end


return M

