local M = {}


M.config = function ()
  require('im_select').setup({
    default_im_select  = "keyboard-us",
    default_command = 'fcitx5-remote',



    -- Restore the default input method state when the following events are triggered
    set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },

    -- Restore the previous used input method state when the following events are triggered
    -- if you don't want to restore previous used im in Insert mode,
    -- e.g. deprecated `disable_auto_restore = 1`, just let it empty `set_previous_events = {}`
    set_previous_events = { "InsertEnter" },

    -- Show notification about how to install executable binary when binary is missing
    keep_quiet_on_no_binary = true
  })
end


return M

