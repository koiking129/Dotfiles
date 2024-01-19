local M = {}


M.compile = function ()
  local source_ftime = vim.fn.getftime(vim.fn.expand('%'))
  local bin_ftime = vim.fn.getftime(vim.fn.expand('%:r'))

  -- Do compile only if the source file was changed after the binary file
  if (source_ftime > bin_ftime) then
    vim.cmd("!g++ -g -o %:r %")
  end
end

M.config = function ()
  local dap = require("dap")

  -- Use vscode-cpptools
  local debugger_bin = vim.fn.expand('$HOME/.config/nvim/cpptools/extension/debugAdapters/bin/OpenDebugAD7')

  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = debugger_bin,
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

  -- Change the directory -> Compile -> Start the debugger
  vim.keymap.set("n", "<leader>dr", [[:cd %:h <CR>
                                      :lua require('setup/nvim-dap').compile() <CR>
                                      :DapContinue <CR>]])
  vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint <CR>")
  vim.keymap.set("n", "<leader>dC", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) <CR>")
  vim.keymap.set("n", "<leader>dc", ":DapContinue <CR>")
  vim.keymap.set("n", "<leader>di", ":DapStepInto <CR>")
  vim.keymap.set("n", "<leader>do", ":DapStepOut <CR>")
  vim.keymap.set("n", "<leader>dn", ":DapStepOver <CR>")
  vim.keymap.set("n", "<leader>dt", ":DapTerminate <CR>")
end


return M

