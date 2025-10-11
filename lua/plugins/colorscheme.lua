return {
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },
      no_italic = true,
      term_colors = true,
      -- color_overrides = { mocha = { base = "#1d1d1e" } },
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
      colorscheme = "catppuccin",
    },
  },
}
