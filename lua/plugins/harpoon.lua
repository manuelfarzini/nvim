local harpoon = require("harpoon")

harpoon:setup({})

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add" })
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon 2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon 3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon 4" })
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon 5" })
vim.keymap.set("n", "<leader>ho", function() harpoon:list():prev() end, { desc = "Harpoon prev" })
vim.keymap.set("n", "<leader>hi", function() harpoon:list():next() end, { desc = "Harpoon next" })

vim.keymap.set( "n", "<leader>ht", function()
    harpoon.ui:toggle_quick_menu(harpoon:list(), {
      border = "rounded",
      title_pos = "center",
      title = " Harpoon ",
      ui_width_ratio = 0.30,
    })
  end, { desc = "Harpoon toggle quick menu" }
)
