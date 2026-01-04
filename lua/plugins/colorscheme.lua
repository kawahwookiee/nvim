return {
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
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
  { "Mofiqul/vscode.nvim", lazy = false, priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
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
          lualine_c = {
            { "filename", path = 3 },
            { "navic", color_correction = "dynamic" },
          },
        },
        extensions = { "lazy" },
      }
      vim.o.laststatus = vim.g.lualine_laststatus
      return opts
    end,
  },
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
    end,
    opts = function()
      Snacks.util.lsp.on({ method = "textDocument/documentSymbol" }, function(buffer, client)
        require("nvim-navic").attach(client, buffer)
      end)
      return {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        icons = LazyVim.config.icons.kinds,
        lazy_update_context = true,
      }
    end,
  },
}
