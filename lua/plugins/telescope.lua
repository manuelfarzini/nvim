local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
  defaults = vim.tbl_extend("force", require("telescope.themes").get_dropdown(), {
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    prompt_prefix = "",
    selection_caret = "→ ",
    path_display = { "smart" },

    preview = {
      treesitter = false,
    },

    color_devicons = false,
    scroll_strategy = "cycle",
    sorting_strategy = "ascending",
    layout_config = {
      center = {
        width = 0.8,
        height = 0.5,
        prompt_position = "top",
        mirror = true,
        anchor = "N",
        preview_cutoff = 25,
        scroll_speed = 1,
      },
    },

    file_ignore_patterns = {
      "node_modules/",
      "%.git/",
      "%.DS_Store",
      "undodir/",
      "zzz/",
      "lazy%-lock%.json",
      "build/",
      "CMakeLists%.txt",
      "media",
      "run%.sh",
      "gradle",
      "%.cache",
      "%.zip",
      "%.class",
      "venv",
      "doxygen",
      "Doxyfile",
      "swapdir",
      "extern",
    },

    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
        ["<C-h>"] = fb_actions.goto_home_dir,

        ["<M-k>"] = actions.preview_scrolling_up,
        ["<M-j>"] = actions.preview_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<Esc><Esc>"] = actions.close,
      },
    },
  }),

  pickers = {
    live_grep = {
      disable_devicons = true,
      color_devicons = false,
      hidden = true,
      additional_args = { "--hidden" },
    },

    find_files = {
      disable_devicons = false,
      hidden = true,
      follow = true,
    },

    oldfiles = {
      disable_devicons = false,
    },

    grep_string = {
      disable_devicons = false,
      color_devicons = false,
    },

    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
      mappings = {
        i = {
          ["<M-c>"] = actions.delete_buffer,
        },
      },
    },
  },

  extensions = {
    file_browser = {
      prompt_title = "File browser",
      disable_devicons = false,
      color_devicons = false,
      hidden = { file_browser = true, folder_browser = true },
    },
    zoxide = {
      prompt_title = "Z Paths",
      mappings = {
        default = {
          after_action = function(selection) print("Update to (" .. selection.z_score .. ") " .. selection.path) end,
        },
      },
    },
  },
})

telescope.load_extension("file_browser")
telescope.load_extension("zoxide")

local key = vim.keymap

key.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Find files in cwd" })
key.set("n", "<leader>fr", "<Cmd>Telescope oldfiles<CR>", { desc = "Find recent" })
key.set("n", "<leader>fs", "<Cmd>Telescope live_grep<CR>", { desc = "Find string" })
key.set("n", "<leader>fu", "<Cmd>Telescope grep_string<CR>", { desc = "Find under" })
key.set("n", "<leader>fo", "<Cmd>Telescope buffers<CR>", { desc = "Find open buffers" })
key.set("n", "<leader>ft", "<Cmd>TodoTelescope<CR>", { desc = "Find todos" })
key.set("n", "<leader>fb", "<Cmd>Telescope file_browser<CR>", { desc = "File browser" })
key.set("n", "<leader>fz", telescope.extensions.zoxide.list, { desc = "Zoxide Paths" })

vim.api.nvim_create_user_command(
  "GrepOpenFiles",
  function() require("telescope.builtin").live_grep({ grep_open_files = true }) end,
  { desc = "Find in opened files" }
)

key.set(
  "n",
  "<leader>fc",
  "<Cmd>lua require('telescope.builtin').live_grep({ search_dirs = { vim.fn.expand('%:p') } })<CR>",
  { desc = "Find string in current file" }
)
