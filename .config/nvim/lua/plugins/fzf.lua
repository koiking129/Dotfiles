return {
  'junegunn/fzf.vim', -- Provide preset commands (e.g. `:Files`)
  dependencies = 'junegunn/fzf',  -- The basic wrapper of fzf
  init = function()
    vim.env.FZF_DEFAULT_COMMAND = [[rg --files --hidden --glob "!.git" --glob "!node_modules"]]
    require("which-key").add({ "<leader>f", group = "fzf" })
  end,
  keys = {
    { '<leader>ff', '<CMD>Files<CR>',   desc = "Files" }, -- runs $FZF_DEFAULT_COMMAND
    { '<leader>fa', '<CMD>Ag<CR>',      desc = "Text" },
    { '<leader>fb', '<CMD>Buffers<CR>', desc = "Buffers" },
    { '<leader>fg', '<CMD>GFiles?<CR>', desc = "Git" },
  },
}
