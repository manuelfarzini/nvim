-- lua/plugins/neocodeium.lua
return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()

    local neocodeium = require("neocodeium")
    neocodeium.setup({
      virtual_text = {
        enabled = false,
        max_lines = 1000,
        -- #1 conditional filetypes restriction
        -- filetypes = { },
      },
      -- #2 conditional global enable
      -- enabled = function()
      --   return vim.bo.filetype ~= "text"
      -- end,
    })

    --- Keymaps
    vim.keymap.set("i", "<S-Tab>", neocodeium.accept)
    vim.keymap.set("i", "<M-w>", neocodeium.accept_word)
    vim.keymap.set("i", "<M-z>", neocodeium.accept_line)
    vim.keymap.set("i", "<M-s>", function() neocodeium.cycle(-1) end, { silent = true })
    vim.keymap.set("i", "<M-g>", function() neocodeium.cycle(1) end, { silent = true })
  end,
}
