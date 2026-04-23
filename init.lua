require("vim._core.ui2").enable({
  -- XXX: tweak
  enable = true,
  msg = {
    target = "cmd",
    pager = { height = 0.5 },
    dialog = { height = 0.5 },
    cmd = { height = 0.5 },
    msg = { height = 0.5, timeout = 4500 },
  },
})
require("config")
require("symbols")
-- vim.hl.priorities.semantic_tokens = 97
