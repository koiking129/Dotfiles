local M = {}


M.config = function ()
  require('competitest').setup({
    -- Template file
    template_file = "$(HOME)/cp/.template.$(FEXT)",
    evaluate_template_modifiers = true,

    -- Generate debug information
    compile_command = {
      c   = { exec = "gcc", args = { "-g", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
      cpp = { exec = "g++", args = { "-g", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
    },
  })

end


return M

