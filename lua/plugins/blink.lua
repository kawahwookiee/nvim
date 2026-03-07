return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    fuzzy = { implementation = "prefer_rust_with_warning" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        lua = { inherit_defaults = true, "lazydev" },
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100, -- show at a higher priority than lsp
        },
      },
      compat = {},
    },
    completion = { keyword = { range = "full" } },
    keymap = {
      preset = "enter",
      ["<Esc>"] = { "hide", "fallback" },
      ["C-e"] = { "cancel", "fallback" },
      ["<Left>"] = { "cancel", "fallback" },
      ["<Right>"] = { "cancel", "fallback" },
    },
  },
}
