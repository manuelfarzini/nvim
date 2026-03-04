---@diagnostic disable: undefined-global
return {
  "nvim-tree/nvim-tree.lua",

  config = function()
    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      api.config.mappings.default_on_attach(bufnr)

      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      --
      vim.keymap.del("n", "<C-]>", { buffer = bufnr })
      vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
      vim.keymap.set("n", "<C-[>", api.tree.change_root_to_parent, opts("Up"))
      --
      -- NOTE: this line prevents <Esc> changing the root to parent
      vim.keymap.set("n", "<Esc>", "<Esc>", { buffer = bufnr, nowait = true })
      --
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Up"))
      vim.keymap.set("n", "l", api.node.open.edit, opts("Up"))
    end

    local nvimtree = require("nvim-tree")

    nvimtree.setup({
      disable_netrw = false,
      hijack_netrw = true,
      on_attach = my_on_attach,
      update_focused_file = {
        enable = true,
      },
      update_cwd = true,
      hijack_directories = {
        enable = true,
        auto_open = true,
      },

      view = {
        width = 30,
        relativenumber = false,
      },

      renderer = {
        add_trailing = true,
        indent_width = 2,
        full_name = true,
        symlink_destination = false,
        root_folder_label = function()
          return "../"
        end,
        indent_markers = {
          enable = true,
          icons = {
            item = "├",
          },
        },
        icons = {
          show = {
            file = false,
            folder = false,
            git = true,
          },
          git_placement = "after",
          glyphs = {
            folder = {
              arrow_closed = "\u{2013}", -- closed folder
              arrow_open = "\u{00B7}", -- opened folder
            },
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "",
              untracked = "",
              deleted = "",
              ignored = "",
              -- unstaged = "",
              -- staged = "",
              -- unmerged = "",
              -- renamed = "",
              -- untracked = "?",
              -- deleted = "",
              -- ignored = "◌",
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
          quit_on_open = false,
        },
        file_popup = {
          open_win_config = {
            col = 1,
            row = 1,
            relative = "cursor",
            border = "single",
            style = "minimal",
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
        exclude = {},
      },
      git = {
        ignore = false,
      },
    })

    vim.keymap.set("n", "<leader>ee", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle file exp" }) -- toggle file explorer
    vim.keymap.set("n", "<leader>ec", "<Cmd>NvimTreeCollapse<CR>", { desc = "Collapse file exp" }) -- collapse file explorer
  end,
}
