local M = {}


M.config = function ()
  local wilder = require('wilder')

  wilder.setup({
    modes = {':', '/', '?'},
  })

  wilder.set_option('pipeline', {
    wilder.branch(
      -- Show the history when there is no input
      {
        wilder.check(function (_, x) return vim.fn.empty(x) end),
        wilder.history()
      },

      -- Fuzzy for cmdline
      wilder.cmdline_pipeline({
        fuzzy = 1,
      }),

      -- Searching
      wilder.search_pipeline()
    )
  })

  -- Drawing style
  wilder.set_option('renderer', wilder.wildmenu_renderer({
    highlights = {
      accent = "WilderAccent",
      selected_accent = "WilderSelectedAccent",
    },
    highlighter = wilder.basic_highlighter(),
    right = {' ', wilder.wildmenu_index()}
  }))

  -- Highlight scheme
  vim.api.nvim_set_hl(0, 'WilderAccent', { fg = '#5F87FF' })
  vim.api.nvim_set_hl(0, 'WilderSelectedAccent', { fg = '#5F87FF', bg= '#2D3F76' })
end


return M

