local M = {}


M.config = function ()
  require('illuminate').configure({
    delay = 100,

    -- filetypes to not illuminate
    filetypes_denylist = { 'NvimTree' },

    -- The number of lines to identify the large file
    large_file_cutoff = 2000,

    -- Tweak for large files
    large_file_overrides = {
      providers = { 'regex' },  -- The most significant
      modes_allowlist = { 'n' },
    },
  })
end


return M
