return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  opts = function()
    local opts = {
      options = {
        theme = "moonfly",
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
}
