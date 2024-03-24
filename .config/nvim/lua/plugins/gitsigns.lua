return {
  'lewis6991/gitsigns.nvim',
  event = "VeryLazy",
  init = function ()
    -- Always keep the sign column
    vim.o.signcolumn = "yes"
  end,
  config = true,
}
