return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  opts = {
    -- LazyVim will use these options when formatting with the conform.nvim formatter
    default_format_opts = {
      timeout_ms = 3000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
      lsp_fallback = true, -- not recommended to change
    },
    formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      sh = { "shfmt" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      go = { "goimports", "gofumpt" },
      -- python = { "isort", "black" },
      ["*"] = { "trim_newlines", "trim_whitespace" },
    },
  },
}
