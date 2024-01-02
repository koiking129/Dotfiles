local M = {}


M.config = function ()
  require("dapui").setup({
    -- Layouts
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.8 },
          { id = "watches", size = 0.2 },
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
  })

  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint <CR>")
  vim.keymap.set("n", "<leader>dr", ":DapContinue <CR>")
end


return M

