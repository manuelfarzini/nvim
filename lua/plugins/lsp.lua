return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },

  config = function()
    --+ Autocompletion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if ok then capabilities = cmp_lsp.default_capabilities(capabilities) end

    --+ Attach Function
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("PersLspConfig", {}),
      callback = function(ev)
        -- Disable semantic tokens
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local disabled = {
          ["zls"] = true,
        }
        if disabled[client.name] then client.server_capabilities.semanticTokensProvider = nil end

        --+ Diagnostics format
        vim.diagnostic.config({
          float = {
            border = "rounded",
            source = true,
            header = "",
            max_width = 100,
            wrap = true,
            severity_sort = true,
            format = function(diagnostic)
              local code = diagnostic.code or ""
              diagnostic.code = nil
              return string.format("%s [%s]\n", diagnostic.message, code)
            end,
          },
        })

        --+ Keymaps
        -- TODO: see init.lua/lua/theprimeagen/init.lua
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Restart LSP"
        vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gR", "<Cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<Cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "Previous diagnostic"
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)

        opts.desc = "Next diagnostic"
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)

        -- XXX: not often used because of trouble
        -- opts.desc = "Show buffer diaghostics"
        -- vim.keymap.set("n", "<leader>D", "<Cmd>Telescope diagnostics bufnr=0<CR>", opts)

        vim.keymap.set("n", "<leader>d", function()
          local _, winid = vim.diagnostic.open_float(0, { scope = "cursor", focusable = true })
          print("winid:", winid, "current:", vim.api.nvim_get_current_win())

          vim.schedule(function()
            print("after schedule, valid:", winid and vim.api.nvim_win_is_valid(winid))
            if winid and vim.api.nvim_win_is_valid(winid) then
              vim.api.nvim_set_current_win(winid)
              print("new current:", vim.api.nvim_get_current_win())
            end
          end)
        end)
      end,
    })

    --+ signs
    local signs = { Error = "✕", Warn = "!", Hint = "?", Info = "i" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    --+ global
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    --+ mojo-lsp
    vim.lsp.config("mojo", {
      cmd = { "mojo-lsp-server", "-I", "." }, -- enough with pixi shell
      root_markers = { "pixi.toml", ".git" }, -- pixi
      filetypes = { "mojo" },
    })

    --+ rust analyzer
    -- vim.lsp.config("rust_analyzer", {
    --   filetypes = { "rust" },
    --   settings = {
    --     ["rust-analyzer"] = {
    --       checkOnSave = true,
    --       check = {
    --         command = "check",
    --       },
    --       cargo = {
    --         allFeatures = true,
    --       },
    --     },
    --   },
    -- })

    --+ faust-lsp
    vim.lsp.config("faustlsp", {
      cmd = { "faustlsp" },
      filetypes = { "faust" },
      workspace_required = true,
      root_markers = { ".faustcfg.json" },
      -- root_dir = function(fname)
      --   local util = require("lspconfig.util")
      --   return util.root_pattern(".git")(fname) or vim.fn.getcwd()
      -- end,
    })

    --+ clangd
    vim.lsp.config("clangd", {
      cmd = {
        "clangd",
        "-j=12",
        "--pretty",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--pch-storage=memory",
      },
      filetypes = { "c", "cpp", "objc", "objcpp" },
      root_markers = { ".clangd", ".clang-format", "compile_commands.json", ".git" },
      init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/inlayHint") then vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end
      end,
    })

    --+ luals
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          completion = { callSnippet = "Replace" },
        },
      },
    })

    -- --+ ltex
    -- vim.lsp.config("ltex", {
    --   filetypes = { "markdown", "tex", "text" },
    --   settings = {
    --     ltex = {
    --       language = "en-US",
    --       checkFrequency = "manual",
    --       enabledRules = {},
    --       disabledRules = { "SPELLING" },
    --     },
    --   },
    -- })

    --+ pyright
    vim.lsp.config("pyright", {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
          },
        },
      },
    })

    --+ zls
    vim.lsp.config("zls", {
      settings = {
        zsl = {
          warn_style = true,
          enable_snippets = true,
          enable_inlay_hints = true,
        },
      },
    })

    --+ jdtls
    vim.lsp.config("jdtls", {
      filetypes = { "java" },
      handlers = {
        ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
          if not result then return end
          result.diagnostics = vim.tbl_filter(
            function(d)
              return not d.message:match("TODO") and not d.message:match("FIXME") and not d.message:match("XXX")
            end,
            result.diagnostics
          )
          return vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx, config)
        end,
      },
    })

    --+ go
    vim.lsp.config("gopls", {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
    })

    --+ bashls
    vim.lsp.config("bashls", {
      filetypes = { "sh" },
    })

    --+ matlab
    vim.lsp.config("matlab_ls", {
      filetypes = { "m", "matlab" },
      root_dir = function() return vim.fn.getcwd() end,
    })

    vim.lsp.config("emmet_ls", {
      -- stylua: ignore start
      filetypes = {
        "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte",
      },
      -- stylua: ignore end
    })

    --+ php
    vim.lsp.config("intelephense", {
      settings = {
        intelephense = {
          -- stylua: ignore start
          stubs = {
            "bcmath", "bz2", "calendar", "Core", "ctype", "curl", "date", "dom", "fileinfo",
            "filter", "gd", "gettext", "hash", "iconv", "json", "libxml", "mbstring", "mysqli",
            "pcre", "PDO", "pdo_mysql", "Phar", "readline", "Reflection", "session",
            "SimpleXML", "soap", "sockets", "SPL", "standard", "tokenizer", "xml", "xmlreader",
            "xmlwriter", "zip", "zlib",
          },
          -- stylua: ignore end
          diagnostics = { enable = true },
          completion = {
            fullyQualifyGlobalConstantsAndFunctions = true,
            triggerParameterHints = true,
          },
          files = { maxSize = 5000000 },
        },
      },
    })

    --+ enable
    -- stylua: ignore start
    vim.lsp.enable({ "clangd", "ols", "lua_ls", "faustlps", "mojo"
      -- "clangd", "lua_ls", "ols", "zls", "pyright", "jdtls", "gopls", "bashls", "matlab_ls",
      -- "emmet_ls", "intelephense", "faustlsp", "mojo"
    })
    --stylua :ignore end
  end,
}
