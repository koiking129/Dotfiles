local M = {}


M.config = function ()
  -- The root directory where received problems are stored
  local cp_home = vim.fn.expand("$HOME/cp")

  require('competitest').setup({
    -- Template file
    template_file = "$(HOME)/cp/.template.$(FEXT)",
    evaluate_template_modifiers = true,

    -- Generate debug information
    compile_command = {
      c   = { exec = "gcc", args = { "-g", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
      cpp = { exec = "g++", args = { "-g", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
    },

    -- Directory structure of problems received
    received_problems_path = function(task, file_extension)
      local judge = string.match(task.group, '(.+)%s%-%s') or task.group

      if judge == "Codeforces" then
        local contest = string.match(task.url, '%d+')
        return string.format(
          "%s/%s/%s/%s/main.%s",
          cp_home,
          judge,
          contest,
          task.name,
          file_extension
        )
      elseif judge == "Luogu" then
        local name = string.match(task.name, '%g+')
        return string.format(
          "%s/%s/%s/main.%s",
          cp_home,
          judge,
          name,
          file_extension
        )
      end

      -- Fallback to the general case
      return "$(HOME)/cp/$(JUDGE)/$(CONTEST)/$(PROBLEM)/main.$(FEXT)"
    end,

    received_contests_directory = function (task, _)
      local judge = string.match(task.group, '(.+)%s%-%s') or task.group

      if judge == "Codeforces" then
        local contest = string.match(task.url, '%d+')
        return string.format("%s/%s/%s", cp_home, judge, contest)
      end

      -- Fallback to the general case
      return "$(HOME)/cp/$(JUDGE)/$(CONTEST)"
    end,

    received_contests_problems_path = function (task, file_extension)
      local judge = string.match(task.group, '(.+)%s%-%s') or task.group

      if judge == "Codeforces" then
        return string.format("%s/main.%s", task.name, file_extension)
      end

      -- Fallback to the general case
      return "$(PROBLEM)/main.$(FEXT)"
    end,

    -- Testcases of received problems
    testcases_input_file_format = "input$(TCNUM).txt",
    testcases_output_file_format = "output$(TCNUM).txt",
  })

  vim.keymap.set("n", "<leader>cp", ":CompetiTest receive problem <CR>")
  vim.keymap.set("n", "<leader>cc", ":CompetiTest receive contest <CR>")
  vim.keymap.set("n", "<leader>cr", ":CompetiTest run <CR>")
  vim.keymap.set("n", "<leader>cui", ":CompetiTest show_ui <CR>")
end


return M

