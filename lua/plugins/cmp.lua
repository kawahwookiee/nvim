return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    sources = {
      compat = {},
      default = { "lsp", "path", "snippets", "buffer" },
    },
    keymap = {
      preset = "enter",
      ["<Esc>"] = { "hide", "fallback" },
      ["C-e"] = { "cancel", "fallback" },
      ["<Left>"] = { "cancel", "fallback" },
      ["<Right>"] = { "cancel", "fallback" },
    },
  },
}
