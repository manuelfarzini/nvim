return {
  "mbbill/undotree",
  config = function()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>ut",
      "<Cmd>UndotreeToggle<CR>",
      { noremap = true, silent = true, desc = "Undotree toggle" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>uf",
      "<Cmd>UndotreeFocus<CR>",
      { noremap = true, silent = true, desc = "Undotree focus" }
    )
  end,
}
