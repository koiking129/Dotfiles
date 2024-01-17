local M = {}


M.config = function ()
  local dap = require("dap")

  -- via vscode-cpptools
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = vim.fn.expand('$HOME/.config/nvim/cpptools/extension/debugAdapters/bin/OpenDebugAD7'),
  }
  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "cppdbg",
      request = "launch",
      program = function ()  -- The Path to the binary file
        return vim.fn.expand('%:r')
      end,
      cwd = '${workspaceFolder}',
      setupCommands = {
        {  -- Show the contents of STL containers
           text = '-enable-pretty-printing',
           description =  'enable pretty printing',
           ignoreFailures = false
        },
      },
    },
  }
end


return M

