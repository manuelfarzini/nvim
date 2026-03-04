return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = { "windwp/nvim-ts-autotag" },

    config = function()

      -- mojo
      vim.filetype.add({
        extension = { mojo = "mojo", },
      })
      local function add_mojo_parser()
        require("nvim-treesitter.parsers").mojo = {
          install_info = {
            url = "https://github.com/lsh/tree-sitter-mojo",
            branch = "main",
          },
        }
      end
      add_mojo_parser()
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = add_mojo_parser,
      })
      --

      local ts = require("nvim-treesitter")

      ts.setup({})

      ts.install({
        "c", "cpp", "faust", "lua", "mojo", "rust", "matlab", "go", "markdown", "markdown_inline", "zig",
        "vim", "python", "java", "yaml", "toml"
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "c", "cpp", "faust", "lua", "mojo", "rust", "matlab", "go", "markdown", "markdown_inline", "zig",
          "vim", "python", "java", "yaml", "toml"
        },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end,
  },

  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<M-space>",
          node_incremental = "<M-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },
}
