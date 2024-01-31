local M = {}


M.config = function ()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'c',
      'cpp',
      'rust',
      'cmake',
      'lua',
      'php',
      'python',
      'bash',
      'vim',
      'vimdoc',
      'html',
      'css',
      'javascript',
      'json',
      'json5',
      'jsonc',
      'xml',
      'yaml',
      'toml',
      'ron',
      'markdown',
      'markdown_inline',
      'org',
      'sxhkdrc',
      'beancount',
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

  -- Zsh support
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
