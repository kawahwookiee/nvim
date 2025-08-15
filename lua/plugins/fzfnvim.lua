return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({
      "max-perf",
      winopts = {
        preview = {
          default = "builtin",
          layout = "vertical",
        },
      },
    })
  end,
}
