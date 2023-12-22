local M = {}


M.config = function ()
  vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle <CR>")
end


return M
