Theme = "tokyonight"  -- _G.Theme

local function set_colorscheme(name)
  if Theme == name then
    vim.cmd("colorscheme " .. Theme)
  end
end

return {
  {
    'dracula/vim',
    name = "dracula", -- Clarify the plugin name
    lazy = false,
    priority = 1000,  -- Load colorscheme first
    config = function ()
      set_colorscheme("dracula")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      set_colorscheme("tokyonight")
    end,
  },
}
