local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = vim.tbl_extend("force", require("telescope.themes").get_dropdown(), {
    prompt_prefix = "",
    path_display = { "smart" },
    disable_devicons = true,
    layout_config = { center = { width = 0.8, anchor = "N", }, },
    file_ignore_patterns = {
      "node_modules", "%.git", "%.DS_Store", "undodir", "zzz", "build", "media", "doxygen", "swapdir",
      "CMakeLists%.txt", "gradle", "%.cache", "%.zip", "%.class", "venv", "Doxyfile", "extern", "pixi"
    },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<M-k>"] = actions.preview_scrolling_up,
        ["<M-j>"] = actions.preview_scrolling_down,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      },
      n = { ["dd"] = actions.delete_buffer },
    },
  }),
  pickers = {
    live_grep = { hidden = true, additional_args = { "--hidden" }, },
    find_files = { hidden = true, follow = true, },
    buffers = {
      initial_mode = "normal",
      ignore_current_buffer = true,
      sort_mru = true,
    },
  },
})

vim.keymap.set("n", "<leader>fs", function()
  require("telescope.builtin").live_grep({ grep_open_files = true })
end, { desc = "Find string in open files" })
vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Find files in cwd" })
vim.keymap.set("n", "<leader>fr", "<Cmd>Telescope oldfiles<CR>", { desc = "Find recent files" })
vim.keymap.set("n", "<leader>fu", "<Cmd>Telescope grep_string<CR>", { desc = "Find under" })
vim.keymap.set("n", "<leader>fo", "<Cmd>Telescope buffers<CR>", { desc = "Find open buffers" })
vim.keymap.set("n", "<leader>ft", "<Cmd>TodoTelescope<CR>", { desc = "Find todos" })
vim.keymap.set("n", "<leader>fS", "<Cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
