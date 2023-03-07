local M = {}


M.config = function ()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'c',
      'cpp',
      'cmake',
      'lua',
      'php',
      'python',
      'bash',
      'vim',
      'html',
      'css',
      'javascript',
      'json',
      'json5',
      'markdown',
      'markdown_inline',
    },
    highlight = {
      enable = true,
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    }
  })

  -- https://github.com/nvim-treesitter/nvim-treesitter/issues/655#issuecomment-1021160477
  local ft_to_lang = require('nvim-treesitter.parsers').ft_to_lang
  require('nvim-treesitter.parsers').ft_to_lang = function(ft)
    if ft == 'zsh' then
      return 'bash'
    end
    return ft_to_lang(ft)
  end
end


return M
