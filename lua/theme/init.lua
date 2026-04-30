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
    value1   = "#768012",
    value2   = "#c68909",
    type     = "#626246",
    keyword  = "#6b4a65",
    path     = "#c68909",
    preproc  = "#aeaf9f",
    macro    = "#6d4a00",
    comment1 = "#a8977a",
    note     = "#879dad",
    error    = "#931514",
    warn     = "#c27070",
    param    = "#3b457b",
    -- error_old    = "#464ea3",
    -- warn_old     = "#7ea8cf",
    --

    --
    green_value_old  = "#849200",
    orange_value_old = "#cf8f0b",
    red_path_old     = "#7d1211",
    orange_teles_old = "#b55e0b",
    orange_mason_old = "#ec9216",
    flash_match_old  = "#858566",
    flash_label_old  = "#3c067c",
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

    --+ editor

    -- core
    Background = { fg = colors.back },
    ColorColumn = { bg = colors.line },
    Conceal = { fg = colors.macro },
    CursorColumn = { bg = colors.line },
    CursorLine = { bg = colors.line },
    CursorLineNr = { fg = colors.value2 },
    Directory = { fg = colors.grey1, bold = true },
    EndOfBuffer = { fg = colors.back },
    LineNr = { fg = colors.grey1 },
    NonText = { fg = colors.value2 },
    Normal = { fg = colors.fore, bg = colors.back },
    SpecialKey = { fg = colors.value2 },
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

    ------+ syntax
    Comment = { fg = colors.comment1 },
    String = { fg = colors.value2 },
    Character = { fg = colors.value2 },
    Number = { fg = colors.value2 },
    Float = { fg = colors.value2 },
    Boolean = { fg = colors.value1 },
    Identifier = { fg = colors.fore },
    Function = { fg = colors.fore },
    Type = { fg = colors.type },
    Special = { fg = colors.value2 },
    SpecialChar = { fg = colors.value2 },
    Keyword = { fg = colors.keyword },
    Qualifier = { fg = colors.type },
    Constant = { fg = colors.value2 },
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

    ------+ treesitter
    -- common
    ["@attribute"] = { link = "Attribute" },
    ["@constant"] = { link = "Variable" },
    ["@constant.macro"] = { link = "Macro" },
    ["@constant.builtin"] = { fg = colors.value1 },
    ["@constant.special"] = { fg = colors.value1 },
    ["@constructor"] = { link = "Type" },
    ["@decorator"] = { link = "PreProc" },
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.import"] = { link = "PreProc" },
    ["@keyword.type"] = { link = "Type" },
    ["@keyword.modifier"] = { link = "Qualifier" },
    -- ["@keyword.exception"] = { link = "Keyword" },
    -- ["@keyword.func.cpp"] = { link = "Keyword" },
    -- ["@keyword.operator"] = { link = "Operator" },
    -- ["@keyword.repeat"] = { link = "Keyword" },
    -- ["@keyword.return"] = { link = "Keyword" },
    -- ["@keyword.type"] = { link = "Type" },
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    ["@function.builtin"] = { link = "Function" },
    ["@qualifier"] = { link = "Qualifier" },
    ["@module"] = { link = "Module" },
    ["@include.path"] = { link = "cIncluded" },
    ["@preproc"] = { link = "PreProc" },
    ["@punctuation.special"] = { fg = colors.fore },
    ["@punctuation.bracket"] = {},
    ["@spell"] = { link = "Spell" },
    ["@variable"] = { link = "Variable" },
    ["@variable.builtin"] = { link = "@constant.builtin" },
    -- doxygen
    ["@keyword.doxygen"] = { link = "PreProc"},
    -- markup
    ["@markup.link"] = { link = "Link" },
    ["@markup.math.latex"] = { fg = colors.grey1 },
    -- c++
    -- mojo
    ["@keyword.mojo"] = { fg = colors.keyword },
    ["@constant.mojo"] = { fg = colors.fore },


    ------+ Semantic
    -- common
    ["@lsp.type.macro"] = { link = "Macro" },
    ["@lsp.type.namespace"] = { link = "Module" },
    ["@lsp.type.concept"] = { link = "Traits" },
    -- c++
    -- use {} to highlight all conditional pp branche
    -- assign a dimmed color to snooze the unactive pp branches
    ["@lsp.type.comment.cpp"] = {}, -- { fg = colors.grey4 },
    ["@lsp.typemod.typeParameter.definition.cpp"] = { fg = colors.param },
    ["@lsp.typemod.typeParameter.functionScope.cpp"] = { fg = colors.param },
    ["@lsp.typemod.typeParameter.readonly.cpp"] = { fg = colors.param },

    -- markup
    ["@markup.heading.1"] = { fg = colors.green1, bold = true },
    ["@markup.heading.2"] = { fg = colors.green1, bold = true },
    ["@markup.heading.3"] = { fg = colors.green2, bold = true },
    ["@markup.heading.4"] = { fg = colors.green3, bold = true },
    ["@markup.heading.5"] = { fg = colors.green3, bold = true },
    ["@markup.raw.block"] = { fg = colors.grey1 },
    ["@markup.raw.markdown_inline"] = { fg = colors.grey1 },
    --

    ------+ lazy
    LazyButton = { fg = colors.fore, bg = colors.back },
    LazySpecial = { fg = colors.grey3, bg = "NONE" },
    --

    ------+ telescope
    TelescopeBorder = { fg = colors.grey2 },
    TelescopeSelection = { fg = colors.fore, bg = colors.line },
    TelescopeMatching = { fg = colors.orange_teles },
    --

    ------+ nvim-tree
    NvimTreeFolderIcon = { link = "Directory" },
    --

    ------+ Extmarks
    LspReferenceText = { fg = colors.fore, bg = colors.grey3 },
    TodofgNOTE = { fg = colors.note },
    TodoBgNOTE = { fg = colors.zfore, bg = colors.note, bold = true },
    TodoSignNOTE = { fg = colors.note },
    TodofgTEST = { fg = colors.error },
    TodoBgTEST = { fg = colors.zback, bg = colors.error, bold = true },
    TodoSignTEST = { fg = colors.error },
    --

    ------+ Mason
    MasonHeader = { bg = colors.orange3 },
    MasonHighlightBlockBold = { fg = colors.fore, bg = colors.green4 },
    MasonMutedBlock = { fg = colors.fore, bg = colors.grey3 },
    MasonMuted = { fg = colors.value2 },
    MasonHighlight = { fg = colors.grey1 },
    --

    ------+ Flash
    FlashBackdrop = { fg = colors.grey3, bg = "NONE" },
    FlashMatch = { fg = colors.flash_match, bg = "NONE" },
    FlashCurrent = { fg = colors.grey1, bg = "NONE" },
    FlashLabel = { fg = colors.flash_label, bg = "NONE" },
    FlashPromptIcon = { fg = "NONE", bg = "NONE" },
    -- FlashPrompt = { fg = colors.grey2, bg = "NONE" },
    -- FlashLabel = { fg = colors.zfore, bg = "NONE", bold = true },
    -- FlashCursor = { bg = "NONE" },
    --

    ------+ NeoCodeium
    NeoCodeiumSuggestion = { fg = colors.grey3 },
    NeoCodeiumSingleLineLabel = { fg = colors.fore, bg = colors.line },
    NeoCodeiumLabel = { fg = colors.green2, bg = colors.back },
    --

    ------+ RenderMarkdown
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
