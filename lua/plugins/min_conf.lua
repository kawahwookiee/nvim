return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  { "mason-org/mason.nvim", version = ">=2.0.0" },
  {
    "folke/trouble.nvim",
    ---@module "trouble"
    ---@type trouble.Config
    opts = { focus = true },
  },
  {
    "folke/todo-comments.nvim",
  },
}
