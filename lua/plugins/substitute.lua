return {
  -- TODO: this guy has more potential
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local subs = require("substitute")
    subs.setup()

    ----------- Substitute using " ---------

    vim.keymap.set("n", "s", subs.operator, { desc = "Substitute" })
    vim.keymap.set("n", "ss", subs.line, { desc = "Substitute line" })
    vim.keymap.set("n", "S", subs.eol, { desc = "Substitute to end of line" })
    vim.keymap.set("v", "s", subs.visual, { desc = "Substitute" })

    ----------- Substitute using + ---------

    vim.keymap.set("n", "<leader>s", function()
      subs.operator({ register = "+" })
    end, { desc = "Substitute from +" })

    vim.keymap.set("n", "<leader>ss", function()
      subs.line({ register = "+" })
    end, { desc = "Substitute line from +" })

    vim.keymap.set("n", "<leader>S", function()
      subs.eol({ register = "+" })
    end, { desc = "Substitute to EOL from +" })

    vim.keymap.set("v", "<leader>s", function()
      subs.visual({ register = "+" })
    end, { desc = "Substitute from +" })
  --
  end,
}
