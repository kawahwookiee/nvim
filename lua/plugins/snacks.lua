return {
  "snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@module "snacks"
  ---@type snacks.Config
  opts = {
    lazygit = { enabled = true },
    explorer = { enabled = true },
    picker = {
      enabled = true,
      win = { input = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } } } },
      sources = {
        explorer = {
          auto_close = true,
          layout = { preset = "sidebar" },
        },
        grep = {
          auto_close = true,
          layout = {
            layout = {
              box = "horizontal",
              backdrop = false,
              width = 0.8,
              height = 0.9,
              border = "none",
              {
                box = "vertical",
                {
                  win = "input",
                  height = 1,
                  border = "rounded",
                  title = string.format("{title}{live} %s {flags}", LazyVim.root()),
                  title_pos = "center",
                },
                { win = "list", height = 0.3, title = " Results ", title_pos = "center", border = "rounded" },
                { win = "preview", title = "{preview:Preview}", border = "rounded", title_pos = "center" },
              },
            },
          },
        },
      },
    },
  },
  keys = {
    { "<leader>/", LazyVim.pick("grep", { root = false }), desc = "Grep (cwd)" },
    { "<leader><space>", false },
    {
      "<leader>e",
      function()
        Snacks.picker.explorer()
      end,
      desc = "File Explorer (cwd)",
    },
    {
      "<leader>E",
      function()
        Snacks.picker.explorer({ cwd = LazyVim.root() })
      end,
      desc = "File Explorer (Root)",
    },
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
}
