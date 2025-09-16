return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      no_italic = true,
      integrations = {
        notify = true,
        mini = true,
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
      colorscheme = "catppuccin-mocha",
    },
  },
}
