-- nvim/lua/theme/init.lua
local M = {}

function M.setup()
  -- define colors
  local colors = {

    --
    zfore    = "#000000",
    zback    = "#ffffff",
    fore     = "#1a1a13",
    back     = "#f3f3eb",
    line     = "#efefe5",
    sel_bg   = "#cedce5",
    vm_bg    = "#ceceb3",
    value1   = "#849200",
    value2   = "#cf8f0b",
    value3   = "#c68909",
    -- value3   = "#8d9a0c",
    type     = "#626246",
    keyword  = "#6b4a65",
    path     = "#c68909",
    -- preproc  = "#93a199",
    preproc  = "#aeaf9f",
    -- preproc  = "#c3c09a", -- old
    macro    = "#6d4a00",
    comment1 = "#a8977a",
    comment2 = "#a88c5b",
    note     = "#8d9a0c",
    error    = "#931514",
    warn     = "#c27070",
    param   = "#3b457b",
    -- warn     = "#8d9a0c",
    -- error    = "#464ea3",
    -- warn     = "#7ea8cf",
    -- param   = "#9c655b",
    --

    --
    green_value  = "#849200",
    orange_value = "#cf8f0b",
    red_path     = "#7d1211",
    orange_teles = "#b55e0b",
    orange_mason = "#ec9216",
    flash_match  = "#858566",
    flash_label  = "#3c067c",
    --

    --
    grey1 = "#5c5c42",
    grey2 = "#999971",
    grey3 = "#ceceb3",
    grey4 = "#dedecc",
    --
    green1 = "#406d17",
    green2 = "#778f27",
    green3 = "#a7b142",
    green4 = "#a8c939",
    --
    orange3 = "#ec9216",
    --

    -- red1 = "#7d1211",
    -- red2 = "#b71a19",
    -- magenta2 = "#ab2e65",
    -- orange1 = "#bf6610",
    -- orange2 = "#cc7a07",
    -- note = "#b4a38d",
    -- note = "#a8af92",
    -- note = "#c2b48e",
    -- grey4 = "#e4e4d5",
    -- purple1 = "#694c5f",
  }
  --

  -- define highlights
  local highlights = {

    --===-- editor

    -- core
    Background = { fg = colors.back },
    ColorColumn = { bg = colors.line },
    Conceal = { fg = colors.macro },
    CursorColumn = { bg = colors.line },
    CursorLine = { bg = colors.line },
    CursorLineNr = { fg = colors.value3 },
    Directory = { fg = colors.grey1, bold = true },
    EndOfBuffer = { fg = colors.back },
    LineNr = { fg = colors.grey1 },
    NonText = { fg = colors.value3 },
    Normal = { fg = colors.fore, bg = colors.back },
    SpecialKey = { fg = colors.value3 },
    Title = { fg = colors.grey1, bg = colors.back },
    Underlined = { fg = "NONE", underline = false },
    VertSplit = { fg = colors.grey3 },
    Whitespace = { fg = colors.back },
    WinSeparator = { fg = colors.grey3 },
    Link = { fg = colors.grey1, bg = colors.back },
    None = { fg = "NONE", bg = "NONE" },
    --

    -- search / select / visual-multi
    Visual = { bg = colors.fore, fg = colors.zback },
    IncSearch = { fg = colors.zback, bg = colors.fore },
    CurSearch = { fg = colors.zback, bg = colors.fore },
    Search = { fg = colors.zfore, bg = colors.sel_bg },
    VM_Mono = { fg = colors.zfore, bg = colors.sel_bg },
    VM_Cursor = { fg = colors.zfore, bg = colors.vm_bg },
    VM_Extend = { fg = colors.zfore, bg = colors.sel_bg },
    VM_Insert = { fg = colors.zfore, bg = colors.vm_bg },

    -- quickfix
    QuickFixLine = { fg = colors.orange_value, bg = colors.back },

    -- fold
    Folded = { fg = "NONE", bg = colors.back },

    -- status line
    StatusLine = { fg = colors.fore, bg = colors.back },
    StatusLineNC = { link = "StatusLine" },

    -- fluo
    Question = { fg = colors.fore },
    MoreMsg = { link = "Question" },
    ModeMsg = { link = "Question" },

    -- messages / errors
    Error = { fg = colors.zback, bg = colors.error },
    ErrorMsg = { fg = colors.error, bg = "none" },
    WarningMsg = { fg = colors.warn, bg = "none" },

    -- paren / substitute
    MatchParen = { fg = colors.zfore, bg = colors.green4 },

    -- floating windows
    FloatNormal = { fg = colors.fore, bg = colors.back },
    NormalFloat = { fg = colors.fore, bg = colors.back }, -- dressing
    FloatBorder = { fg = colors.grey2 },
    FloatTitle = { link = "FloatBorder" },

    -- indent guides
    IndentLineColor = { fg = colors.grey3 },
    IndentScopeLineColor = { fg = colors.grey1 },

    -- help / misc
    helpCommand = { fg = colors.fore, bg = colors.grey3 },
    MsgSeparator = { fg = colors.grey1 },

    -- diagnostics
    DiagnosticOk = { fg = colors.green_value },
    DiagnosticError = { link = "ErrorMsg" },
    DiagnosticWarn = { link = "WarningMsg" },
    DiagnosticInfo = { link = "WarningMsg" },
    DiagnosticHint = { link = "WarningMsg" },

    -- diff
    -- DiffChange = { bg = colors.blackr },
    -- DiffText = { fg = colors.red1, bg = colors.blackr },
    -- DiffDelete = { fg = colors.blackr, bg = colors.blackr },
    -- DiffAdd = { bg = colors.blackg },

    -- popup menu
    Pmenu = { fg = colors.fore, bg = colors.line },
    PmenuThumb = { bg = colors.grey3 },
    PmenuSel = { bg = colors.green4 },
    WildMenu = { bg = colors.grey3 },

    --===-- syntax
    Comment = { fg = colors.comment1 },
    String = { fg = colors.value3 },
    Character = { fg = colors.value3 },
    Number = { fg = colors.value3 },
    Float = { fg = colors.value3 },
    Boolean = { fg = colors.value3 },
    Identifier = { fg = colors.fore },
    Function = { fg = colors.fore },
    Type = { fg = colors.type },
    Special = { fg = colors.value3 },
    SpecialChar = { fg = colors.value3 },
    Keyword = { fg = colors.keyword },
    -- Keyword = { fg = colors.fore, italic = true },
    Qualifier = { fg = colors.type },
    Constant = { fg = colors.value3 },
    Attribute = { fg = colors.grey3 },
    Statement = { fg = colors.grey1 },
    Conditional = { fg = colors.keyword },
    Repeat = { fg = colors.grey1 },
    Label = { fg = colors.grey1 },
    Operator = { fg = colors.fore },
    Delimiter = { fg = colors.fore },
    Variable = { fg = colors.fore },
    Macro = { fg = colors.macro },
    Module = { fg = colors.fore },
    PreProc = { fg = colors.preproc },
    Traits = { fg = colors.grey1 },
    -- C
    cIncluded = { fg = colors.path },
    cDefine = { link = "None" },
    -- zsh
    zshDeref = { fg = colors.grey2 },
    zshSubstDelim = { fg = colors.grey2 },
    zshSubstQuoted = { fg = colors.grey2 },
    --

    --===-- treesitter
    -- common
    ["@attribute"] = { link = "Attribute" },
    ["@constant"] = { link = "Variable" },
    ["@constant.macro"] = { link = "Macro" },
    ["@constant.builtin"] = { link = "Constant" },
    ["@variable"] = { link = "Variable" },
    ["@variable.builtin"] = { link = "Constant" },
    -- ["@variable.template"] = { fg = colors.param },
    -- ["@variable.parameter"] = { link = "@variable.priority" },
    -- ["@variable.priority"] = { link = "Variable" },
    ["@keyword"] = { link = "Type" },
    ["@keyword.conditional"] = { link = "Keyword" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.exception"] = { link = "Keyword" },
    ["@keyword.import"] = { link = "PreProc" },
    ["@keyword.func.cpp"] = { link = "Keyword" },
    ["@keyword.modifier"] = { link = "Qualifier" },
    ["@keyword.operator"] = { link = "Operator" },
    ["@keyword.repeat"] = { link = "Keyword" },
    ["@keyword.return"] = { link = "Keyword" },
    ["@keyword.type"] = { link = "Type" },
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    ["@function.builtin"] = { link = "Function" },
    ["@qualifier"] = { link = "Qualifier" },
    ["@module"] = { link = "Module" },
    ["@include.path"] = { link = "cIncluded" },
    ["@punctuation.special"] = { fg = colors.fore },
    ["@punctuation.bracket"] = {},
    ["@spell"] = { link = "Spell" },
    ["@constructor"] = { link = "Type" },
    -- doxygen
    ["@keyword.doxygen"] = { fg = colors.comment2 },
    -- markup
    ["@markup.link"] = { link = "Link" },
    ["@markup.math.latex"] = { fg = colors.grey1 },
    -- c++
    ["@keyword.noexce.cpp"] = { fg = colors.keyword },
    -- mojo
    ["@keyword.mojo"] = { fg = colors.keyword },
    ["@constant.mojo"] = { fg = colors.fore },


    --===-- Semantic
    -- common
    ["@lsp.type.macro"] = { link = "Macro" },
    ["@lsp.type.namespace"] = { link = "Module" },
    ["@lsp.type.concept"] = { link = "Traits" },
    -- c++
    -- use {} to highlight all pp #if branches and do not dim them
    ["@lsp.type.comment.cpp"] = {},
    -- ["@lsp.type.comment.cpp"] = { fg = colors.grey4 },
    ["@lsp.type.typeParameter.cpp"] = { fg = colors.param },

    -- markup
    ["@markup.heading.1"] = { fg = colors.green1, bold = true },
    ["@markup.heading.2"] = { fg = colors.green1, bold = true },
    ["@markup.heading.3"] = { fg = colors.green2, bold = true },
    ["@markup.heading.4"] = { fg = colors.green3, bold = true },
    ["@markup.heading.5"] = { fg = colors.green3, bold = true },
    ["@markup.raw.block"] = { fg = colors.grey1 },
    ["@markup.raw.markdown_inline"] = { fg = colors.grey1 },
    --

    --===-- lazy
    LazyButton = { fg = colors.fore, bg = colors.back },
    LazySpecial = { fg = colors.grey3, bg = "NONE" },
    --

    --===-- telescope
    TelescopeBorder = { fg = colors.grey2 },
    TelescopeSelection = { fg = colors.fore, bg = colors.line },
    TelescopeMatching = { fg = colors.orange_teles },
    --

    --===-- nvim-tree
    NvimTreeFolderIcon = { link = "Directory" },
    --

    --===-- Extmarks
    LspReferenceText = { fg = colors.fore, bg = colors.grey3 },
    TodofgNOTE = { fg = colors.note },
    TodoBgNOTE = { fg = colors.zfore, bg = colors.note, bold = true },
    TodoSignNOTE = { fg = colors.note },
    TodofgTEST = { fg = colors.error },
    TodoBgTEST = { fg = colors.zback, bg = colors.error, bold = true },
    TodoSignTEST = { fg = colors.error },
    --

    --===-- Mason
    MasonHeader = { bg = colors.orange3 },
    MasonHighlightBlockBold = { fg = colors.fore, bg = colors.green4 },
    MasonMutedBlock = { fg = colors.fore, bg = colors.grey3 },
    MasonMuted = { fg = colors.value3 },
    MasonHighlight = { fg = colors.grey1 },
    --

    --===-- Flash
    FlashBackdrop = { fg = colors.grey3, bg = "NONE" },
    FlashMatch = { fg = colors.flash_match, bg = "NONE" },
    FlashCurrent = { fg = colors.grey1, bg = "NONE" },
    FlashLabel = { fg = colors.flash_label, bg = "NONE" },
    FlashPromptIcon = { fg = "NONE", bg = "NONE" },
    -- FlashPrompt = { fg = colors.grey2, bg = "NONE" },
    -- FlashLabel = { fg = colors.zfore, bg = "NONE", bold = true },
    -- FlashCursor = { bg = "NONE" },
    --

    --===-- NeoCodeium
    NeoCodeiumSuggestion = { fg = colors.grey3 },
    NeoCodeiumSingleLineLabel = { fg = colors.fore, bg = colors.line },
    NeoCodeiumLabel = { fg = colors.green2, bg = colors.back },
    --

    --===-- RenderMarkdown
    RenderMarkdownH1Bg = { link = "markup.heading.1.markdown" },
    RenderMarkdownH2Bg = { link = "markup.heading.2.markdown" },
    RenderMarkdownH3Bg = { link = "markup.heading.3.markdown" },
    RenderMarkdownH4Bg = { link = "markup.heading.4.markdown" },
    RenderMarkdownH5Bg = { link = "markup.heading.5.markdown" },
    RenderMarkdownH6Bg = { link = "markup.heading.6.markdown" },
  }
  --

  -- apply highlights
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
