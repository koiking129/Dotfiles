local M = {}


M.config = function ()
  require('lualine').setup({
    options = {
      theme = 'dracula'
    }
  })
end


return M

