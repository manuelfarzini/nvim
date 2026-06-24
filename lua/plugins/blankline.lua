require("ibl").setup({
    indent = {
        char = "┊",
        highlight = { "IndentLineColor" },
        priority = 100,
    },
    scope = {
        enabled = true,
        highlight = { "IndentScopeLineColor" },
        show_start = false,
        show_end = false,
        show_exact_scope = false,
    },
})
