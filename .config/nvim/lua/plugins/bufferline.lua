return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      offsets = {
        {
          -- filetype = "NvimTree",
          filetype = "neo-tree", -- The filetype of neo-tree buffer
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)

    vim.keymap.set("n", "<leader>b", "<CMD>BufferLinePick<CR>")
  end
}
