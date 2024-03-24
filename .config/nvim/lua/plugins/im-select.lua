return {
  'Zhniing/im-select.nvim',
  branch = 'feat',
  event = "VeryLazy",
  opts = {
    default_im_select       = "keyboard-us",
    default_command         = 'fcitx5-remote',

    -- \x16 is the unicode of Ctrl-v
    set_default_events      = { ModeChanged = { "[iRc]*:[nvV\x16sS]*" }, "VimEnter" },
    save_state_events       = { ModeChanged = { "[iR]*:[nvV\x16sS]*" } },
    set_previous_events     = { ModeChanged = { "[nvV\x16sS]*:[iR]" } },

    keep_quiet_on_no_binary = true
  },
}
