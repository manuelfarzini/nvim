-- stylua: ignore start

-- Autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then capabilities = cmp_lsp.default_capabilities(capabilities) end

-- Attach Function
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("PersLspConfig", {}),
  callback = function(ev)
    -- Disable semantic tokens
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local disabled = {
      ["mojo"] = true,
    }
    if disabled[client.name] then client.server_capabilities.semanticTokensProvider = nil end

    -- Keymaps
    local opts = function(desc) return { buffer = ev.buf, silent = true, desc = desc } end
    vim.keymap.set("n", "<leader>lr", "<Cmd>lsp restart<CR>", opts("Lsp restart"))
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Goto definition") )
    vim.keymap.set("n", "gD", "<Cmd>Telescope lsp_definitions<CR>", opts("Telescope lsp definitions"))
    vim.keymap.set("n", "gR", "<Cmd>Telescope lsp_references<CR>", opts("Telescope lsp references"))
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts("Open diagnostic"))
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts("Prev diagnostic"))
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts("Next diagnostic"))
  end,
})

-- global
vim.lsp.config("*", {
  capabilities = capabilities,
})

-- mojo-lsp
vim.lsp.config("mojo", {
  cmd = { "mojo-lsp-server", "-I", "." }, -- enough with pixi shell
  filetypes = { "mojo" },
  root_markers = { "pixi.toml", ".git" },
})

-- rust analyzer
vim.lsp.config("rust_analyzer", {
  filetypes = { "rust" },
  settings = {
    ["rust_analyzer"] = {
      checkOnSave = true,
      check = {
        command = "check",
      },
      cargo = {
        allFeatures = true,
      },
    },
  },
})

-- faust-lsp
vim.lsp.config("faustlsp", {
  cmd = { "faustlsp" },
  filetypes = { "faust" },
  workspace_required = true,
  root_markers = { ".faustcfg.json" },
})

-- clangd
vim.lsp.config("clangd", {
  cmd = {
    "/opt/homebrew/opt/llvm/bin/clangd",
    "--background-index",
    "-j=12",
    "--pretty",
    "--query-driver=/opt/homebrew/opt/llvm/bin/clang++", -- /usr/bin/clang++"
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--pch-storage=memory",
    "--compile-commands-dir=build",
  },
  root_markers = { ".clangd", ".git" },
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
  },
})

-- luals
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

-- pyright
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

-- zls
vim.lsp.config("zls", {
  settings = {
    zsl = {
      warn_style = true,
      enable_snippets = true,
      enable_inlay_hints = true,
    },
  },
})

-- jdtls
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

-- go
vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
})

-- bashls
vim.lsp.config("bashls", {
  filetypes = { "sh" },
})

-- matlab
vim.lsp.config("matlab_ls", {
  filetypes = { "matlab" },
  root_dir = function() return vim.fn.getcwd() end,
})

vim.lsp.config("emmet_ls", {
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" }
})

-- php
vim.lsp.config("intelephense", {
  settings = {
    intelephense = {
      stubs = {
        "bcmath", "bz2", "calendar", "Core", "ctype", "curl", "date", "dom", "fileinfo", "filter", "gd", "gettext", "zip",
        "hash", "iconv", "json", "libxml", "mbstring", "mysqli", "pcre", "PDO", "pdo_mysql", "Phar", "readline", "xmlwriter",
        "Reflection", "session", "SimpleXML", "soap", "sockets", "SPL", "standard", "tokenizer", "xml", "xmlreader", "zlib",
      },
      diagnostics = { enable = true },
      completion = {
        fullyQualifyGlobalConstantsAndFunctions = true,
        triggerParameterHints = true,
      },
      files = { maxSize = 5000000 },
    },
  },
})

vim.lsp.enable({ "clangd", "ols", "lua_ls", "faustlsp", "mojo", "rust_analyzer", "jdtls" })
-- "zls", "pyright", "gopls", "bashls", "matlab_ls",
-- "emmet_ls", "intelephense",

-- stylua: ignore end
