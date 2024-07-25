return {
  "monaqa/dial.nvim",
  keys = {
    { mode = "n", "<C-a>",  function() require("dial.map").manipulate("increment", "normal") end, },
    { mode = "n", "<C-x>",  function() require("dial.map").manipulate("decrement", "normal") end, },
    { mode = "n", "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end, },
    { mode = "n", "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end, },
    { mode = "v", "<C-a>",  function() require("dial.map").manipulate("increment", "visual") end, },
    { mode = "v", "<C-x>",  function() require("dial.map").manipulate("decrement", "visual") end, },
    { mode = "v", "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, },
    { mode = "v", "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, },
  },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal_int, -- decimal number (-2, -1, 0, 1, 2, ...)
        augend.constant.alias.bool,       -- Toggle boolean value (true <-> false)
        augend.constant.new{
          elements = {"True", "False"},
          word = true,
          cyclic = true,
        },
        augend.constant.new{
          elements = {"yes", "no"}, -- yes <-> no
          word = true,
          cyclic = true,
        },
      },
    })
  end,
}
