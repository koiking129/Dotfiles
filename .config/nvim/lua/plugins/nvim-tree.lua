-- Show nvim-tree when opening a directory
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup#open-for-directories-and-change-neovims-directory
local open_nvim_tree = function (data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end


return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  keys = { { '<leader>t', ':NvimTreeToggle<cr>' } },
  opts = {
    -- Keep using netrw without its browser features
    -- To bring back the shortcut `gx` provided by Netrw
    disable_netrw = false,
    hijack_netrw  = true,
  },
  config = function (_, opts)
    require("nvim-tree").setup(opts)
    -- Show nvim-tree when opening a directory
    vim.api.nvim_create_autocmd({"VimEnter"}, {callback = open_nvim_tree})
  end,
  enabled = false,
}
