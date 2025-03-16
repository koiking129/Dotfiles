return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  init = function ()
    -- Always keep the sign column
    vim.o.signcolumn = "yes"
  end,
  config = function ()
    local gitsigns = require("gitsigns")

    require("gitsigns").setup({
      require("which-key").add({
        -- Prefix
        { "<leader>g", desc = "Git" },

        -- Navigation
        {mode = "n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, desc = "Next hunk" },
        {mode = "n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, desc = "Previous hunk" },

        -- Stage
        { mode = "n", "<leader>gs", gitsigns.stage_hunk, desc = "Stage hunk", icon = "󰕒" },
        { mode = "n", "<leader>gr", gitsigns.reset_hunk, desc = "Reset hunk", icon = "󰕌" },
        { mode = "v", "<leader>gs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, desc = "Stage hunk", icon = "󰕒" },
        { mode = "v", "<leader>gr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, desc = "Reset hunk", icon = "󰕌" },
        { mode = "n", "<leader>gS", gitsigns.stage_buffer, desc = "Stage buffer", icon = "󰩍" },
        { mode = "n", "<leader>gR", gitsigns.reset_buffer, desc = "Reset buffer", icon = "󰣜" },

        -- Diff
        { mode = "n", "<leader>gd", desc = "Diff", icon = "" }, -- Prefix
        { mode = "n", "<leader>gdh", gitsigns.preview_hunk, desc = "Diff hunk in window" },
        { mode = "n", "<leader>gdH", gitsigns.preview_hunk_inline, desc = "Diff hunk inline" },
        { mode = "n", "<leader>gdb", gitsigns.diffthis, desc = "Diff buffer", icon = "" },
        { mode = "n", "<leader>gdB", function() gitsigns.diffthis("~") end, desc = "Diff buffer", icon = "" },
        { mode = "n", "<leader>gdd", gitsigns.toggle_deleted, desc = "Toggle deleted" },
        { mode = "n", "<leader>gdw", gitsigns.toggle_word_diff, desc = "Toggle word diff" },

        -- List
        { mode = "n", "<leader>gq", gitsigns.setqflist, desc = "Buffer hunks", icon = "" },
        { mode = "n", "<leader>gQ", function() gitsigns.setqflist("all") end, desc = "Workspace hunks", icon = "" },

        -- Blame
        { mode = "n", "<leader>gb", function() gitsigns.blame_line({ full = true }) end, desc = "Blame line", icon = "" },
        { mode = "n", "<leader>gB", gitsigns.toggle_current_line_blame, desc = "Toggle inline blame" },

        -- Text object
        { mode = { "o", "x" }, "ih", gitsigns.select_hunk },
      })
    })
  end,
}
