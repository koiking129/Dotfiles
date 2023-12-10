local M = {}


M.config = function ()
  require('im_select').setup({
    default_im_select  = "keyboard-us",
    default_command = 'fcitx5-remote',

    set_default_events = { "VimEnter", ModeChanged = { "[iRc]*:[nvV\x16sS]*" } },
    save_state_events = { ModeChanged = { "[iR]*:[nvV\x16sS]*" } },
    set_previous_events = { ModeChanged = { "[nvV\x16sS]*:[iR]" } },
    -- \x16 is the unicode of Ctrl-V

    keep_quiet_on_no_binary = true
  })
end


return M

