return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  config = function()

    local ufo = require("ufo")

    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- XXX: can I do this with less lines?

    local max_foldlevel = 99

    local function get_ufo_foldlevel()
      if vim.w.ufo_foldlevel == nil then
        vim.w.ufo_foldlevel = max_foldlevel
      end
      return vim.w.ufo_foldlevel
    end
    local function set_ufo_foldlevel(level)
      vim.w.ufo_foldlevel = math.max(0, math.min(max_foldlevel, level))
      ufo.closeFoldsWith(vim.w.ufo_foldlevel)
    end

    vim.keymap.set("n", "zR", function()
      vim.w.ufo_foldlevel = max_foldlevel
      ufo.openAllFolds()
    end, { silent = true, desc = "Open all folds" })

    vim.keymap.set("n", "zM", function()
      vim.w.ufo_foldlevel = 0
      ufo.closeAllFolds()
    end, { silent = true, desc = "Close all folds" })

    vim.keymap.set("n", "zm", function()
      set_ufo_foldlevel(get_ufo_foldlevel() - vim.v.count1)
    end, { silent = true, desc = "Fold more" })

    vim.keymap.set("n", "zr", function()
      set_ufo_foldlevel(get_ufo_foldlevel() + vim.v.count1)
    end, { silent = true, desc = "Fold less" })

    -- XXX:

    vim.keymap.set("n", "zf", function()
      require("ufo").openFoldsExceptKinds({
        "function_definition", -- cpp
        "preproc_function_def", -- cpp
      })
    end, { silent = true, desc = "Fold functions" })

    vim.keymap.set("n", "zF", function()
      require("ufo").openFoldsExceptKinds({
        "template_declaration", -- cpp
        "function_definition", -- cpp
        "preproc_function_def", -- cpp
      })
    end, { silent = true, desc = "Fold functions and templates" })

    vim.keymap.set("n", "zs", function()
      require("ufo").openFoldsExceptKinds({
        "comment", -- cpp
      })
    end, { silent = true, desc = "Fold comments" })

    --- Handle multi-line comments
    local fold_virt_text_handler = function(virtText, lnum, endLnum, _, _)
      local newVirtText = {}
      local folded_lines = endLnum - lnum
      local suffix = ("  %d "):format(folded_lines)

      local comment_type = nil
      for i, chunk in ipairs(virtText) do
        local text = chunk[1]
        local hl_group = chunk[2] or "Normal"
        if i == #virtText then text = text:gsub("[%s]*%{$", "") end
        table.insert(newVirtText, { text, hl_group })
        if text:match("^%s*/%*") then
          comment_type = "slash_star"
        elseif text:match("^%s*///") then
          comment_type = "slash_slash_slash"
        end
      end

      if comment_type == "slash_star" then
        local second_line = ""
        local second_line_content = vim.api.nvim_buf_get_lines(0, lnum, lnum + 1, false)

        if second_line_content[1] then
          second_line = second_line_content[1]
              :gsub("^%s*%*%s?", "")
              :gsub("^%s+", "")
        end

        table.insert(newVirtText, { " " .. second_line, "Comment" })
      end

      table.insert(newVirtText, { suffix, "Comment" })
      return newVirtText
    end

    --- Setup
    require("ufo").setup({
      open_fold_hl_timeout = 0,
      provider_selector = function() return { "treesitter", "indent" } end,
      fold_virt_text_handler = fold_virt_text_handler,
    })
  end,
}
