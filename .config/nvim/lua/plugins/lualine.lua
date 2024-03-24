return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require('lualine').setup({
      options = {
        theme = _G.theme, -- Load after the colorscheme
      },
    })
  end
}
