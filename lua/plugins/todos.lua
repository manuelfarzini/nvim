local todo_comments = require("todo-comments")

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

vim.keymap.set("n", "]t", function() todo_comments.jump_next() end, { desc = "Next todo" })
vim.keymap.set("n", "[t", function() todo_comments.jump_prev() end, { desc = "Prev todo" })
