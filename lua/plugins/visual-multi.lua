return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    vim.g.VM_silent_exit = 1
    vim.g.VM_set_statusline = 1
    vim.g.VM_show_warnings = 1
    vim.g.VM_quit_after_leaving_insert_mode = 0

    vim.g.VM_default_mappings = 1 --
    vim.g.VM_maps = {
      ["Find Under"] = "<M-n>",
      ["Find Subword Under"] = "<M-n>",
      ["Skip Region"] = "o",
      ["Find next"] = "n",
      ["Find Prev"] = "N",
      ["Reselect Last"] = "<M-v>",
      ["Add Cursor Down"] = "<M-j>",
      ["Add Cursor Up"] = "<M-k>",
      ["Select h"] = "<M-h>",
      ["Select l"] = "<M-l>",
      ["Undo"] = "u",
      ["Redo"] = "U",
      ["Select All"] = "<M-a>",
      ["Quit"] = "<Esc>",
    }
  end,
}
