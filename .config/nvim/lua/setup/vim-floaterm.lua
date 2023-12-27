local M = {}


M.config = function ()
  -- Toggle the floaterm
  vim.keymap.set('n', '<a-q>', ':FloatermToggle <CR>')
  vim.keymap.set('t', '<a-q>', '<c-\\><c-n> :FloatermHide <CR>')

  -- The relative size of floaterm
  vim.g.floaterm_width = 0.8
  vim.g.floaterm_height = 0.8
end


return M

