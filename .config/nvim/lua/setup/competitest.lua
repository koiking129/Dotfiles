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

  vim.keymap.set("n", "<leader>cp", ":CompetiTest receive problem <CR>")
  vim.keymap.set("n", "<leader>cc", ":CompetiTest receive contest <CR>")
  vim.keymap.set("n", "<leader>cr", ":CompetiTest run <CR>")
  vim.keymap.set("n", "<leader>cui", ":CompetiTest show_ui <CR>")
end


return M

