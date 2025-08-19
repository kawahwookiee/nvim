return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  opts = function()
    local opts = {
      options = {
        theme = "catppuccin",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_c = { { "filename", path = 1 } },
      },
      extensions = { "lazy" },
    }
    vim.o.laststatus = vim.g.lualine_laststatus
    local trouble = require("trouble")
    local symbols = trouble.statusline({
      mode = "lsp_document_symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
      hl_group = "lualine_c_normal",
    })
    table.insert(opts.sections.lualine_c, {
      symbols.get,
      cond = symbols.has,
    })
    return opts
  end,
}
