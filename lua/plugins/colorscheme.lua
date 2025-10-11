return {
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    opts = {},
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    name = "vscode",
    opts = {
      color_overrides = {
        vscYellow = "#C8A309",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = function()
      local opts = {
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_c = { { "filename", path = 1 } },
        },
        extensions = { "lazy" },
      }
      vim.o.laststatus = vim.g.lualine_laststatus
      return opts
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
