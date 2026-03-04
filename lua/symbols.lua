---@diagnostic disable-next-line: duplicate-set-field
function _G.set_timeoutlen(new_timeoutlen)
  local original_timeoutlen = vim.o.timeoutlen
  vim.o.timeoutlen = new_timeoutlen
  vim.defer_fn(function() vim.o.timeoutlen = original_timeoutlen end, new_timeoutlen + 300)
end

function _G.insert_symbol(symbol) vim.api.nvim_put({ symbol }, "c", true, true) end

local symbols = {
  ["?alpha"] = "α",
  ["?beta"] = "β",
  ["?gamma"] = "γ",
  ["?delta"] = "δ",
  ["?epsilon"] = "ε",
  ["?zeta"] = "ζ",
  ["?eta"] = "η",
  ["?theta"] = "θ",
  ["?iota"] = "ι",
  ["?kappa"] = "κ",
  ["?lambda"] = "λ",
  ["?mu"] = "μ",
  ["?nu"] = "ν",
  ["?xi"] = "ξ",
  ["?omic"] = "ο",
  ["?pi"] = "π",
  ["?rho"] = "ρ",
  ["?sigma"] = "σ",
  ["?tau"] = "τ",
  ["?upsi"] = "υ",
  ["?phi"] = "φ",
  ["?chi"] = "χ",
  ["?psi"] = "ψ",
  ["?omega"] = "ω",
  ["?Gamma"] = "Γ",
  ["?Delta"] = "Δ",
  ["?Theta"] = "Θ",
  ["?Lambda"] = "Λ",
  ["?Xi"] = "Ξ",
  ["?Omic"] = "Ο",
  ["?Pi"] = "Π",
  ["?Phi"] = "Φ",
  ["?Psi"] = "Ψ",
  ["?Omega"] = "Ω",
  ["?sum"] = "Σ",
  ["?int"] = "∫",

  ["?minus"] = "−",
  ["?times"] = "×",
  ["?divide"] = "÷",
  ["?cdot"] = "⋅",

  ["?sub"] = "⊂",
  ["?subeq"] = "⊆",
  ["?in"] = "∈",
  ["?notin"] = "∉",
  ["?cup"] = "∪",
  ["?cap"] = "∩",
  ["?setmin"] = "∖",
  ["?empty"] = "∅",

  ["?bot"] = "⟂",
  ["?not"] = "¬",
  ["?or"] = "∨",
  ["?and"] = "∧",
  ["?forall"] = "∀",
  ["?exist"] = "∃",
  ["?nexist"] = "∄",

  ["?right"] = "→",
  ["?left"] = "←",
  ["?impl"] = "⇒",
  ["?iff"] = "⇔",

  ["?infty"] = "∞",
  ["?def"] = "≔",
  ["?equi"] = "≡",
  ["?approx"] = "≈",
  ["?neq"] = "≠",
  ["?leq"] = "≤",
  ["?geq"] = "≥",

  ["?dots"] = "…",
}

for key, symbol in pairs(symbols) do
  vim.api.nvim_set_keymap(
    "i",
    key,
    '<Cmd>:lua insert_symbol("' .. symbol .. '")<CR>',
    { noremap = true, silent = true }
  )
end
