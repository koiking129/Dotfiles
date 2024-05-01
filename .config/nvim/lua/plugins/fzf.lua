return {
  'junegunn/fzf.vim', -- Provide preset commands (e.g. `:Files`)
  dependencies = 'junegunn/fzf',  -- The basic wrapper of fzf
  init = function()
    vim.env.FZF_DEFAULT_COMMAND = [[rg --files --hidden --glob "!.git" --glob "!node_modules"]]
    require("which-key").add({ "<leader>f", group = "fzf" })
  end,
  keys = {
    { '<leader>ff', '<CMD>Files<CR>',    desc = "Files" }, -- runs $FZF_DEFAULT_COMMAND
    { '<leader>fh', '<CMD>History<CR>',  desc = "History" },
    { '<leader>fa', '<CMD>Ag<CR>',       desc = "Text" },
    { '<leader>fl', '<CMD>Lines<CR>',    desc = "Lines" },
    { '<leader>fb', '<CMD>Buffers<CR>',  desc = "Buffers" },
    { '<leader>fg', '<CMD>GFiles?<CR>',  desc = "Git" },
    { '<leader>f:', '<CMD>History:<CR>', desc = "Command history" },
    { '<leader>fc', '<CMD>Commands<CR>', desc = "Commands" },
    { '<leader>fC', '<CMD>Colors<CR>',   desc = "Color schemes" },
    { '<leader>fm', '<CMD>Maps<CR>',     desc = "Normal mode mappings" },
  },
}
