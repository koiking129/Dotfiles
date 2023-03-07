local M = {}


M.config = function ()
  vim.keymap.set('n', '<c-a>', ':Ag<cr>')
  vim.keymap.set('n', '<c-p>', ':Files<cr>')
  vim.keymap.set('n', '<c-g>', ':GFiles?<cr>')
end


return M

