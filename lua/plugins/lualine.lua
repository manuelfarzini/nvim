---@diagnostic disable: unused-local
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local fore = "#1a1a13"
    local grey4 = "#dedecc"
    local error = "#931514"
    local warn = "#c27070"

    local lualine_theme = {
      normal = {
        a = { bg = grey4, fg = fore, gui = "bold" },
        b = { bg = grey4, fg = fore },
        c = { bg = grey4, fg = fore },
      },
      insert = {
        a = { bg = grey4, fg = fore, gui = "bold" },
        b = { bg = grey4, fg = fore },
        c = { bg = grey4, fg = fore },
      },
      visual = {
        a = { bg = grey4, fg = fore, gui = "bold" },
        b = { bg = grey4, fg = fore },
        c = { bg = grey4, fg = fore },
      },
      command = {
        a = { bg = grey4, fg = fore, gui = "bold" },
        b = { bg = grey4, fg = fore },
        c = { bg = grey4, fg = fore },
      },
      replace = {
        a = { bg = grey4, fg = fore, gui = "bold" },
        b = { bg = grey4, fg = fore },
        c = { bg = grey4, fg = fore },
      },
      inactive = {
        a = { bg = grey4, fg = fore, gui = "bold" },
        b = { bg = grey4, fg = fore },
        c = { bg = grey4, fg = fore },
      },
    }

    local function hide_in_nvimtree(str)
      if vim.bo.filetype == "NvimTree" then return "" end
      return str
    end

    local function current_mode()
      local mode = require("lualine.utils.mode").get_mode()
      local vm_info = vim.fn.VMInfos()
      if vm_info and vm_info.status ~= nil then mode = "VM " .. mode end
      return mode
    end

    -- Visual feedback for macro recording
    local function macro_recording()
      local reg = vim.fn.reg_recording()
      if reg == "" then
        return ""
      else
        return "recording @" .. reg .. "..."
      end
    end

    lualine.setup({
      options = {
        theme = lualine_theme,
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_a = {
          {
            current_mode,
            fmt = function(str)
              if vim.bo.filetype == "NvimTree" then return "" end
              return str
            end,
            gui = "bold",
          },
        },

        lualine_b = {
          {
            "branch",
          },
          {
            macro_recording,
          },
        },

        lualine_c = {
          {
            "filename",
            fmt = hide_in_nvimtree,
          },
        },

        lualine_x = {
          {
            "diagnostics",
            diagnostics_color = {
              error = { fg = error, bg = grey4 },
              warn = { fg = warn, bg = grey4 },
              info = { fg = warn, bg = grey4 },
              hint = { fg = warn, bg = grey4 },
            },
            -- local signs = { Error = "✕", Warn = "!", Hint = "?", Info = "i" }
            symbols = { error = "E", warn = "W", info = "I", hint = "H" },
          },
        },

        lualine_y = {
          {
            "progress",
            fmt = function(str) return (vim.bo.filetype ~= "NvimTree") and string.lower(str) or "" end,
          },
        },

        lualine_z = {
          {
            "location",
            fmt = hide_in_nvimtree,
          },
        },
      },

      inactive_sections = {
        lualine_c = {
          {
            "filename",
            fmt = function(str) return (vim.bo.filetype == "NvimTree") and "" or str end,
          },
        },
        lualine_x = {
          {
            "location",
            fmt = hide_in_nvimtree,
          },
        },
      },
      extension = { "fugitive" },
    })
  end,
}
