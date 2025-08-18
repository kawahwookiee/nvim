return {
  {
    "stevearc/aerial.nvim",
    event = "LazyFile",
    keys = {
      { "<C-t>", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
    },
  },
  {
    "folke/todo-comments.nvim",
    optional = true,
    keys = {
      {
        "<leader>st",
        function()
          Snacks.picker.todo_comments()
        end,
        desc = "Todo",
      },
      {
        "<leader>sT",
        function()
          Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
        end,
        desc = "Todo/Fix/Fixme",
      },
    },
  },
}
