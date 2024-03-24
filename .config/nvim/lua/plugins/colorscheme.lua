_G.theme = "tokyonight"

local function set_colorscheme(LazyPlugin)
  local theme = _G.theme
  local name = string.match(LazyPlugin.name, "([^.]+).?.*")
  if theme == name then
    vim.cmd("colorscheme " .. theme)
  end
end

return {
  {
    'dracula/vim',
    name = "dracula", -- Clarify the plugin name
    lazy = false,
    priority = 1000,  -- Load colorscheme first
    config = set_colorscheme,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = set_colorscheme,
  },
}
