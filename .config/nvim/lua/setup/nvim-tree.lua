local M = {}


M.config = function ()
  require("nvim-tree").setup({
    -- Keep using netrw without its browser features
    -- To bring back the shortcut `gx` provided by Netrw
    disable_netrw = false,
    hijack_netrw  = true,
  })

  -- keymaps
  vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<cr>')
end


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


vim.api.nvim_create_autocmd(
  { "VimEnter" },
  { callback = open_nvim_tree }
)


return M

