return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'c',
      'cpp',
      'rust',
      'cmake',
      'lua',
      'php',
      'python',
      'gdscript', -- 'godot_resource', 'gdshader',
      'bash',
      'powershell',
      'vim',
      'vimdoc',
      'html',
      'css',
      'javascript',
      'json',
      'json5',
      'jsonc',
      'hjson',
      'xml',
      'yaml',
      'toml',
      'ron',
      'markdown',
      'markdown_inline',
      'sxhkdrc',
      'zathurarc',
      'beancount',
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
  config = function (_, opts)
    require('nvim-treesitter.configs').setup(opts)

    -- Use bash parser for zsh
    vim.treesitter.language.register("bash", "zsh")
  end
}
