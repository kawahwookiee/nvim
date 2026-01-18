return {
  "snacks.nvim",
  priority = 1000,
  lazy = false,
  init = function()
    -- require("aerial").setup({ attach_mode = "global", backends = { "lsp", "treesitter", "markdown", "man" } })
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
      input = { enabled = true },
      explorer = { enabled = true },
      quickfile = { enabled = true },
      indent = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      terminal = { enabled = true },
      gitbrowse = {
        enabled = true,
        url_patterns = {
          ["gitea%.*"] = {
            branch = "/src/branch/{branch}",
            file = "/src/branch/{branch}/{file}#L{line_start}-L{line_end}",
            permalink = "/src/commit/{commit}/{file}#L{line_start}-L{line_end}",
            commit = "/src/commit/{commit}",
          },
        },
      },
      picker = {
        enabled = true,
        ui_select = true,
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
        layout = function(source)
          if source == "explorer" then
            ---@type snacks.picker.layout.Config
            return {
              layout = { resize = true },
            }
          end
          return default_layout
        end,
        sources = {
          ---@type snacks.picker.Config
          explorer = {
            auto_close = true,
            layout = { hidden = { "preview", "input" }, auto_hide = { "input" } },
          },
        },
      },
    }
    return opts
  end,
  keys = {
    {
      "<leader>xx",
      function()
        Snacks.picker.diagnostics_buffer({})
      end,
      desc = "Diagnostics (Buffer)",
    },
    {
      "<leader>xX",
      function()
        Snacks.picker.diagnostics({})
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>t",
      LazyVim.pick("lsp_symbols", { workspace = false }),
      desc = "Symbols",
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
