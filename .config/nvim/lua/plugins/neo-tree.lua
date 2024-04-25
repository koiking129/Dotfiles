return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  init = function ()
    -- Lazy load neo-tree while keeping it hijack the netrw
    vim.api.nvim_create_autocmd({"VimEnter"}, {callback = function (args)
      -- If the buffer is a directory
      if vim.fn.isdirectory(args.file) == 1 then
        require("neo-tree") -- Load neo-tree
      end
    end})
  end,
  keys = {
    { "<leader>t", "<CMD>Neotree position=left toggle<CR>", desc = "Neotree" },
    { "<A-[>", "<CMD>wincmd w<CR>", ft = "neo-tree"},
    { "<A-]>", "<CMD>wincmd w<CR>", ft = "neo-tree"},
  },
  cmd = "Neotree",
  opts = {
    close_if_last_window = true,
    window = {
      width = 30,
      mappings = {
        ["<TAB>"] = "focus_preview",
        ["l"] = "open",
        ["h"] = "close_node",
        ["H"] = "navigate_up",
        ["L"] = "set_root",
        ["<bs>"] = "toggle_hidden",
      },
    },
    -- For the source of filesystem
    filesystem = {
      hijack_netrw_behavior = "open_current",
      -- Use the OS level file watchers to detect changes
      use_libuv_file_watcher = true,
      -- Focus the entry of the current file in neo-tree
      follow_current_file = { enabled = true },
    },
  },
  config = function (_, opts)
    require("neo-tree").setup(opts)

    -- Override the command `:bd`
    -- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/FAQ
    vim.api.nvim_create_user_command("Bd", "bp | bd #", {})
    vim.cmd("cabbrev bd Bd")

    -- Return to the neo-tree window from the preview window
    vim.keymap.set("n", "<TAB>", function ()
      if vim.w.neo_tree_preview ~= nil then
        vim.cmd("Neotree reveal")
      end
    end)
  end
}
