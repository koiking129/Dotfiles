-- Generate the binary file
local compile = function ()
  if vim.fn.findfile('Cargo.toml') ~= "" then
    -- Rust project
    vim.cmd("!cargo build")
  else
    -- Single file
    local source_ftime = vim.fn.getftime(vim.fn.expand('%'))
    local bin_ftime = vim.fn.getftime(vim.fn.expand('%:r'))
    -- Do compile only if the source file was changed after the binary file
    if source_ftime > bin_ftime then
      vim.cmd("!g++ -g -o '%:r' '%'")
    end
  end
end


-- Start (Restart) debugging
local dap_run = function ()
  local dap = require("dap")

  -- Stop the current session if exists
  if dap.session() then
    vim.cmd('DapTerminate')
    vim.cmd('sleep 100ms')  -- OPTIM:
  end

  compile()

  -- Change directory for competitive programming
  local cp_home = vim.fn.expand("~/cp")
  local wd = vim.fn.getcwd()
  if wd == cp_home then
    vim.cmd("cd %:h")
  end

  -- Start debugging
  vim.cmd("DapContinue")

  -- Restore the working directory
  if string.find(vim.fn.getcwd(), cp_home) then
    vim.cmd("cd " .. wd)
  end
end


return {
  "mfussenegger/nvim-dap",
  dependencies = "rcarriga/nvim-dap-ui",  -- To open dap-ui automatically
  keys = {
    {"<leader>dr", dap_run},
    {"<leader>db", ":DapToggleBreakpoint <CR>"},
    {"<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Conditional breakpoint: ')) end},
  },
  config = function ()
    local dap = require("dap")

    -- Use vscode-cpptools
    local debugger_bin = '/opt/cpptools/current/extension/debugAdapters/bin/OpenDebugAD7'

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
          local project_name = string.match(vim.fn.getcwd(), "%w+$")
          if vim.fn.findfile('Cargo.toml') ~= "" then
            -- The rust project
            return vim.fn.getcwd() .. "/target/debug/" .. project_name
          else
            -- Single file
            return vim.fn.expand('%:r')
          end
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        setupCommands = {
          {  -- Show the contents of STL containers
             text = '-enable-pretty-printing',
             description =  'enable pretty printing',
             ignoreFailures = false
          },
        },
      },
    }
    dap.configurations.rust = dap.configurations.cpp

    vim.keymap.set("n", "<leader>dc", ":DapContinue <CR>")
    vim.keymap.set("n", "<leader>dC", dap.run_to_cursor)
    vim.keymap.set("n", "<leader>dn", ":DapStepOver <CR>")
    vim.keymap.set("n", "<leader>di", ":DapStepInto <CR>")
    vim.keymap.set("n", "<leader>do", ":DapStepOut <CR>")
    vim.keymap.set("n", "<leader>dt", ":DapTerminate <CR>")
  end
}
