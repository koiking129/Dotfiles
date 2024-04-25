return {
  'Wansmer/treesj',
  init = function ()
    require("which-key").add({ "<leader>n", group = "TreeSJ" })
  end,
  keys = {
    { '<space>nm', '<CMD>TSJToggle<CR>', desc = "Toggle node" },
    { '<space>ns', '<CMD>TSJSplit<CR>', desc = "Split node" },
    { '<space>nj', '<CMD>TSJJoin<CR>', desc = "Join node" },
  },
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = true,
}
