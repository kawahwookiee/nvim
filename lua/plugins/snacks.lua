return {
  "snacks.nvim",
  priority = 1000,
  lazy = false,
  init = function()
    require("aerial").setup({ attach_mode = "global", backends = { "lsp", "treesitter", "markdown", "man" } })
  end,
  opts = function()
    ---@type snacks.picker.layout.Config
    local default_layout = {
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
    }
    ---@type snacks.Config
    local opts = {
      lazygit = { enabled = true },
      notifier = { enabled = true },
      notify = { enabled = true },
      explorer = { enabled = true },
      quickfile = { enabled = true },
      indent = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      picker = {
        enabled = true,
        win = {
          list = {
            keys = {
              ["<S-PageDown>"] = { "preview_scroll_down", mode = { "n", "i" } },
              ["<S-PageUp>"] = { "preview_scroll_up", mode = { "n", "i" } },
              ["<PageUp>"] = { "list_scroll_up", mode = { "n", "i" } },
              ["<PageDown>"] = { "list_scroll_down", mode = { "n", "i" } },
            },
          },
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
              ["<S-PageDown>"] = { "preview_scroll_down", mode = { "n", "i" } },
              ["<S-PageUp>"] = { "preview_scroll_up", mode = { "n", "i" } },
              ["<PageUp>"] = { "list_scroll_up", mode = { "n", "i" } },
              ["<PageDown>"] = { "list_scroll_down", mode = { "n", "i" } },
            },
          },
        },
        auto_close = true,
        layout = default_layout,
        sources = {
          ---@type snacks.picker.Config
          explorer = {
            auto_close = true,
            win = { list = { resize = true } },
            layout = "sidebar",
            preview = function()
              return false
            end,
          },
        },
      },
    }
    return opts
  end,
  keys = {
    {
      "<C-t>",
      function()
        require("aerial").snacks_picker(
          ---@type snacks.picker.layout.Config
          {
            layout = {
              preset = "right",
              layout = { min_width = 0.1, resize = true },
              preview = "main",
            },
          }
        )
      end,
      desc = "Aerial (Symbols)",
    },
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
        local cur_dir = require("utils").GetCurrentDir()
        Snacks.picker.explorer({ cwd = cur_dir })
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
