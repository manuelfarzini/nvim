local lualine = require("lualine")
local get_mode = require("lualine.utils.mode").get_mode

local fore  = "#1a1a13"
local grey4 = "#dedecc"
local error = "#931514"
local warn  = "#c27070"
local note  = "#879dad"

local function theme_mode() return {
    a = { bg = grey4, fg = fore, gui = "bold" }, b = { bg = grey4, fg = fore }, c = { bg = grey4, fg = fore },
} end

local lualine_theme = {
  normal = theme_mode(), insert = theme_mode(), visual = theme_mode(),
  command = theme_mode(), replace = theme_mode(), inactive = theme_mode(),
}

local function tree_hide(str) return vim.bo.filetype == "NvimTree" and "" or str end
local function tree_name(str) return vim.bo.filetype == "NvimTree" and "Tree" or str end

local function current_mode()
  local mode = get_mode()
  return vim.fn.VMInfos().status ~= nil and ("VM " .. mode) or mode
end

local function macro_recording()
  local reg = vim.fn.reg_recording()
  return reg ~= "" and ("recording @" .. reg .. "...") or ""
end

lualine.setup({
  options = {
    theme = lualine_theme,
    component_separators = "",
    section_separators = "",
  },
  sections = {
    lualine_a = { { current_mode, fmt = tree_name } },
    lualine_b = { macro_recording },
    lualine_c = { { "filename", fmt = tree_hide }, { "branch", fmt = tree_hide } },
    lualine_x = {
      {
        "diagnostics",
        diagnostics_color = {
          error = { fg = error, bg = grey4 }, warn = { fg = warn, bg = grey4 },
          info = { fg = note, bg = grey4 }, hint = { fg = note, bg = grey4 },
        },
        symbols = { error = "E", warn = "W", info = "I", hint = "H" },
      },
    },
    lualine_y = { { "progress", fmt = function(str) return vim.bo.filetype == "NvimTree" and "" or str end } },
    lualine_z = { { "location", fmt = tree_hide } },
  },
  inactive_sections = {
    lualine_c = { { "filename", fmt = tree_name } },
    lualine_x = { { "location", fmt = tree_hide } },
  },
})
