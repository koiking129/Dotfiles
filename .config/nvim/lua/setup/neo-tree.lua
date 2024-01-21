local M = {}


M.config = function ()
  vim.keymap.set("n", "<leader>t", ":Neotree toggle <CR>")

  require("neo-tree").setup({
    filesystem = {
      hijack_netrw_behavior = "open_current",
      window = {
        width = 30,
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["H"] = "navigate_up",
          ["L"] = "set_root",
          ["<bs>"] = "toggle_hidden",
        }
      }
    }
  })
end


return M
