local function default_keymaps(x)  -- x: the key used for surround
  x = x or "s"  -- default to the "s"
  local X = string.upper(x)
  return {
    insert = "<C-g>" .. x,
    insert_line = "<C-g>" .. X,
    normal = "y" .. x,
    normal_cur = "y" .. x .. x,
    normal_line = "y" .. X,
    normal_cur_line = "y" .. X ..X,
    visual = X,
    visual_line = "g" .. X,
    delete = "d" .. x,
    change = "c" .. x,
    change_line = "c" .. X,
  }
end

local function prefix_keymaps()  -- https://github.com/ggandor/leap.nvim/discussions/59
  return {
    insert = "<C-g>s",
    insert_line = "<C-g>S",
    normal = "gs",
    normal_cur = "gss",
    normal_line = "gS",
    normal_cur_line = "gSS",
    visual = "gs",
    visual_line = "gS",
    delete = "gsd",
    change = "gsr",
    change_line = "gSr",
  }
end

return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  opts = {
    keymaps = prefix_keymaps(),
  },
}
