return {
  "roobert/surround-ui.nvim",
  dependencies = {
    "kylechui/nvim-surround",
    "folke/which-key.nvim",
  },
  init = function ()
    require("which-key").add({ "<leader>S", group = "Surround UI" })
  end,
  -- Triggered by <leader>S
  keys = { "<leader>S" },
  opts = { root_key = "S" },
}
