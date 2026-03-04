return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    vim.keymap.set("n", "]t", function() todo_comments.jump_next() end, { desc = "Next todo" })
    vim.keymap.set("n", "[t", function() todo_comments.jump_prev() end, { desc = "Prev todo" })

    todo_comments.setup({
      signs = false,
      todo_comments.setup({
        signs = false,
        highlight = {
          comments_only = true,
          after = "fg",
        },
        search = {
          pattern = [[\b(KEYWORDS)\b]],
        },
      })
    })
  end,
}
