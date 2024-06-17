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

      -- Show the diagnostics info
      diagnostics = "coc",
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
              or (e == "warning" and " " or "")
          s = s .. n .. sym
        end
        return s
      end,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)

    vim.keymap.set("n", "<leader>b", "<CMD>BufferLinePick<CR>")
  end
}
