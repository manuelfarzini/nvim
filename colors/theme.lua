-- nvim/colors/theme.lua
local function setup()
  local colors = {
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
    dtype    = "#1f2d7a",
    param    = "#1f2d7a",
    enum     = "#768012",
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
    orange4 = "#ec9216",
  }

  local highlights = {

    --+ editor
    Background = { fg = colors.back },
    ColorColumn = { bg = colors.line },
    Conceal = { fg = colors.macro },
    CursorColumn = { bg = colors.line },
    CursorLine = { bg = colors.line },
    CursorLineNr = { fg = colors.value2 },
    Directory = { fg = colors.grey1, bold = true },
    EndOfBuffer = { fg = colors.back },
    Folded = { fg = "NONE", bg = colors.back },
    LineNr = { fg = colors.grey1 },
    Link = { fg = colors.grey1, bg = colors.back },
    MatchParen = { fg = colors.zfore, bg = colors.green4 },
    NonText = { fg = colors.value2 },
    None = { fg = "NONE", bg = "NONE" },
    Normal = { fg = colors.fore, bg = colors.back },
    QuickFixLine = { fg = colors.value2, bg = colors.back },
    SpecialKey = { fg = colors.value2 },
    Title = { fg = colors.grey1, bg = colors.back },
    Underlined = { fg = "NONE", underline = false },
    VertSplit = { fg = colors.grey3 },
    Whitespace = { fg = colors.back },
    WinSeparator = { fg = colors.grey3 },
    --

    --+ search / selection
    CurSearch = { fg = colors.zback, bg = colors.fore },
    IncSearch = { fg = colors.zback, bg = colors.fore },
    Search = { fg = colors.zfore, bg = colors.sel_bg },
    Visual = { bg = colors.fore, fg = colors.zback },
    VM_Cursor = { fg = colors.zfore, bg = colors.vm_bg },
    VM_Extend = { fg = colors.zfore, bg = colors.sel_bg },
    VM_Insert = { fg = colors.zfore, bg = colors.vm_bg },
    VM_Mono = { fg = colors.zfore, bg = colors.sel_bg },
    --

    --+ ui
    FloatBorder = { fg = colors.grey2 },
    FloatNormal = { fg = colors.fore, bg = colors.back },
    FloatTitle = { link = "FloatBorder" },
    helpCommand = { fg = colors.fore, bg = colors.grey3 },
    IndentLineColor = { fg = colors.grey3 },
    IndentScopeLineColor = { fg = colors.grey1 },
    ModeMsg = { link = "Question" },
    MoreMsg = { link = "Question" },
    MsgSeparator = { fg = colors.grey1 },
    NormalFloat = { fg = colors.fore, bg = colors.back },
    Pmenu = { fg = colors.fore, bg = colors.line },
    PmenuSel = { bg = colors.green4 },
    PmenuThumb = { bg = colors.grey3 },
    Question = { fg = colors.fore },
    StatusLine = { fg = colors.fore, bg = colors.back },
    StatusLineNC = { link = "StatusLine" },
    WildMenu = { bg = colors.grey3 },
    --

    --+ diagnostics
    DiagnosticError = { link = "ErrorMsg" },
    DiagnosticHint = { link = "WarningMsg" },
    DiagnosticInfo = { link = "WarningMsg" },
    DiagnosticOk = { fg = colors.value1 },
    DiagnosticWarn = { link = "WarningMsg" },
    Error = { fg = colors.zback, bg = colors.error },
    ErrorMsg = { fg = colors.error, bg = "none" },
    WarningMsg = { fg = colors.warn, bg = "none" },
    --

    --+ syntax
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

    --+ treesitter
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
    ["@keyword.operator"] = { link = "Function" },
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
    -- mojo
    ["@keyword.mojo"] = { fg = colors.keyword },
    ["@constant.mojo"] = { fg = colors.fore },
    ["@enum.mojo"] = { fg = colors.enum },
    ["@dtype.mojo"] = { fg = colors.dtype },

    --+ Semantic
    -- common
    ["@lsp.type.macro"] = { link = "Macro" },
    ["@lsp.type.namespace"] = { link = "Module" },
    ["@lsp.type.concept"] = { link = "Traits" },
    -- c++
    -- {} to highlight all preproc branches; dimmed color to snooze unactive ones
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

    --+ telescope
    TelescopeBorder = { fg = colors.grey2 },
    TelescopeSelection = { bg = colors.line },
    TelescopeMatching = { fg = colors.value2 },
    --

    --+ nvim-tree
    NvimTreeFolderIcon = { link = "Directory" },
    --

    --+ Extmarks
    LspReferenceText = { fg = colors.fore, bg = colors.grey3 },
    TodofgNOTE = { fg = colors.note },
    TodoBgNOTE = { fg = colors.zfore, bg = colors.note, bold = true },
    TodoSignNOTE = { fg = colors.note },
    TodofgTEST = { fg = colors.error },
    TodoBgTEST = { fg = colors.zback, bg = colors.error, bold = true },
    TodoSignTEST = { fg = colors.error },
    DiagnosticUnnecessary = {},
    --

    --+ Mason
    MasonHeader = { bg = colors.orange4 },
    MasonHighlightBlockBold = { fg = colors.fore, bg = colors.green4 },
    MasonMutedBlock = { fg = colors.fore, bg = colors.grey3 },
    MasonMuted = { fg = colors.value2 },
    MasonHighlight = { fg = colors.grey1 },
    --

    --+ Flash
    FlashBackdrop = { fg = colors.grey3, bg = "NONE" },
    FlashCurrent = { fg = colors.grey1, bg = "NONE" },
    FlashPromptIcon = { fg = "NONE", bg = "NONE" },
    --

    --+ NeoCodeium
    NeoCodeiumSuggestion = { fg = colors.grey3 },
    NeoCodeiumSingleLineLabel = { fg = colors.fore, bg = colors.line },
    NeoCodeiumLabel = { fg = colors.green2, bg = colors.back },
    --

    --+ RenderMarkdown
    RenderMarkdownH1Bg = { link = "markup.heading.1.markdown" },
    RenderMarkdownH2Bg = { link = "markup.heading.2.markdown" },
    RenderMarkdownH3Bg = { link = "markup.heading.3.markdown" },
    RenderMarkdownH4Bg = { link = "markup.heading.4.markdown" },
    RenderMarkdownH5Bg = { link = "markup.heading.5.markdown" },
    RenderMarkdownH6Bg = { link = "markup.heading.6.markdown" },
    --
  }

  -- apply highlights
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

setup()
