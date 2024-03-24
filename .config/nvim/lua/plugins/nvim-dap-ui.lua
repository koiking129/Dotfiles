return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  keys = { { "<leader>du", function() require('dapui').toggle({ reset = true }) end } },
  opts = {
    -- Layouts
    layouts = {
      {
        elements = {
          { id = "scopes",      size = 0.6 },
          { id = "watches",     size = 0.2 },
          { id = "breakpoints", size = 0.2 },
        },
        size = 30, -- columns
        position = "left",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 0.25, -- percentage of total lines
        position = "bottom",
      },
    },
  },
  config = function(_, opts)
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup(opts)

    -- Debugger starts
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({ reset = true }) -- Reset the layouts when opening the dap-ui
    end

    -- :DapTerminate
    dap.listeners.before.disconnect["dapui_config"] = function()
      dapui.close()
    end

    -- Execution ends normally
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
